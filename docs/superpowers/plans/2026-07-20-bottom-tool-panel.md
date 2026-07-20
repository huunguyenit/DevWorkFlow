# Bottom Tool Panel (Shared Layout) Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Unify Problems, Output, Log, and Search under one `BottomToolPanel` layout (Problems visual as standard) via `IBottomListItem` + `BottomPaneVm`.

**Architecture:** One shared UserControl owns header + list chrome. Each bottom tab binds a `BottomPaneVm` (title, badges, items, clear, activate). Item rows bind `IBottomListItem`. Navigate goes through `ActivateItemCommand` (no per-panel code-behind). XML tab stays `XmlBottomPanel`.

**Tech Stack:** WPF, MaterialDesign `PackIcon`, existing `RelayCommand` / `ViewModelBase`, `IdeDiagnosticsViewModel`.

**Spec:** `docs/superpowers/specs/2026-07-20-bottom-tool-panel-design.md`

## Global Constraints

- Snake_case for local C# variables (project rule).
- Do not destroy/recreate shell ViewModels; only change UI wiring for bottom list panes.
- XML bottom tab out of scope — keep `XmlBottomPanel` as-is.
- No Find-in-files engine this iteration — Search pane stub + `SetSearchResults` / `ClearSearch` API only.
- Left Panel UX freeze does not apply to bottom dock.
- Do not commit unless the user explicitly asks (user rule overrides plan commit steps).
- Verify with `dotnet build UI/UI.csproj` (no UI test project).

## File Structure

| File | Responsibility |
|------|----------------|
| `UI/ViewModels/Bottom/BottomNavigateTarget.cs` | Path / Line / Offset for activate |
| `UI/ViewModels/Bottom/IBottomListItem.cs` | Shared row contract |
| `UI/ViewModels/Bottom/BottomListItemVm.cs` | Default row VM (Output/Log/Search) |
| `UI/ViewModels/Bottom/BottomBadgeVm.cs` | Header badge (icon + count + colors) |
| `UI/ViewModels/Bottom/BottomPaneVm.cs` | Pane surface for `BottomToolPanel` |
| `UI/ViewModels/Bottom/ProblemItemVm.cs` | Implement `IBottomListItem` |
| `UI/ViewModels/Bottom/LogEntryVm` (in IdeDiagnostics) | Map helpers → `BottomListItemVm` or implement interface |
| `UI/ViewModels/Bottom/IdeDiagnosticsViewModel.cs` | Expose four panes; sync badges; search API; activator |
| `UI/Views/Bottom/BottomToolPanel.xaml(.cs)` | Shared layout (Problems chrome) |
| `UI/Views/Shell/BottomToolDockHost.xaml` | Wire four `BottomToolPanel` + keep XML |
| `UI/ViewModels/MainViewModel.cs` | Wire `ItemActivator` → FormBuilder navigate |
| `UI/ViewModels/Shell/IdeShellViewModel.cs` | Clear Search placeholder message |
| Delete after migrate | `ProblemsPanel` / `OutputPanel` / `LogPanel` xaml+cs |

---

### Task 1: Contracts — `IBottomListItem`, navigate target, badge, list item VM

**Files:**
- Create: `UI/ViewModels/Bottom/BottomNavigateTarget.cs`
- Create: `UI/ViewModels/Bottom/IBottomListItem.cs`
- Create: `UI/ViewModels/Bottom/BottomBadgeVm.cs`
- Create: `UI/ViewModels/Bottom/BottomListItemVm.cs`

**Interfaces:**
- Produces:
  - `BottomNavigateTarget { string? Path; int Line; int Offset; }`
  - `IBottomListItem` with `PrimaryText`, `SecondaryText`, `TrailingText`, `IconKind`, `IconBrush`, `CanNavigate`, `NavigateTarget`
  - `BottomBadgeVm { string IconKind; string CountText; string Background; string Foreground; }`
  - `BottomListItemVm : ViewModelBase, IBottomListItem`

- [ ] **Step 1: Add `BottomNavigateTarget.cs`**

```csharp
namespace UI.ViewModels.Bottom;

public sealed class BottomNavigateTarget
{
    public string? Path { get; init; }
    public int Line { get; init; }
    public int Offset { get; init; }
}
```

