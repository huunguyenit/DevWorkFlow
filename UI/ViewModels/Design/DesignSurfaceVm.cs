using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using DevWorkFlow.Domain.Models.Fbo;

namespace UI.ViewModels.Design;

public enum DesignEditorKind
{
    Text,
    Boolean,
    DateTime,
    DropDown,
    Lookup
}

public class DesignCellVm : INotifyPropertyChanged
{
    private string _text = string.Empty;
    private bool _is_selected;
    private int _width_px = 120;
    private double _width_dip = 120;

    public FormViewCellKind Kind { get; init; }
    public string FieldName { get; init; } = string.Empty;
    public string TextV { get; set; } = string.Empty;
    public string TextE { get; set; } = string.Empty;
    public int RowIndex { get; set; }
    public string? Pattern { get; set; }

    public string Text
    {
        get => _text;
        set { if (_text == value) return; _text = value; OnPropertyChanged(); }
    }

    public string Value { get; init; } = string.Empty;
    public string ReferenceText { get; init; } = string.Empty;
    public string DropDownText { get; init; } = string.Empty;

    private bool _show_input_border = true;
    private bool _is_read_only;
    private bool _is_required;

    public DesignEditorKind EditorKind { get; init; } = DesignEditorKind.Text;
    public bool ShowLookupIcon { get; init; }
    public bool ShowDateIcon { get; init; }
    public bool IsCheckbox { get; init; }
    public bool IsDropDownEditor => EditorKind == DesignEditorKind.DropDown;
    public bool IsTextEditor => EditorKind == DesignEditorKind.Text
                                || EditorKind == DesignEditorKind.Lookup
                                || EditorKind == DesignEditorKind.DateTime;

    public string? DataType { get; init; }
    public string? ItemsStyle { get; init; }
    public string? ItemsController { get; init; }
    public string? ItemsReference { get; init; }

    public bool ShowInputBorder
    {
        get => _show_input_border;
        set { if (_show_input_border == value) return; _show_input_border = value; OnPropertyChanged(); }
    }

    public bool IsReadOnly
    {
        get => _is_read_only;
        set { if (_is_read_only == value) return; _is_read_only = value; OnPropertyChanged(); }
    }

    public bool IsRequired
    {
        get => _is_required;
        set { if (_is_required == value) return; _is_required = value; OnPropertyChanged(); }
    }

    private bool _is_primary_key;

    public bool IsPrimaryKey
    {
        get => _is_primary_key;
        set { if (_is_primary_key == value) return; _is_primary_key = value; OnPropertyChanged(); }
    }

    public int WidthPx
    {
        get => _width_px;
        set { if (_width_px == value) return; _width_px = value; OnPropertyChanged(); }
    }

    public double WidthDip
    {
        get => _width_dip;
        set
        {
            if (Math.Abs(_width_dip - value) < 0.01) return;
            _width_dip = value;
            OnPropertyChanged();
        }
    }

    public int ColumnIndex { get; init; }
    public int ColumnSpan { get; set; } = 1;
    public string TextAlign { get; init; } = "Left";
    public bool IsUpperCase { get; init; }
    public bool IsLowerCase { get; init; }
    public string? FormatHint { get; init; }

    public bool IsSelected
    {
        get => _is_selected;
        set { if (_is_selected == value) return; _is_selected = value; OnPropertyChanged(); }
    }

    public bool IsEmpty => Kind == FormViewCellKind.Empty;
    public bool IsLabel => Kind == FormViewCellKind.Label;
    public bool IsInput => Kind == FormViewCellKind.Input;
    public bool IsDescription => Kind == FormViewCellKind.Description;
    public bool HasReferenceText => !string.IsNullOrWhiteSpace(ReferenceText);

    public void ApplyLanguage(bool vietnamese)
    {
        Text = vietnamese
            ? (!string.IsNullOrWhiteSpace(TextV) ? TextV : TextE)
            : (!string.IsNullOrWhiteSpace(TextE) ? TextE : TextV);
    }

    public event PropertyChangedEventHandler? PropertyChanged;

    private void OnPropertyChanged([CallerMemberName] string? name = null) =>
        PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(name));
}

