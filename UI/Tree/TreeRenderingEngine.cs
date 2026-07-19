using System.Collections.ObjectModel;
using System.Windows;
using System.Windows.Media;
using System.Windows.Threading;
using DevWorkFlow.Tree;

namespace UI.Tree;

/// <summary>Bindable row for flat virtualized ListBox.</summary>
public sealed class TreeRowVm : System.ComponentModel.INotifyPropertyChanged
{
    private static readonly Brush DefaultIconBrush = CreateFrozenBrush("#8A929C");
    private static readonly Brush DefaultTextBrush = CreateFrozenBrush("#24292F");

    private bool _is_selected;
    private bool _is_expanded;
    private bool _is_expandable;
    private TreeNode _node;
    private int _depth;
    private Brush _icon_brush = DefaultIconBrush;
    private Brush _text_brush = DefaultTextBrush;
    private FontStyle _font_style = FontStyles.Normal;
    private bool _is_selectable = true;

    public TreeRowVm(TreeRow row)
    {
        _node = row.Node;
        _depth = row.Depth;
        _is_expanded = row.IsExpanded;
        _is_expandable = row.IsExpandable;
        ApplyNodeVisual(row.Node);
    }

    public TreeNode Node
    {
        get => _node;
        private set
        {
            if (ReferenceEquals(_node, value)) return;
            _node = value;
            ApplyNodeVisual(value);
            OnPropertyChanged(nameof(Node));
            OnPropertyChanged(nameof(DisplayName));
            OnPropertyChanged(nameof(Icon));
            OnPropertyChanged(nameof(IconBrush));
            OnPropertyChanged(nameof(TextBrush));
            OnPropertyChanged(nameof(FontStyle));
            OnPropertyChanged(nameof(IsSelectable));
            OnPropertyChanged(nameof(Indent));
        }
    }

    public string DisplayName => Node.DisplayName;
    public string Icon => string.IsNullOrWhiteSpace(Node.Icon) ? "FileOutline" : Node.Icon;
    public Brush IconBrush => _icon_brush;
    public Brush TextBrush => _text_brush;
    public FontStyle FontStyle => _font_style;
    public bool IsSelectable => _is_selectable;
    public double Indent => Depth * 16;

    private void ApplyNodeVisual(TreeNode node)
    {
        _icon_brush = string.IsNullOrWhiteSpace(node.IconColor)
            ? DefaultIconBrush
            : TreeIconCatalog.BrushFromHex(node.IconColor, DefaultIconBrush);
        _text_brush = string.IsNullOrWhiteSpace(node.TextColor)
            ? ResolveThemeTextBrush()
            : TreeIconCatalog.BrushFromHex(node.TextColor, DefaultTextBrush);
        _font_style = TreeIconCatalog.ToFontStyle(node.IsItalic);
        _is_selectable = node.IsSelectable;
    }

    private static Brush ResolveThemeTextBrush()
    {
        if (System.Windows.Application.Current?.TryFindResource("FgBrush") is Brush brush)
            return brush;
        return DefaultTextBrush;
    }

    private static Brush CreateFrozenBrush(string hex)
    {
        var brush = (Brush)new BrushConverter().ConvertFromString(hex)!;
        brush.Freeze();
        return brush;
    }

    public int Depth
    {
        get => _depth;
        private set
        {
            if (_depth == value) return;
            _depth = value;
            OnPropertyChanged(nameof(Depth));
            OnPropertyChanged(nameof(Indent));
        }
    }

    public bool IsExpanded
    {
        get => _is_expanded;
        set
        {
            if (_is_expanded == value) return;
            _is_expanded = value;
            OnPropertyChanged(nameof(IsExpanded));
        }
    }

    public bool IsExpandable
    {
        get => _is_expandable;
        private set
        {
            if (_is_expandable == value) return;
            _is_expandable = value;
            OnPropertyChanged(nameof(IsExpandable));
        }
    }

