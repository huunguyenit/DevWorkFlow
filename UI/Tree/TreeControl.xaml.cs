using System.Windows;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Input;
using System.Windows.Threading;
using DevWorkFlow.Tree;

namespace UI.Tree;

/// <summary>
/// Thin WPF host — zero business. Renders flat virtualized rows from <see cref="TreeRenderingEngine"/>.
/// </summary>
public partial class TreeControl : UserControl
{
    public static readonly DependencyProperty EngineProperty =
        DependencyProperty.Register(
            nameof(Engine),
            typeof(TreeRenderingEngine),
            typeof(TreeControl),
            new PropertyMetadata(null, OnEngineChanged));

    public static readonly DependencyProperty FilterTextProperty =
        DependencyProperty.Register(
            nameof(FilterText),
            typeof(string),
            typeof(TreeControl),
            new FrameworkPropertyMetadata(
                string.Empty,
                FrameworkPropertyMetadataOptions.BindsTwoWayByDefault));

    public static readonly DependencyProperty StatusTextProperty =
        DependencyProperty.Register(
            nameof(StatusText),
            typeof(string),
            typeof(TreeControl),
            new PropertyMetadata(string.Empty));

    public static readonly DependencyProperty ShowFilterProperty =
        DependencyProperty.Register(
            nameof(ShowFilter),
            typeof(bool),
            typeof(TreeControl),
            new PropertyMetadata(true));

    public static readonly RoutedEvent NodeActivatedEvent =
        EventManager.RegisterRoutedEvent(
            nameof(NodeActivated),
            RoutingStrategy.Bubble,
            typeof(RoutedEventHandler),
            typeof(TreeControl));

    public static readonly RoutedEvent NodeExpandingEvent =
        EventManager.RegisterRoutedEvent(
            nameof(NodeExpanding),
            RoutingStrategy.Bubble,
            typeof(RoutedEventHandler),
            typeof(TreeControl));

    private DispatcherTimer? _activation_timer;
    private TreeRowVm? _pending_row;
    private Point _drag_start;
    private bool _drag_pending;
    private int _expand_generation;
    private bool _expand_busy;
    private ScrollViewer? _row_scroll;

    public TreeControl()
    {
        InitializeComponent();
        RowList.PreviewMouseLeftButtonDown += RowList_PreviewMouseLeftButtonDown;
        RowList.PreviewMouseMove += RowList_PreviewMouseMove;
        RowList.Drop += RowList_Drop;
        RowList.DragOver += RowList_DragOver;
        RowList.Loaded += (_, _) => _row_scroll = FindScrollViewer(RowList);
        AllowDrop = true;
        RowList.AllowDrop = true;
    }

    public TreeRenderingEngine? Engine
    {
        get => (TreeRenderingEngine?)GetValue(EngineProperty);
        set => SetValue(EngineProperty, value);
    }

    public string FilterText
    {
        get => (string)GetValue(FilterTextProperty);
        set => SetValue(FilterTextProperty, value);
    }

    public string StatusText
    {
        get => (string)GetValue(StatusTextProperty);
        set => SetValue(StatusTextProperty, value);
    }

    public bool ShowFilter
    {
        get => (bool)GetValue(ShowFilterProperty);
        set => SetValue(ShowFilterProperty, value);
    }

    public int ActivationDelayMs { get; set; } = 200;

    public ITreeCommandProvider? CommandProvider { get; set; }
    public ITreeDragDropHandler? DragDropHandler { get; set; }

    public event RoutedEventHandler NodeActivated
    {
        add => AddHandler(NodeActivatedEvent, value);
        remove => RemoveHandler(NodeActivatedEvent, value);
    }

    public event RoutedEventHandler NodeExpanding
    {
        add => AddHandler(NodeExpandingEvent, value);
        remove => RemoveHandler(NodeExpandingEvent, value);
    }

    public event EventHandler<TreeFilterChangedEventArgs>? FilterChanged;

