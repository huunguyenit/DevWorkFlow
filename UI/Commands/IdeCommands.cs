using System.Windows.Input;

namespace UI.Commands;

/// <summary>
/// Routed commands IDE — bind từ Menu/Ribbon; handler gắn ở MainWindow / shell VM.
/// Phần lớn NoOp ở Bước 1; Save/Parse ủy quyền FormBuilder khi có document.
/// </summary>
public static class IdeCommands
{
    public static readonly RoutedUICommand New = Create(nameof(New), Key.N, ModifierKeys.Control);
    public static readonly RoutedUICommand Open = Create(nameof(Open), Key.O, ModifierKeys.Control);
    public static readonly RoutedUICommand Save = Create(nameof(Save), Key.S, ModifierKeys.Control);
    public static readonly RoutedUICommand SaveAll = Create(nameof(SaveAll), Key.S, ModifierKeys.Control | ModifierKeys.Shift);
    public static readonly RoutedUICommand Exit = Create(nameof(Exit), Key.F4, ModifierKeys.Alt);

    public static readonly RoutedUICommand Undo = Create(nameof(Undo), Key.Z, ModifierKeys.Control);
    public static readonly RoutedUICommand Redo = Create(nameof(Redo), Key.Y, ModifierKeys.Control);
    public static readonly RoutedUICommand Cut = Create(nameof(Cut), Key.X, ModifierKeys.Control);
    public static readonly RoutedUICommand Copy = Create(nameof(Copy), Key.C, ModifierKeys.Control);
    public static readonly RoutedUICommand Paste = Create(nameof(Paste), Key.V, ModifierKeys.Control);
    public static readonly RoutedUICommand Delete = Create(nameof(Delete), Key.Delete, ModifierKeys.None);

    public static readonly RoutedUICommand Add = Create(nameof(Add));
    public static readonly RoutedUICommand ValidateXml = Create(nameof(ValidateXml));
    public static readonly RoutedUICommand Preview = Create(nameof(Preview));
    public static readonly RoutedUICommand Entity = Create(nameof(Entity));
    public static readonly RoutedUICommand Parse = Create(nameof(Parse));
    public static readonly RoutedUICommand ClearText = Create(nameof(ClearText));
    public static readonly RoutedUICommand ExecuteSql = Create(nameof(ExecuteSql), Key.F5, ModifierKeys.None);
    public static readonly RoutedUICommand OpenSqlFromForm = Create(nameof(OpenSqlFromForm));
    public static readonly RoutedUICommand OpenSqlFile = Create(nameof(OpenSqlFile));
    public static readonly RoutedUICommand Search = Create(nameof(Search), Key.F, ModifierKeys.Control);
    public static readonly RoutedUICommand Replace = Create(nameof(Replace), Key.H, ModifierKeys.Control);
    public static readonly RoutedUICommand GoToDefinition = Create(nameof(GoToDefinition), Key.F12, ModifierKeys.None);
    public static readonly RoutedUICommand FindReferences = Create(nameof(FindReferences), Key.F12, ModifierKeys.Shift);
    public static readonly RoutedUICommand Settings = Create(nameof(Settings));

    // Project Web Skin (nền Designer Platform) — capture shell + mirror assets + xem skin trống.
    public static readonly RoutedUICommand CaptureSkin = Create(nameof(CaptureSkin));
    public static readonly RoutedUICommand RefreshSkinAssets = Create(nameof(RefreshSkinAssets));
    public static readonly RoutedUICommand ViewSkin = Create(nameof(ViewSkin));

    public static readonly RoutedUICommand ToggleLeftDock = Create(nameof(ToggleLeftDock));
    public static readonly RoutedUICommand ToggleRightDock = Create(nameof(ToggleRightDock));
    public static readonly RoutedUICommand ToggleBottomDock = Create(nameof(ToggleBottomDock));

    private static RoutedUICommand Create(string name, Key key = Key.None, ModifierKeys modifiers = ModifierKeys.None)
    {
        var gestures = new InputGestureCollection();
        if (key != Key.None)
            gestures.Add(new KeyGesture(key, modifiers));
        return new RoutedUICommand(name, name, typeof(IdeCommands), gestures);
    }
}
