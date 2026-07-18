using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Windows.Threading;
using DevWorkFlow.Application.Engine;
using UI.ViewModels.Base;

namespace UI.ViewModels.Bottom;

/// <summary>Node TreeView tóm tắt cấu trúc XML code.</summary>
public sealed class XmlStructureNodeVm : ViewModelBase
{
    private bool _is_expanded = true;

    public required string Display { get; init; }
    public required string IconKind { get; init; }
    public required int StartLine { get; init; }
    public required int StartOffset { get; init; }
    public required XmlStructureKind Kind { get; init; }
    public ObservableCollection<XmlStructureNodeVm> Children { get; } = [];

    public bool IsExpanded
    {
        get => _is_expanded;
        set => SetProperty(ref _is_expanded, value);
    }

    public bool HasChildren => Children.Count > 0;
}

/// <summary>
/// TreeView phải XML editor — tóm tắt fields/views/commands/script·function/response/…
/// Click → nhảy dòng trong editor.
/// </summary>
public sealed class XmlStructureOutlineViewModel : ViewModelBase
{
    private FormBuilderViewModel? _form_builder_vm;
    private readonly DispatcherTimer _rebuild_timer;
    private string _header = "Structure";
    private XmlStructureNodeVm? _selected;

    public XmlStructureOutlineViewModel(FormBuilderViewModel? form_builder_vm = null)
    {
        Roots = [];
        SelectNodeCommand = new RelayCommand<XmlStructureNodeVm>(SelectNode);
        RefreshCommand = new RelayCommand(RebuildNow);

        _rebuild_timer = new DispatcherTimer(DispatcherPriority.Background)
        {
            Interval = TimeSpan.FromMilliseconds(350)
        };
        _rebuild_timer.Tick += (_, _) =>
        {
            _rebuild_timer.Stop();
            RebuildNow();
        };

        BindTo(form_builder_vm);
    }

    public ObservableCollection<XmlStructureNodeVm> Roots { get; }

    public string Header
    {
        get => _header;
        private set => SetProperty(ref _header, value);
    }

    public XmlStructureNodeVm? SelectedNode
    {
        get => _selected;
        set
        {
            if (!SetProperty(ref _selected, value) || value is null) return;
            SelectNode(value);
        }
    }

    public bool HasNodes => Roots.Count > 0;

    public RelayCommand<XmlStructureNodeVm> SelectNodeCommand { get; }
    public RelayCommand RefreshCommand { get; }

    public void BindTo(FormBuilderViewModel? form_builder_vm)
    {
        if (ReferenceEquals(_form_builder_vm, form_builder_vm)) return;
        if (_form_builder_vm is not null)
            _form_builder_vm.PropertyChanged -= OnFormChanged;
        _form_builder_vm = form_builder_vm;
        if (_form_builder_vm is not null)
            _form_builder_vm.PropertyChanged += OnFormChanged;
        RebuildNow();
    }

    private void OnFormChanged(object? sender, PropertyChangedEventArgs e)
    {
        if (e.PropertyName is nameof(FormBuilderViewModel.XmlSource)
            or nameof(FormBuilderViewModel.EditorText)
            or nameof(FormBuilderViewModel.LoadedFilePath)
            or nameof(FormBuilderViewModel.HasDocument))
        {
            _rebuild_timer.Stop();
            _rebuild_timer.Start();
        }
    }

    private void RebuildNow()
    {
        Roots.Clear();
        var xml = _form_builder_vm?.XmlSource;
        if (string.IsNullOrWhiteSpace(xml))
        {
            Header = "Structure";
            OnPropertyChanged(nameof(HasNodes));
            return;
        }

        var parsed = XmlStructureParser.Parse(xml);
        if (parsed is null)
        {
            Header = "Structure";
            OnPropertyChanged(nameof(HasNodes));
            return;
        }

        Header = $"Structure · {parsed.Name}";
        Roots.Add(ToVm(parsed, expand: true));
        OnPropertyChanged(nameof(HasNodes));
    }

    private static XmlStructureNodeVm ToVm(XmlStructureNode node, bool expand)
    {
        var vm = new XmlStructureNodeVm
        {
            Display = node.Display,
            IconKind = IconFor(node),
            StartLine = node.StartLine,
            StartOffset = node.StartOffset,
            Kind = node.Kind,
            IsExpanded = expand || node.Kind == XmlStructureKind.ScriptFunction
                         || IsPrimarySection(node.Name)
        };

        foreach (var child in node.Children)
            vm.Children.Add(ToVm(child, expand: false));

        return vm;
    }

    private static bool IsPrimarySection(string name) =>
        name.Equals("fields", StringComparison.OrdinalIgnoreCase)
        || name.Equals("views", StringComparison.OrdinalIgnoreCase)
        || name.Equals("commands", StringComparison.OrdinalIgnoreCase)
        || name.Equals("script", StringComparison.OrdinalIgnoreCase)
        || name.Equals("response", StringComparison.OrdinalIgnoreCase);

    private static string IconFor(XmlStructureNode node) =>
        node.Kind switch
        {
            XmlStructureKind.ScriptFunction => "CodeBraces",
            _ => node.Name.ToLowerInvariant() switch
            {
                "dir" or "filter" or "grid" or "lookup" => "FileDocumentOutline",
                "fields" or "field" => "FormTextbox",
                "views" or "view" => "ViewDashboard",
                "commands" or "command" or "query" => "Database",
                "script" or "text" => "LanguageJavascript",
                "response" or "action" => "Reply",
                "css" => "LanguageCss3",
                _ => "CodeTags"
            }
        };

    private void SelectNode(XmlStructureNodeVm? node)
    {
        if (node is null || _form_builder_vm is null) return;
        _form_builder_vm.NavigateToOffset(node.StartOffset, node.StartLine);
    }
}