    private static void OnEngineChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
    {
        var control = (TreeControl)d;
        if (e.OldValue is TreeRenderingEngine old_engine)
        {
            old_engine.NodeActivated -= control.OnEngineNodeActivated;
            old_engine.RowsSynced -= control.OnRowsSynced;
        }

        if (e.NewValue is TreeRenderingEngine new_engine)
        {
            new_engine.NodeActivated += control.OnEngineNodeActivated;
            new_engine.RowsSynced += control.OnRowsSynced;
            control.RowList.ItemsSource = new_engine.Rows;
            control.ClampScrollAfterLayout();
        }
        else
        {
            control.RowList.ItemsSource = null;
        }
    }

    private void OnRowsSynced(object? sender, EventArgs e) => ClampScrollAfterLayout();

    /// <summary>
    /// Khi thu/phóng nhanh, ExtentHeight thay đổi — VerticalOffset có thể vượt ScrollableHeight
    /// → thanh cuộn trông như bị khóa. Kẹp lại sau layout.
    /// </summary>
    private void ClampScrollAfterLayout()
    {
        _ = Dispatcher.BeginInvoke(DispatcherPriority.Loaded, () =>
        {
            _row_scroll ??= FindScrollViewer(RowList);
            if (_row_scroll is null) return;

            var max = _row_scroll.ScrollableHeight;
            if (max < 0) max = 0;
            if (_row_scroll.VerticalOffset > max)
                _row_scroll.ScrollToVerticalOffset(max);
            if (_row_scroll.HorizontalOffset > _row_scroll.ScrollableWidth)
                _row_scroll.ScrollToHorizontalOffset(Math.Max(0, _row_scroll.ScrollableWidth));
        });
    }

    private static ScrollViewer? FindScrollViewer(DependencyObject root)
    {
        if (root is ScrollViewer sv) return sv;
        for (var i = 0; i < System.Windows.Media.VisualTreeHelper.GetChildrenCount(root); i++)
        {
            var child = System.Windows.Media.VisualTreeHelper.GetChild(root, i);
            var found = FindScrollViewer(child);
            if (found is not null) return found;
        }

        return null;
    }

    private void OnEngineNodeActivated(object? sender, TreeNodeEventArgs e)
    {
        RaiseEvent(new TreeControlNodeActivatedEventArgs(NodeActivatedEvent, e.Node, e.IsDoubleClick));
    }

    private void FilterBox_TextChanged(object sender, TextChangedEventArgs e)
    {
        FilterText = FilterBox.Text;
        FilterChanged?.Invoke(this, new TreeFilterChangedEventArgs(FilterBox.Text));
    }

    private void Row_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
    {
        if (sender is not FrameworkElement { DataContext: TreeRowVm row } || Engine is null)
            return;

        // Click chevron → chỉ Expand, không select/activate (tránh race SyncCommandTree khi Menu load file).
        if (e.OriginalSource is DependencyObject source
            && FindAncestor<ToggleButton>(source) is not null)
            return;

        if (!row.IsSelectable)
        {
            e.Handled = true;
            return;
        }

        _drag_start = e.GetPosition(this);
        _drag_pending = true;

        if (Keyboard.Modifiers.HasFlag(ModifierKeys.Control))
            Engine.ToggleSelect(row);
        else if (Keyboard.Modifiers.HasFlag(ModifierKeys.Shift))
            Engine.SelectRange(row);
        else
            Engine.SelectSingle(row);

        if (e.ClickCount >= 2)
        {
            _activation_timer?.Stop();
            _pending_row = null;
            _ = HandleDoubleClickAsync(row);
        }
        else
        {
            ScheduleActivation(row);
        }

        RowList.Focus();
        e.Handled = true;
    }

    /// <summary>
    /// Double-click node có con → toggle expand/collapse (giống chevron / Left-Right).
    /// Sau đó vẫn RaiseActivated để host mở file/object khi là leaf.
    /// </summary>
    private async Task HandleDoubleClickAsync(TreeRowVm row)
    {
        if (Engine is null) return;

        if (row.IsExpandable && !row.Node.IsPlaceholder && !_expand_busy)
        {
            _expand_busy = true;
            var generation = ++_expand_generation;
            var engine = Engine;
            try
            {
                if (!row.IsExpanded)
                    RaiseEvent(new TreeControlNodeActivatedEventArgs(
                        NodeExpandingEvent, row.Node, is_double_click: false));

                await engine.ToggleExpandAsync(row);
                if (generation == _expand_generation)
                    ClampScrollAfterLayout();
            }
            catch
            {
                // DataSource / dispose race — tránh crash UI.
            }
            finally
            {
                _expand_busy = false;
            }
        }

        Engine.RaiseActivated(row, is_double_click: true);
    }