- [ ] **Step 2: Add `IBottomListItem.cs`**

```csharp
namespace UI.ViewModels.Bottom;

public interface IBottomListItem
{
    string PrimaryText { get; }
    string SecondaryText { get; }
    string TrailingText { get; }
    /// <summary>MaterialDesign PackIcon kind name, e.g. CloseCircle.</summary>
    string IconKind { get; }
    /// <summary>Brush hex or resource-like color string for icon, e.g. #C62828.</summary>
    string IconBrush { get; }
    bool CanNavigate { get; }
    BottomNavigateTarget? NavigateTarget { get; }
}
```

- [ ] **Step 3: Add `BottomBadgeVm.cs`**

```csharp
namespace UI.ViewModels.Bottom;

public sealed class BottomBadgeVm
{
    public required string IconKind { get; init; }
    public required string CountText { get; init; }
    public required string Background { get; init; }
    public required string Foreground { get; init; }
}
```

- [ ] **Step 4: Add `BottomListItemVm.cs`**

```csharp
using UI.ViewModels.Base;

namespace UI.ViewModels.Bottom;

public sealed class BottomListItemVm : ViewModelBase, IBottomListItem
{
    public required string PrimaryText { get; init; }
    public string SecondaryText { get; init; } = string.Empty;
    public string TrailingText { get; init; } = string.Empty;
    public string IconKind { get; init; } = "InformationOutline";
    public string IconBrush { get; init; } = "#555555";
    public bool CanNavigate { get; init; }
    public BottomNavigateTarget? NavigateTarget { get; init; }
}
```

- [ ] **Step 5: Build**

Run: `dotnet build "UI/UI.csproj" -v q`  
Expected: Build succeeded, 0 Error(s)

---

### Task 2: `BottomPaneVm` + `ProblemItemVm` implements `IBottomListItem`

**Files:**
- Create: `UI/ViewModels/Bottom/BottomPaneVm.cs`
- Modify: `UI/ViewModels/Bottom/ProblemItemVm.cs`

**Interfaces:**
- Consumes: `IBottomListItem`, `BottomBadgeVm`, `BottomNavigateTarget`
- Produces: `BottomPaneVm` with `Title`, `Badges`, `Items`, `ClearCommand`, `ActivateItemCommand`
- Produces: `ProblemItemVm` members mapping to `IBottomListItem`

- [ ] **Step 1: Add `BottomPaneVm.cs`**

```csharp
using System.Collections;
using System.Collections.ObjectModel;
using System.Windows.Input;
using UI.ViewModels.Base;

namespace UI.ViewModels.Bottom;

public sealed class BottomPaneVm : ViewModelBase
{
    public BottomPaneVm(
        string title,
        IEnumerable items,
        ICommand clear_command,
        ICommand activate_item_command)
    {
        Title = title;
        Items = items;
        ClearCommand = clear_command;
        ActivateItemCommand = activate_item_command;
    }

    public string Title { get; }
    public ObservableCollection<BottomBadgeVm> Badges { get; } = [];
    public IEnumerable Items { get; }
    public ICommand ClearCommand { get; }
    public ICommand ActivateItemCommand { get; }

    public void ReplaceBadges(IEnumerable<BottomBadgeVm> badges)
    {
        Badges.Clear();
        foreach (var badge in badges)
            Badges.Add(badge);
    }
}
```

- [ ] **Step 2: Implement `IBottomListItem` on `ProblemItemVm`**

Change class declaration to:

```csharp
public sealed class ProblemItemVm : ViewModelBase, IBottomListItem
```

Add explicit/public members (keep existing fields; add these properties):