public class DesignFormRowVm
{
    public string Pattern { get; set; } = string.Empty;
    public ObservableCollection<DesignCellVm> Cells { get; } = [];
    public double HeightDip { get; set; } = 24;

    /// <summary>Dòng domain tương ứng (để ghi lại pattern/cells khi đổi span).</summary>
    public FormViewRow? Source { get; set; }

    /// <summary>Danh sách width px của bảng chứa dòng (top form hoặc category).</summary>
    public IList<int>? ColumnWidthsPx { get; set; }
}

public class RulerTickVm : INotifyPropertyChanged
{
    private int _width_px;
    private double _width_dip;
    private double _offset_dip;

    public int Index { get; init; }

    public int WidthPx
    {
        get => _width_px;
        set { if (_width_px == value) return; _width_px = value; OnPropertyChanged(); OnPropertyChanged(nameof(Label)); }
    }

    public double WidthDip
    {
        get => _width_dip;
        set { if (Math.Abs(_width_dip - value) < 0.01) return; _width_dip = value; OnPropertyChanged(); OnPropertyChanged(nameof(Label)); }
    }

    public double OffsetDip
    {
        get => _offset_dip;
        set { if (Math.Abs(_offset_dip - value) < 0.01) return; _offset_dip = value; OnPropertyChanged(); }
    }

    public string Label => WidthPx.ToString();

    public event PropertyChangedEventHandler? PropertyChanged;

    private void OnPropertyChanged([CallerMemberName] string? name = null) =>
        PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(name));
}

public enum FieldPropertyEditorKind
{
    Text,
    Boolean,
    Enum
}

public class DesignFieldPropertyVm : INotifyPropertyChanged
{
    private string _value = string.Empty;

    public string Name { get; init; } = string.Empty;
    public string DisplayName { get; init; } = string.Empty;
    public string Category { get; init; } = "Field";
    public FieldPropertyEditorKind EditorKind { get; init; } = FieldPropertyEditorKind.Text;
    public IReadOnlyList<string> EnumOptions { get; init; } = [];
    public bool IsReadOnly { get; init; }

    public string Value
    {
        get => _value;
        set
        {
            if (_value == value) return;
            _value = value ?? string.Empty;
            OnPropertyChanged();
            OnPropertyChanged(nameof(BoolValue));
        }
    }

    public bool BoolValue
    {
        get => string.Equals(_value, "true", StringComparison.OrdinalIgnoreCase)
               || _value == "1";
        set
        {
            var next = value ? "true" : "false";
            if (_value == next) return;
            _value = next;
            OnPropertyChanged();
            OnPropertyChanged(nameof(Value));
        }
    }

    public bool IsTextEditor => EditorKind == FieldPropertyEditorKind.Text;
    public bool IsBooleanEditor => EditorKind == FieldPropertyEditorKind.Boolean;
    public bool IsEnumEditor => EditorKind == FieldPropertyEditorKind.Enum;

    public event PropertyChangedEventHandler? PropertyChanged;

    private void OnPropertyChanged([CallerMemberName] string? name = null) =>
        PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(name));
}

public class DesignCategoryTabVm : INotifyPropertyChanged
{
    private string _header = string.Empty;
    private bool _is_selected;

    public int Index { get; init; }
    public string HeaderV { get; init; } = string.Empty;
    public string HeaderE { get; init; } = string.Empty;

    public string Header
    {
        get => _header;
        set { if (_header == value) return; _header = value; OnPropertyChanged(); }
    }

    public bool IsSelected
    {
        get => _is_selected;
        set { if (_is_selected == value) return; _is_selected = value; OnPropertyChanged(); }
    }

    public ObservableCollection<DesignFormRowVm> Rows { get; } = [];
    public ObservableCollection<RulerTickVm> RulerTicks { get; } = [];
    public ObservableCollection<int> ColumnWidthsPx { get; } = [];

    private double _form_table_width_dip;
    private int _form_table_width_px;

    public double FormTableWidthDip
    {
        get => _form_table_width_dip;
        set { if (Math.Abs(_form_table_width_dip - value) < 0.01) return; _form_table_width_dip = value; OnPropertyChanged(); }
    }