    private static T? FindAncestor<T>(DependencyObject? current) where T : DependencyObject
    {
        while (current is not null)
        {
            if (current is T match) return match;
            current = System.Windows.Media.VisualTreeHelper.GetParent(current);
        }

        return null;
    }

    private async void Expander_Click(object sender, RoutedEventArgs e)
    {
        if (sender is not FrameworkElement { DataContext: TreeRowVm row } || Engine is null)
            return;

        e.Handled = true;

        if (_expand_busy) return;
        _expand_busy = true;
        var generation = ++_expand_generation;
        var engine = Engine;
        try
        {
            // Sắp expand → cho host load children (menu controller files) trước
            if (!row.IsExpanded)
                RaiseEvent(new TreeControlNodeActivatedEventArgs(NodeExpandingEvent, row.Node, is_double_click: false));

            await engine.ToggleExpandAsync(row);
            if (generation == _expand_generation)
                ClampScrollAfterLayout();
        }
        catch
        {
            // DataSource / dispose race — tránh crash UI.
        }
        finally
        {
            _expand_busy = false;
        }
    }

    private async void RowList_KeyDown(object sender, KeyEventArgs e)
    {
        if (Engine is null) return;
        var caret = Engine.CaretRow;

        switch (e.Key)
        {
            case Key.Down:
                Engine.MoveCaret(1);
                e.Handled = true;
                break;
            case Key.Up:
                Engine.MoveCaret(-1);
                e.Handled = true;
                break;
            case Key.Right:
                if (caret is not null && caret.IsExpandable && !caret.IsExpanded)
                {
                    RaiseEvent(new TreeControlNodeActivatedEventArgs(
                        NodeExpandingEvent, caret.Node, is_double_click: false));
                    await Engine.ToggleExpandAsync(caret);
                    e.Handled = true;
                }
                else
                {
                    Engine.MoveCaret(1);
                    e.Handled = true;
                }

                break;
            case Key.Left:
                if (caret is not null && caret.IsExpanded)
                {
                    await Engine.ToggleExpandAsync(caret);
                    e.Handled = true;
                }
                else
                {
                    Engine.MoveCaret(-1);
                    e.Handled = true;
                }

                break;
            case Key.Enter:
                if (caret is not null)
                {
                    Engine.RaiseActivated(caret, is_double_click: false);
                    e.Handled = true;
                }

                break;
            case Key.Space:
                if (caret is not null)
                {
                    Engine.ToggleSelect(caret);
                    e.Handled = true;
                }

                break;
        }
    }

    private async void RowList_ContextMenuOpening(object sender, ContextMenuEventArgs e)
    {
        if (CommandProvider is null || Engine is null)
        {
            RowList.ContextMenu = null;
            return;
        }

        var selection = Engine.SelectedNodes;
        if (selection.Count == 0 && Engine.CaretRow is not null)
            selection = [Engine.CaretRow.Node];

        IReadOnlyList<TreeCommand> commands;
        try
        {
            commands = await CommandProvider.GetCommandsAsync(selection);
        }
        catch
        {
            RowList.ContextMenu = null;
            return;
        }

        if (commands.Count == 0)
        {
            RowList.ContextMenu = null;
            return;
        }

        var menu = new ContextMenu();
        foreach (var cmd in commands)
        {
            var item = new MenuItem
            {
                Header = cmd.Header,
                IsEnabled = cmd.IsEnabled,
                Tag = cmd
            };
            item.Click += async (_, _) =>
            {
                if (item.Tag is TreeCommand c)
                    await CommandProvider.ExecuteAsync(c, selection);
            };
            menu.Items.Add(item);
        }

        RowList.ContextMenu = menu;
    }

