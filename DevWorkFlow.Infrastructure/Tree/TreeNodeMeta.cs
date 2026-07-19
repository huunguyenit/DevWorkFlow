namespace DevWorkFlow.Infrastructure.Tree;

/// <summary>Opaque metadata for filesystem tree nodes.</summary>
public sealed class FileSystemNodeMeta
{
    public required string FullPath { get; init; }
    public bool IsDirectory { get; init; }
}

/// <summary>Opaque metadata for database object tree nodes.</summary>
public sealed class DatabaseNodeMeta
{
    public string? Schema { get; init; }
    public string? ObjectName { get; init; }
    public string? ObjectType { get; init; }
    public bool IsFolder { get; init; }
    public string? ConnectionString { get; init; }
}

/// <summary>Opaque metadata for command / menu tree nodes.</summary>
public sealed class CommandNodeMeta
{
    public string? SysId { get; init; }
    public string? WmenuId { get; init; }
    public string? Link { get; init; }
    public string? Type { get; init; }
    public bool IsFile { get; init; }
    public string? FilePath { get; init; }
    public object? Source { get; init; }
}

/// <summary>Generic stub metadata.</summary>
public sealed class StubNodeMeta
{
    public required string Key { get; init; }
}