    public int FormTableWidthPx
    {
        get => _form_table_width_px;
        set { if (_form_table_width_px == value) return; _form_table_width_px = value; OnPropertyChanged(); }
    }

    public void ApplyLanguage(bool vietnamese)
    {
        Header = vietnamese
            ? (!string.IsNullOrWhiteSpace(HeaderV) ? HeaderV : HeaderE)
            : (!string.IsNullOrWhiteSpace(HeaderE) ? HeaderE : HeaderV);
        foreach (var row in Rows)
        foreach (var cell in row.Cells)
            cell.ApplyLanguage(vietnamese);
    }

    public event PropertyChangedEventHandler? PropertyChanged;

    private void OnPropertyChanged([CallerMemberName] string? name = null) =>
        PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(name));
}

public class DesignSurfaceVm : INotifyPropertyChanged
{
    private string _title = string.Empty;
    private string _sub_title = string.Empty;

    public ControllerDisplayKind DisplayKind { get; init; }

    public string Title
    {
        get => _title;
        set { if (_title == value) return; _title = value; OnPropertyChanged(); }
    }

    public string SubTitle
    {
        get => _sub_title;
        set { if (_sub_title == value) return; _sub_title = value; OnPropertyChanged(); }
    }

    public string TitleV { get; init; } = string.Empty;
    public string TitleE { get; init; } = string.Empty;
    public string SubTitleV { get; init; } = string.Empty;
    public string SubTitleE { get; init; } = string.Empty;

    public bool IsForm => DisplayKind == ControllerDisplayKind.Form;
    public bool IsGrid => DisplayKind == ControllerDisplayKind.Grid;
    public bool IsLookup => DisplayKind == ControllerDisplayKind.Lookup;

    public const int RowHeightPx = 24;

    public ObservableCollection<int> ColumnWidthsPx { get; } = [];
    public ObservableCollection<RulerTickVm> RulerTicks { get; } = [];
    public ObservableCollection<DesignFormRowVm> FormRows { get; } = [];
    public ObservableCollection<DesignFormRowVm> BottomRows { get; } = [];
    public ObservableCollection<DesignCategoryTabVm> CategoryTabs { get; } = [];

    private DesignCategoryTabVm? _selected_category;

    public DesignCategoryTabVm? SelectedCategory
    {
        get => _selected_category;
        set
        {
            if (_selected_category == value) return;
            if (_selected_category is not null) _selected_category.IsSelected = false;
            _selected_category = value;
            if (_selected_category is not null) _selected_category.IsSelected = true;
            OnPropertyChanged();
            OnPropertyChanged(nameof(HasSelectedCategory));
        }
    }

    public bool HasCategories => CategoryTabs.Count > 0;
    public bool HasSelectedCategory => SelectedCategory is not null;
    public bool HasBottomRows => BottomRows.Count > 0;

    private int _form_table_width_px;
    private double _form_table_width_dip;
    private double _form_height_dip;
    private int _form_height_px;
    private bool _is_height_from_rows = true;

    public int FormTableWidthPx
    {
        get => _form_table_width_px;
        set { if (_form_table_width_px == value) return; _form_table_width_px = value; OnPropertyChanged(); }
    }

    public double FormTableWidthDip
    {
        get => _form_table_width_dip;
        set { if (Math.Abs(_form_table_width_dip - value) < 0.01) return; _form_table_width_dip = value; OnPropertyChanged(); }
    }

    public double FormHeightDip
    {
        get => _form_height_dip;
        set
        {
            if (Math.Abs(_form_height_dip - value) < 0.01) return;
            _form_height_dip = value;
            OnPropertyChanged();
            OnPropertyChanged(nameof(CategoryContentHeightDip));
            OnPropertyChanged(nameof(HasFixedCategoryHeight));
            OnPropertyChanged(nameof(LayoutBadge));
        }
    }

    public int FormHeightPx
    {
        get => _form_height_px;
        set
        {
            if (_form_height_px == value) return;
            _form_height_px = value;
            OnPropertyChanged();
            OnPropertyChanged(nameof(LayoutBadge));
        }
    }