    public bool IsSelected
    {
        get => _is_selected;
        set
        {
            if (_is_selected == value) return;
            _is_selected = value;
            OnPropertyChanged(nameof(IsSelected));
        }
    }

    public void SyncFrom(TreeRow row)
    {
        Node = row.Node;
        Depth = row.Depth;
        IsExpanded = row.IsExpanded;
        IsExpandable = row.IsExpandable;
    }

    public event System.ComponentModel.PropertyChangedEventHandler? PropertyChanged;

    private void OnPropertyChanged(string name) =>
        PropertyChanged?.Invoke(this, new System.ComponentModel.PropertyChangedEventArgs(name));
}

/// <summary>
/// Bridges <see cref="VirtualTreeEngine"/> ↔ WPF: visible rows, selection, caret.
/// </summary>
public sealed class TreeRenderingEngine : IDisposable
{
    private readonly VirtualTreeEngine _engine;
    private readonly Dispatcher _dispatcher;
    private readonly Dictionary<Guid, TreeRowVm> _row_map = new();
    private readonly HashSet<Guid> _selected_ids = new();
    private Guid? _caret_id;
    private bool _syncing;
    private bool _sync_pending;

    public TreeRenderingEngine(VirtualTreeEngine engine, Dispatcher? dispatcher = null)
    {
        _engine = engine ?? throw new ArgumentNullException(nameof(engine));
        _dispatcher = dispatcher ?? Dispatcher.CurrentDispatcher;
        Rows = [];
        _engine.VisibleRowsChanged += OnVisibleRowsChanged;
        SyncRows();
    }

    public ObservableCollection<TreeRowVm> Rows { get; }

    /// <summary>Raised after visible rows are fully synced (UI may clamp scroll).</summary>
    public event EventHandler? RowsSynced;

    public IReadOnlyList<TreeNode> SelectedNodes
    {
        get
        {
            var list = new List<TreeNode>();
            foreach (var id in _selected_ids)
            {
                if (_row_map.TryGetValue(id, out var vm))
                    list.Add(vm.Node);
            }

            return list;
        }
    }

    public TreeRowVm? CaretRow =>
        _caret_id is Guid id && _row_map.TryGetValue(id, out var vm) ? vm : null;

    public event EventHandler? SelectionChanged;
    public event EventHandler<TreeNodeEventArgs>? NodeActivated;

    public async Task InitializeAsync(CancellationToken cancellation_token = default)
    {
        await _engine.InitializeAsync(cancellation_token).ConfigureAwait(true);
        SyncRows();
    }

    public async Task ToggleExpandAsync(TreeRowVm row, CancellationToken cancellation_token = default)
    {
        if (!row.IsExpandable || row.Node.IsPlaceholder) return;
        await _engine.ToggleExpandAsync(row.Node.Id, cancellation_token).ConfigureAwait(true);
    }

    public void SelectSingle(TreeRowVm row, bool clear_others = true)
    {
        if (!row.IsSelectable) return;

        if (clear_others)
        {
            foreach (var id in _selected_ids.ToList())
            {
                if (_row_map.TryGetValue(id, out var vm))
                    vm.IsSelected = false;
            }

            _selected_ids.Clear();
        }

        _selected_ids.Add(row.Node.Id);
        row.IsSelected = true;
        _caret_id = row.Node.Id;
        SelectionChanged?.Invoke(this, EventArgs.Empty);
    }

    public void ToggleSelect(TreeRowVm row)
    {
        if (!row.IsSelectable) return;
        if (_selected_ids.Contains(row.Node.Id))
        {
            _selected_ids.Remove(row.Node.Id);
            row.IsSelected = false;
        }
        else
        {
            _selected_ids.Add(row.Node.Id);
            row.IsSelected = true;
        }

        _caret_id = row.Node.Id;
        SelectionChanged?.Invoke(this, EventArgs.Empty);
    }

