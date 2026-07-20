### Task 1: Contracts â€” `IBottomListItem`, navigate target, badge, list item VM

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