    public bool IsHeightFromRows
    {
        get => _is_height_from_rows;
        set
        {
            if (_is_height_from_rows == value) return;
            _is_height_from_rows = value;
            OnPropertyChanged();
            OnPropertyChanged(nameof(CategoryContentHeightDip));
            OnPropertyChanged(nameof(HasFixedCategoryHeight));
            OnPropertyChanged(nameof(LayoutBadge));
        }
    }

    public int Anchor { get; set; }
    public int Split { get; set; }

    public string LayoutBadge =>
        IsHeightFromRows || double.IsNaN(FormHeightDip) || FormHeightDip <= 0
            ? "height=auto"
            : $"height={FormHeightPx}px";

    /// <summary>
    /// Chiều cao cố định (dip) cho vùng nội dung mỗi tab = height khai báo.
    /// NaN = auto (không có khai báo height hợp lệ).
    /// </summary>
    public double CategoryContentHeightDip =>
        !IsHeightFromRows && FormHeightDip > 0 ? FormHeightDip : double.NaN;

    public bool HasFixedCategoryHeight =>
        !IsHeightFromRows && FormHeightDip > 0;

    public ObservableCollection<DesignColumnVm> Columns { get; } = [];
    public ObservableCollection<DesignDataRowVm> SampleRows { get; } = [];
    public ObservableCollection<DesignToolbarItemVm> ToolbarItems { get; } = [];

    public string SearchFieldLabel { get; set; } = string.Empty;
    public string SearchFieldLabelV { get; init; } = string.Empty;
    public string SearchFieldLabelE { get; init; } = string.Empty;

    public void ApplyLanguage(bool vietnamese)
    {
        Title = Pick(TitleV, TitleE, vietnamese);
        SubTitle = Pick(SubTitleV, SubTitleE, vietnamese);
        SearchFieldLabel = Pick(SearchFieldLabelV, SearchFieldLabelE, vietnamese);
        foreach (var row in FormRows)
        foreach (var cell in row.Cells)
            cell.ApplyLanguage(vietnamese);
        foreach (var row in BottomRows)
        foreach (var cell in row.Cells)
            cell.ApplyLanguage(vietnamese);
        foreach (var tab in CategoryTabs)
            tab.ApplyLanguage(vietnamese);
        foreach (var col in Columns)
            col.ApplyLanguage(vietnamese);
    }

    private static string Pick(string v, string e, bool vietnamese) =>
        vietnamese ? (!string.IsNullOrWhiteSpace(v) ? v : e) : (!string.IsNullOrWhiteSpace(e) ? e : v);

    public event PropertyChangedEventHandler? PropertyChanged;
    private void OnPropertyChanged([CallerMemberName] string? name = null) =>
        PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(name));
}

public class DesignColumnVm : INotifyPropertyChanged
{
    private string _header = string.Empty;
    public string Name { get; init; } = string.Empty;
    public string HeaderV { get; init; } = string.Empty;
    public string HeaderE { get; init; } = string.Empty;
    public string Header
    {
        get => _header;
        set { if (_header == value) return; _header = value; OnPropertyChanged(); }
    }
    public int Width { get; init; } = 120;
    public double WidthDip { get; init; } = 120;
    public string Align { get; init; } = "left";
    public bool IsPrimaryKey { get; init; }
    public void ApplyLanguage(bool vietnamese) =>
        Header = vietnamese ? (!string.IsNullOrWhiteSpace(HeaderV) ? HeaderV : HeaderE) : (!string.IsNullOrWhiteSpace(HeaderE) ? HeaderE : HeaderV);
    public event PropertyChangedEventHandler? PropertyChanged;
    private void OnPropertyChanged([CallerMemberName] string? name = null) =>
        PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(name));
}

public class DesignDataRowVm
{
    public ObservableCollection<string> Values { get; } = [];
}

public class DesignToolbarItemVm
{
    public string Command { get; init; } = string.Empty;
    public string Title { get; init; } = string.Empty;
    public string TitleV { get; init; } = string.Empty;
    public string TitleE { get; init; } = string.Empty;
    public bool IsSeparator { get; init; }
}
