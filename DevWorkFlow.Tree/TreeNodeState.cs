namespace DevWorkFlow.Tree;

/// <summary>Load state of a tree node (framework only — no business meaning).</summary>
public enum TreeNodeState
{
    NotLoaded = 0,
    Loading = 1,
    Loaded = 2,
    Error = 3,
    Disposed = 4
}

/// <summary>Generic node kind for rendering (icon / expander hints). DataSource assigns values.</summary>
public enum TreeNodeKind
{
    Default = 0,
    Folder = 1,
    File = 2,
    Placeholder = 3,
    Separator = 4,
    Group = 5,
    Leaf = 6
}