    public void SelectRange(TreeRowVm to_row)
    {
        if (CaretRow is null)
        {
            SelectSingle(to_row);
            return;
        }

        var from = Rows.IndexOf(CaretRow);
        var to = Rows.IndexOf(to_row);
        if (from < 0 || to < 0)
        {
            SelectSingle(to_row);
            return;
        }

        if (from > to) (from, to) = (to, from);

        foreach (var id in _selected_ids.ToList())
        {
            if (_row_map.TryGetValue(id, out var vm))
                vm.IsSelected = false;
        }

        _selected_ids.Clear();
        for (var i = from; i <= to; i++)
        {
            var row = Rows[i];
            if (!row.IsSelectable) continue;
            _selected_ids.Add(row.Node.Id);
            row.IsSelected = true;
        }

        if (!to_row.IsSelectable)
        {
            SelectionChanged?.Invoke(this, EventArgs.Empty);
            return;
        }

        _caret_id = to_row.Node.Id;
        SelectionChanged?.Invoke(this, EventArgs.Empty);
    }

    public void MoveCaret(int delta)
    {
        if (Rows.Count == 0) return;
        var start = CaretRow is null
            ? (delta > 0 ? -1 : Rows.Count)
            : Rows.IndexOf(CaretRow);
        var index = start;
        for (var step = 0; step < Rows.Count; step++)
        {
            index += delta;
            if (index < 0 || index >= Rows.Count)
                return;
            if (!Rows[index].IsSelectable)
                continue;
            SelectSingle(Rows[index]);
            return;
        }
    }

    public void RaiseActivated(TreeRowVm row, bool is_double_click)
    {
        if (!row.IsSelectable) return;
        NodeActivated?.Invoke(this, new TreeNodeEventArgs(row.Node, is_double_click));
    }

    private void OnVisibleRowsChanged(object? sender, EventArgs e)
    {
        if (_dispatcher.CheckAccess())
            SyncRows();
        else
            _ = _dispatcher.InvokeAsync(SyncRows, DispatcherPriority.DataBind);
    }

    private void SyncRows()
    {
        if (_syncing)
        {
            _sync_pending = true;
            return;
        }

        _syncing = true;
        try
        {
            do
            {
                _sync_pending = false;
                ApplyVisibleSnapshot();
            } while (_sync_pending);
        }
        finally
        {
            _syncing = false;
        }

        RowsSynced?.Invoke(this, EventArgs.Empty);
    }

    private void ApplyVisibleSnapshot()
    {
        var visible = _engine.VisibleRows;
        var next_ids = new HashSet<Guid>(visible.Select(r => r.Node.Id));

        for (var i = Rows.Count - 1; i >= 0; i--)
        {
            if (next_ids.Contains(Rows[i].Node.Id)) continue;
            var removed = Rows[i];
            _row_map.Remove(removed.Node.Id);
            Rows.RemoveAt(i);
        }

        for (var i = 0; i < visible.Count; i++)
        {
            var row = visible[i];
            if (_row_map.TryGetValue(row.Node.Id, out var existing))
            {
                existing.SyncFrom(row);
                existing.IsSelected = _selected_ids.Contains(row.Node.Id);
                var current_index = Rows.IndexOf(existing);
                if (current_index != i)
                {
                    Rows.RemoveAt(current_index);
                    Rows.Insert(Math.Min(i, Rows.Count), existing);
                }
            }
            else
            {
                var vm = new TreeRowVm(row)
                {
                    IsSelected = _selected_ids.Contains(row.Node.Id)
                };
                _row_map[row.Node.Id] = vm;
                Rows.Insert(Math.Min(i, Rows.Count), vm);
            }
        }

        foreach (var id in _selected_ids.Where(id => !_row_map.ContainsKey(id)).ToList())
            _selected_ids.Remove(id);
    }

    public void Dispose()
    {
        _engine.VisibleRowsChanged -= OnVisibleRowsChanged;
    }
}

public sealed class TreeNodeEventArgs : EventArgs
{
    public TreeNodeEventArgs(TreeNode node, bool is_double_click)
    {
        Node = node;
        IsDoubleClick = is_double_click;
    }

    public TreeNode Node { get; }
    public bool IsDoubleClick { get; }
}