```csharp
public string PrimaryText => string.IsNullOrEmpty(Code)
    ? Description
    : $"{Description}  {Code}";

public string SecondaryText => Resolution;

public string TrailingText
{
    get
    {
        if (string.IsNullOrEmpty(File) && string.IsNullOrEmpty(LocationText))
            return string.Empty;
        if (string.IsNullOrEmpty(LocationText))
            return File;
        if (string.IsNullOrEmpty(File))
            return LocationText;
        return $"{File}  {LocationText}";
    }
}

public string IconKind => SeverityBadge switch
{
    "E" => "CloseCircle",
    "W" => "Alert",
    _ => "LightbulbOutline"
};

public string IconBrush => SeverityBadge switch
{
    "E" => "#C62828",
    "W" => "#F57F17",
    _ => "#1565C0"
};

public bool CanNavigate =>
    (!string.IsNullOrWhiteSpace(RelatedPath))
    || StartOffset > 0
    || Line > 0;

public BottomNavigateTarget? NavigateTarget => CanNavigate
    ? new BottomNavigateTarget
    {
        Path = RelatedPath,
        Line = Line,
        Offset = StartOffset
    }
    : null;
```

Note: Problems XAML previously showed Description and Code as separate Runs; shared template uses single `PrimaryText`. Acceptable per spec mapping table.

- [ ] **Step 3: Build**

Run: `dotnet build "UI/UI.csproj" -v q`  
Expected: Build succeeded

---

### Task 3: `IdeDiagnosticsViewModel` — panes, sync, search API, activator

**Files:**
- Modify: `UI/ViewModels/Bottom/IdeDiagnosticsViewModel.cs`
- Modify: `UI/ViewModels/MainViewModel.cs` (wire activator — can be same task or Step at end)

**Interfaces:**
- Consumes: `BottomPaneVm`, `BottomListItemVm`, `BottomBadgeVm`, `IBottomListItem`, `BottomNavigateTarget`
- Produces:
  - `ProblemsPane`, `OutputPane`, `LogPane`, `SearchPane`
  - `ObservableCollection<BottomListItemVm> SearchResults`
  - `SetSearchResults(IEnumerable<BottomListItemVm>)`, `ClearSearch()`
  - `SetItemActivator(Action<IBottomListItem> activator)`
  - Output/Log collections become `ObservableCollection<BottomListItemVm>` **or** keep `LogEntryVm` and project into list-item collections

**Preferred collection approach (lock this):**  
Keep internal `LogEntries` / `OutputEntries` as today for `Info`/`Warn` API, but also maintain parallel `ObservableCollection<BottomListItemVm>` used by panes — **simpler alternate:** change `LogEntryVm` to implement `IBottomListItem` and keep single collections.

- [ ] **Step 1: Make `LogEntryVm` implement `IBottomListItem`**

In `IdeDiagnosticsViewModel.cs` (where `LogEntryVm` lives), update:

```csharp
public sealed class LogEntryVm : IBottomListItem
{
    public DateTime Time { get; init; } = DateTime.Now;
    public LogLevel Level { get; init; } = LogLevel.Info;
    public string Message { get; init; } = string.Empty;
    public string Source { get; init; } = "IDE";

    public string TimeText => Time.ToString("HH:mm:ss");
    public string LevelText => Level.ToString().ToUpperInvariant();
    public string Display => $"[{TimeText}] {LevelText}: {Message}";

    public string PrimaryText => Message;
    public string SecondaryText => Source;
    public string TrailingText => TimeText;
    public string IconKind => Level switch
    {
        LogLevel.Error => "CloseCircle",
        LogLevel.Warning => "Alert",
        _ => "InformationOutline"
    };
    public string IconBrush => Level switch
    {
        LogLevel.Error => "#C62828",
        LogLevel.Warning => "#F57F17",
        _ => "#555555"
    };
    public bool CanNavigate => false;
    public BottomNavigateTarget? NavigateTarget => null;
}
```

- [ ] **Step 2: Add search collection + activator + pane fields to `IdeDiagnosticsViewModel`**

Add members:

```csharp
private Action<IBottomListItem>? _item_activator;
private int _search_count;

public ObservableCollection<BottomListItemVm> SearchResults { get; } = [];

public BottomPaneVm ProblemsPane { get; private set; } = null!;
public BottomPaneVm OutputPane { get; private set; } = null!;
public BottomPaneVm LogPane { get; private set; } = null!;
public BottomPaneVm SearchPane { get; private set; } = null!;
```

In constructor, after Clear commands:

