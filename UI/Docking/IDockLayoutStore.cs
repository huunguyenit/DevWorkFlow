namespace UI.Docking;

public interface IDockLayoutStore
{
    DockLayoutSnapshot? Load();
    void Save(DockLayoutSnapshot snapshot);
}