    private void ScheduleActivation(TreeRowVm row)
    {
        _pending_row = row;
        if (ActivationDelayMs <= 0)
        {
            Engine?.RaiseActivated(row, is_double_click: false);
            return;
        }

        _activation_timer ??= new DispatcherTimer(DispatcherPriority.Background, Dispatcher)
        {
            Interval = TimeSpan.FromMilliseconds(ActivationDelayMs)
        };
        _activation_timer.Interval = TimeSpan.FromMilliseconds(ActivationDelayMs);
        _activation_timer.Stop();
        _activation_timer.Tick -= ActivationTimer_Tick;
        _activation_timer.Tick += ActivationTimer_Tick;
        _activation_timer.Start();
    }

    private void ActivationTimer_Tick(object? sender, EventArgs e)
    {
        _activation_timer?.Stop();
        if (_pending_row is null || Engine is null) return;
        Engine.RaiseActivated(_pending_row, is_double_click: false);
        _pending_row = null;
    }

    private void RowList_PreviewMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
    {
        _drag_start = e.GetPosition(this);
        _drag_pending = true;
    }

    private void RowList_PreviewMouseMove(object sender, MouseEventArgs e)
    {
        if (!_drag_pending || e.LeftButton != MouseButtonState.Pressed || Engine is null)
            return;

        var pos = e.GetPosition(this);
        if (Math.Abs(pos.X - _drag_start.X) < SystemParameters.MinimumHorizontalDragDistance
            && Math.Abs(pos.Y - _drag_start.Y) < SystemParameters.MinimumVerticalDragDistance)
            return;

        _drag_pending = false;
        var selection = Engine.SelectedNodes;
        if (selection.Count == 0) return;

        var data = new DataObject("DevWorkFlow.Tree.Nodes", selection.ToList());
        DragDrop.DoDragDrop(RowList, data, DragDropEffects.Copy | DragDropEffects.Move | DragDropEffects.Link);
    }

    private void RowList_DragOver(object sender, DragEventArgs e)
    {
        if (DragDropHandler is null || Engine is null
            || !e.Data.GetDataPresent("DevWorkFlow.Tree.Nodes"))
        {
            e.Effects = DragDropEffects.None;
            e.Handled = true;
            return;
        }

        var dragged = (IReadOnlyList<TreeNode>)e.Data.GetData("DevWorkFlow.Tree.Nodes");
        var target = FindRowUnder(e.GetPosition(RowList))?.Node;
        var effect = DragDropHandler.GetEffects(dragged, target);
        e.Effects = effect switch
        {
            TreeDropEffect.Move => DragDropEffects.Move,
            TreeDropEffect.Copy => DragDropEffects.Copy,
            TreeDropEffect.Link => DragDropEffects.Link,
            _ => DragDropEffects.None
        };
        e.Handled = true;
    }

    private async void RowList_Drop(object sender, DragEventArgs e)
    {
        if (DragDropHandler is null || Engine is null
            || !e.Data.GetDataPresent("DevWorkFlow.Tree.Nodes"))
            return;

        var dragged = (IReadOnlyList<TreeNode>)e.Data.GetData("DevWorkFlow.Tree.Nodes");
        var target = FindRowUnder(e.GetPosition(RowList))?.Node;
        var effect = DragDropHandler.GetEffects(dragged, target);
        if (effect == TreeDropEffect.None) return;

        await DragDropHandler.DropAsync(dragged, target, effect);
        e.Handled = true;
    }

    private TreeRowVm? FindRowUnder(Point point)
    {
        var hit = System.Windows.Media.VisualTreeHelper.HitTest(RowList, point);
        var current = hit?.VisualHit as DependencyObject;
        while (current is not null)
        {
            if (current is FrameworkElement { DataContext: TreeRowVm row })
                return row;
            current = System.Windows.Media.VisualTreeHelper.GetParent(current);
        }

        return null;
    }
}

public sealed class TreeControlNodeActivatedEventArgs : RoutedEventArgs
{
    public TreeControlNodeActivatedEventArgs(RoutedEvent routed_event, TreeNode node, bool is_double_click)
        : base(routed_event)
    {
        Node = node;
        IsDoubleClick = is_double_click;
    }

    public TreeNode Node { get; }
    public bool IsDoubleClick { get; }
}

public sealed class TreeFilterChangedEventArgs : EventArgs
{
    public TreeFilterChangedEventArgs(string text) => Text = text ?? string.Empty;
    public string Text { get; }
}