```csharp
var activate = new RelayCommand<IBottomListItem>(OnActivateItem);

ProblemsPane = new BottomPaneVm("PROBLEMS", Problems, ClearProblemsCommand, activate);
OutputPane = new BottomPaneVm("OUTPUT", OutputEntries, ClearOutputCommand, activate);
LogPane = new BottomPaneVm("LOG", LogEntries, ClearLogCommand, activate);
SearchPane = new BottomPaneVm(
    "SEARCH",
    SearchResults,
    new RelayCommand(ClearSearch),
    activate);

RefreshProblemBadges();
RefreshCountBadge(OutputPane, OutputEntries.Count);
RefreshCountBadge(LogPane, LogEntries.Count);
RefreshCountBadge(SearchPane, 0);
```

Add methods:

```csharp
public void SetItemActivator(Action<IBottomListItem> activator) =>
    _item_activator = activator;

public void SetSearchResults(IEnumerable<BottomListItemVm> items)
{
    SearchResults.Clear();
    foreach (var item in items)
        SearchResults.Add(item);
    RefreshCountBadge(SearchPane, SearchResults.Count);
}

public void ClearSearch()
{
    SearchResults.Clear();
    RefreshCountBadge(SearchPane, 0);
}

private void OnActivateItem(IBottomListItem? item)
{
    if (item is null || !item.CanNavigate) return;
    _item_activator?.Invoke(item);
}

private void RefreshProblemBadges()
{
    ProblemsPane.ReplaceBadges(
    [
        new BottomBadgeVm
        {
            IconKind = "CloseCircle",
            CountText = ErrorCount.ToString(),
            Background = "#FFEBEE",
            Foreground = "#C62828"
        },
        new BottomBadgeVm
        {
            IconKind = "Alert",
            CountText = WarningCount.ToString(),
            Background = "#FFF8E1",
            Foreground = "#F57F17"
        },
        new BottomBadgeVm
        {
            IconKind = "LightbulbOutline",
            CountText = HintCount.ToString(),
            Background = "#E3F2FD",
            Foreground = "#1565C0"
        }
    ]);
}

private static void RefreshCountBadge(BottomPaneVm pane, int count)
{
    if (count <= 0)
    {
        pane.ReplaceBadges([]);
        return;
    }

    pane.ReplaceBadges(
    [
        new BottomBadgeVm
        {
            IconKind = "Counter",
            CountText = count.ToString(),
            Background = "#ECEFF1",
            Foreground = "#455A64"
        }
    ]);
}
```

- [ ] **Step 3: Keep badges in sync**

After `SyncProblems` / `ClearProblems` update counts, call `RefreshProblemBadges()`.

After `Add(...)` inserts into Log/Output, call:

```csharp
RefreshCountBadge(LogPane, LogEntries.Count);
if (to_output)
    RefreshCountBadge(OutputPane, OutputEntries.Count);
```

Update `ClearLogCommand` / `ClearOutputCommand` to refresh badges after clear:

```csharp
ClearLogCommand = new RelayCommand(() =>
{
    LogEntries.Clear();
    RefreshCountBadge(LogPane, 0);
});
ClearOutputCommand = new RelayCommand(() =>
{
    OutputEntries.Clear();
    RefreshCountBadge(OutputPane, 0);
});
```

- [ ] **Step 4: Wire activator in `MainViewModel` constructor** (after `DiagnosticsVm` assigned)

```csharp
DiagnosticsVm.SetItemActivator(ActivateBottomListItem);
```

Add private method on `MainViewModel`:

```csharp
private void ActivateBottomListItem(IBottomListItem item)
{
    var target = item.NavigateTarget;
    if (target is null) return;

    var form = FormBuilderVm;

    if (!string.IsNullOrWhiteSpace(target.Path) && File.Exists(target.Path))
    {
        form.OpenEntityFile(target.Path);
        if (target.Line > 0)
            form.NavigateToLine(target.Line);
        return;
    }

    if (target.Offset > 0)
        form.NavigateToOffset(target.Offset, target.Line);
    else if (target.Line > 0)
        form.NavigateToLine(target.Line);
}
```

Add `using System.IO;` and `using UI.ViewModels.Bottom;` if missing.

- [ ] **Step 5: Build**

Run: `dotnet build "UI/UI.csproj" -v q`  
Expected: Build succeeded

---

### Task 4: `BottomToolPanel` view (Problems chrome)

**Files:**
- Create: `UI/Views/Bottom/BottomToolPanel.xaml`
- Create: `UI/Views/Bottom/BottomToolPanel.xaml.cs`

**Interfaces:**
- Consumes: `BottomPaneVm`, `IBottomListItem`, `BottomBadgeVm`
- Produces: shared UserControl bound to `BottomPaneVm`

- [ ] **Step 1: Add code-behind**

```csharp
using System.Windows.Controls;
using System.Windows.Input;
using UI.ViewModels.Bottom;

namespace UI.Views.Bottom;

public partial class BottomToolPanel : UserControl
{
    public BottomToolPanel()
    {
        InitializeComponent();
    }

    private void ItemsList_MouseDoubleClick(object sender, MouseButtonEventArgs e)
    {
        if (DataContext is not BottomPaneVm pane) return;
        if (sender is not ListBox list) return;
        if (list.SelectedItem is not IBottomListItem item) return;
        if (pane.ActivateItemCommand.CanExecute(item))
            pane.ActivateItemCommand.Execute(item);
    }
}
```

- [ ] **Step 2: Add `BottomToolPanel.xaml`** — copy Problems structure; bind pane

```xml
<UserControl x:Class="UI.Views.Bottom.BottomToolPanel"
             xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
             xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
             xmlns:md="http://materialdesigninxaml.net/winfx/xaml/themes"
             xmlns:bottom="clr-namespace:UI.ViewModels.Bottom">

    <DockPanel Background="{StaticResource EditorBgBrush}">
        <Border DockPanel.Dock="Top" Background="{StaticResource CodePaneHeaderBrush}"
                Padding="8,3" BorderBrush="{StaticResource IdeBorderBrush}" BorderThickness="0,0,0,1">
            <DockPanel>
                <StackPanel Orientation="Horizontal" VerticalAlignment="Center">
                    <TextBlock Text="{Binding Title}" FontSize="11" FontWeight="SemiBold"
                               VerticalAlignment="Center"
                               Foreground="{StaticResource FgMutedBrush}"/>
                    <ItemsControl ItemsSource="{Binding Badges}" Margin="10,0,0,0">
                        <ItemsControl.ItemsPanel>
                            <ItemsPanelTemplate>
                                <StackPanel Orientation="Horizontal"/>
                            </ItemsPanelTemplate>
                        </ItemsControl.ItemsPanel>
                        <ItemsControl.ItemTemplate>
                            <DataTemplate DataType="{x:Type bottom:BottomBadgeVm}">
                                <Border Background="{Binding Background}" CornerRadius="8"
                                        Padding="7,1" Margin="0,0,4,0">
                                    <StackPanel Orientation="Horizontal">
                                        <md:PackIcon Kind="{Binding IconKind}" Width="11" Height="11"
                                                     Foreground="{Binding Foreground}"
                                                     VerticalAlignment="Center"/>
                                        <TextBlock Text="{Binding CountText}" FontSize="10" Margin="3,0,0,0"
                                                   Foreground="{Binding Foreground}" FontWeight="SemiBold"
                                                   VerticalAlignment="Center"/>
                                    </StackPanel>
                                </Border>
                            </DataTemplate>
                        </ItemsControl.ItemTemplate>
                    </ItemsControl>
                </StackPanel>
                <Button DockPanel.Dock="Right" Content="Clear" FontSize="10" Padding="8,2"
                        Command="{Binding ClearCommand}"
                        Style="{StaticResource IdeToolButtonStyle}"
                        HorizontalAlignment="Right" Margin="0"/>
            </DockPanel>
        </Border>

        <ListBox x:Name="ItemsList"
                 ItemsSource="{Binding Items}"
                 Background="Transparent"
                 BorderThickness="0"
                 FontSize="11"
                 HorizontalContentAlignment="Stretch"
                 ScrollViewer.HorizontalScrollBarVisibility="Disabled"
                 VirtualizingPanel.ScrollUnit="Pixel"
                 MouseDoubleClick="ItemsList_MouseDoubleClick">
            <ListBox.ItemContainerStyle>
                <Style TargetType="ListBoxItem">
                    <Setter Property="Padding" Value="8,4"/>
                    <Setter Property="Cursor" Value="Hand"/>
                    <Setter Property="SnapsToDevicePixels" Value="True"/>
                    <Setter Property="Template">
                        <Setter.Value>
                            <ControlTemplate TargetType="ListBoxItem">
                                <Border x:Name="Bd" Background="Transparent"
                                        Padding="{TemplateBinding Padding}">
                                    <ContentPresenter/>
                                </Border>
                                <ControlTemplate.Triggers>
                                    <Trigger Property="IsMouseOver" Value="True">
                                        <Setter TargetName="Bd" Property="Background" Value="#F0F6FC"/>
                                    </Trigger>
                                    <Trigger Property="IsSelected" Value="True">
                                        <Setter TargetName="Bd" Property="Background" Value="#CCE8FF"/>
                                    </Trigger>
                                </ControlTemplate.Triggers>
                            </ControlTemplate>
                        </Setter.Value>
                    </Setter>
                </Style>
            </ListBox.ItemContainerStyle>
            <ListBox.ItemTemplate>
                <DataTemplate>
                    <Grid>
                        <Grid.ColumnDefinitions>
                            <ColumnDefinition Width="Auto"/>
                            <ColumnDefinition Width="*"/>
                            <ColumnDefinition Width="Auto"/>
                        </Grid.ColumnDefinitions>

                        <md:PackIcon Grid.Column="0"
                                     Kind="{Binding IconKind}" Width="14" Height="14"
                                     Margin="0,1,8,0" VerticalAlignment="Top"
                                     Foreground="{Binding IconBrush}"/>

                        <StackPanel Grid.Column="1">
                            <TextBlock Text="{Binding PrimaryText}" TextTrimming="CharacterEllipsis"
                                       ToolTip="{Binding PrimaryText}"/>
                            <TextBlock Text="{Binding SecondaryText}"
                                       TextTrimming="CharacterEllipsis"
                                       FontSize="10" Margin="0,1,0,0"
                                       Foreground="{StaticResource FgMutedBrush}"
                                       ToolTip="{Binding SecondaryText}">
                                <TextBlock.Style>
                                    <Style TargetType="TextBlock">
                                        <Style.Triggers>
                                            <DataTrigger Binding="{Binding SecondaryText}" Value="">
                                                <Setter Property="Visibility" Value="Collapsed"/>
                                            </DataTrigger>
                                        </Style.Triggers>
                                    </Style>
                                </TextBlock.Style>
                            </TextBlock>
                        </StackPanel>

                        <TextBlock Grid.Column="2" Margin="12,0,0,0" VerticalAlignment="Top"
                                   FontSize="10" Foreground="{StaticResource FgMutedBrush}"
                                   Text="{Binding TrailingText}"
                                   ToolTip="{Binding TrailingText}"/>
                    </Grid>
                </DataTemplate>
            </ListBox.ItemTemplate>
        </ListBox>
    </DockPanel>
</UserControl>
```

If `PackIcon.Kind="{Binding IconKind}"` fails (string→enum), add a small `PackIconKindConverter` in `UI/Converters` and use it — keep converter minimal.

- [ ] **Step 3: Build**

Run: `dotnet build "UI/UI.csproj" -v q`  
Expected: Build succeeded

---

### Task 5: Wire `BottomToolDockHost` + enable Search tab + delete old panels

**Files:**
- Modify: `UI/Views/Shell/BottomToolDockHost.xaml`
- Modify: `UI/ViewModels/Shell/IdeShellViewModel.cs` (`SeedPlaceholderPanes`)
- Delete: `UI/Views/Bottom/ProblemsPanel.xaml`, `.xaml.cs`
- Delete: `UI/Views/Bottom/OutputPanel.xaml`, `.xaml.cs`
- Delete: `UI/Views/Bottom/LogPanel.xaml`, `.xaml.cs`

**Interfaces:**
- Consumes: `DiagnosticsVm.ProblemsPane` / `OutputPane` / `LogPane` / `SearchPane`
- Produces: host shows four shared panels + XML

- [ ] **Step 1: Replace content grids in `BottomToolDockHost.xaml`**

Replace the four visibility grids (Problems/Output/Log + add Search) with:

```xml
<Grid DataContext="{Binding}">
    <Grid Visibility="{Binding Shell.IsProblemsSelected, Converter={StaticResource BoolToVisibilityConverter}}">
        <bottom:BottomToolPanel DataContext="{Binding DiagnosticsVm.ProblemsPane}"/>
    </Grid>
    <Grid Visibility="{Binding Shell.IsOutputSelected, Converter={StaticResource BoolToVisibilityConverter}}">
        <bottom:BottomToolPanel DataContext="{Binding DiagnosticsVm.OutputPane}"/>
    </Grid>
    <Grid Visibility="{Binding Shell.IsLogSelected, Converter={StaticResource BoolToVisibilityConverter}}">
        <bottom:BottomToolPanel DataContext="{Binding DiagnosticsVm.LogPane}"/>
    </Grid>
    <Grid Visibility="{Binding Shell.IsXmlBottomSelected, Converter={StaticResource BoolToVisibilityConverter}}">
        <bottom:XmlBottomPanel DataContext="{Binding XmlBottomVm}"/>
    </Grid>
    <Grid Visibility="{Binding Shell.IsSearchResultSelected, Converter={StaticResource BoolToVisibilityConverter}}">
        <bottom:BottomToolPanel DataContext="{Binding DiagnosticsVm.SearchPane}"/>
    </Grid>
</Grid>
```

If `IsSearchResultSelected` does not exist on `IdeShellViewModel`, add:

```csharp
public bool IsSearchResultSelected => SelectedBottomPane?.Kind == ToolPaneKind.SearchResult;
```

And raise `OnPropertyChanged(nameof(IsSearchResultSelected))` inside `SelectedBottomPane` setter (alongside other Is* flags). Extend `IsBottomPlaceholderSelected` so Search is **not** treated as placeholder once wired (Search has real panel).

- [ ] **Step 2: Clear Search placeholder in `SeedPlaceholderPanes`**

Change:

```csharp
foreach (var p in BottomPanes.Take(4))
    p.PlaceholderMessage = string.Empty;
```

To clear Search too:

```csharp
foreach (var p in BottomPanes)
{
    if (p.Kind == ToolPaneKind.Xml) continue;
    p.PlaceholderMessage = string.Empty;
}
```

- [ ] **Step 3: Delete old panel files**

Delete:
- `UI/Views/Bottom/ProblemsPanel.xaml`
- `UI/Views/Bottom/ProblemsPanel.xaml.cs`
- `UI/Views/Bottom/OutputPanel.xaml`
- `UI/Views/Bottom/OutputPanel.xaml.cs`
- `UI/Views/Bottom/LogPanel.xaml`
- `UI/Views/Bottom/LogPanel.xaml.cs`

Grep for `ProblemsPanel|OutputPanel|LogPanel` under `UI/` and remove leftover references.

- [ ] **Step 4: Build**

Run: `dotnet build "UI/UI.csproj" -v q`  
Expected: Build succeeded, 0 Error(s)

- [ ] **Step 5: Manual smoke checklist**

1. Open bottom Problems — header PROBLEMS + 3 badges + Clear; rows match icon/primary/secondary/trailing.
2. Double-click a problem with line → editor navigates (same as before).
3. Output / Log — same chrome; Clear works; badges show count when non-empty.
4. Search tab — empty list, title SEARCH, Clear no-op on empty; no placeholder text.
5. XML tab unchanged.

---

## Spec coverage (self-review)

| Spec requirement | Task |
|------------------|------|
| Shared `BottomToolPanel` | Task 4 |
| `IBottomListItem` row contract | Task 1–2 |
| Problems-style row for all four | Task 4 + mapping Task 2–3 |
| `BottomPaneVm` wiring | Task 3, 5 |
| Search stub + API | Task 3 |
| Navigate via command | Task 3–4 |
| Remove old panels | Task 5 |
| XML unchanged | Task 5 (keep) |
| Badges table | Task 3 |

**Placeholder scan:** none intentional.  
**Type consistency:** `IBottomListItem` / `BottomPaneVm` / `BottomBadgeVm` / `BottomNavigateTarget` names stable across tasks.
