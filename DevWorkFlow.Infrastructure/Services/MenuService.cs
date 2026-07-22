using DevWorkFlow.Application.Abstractions;
using DevWorkFlow.Application.Engine;
using DevWorkFlow.Application.Language;
using DevWorkFlow.Domain.Language;
using DevWorkFlow.Domain.Models;

namespace DevWorkFlow.Infrastructure.Services;

/// <summary>
/// Dựng cây menu 3 cấp từ wcommand;
/// resolve: link (.aspx) → Controller → Dir/Filter/Grid/… (+ related từ XML).
/// </summary>
public class MenuService : IMenuService
{
    private readonly IWcommandRepository _wcommand_repo;
    private readonly IErpLanguageService _language_service;

    /// <summary>Thứ tự: Dir, Filter, Grid, Lookup, Report (Template/Main resolve riêng).</summary>
    private static readonly (string Folder, ControllerFileKind Kind)[] ControllerFolders =
    [
        ("Dir", ControllerFileKind.Dir),
        ("Filter", ControllerFileKind.Filter),
        ("Grid", ControllerFileKind.Grid),
        ("Lookup", ControllerFileKind.Lookup),
        ("Report", ControllerFileKind.Report)
    ];

    private static readonly string[] FormExtensions = [".xml", ".f"];

    public MenuService(
        IWcommandRepository wcommand_repo,
        IErpLanguageService language_service)
    {
        _wcommand_repo = wcommand_repo;
        _language_service = language_service;
    }

    public async Task<IReadOnlyList<MenuTreeNode>> LoadMenuTreeAsync(ProgramContext program)
    {
        var items = await _wcommand_repo.GetAllAsync(program.SysConnectionString);
        return BuildTree(items);
    }

    public MenuResourceBundle ResolveFromMenu(ProgramContext program, MenuTreeNode menu_node)
    {
        var bundle = new MenuResourceBundle
        {
            MenuTitle = menu_node.Title,
            Link = menu_node.Link
        };

        if (menu_node.IsSeparator)
        {
            bundle.ErrorMessage = "Separator — không có resource.";
            return bundle;
        }

        if (string.IsNullOrWhiteSpace(menu_node.Link))
        {
            bundle.ErrorMessage = "Menu không có link (file main .aspx).";
            return bundle;
        }

        var aspx_path = ResolveAspxPath(program.ProgramPath, menu_node.Link);
        bundle.AspxPath = aspx_path;

        if (aspx_path is null || !File.Exists(aspx_path))
        {
            bundle.ErrorMessage = $"Không tìm thấy file main: {menu_node.Link}";
            return bundle;
        }

        var controllers = AspxControllerParser.ParseControllersFromFile(aspx_path);
        bundle.Controllers = controllers.ToList();
        bundle.ControllerName = controllers.FirstOrDefault() ?? string.Empty;

        if (controllers.Count == 0)
        {
            bundle.ErrorMessage = $"File aspx không khai báo Controller: {Path.GetFileName(aspx_path)}";
            TryAddFile(bundle, program.ProgramPath, aspx_path, ControllerFileKind.Aspx, string.Empty);
            return SortBundle(bundle);
        }

        var controllers_root = ResolveControllersRoot(program.ProgramPath);
        if (controllers_root is null)
        {
            bundle.ErrorMessage = $"Không tìm thấy App_Data/Controllers trong: {program.ProgramPath}";
            TryAddFile(bundle, program.ProgramPath, aspx_path, ControllerFileKind.Aspx, string.Empty);
            return SortBundle(bundle);
        }

        foreach (var controller_name in controllers)
        {
            foreach (var (folder, kind) in ControllerFolders)
            {
                var file_path = FindControllerFile(controllers_root, folder, controller_name);
                if (file_path is null) continue;
                TryAddFile(bundle, program.ProgramPath, file_path, kind, controller_name);
            }

            AddTemplateFiles(bundle, program.ProgramPath, controllers_root, controller_name);
        }

        TryAddFile(bundle, program.ProgramPath, aspx_path, ControllerFileKind.Aspx, string.Empty);

        // Dir/Grid/Filter/Report → related Grid / Filter / Upload / Rpt / Excel
        EnrichFromXmlReferences(bundle, program.ProgramPath, controllers_root);

        var form_count = bundle.Files.Count(f => f.IsFormSource);
        if (form_count == 0)
        {
            bundle.ErrorMessage =
                $"Controller \"{bundle.ControllerName}\" chưa có file .xml/.f trong Dir, Filter, Grid.";
        }

        return SortBundle(bundle);
    }

    private void EnrichFromXmlReferences(
        MenuResourceBundle bundle,
        string program_path,
        string controllers_root)
    {
        var seed_files = bundle.Files
            .Where(f => f.IsXml || f.IsEncrypted)
            .Where(f => f.Kind is ControllerFileKind.Dir
                or ControllerFileKind.Filter
                or ControllerFileKind.Grid
                or ControllerFileKind.Lookup
                or ControllerFileKind.Report)
            .ToList();

        var pending = new Queue<ControllerFileItem>(seed_files);
        var scanned = new HashSet<string>(StringComparer.OrdinalIgnoreCase);

        while (pending.Count > 0)
        {
            var file = pending.Dequeue();
            if (!scanned.Add(file.FullPath)) continue;

            var clear_text = TryReadClearText(file.FullPath);
            if (string.IsNullOrWhiteSpace(clear_text)) continue;

            var parent_controller = !string.IsNullOrWhiteSpace(file.ControllerName)
                ? file.ControllerName
                : bundle.ControllerName;

            foreach (var related in ControllerRelatedFileResolver.FindRelated(clear_text, parent_controller))
            {
                var added = TryAddRelated(
                    bundle, program_path, controllers_root, related, parent_controller);
                if (added is null) continue;
                if (added.IsXml || added.IsEncrypted)
                    pending.Enqueue(added);
            }
        }
    }

    private ControllerFileItem? TryAddRelated(
        MenuResourceBundle bundle,
        string program_path,
        string controllers_root,
        ControllerRelatedFileResolver.RelatedRef related,
        string parent_controller)
    {
        string? path;
        ControllerFileKind kind;
        var name = related.ControllerName;

        switch (related.Kind)
        {
            case ControllerRelatedFileResolver.RelatedKind.Grid:
                kind = ControllerFileKind.Grid;
                path = FindControllerFile(controllers_root, "Grid", name);
                break;

            case ControllerRelatedFileResolver.RelatedKind.Filter:
                kind = ControllerFileKind.Filter;
                path = FindControllerFile(controllers_root, "Filter", name);
                break;

            case ControllerRelatedFileResolver.RelatedKind.UploadFromParent:
                name = parent_controller;
                if (string.IsNullOrWhiteSpace(name)) return null;
                kind = ControllerFileKind.TemplateUpload;
                path = FindTemplateAsset(controllers_root, "Upload", name, [".xml"]);
                break;

            case ControllerRelatedFileResolver.RelatedKind.Upload:
                kind = ControllerFileKind.TemplateUpload;
                path = FindTemplateAsset(controllers_root, "Upload", name, [".xml"]);
                break;

            case ControllerRelatedFileResolver.RelatedKind.Excel:
                kind = ControllerFileKind.TemplateExcel;
                path = FindTemplateAsset(controllers_root, "Excel", name, [".xlsx", ".xls"]);
                break;

            case ControllerRelatedFileResolver.RelatedKind.Rpt:
                kind = ControllerFileKind.TemplateRpt;
                path = FindTemplateAsset(controllers_root, "Rpt", name, [".rpt"]);
                break;

            default:
                return null;
        }

        if (path is null) return null;
        if (bundle.Files.Any(f =>
                string.Equals(f.FullPath, path, StringComparison.OrdinalIgnoreCase)))
            return null;

        var item = CreateFileItem(program_path, path, kind, name);
        bundle.Files.Add(item);

        if (kind is ControllerFileKind.Grid or ControllerFileKind.Filter or ControllerFileKind.Report)
            AddTemplateFiles(bundle, program_path, controllers_root, name);

        return item;
    }

    /// <summary>Ưu tiên ClearText từ Language Service; fallback đọc file .xml thô.</summary>
    private string? TryReadClearText(string file_path)
    {
        try
        {
            var document_id = ErpDocumentId.FromPath(file_path);
            var document = _language_service.GetDocument(document_id);
            var close_after = false;
            if (document is null)
            {
                document = _language_service.OpenDocument(file_path);
                close_after = true;
            }

            var text = document.GetProjection(ErpProjectionKind.ClearText).Text;
            if (close_after)
                _language_service.CloseDocument(document.Id);

            if (!string.IsNullOrWhiteSpace(text))
                return text;
        }
        catch
        {
            // fallback
        }

        try
        {
            if (file_path.EndsWith(".xml", StringComparison.OrdinalIgnoreCase))
                return File.ReadAllText(file_path);
        }
        catch
        {
            // ignore
        }

        return null;
    }

    private static void AddTemplateFiles(
        MenuResourceBundle bundle,
        string program_path,
        string controllers_root,
        string controller_name)
    {
        if (string.IsNullOrWhiteSpace(controller_name)) return;

        TryAddTemplateKind(bundle, program_path, controllers_root, controller_name,
            "Upload", ControllerFileKind.TemplateUpload, [".xml"]);
        TryAddTemplateKind(bundle, program_path, controllers_root, controller_name,
            "Excel", ControllerFileKind.TemplateExcel, [".xlsx", ".xls"]);
        TryAddTemplateKind(bundle, program_path, controllers_root, controller_name,
            "Rpt", ControllerFileKind.TemplateRpt, [".rpt"]);
    }

    private static void TryAddTemplateKind(
        MenuResourceBundle bundle,
        string program_path,
        string controllers_root,
        string controller_name,
        string template_subfolder,
        ControllerFileKind kind,
        string[] extensions)
    {
        var path = FindTemplateAsset(controllers_root, template_subfolder, controller_name, extensions);
        if (path is null) return;
        TryAddFile(bundle, program_path, path, kind, controller_name);
    }

    /// <summary>Tìm Templates|Template / {Upload|Excel|Rpt} / {name}.{ext}.</summary>
    public static string? FindTemplateAsset(
        string controllers_root,
        string template_subfolder,
        string name,
        string[] extensions)
    {
        if (string.IsNullOrWhiteSpace(name)) return null;


        var folder = ResolveNestedFolder(
            controllers_root, Path.Combine("Templates", template_subfolder));


        foreach (var ext in extensions)
        {
            var direct = Path.Combine(folder, name + ext);
            if (File.Exists(direct)) return direct;
        }

        try
        {
            var match = Directory.EnumerateFiles(folder, "*", SearchOption.TopDirectoryOnly)
                .FirstOrDefault(f =>
                {
                    var file_ext = Path.GetExtension(f);
                    if (!extensions.Any(e =>
                            string.Equals(file_ext, e, StringComparison.OrdinalIgnoreCase)))
                        return false;
                    return string.Equals(
                        Path.GetFileNameWithoutExtension(f),
                        name,
                        StringComparison.OrdinalIgnoreCase);
                });
            if (match is not null) return match;
        }
        catch
        {
            // ignore
        }


        return null;
    }

    private static string? ResolveNestedFolder(string controllers_root, string relative_folder)
    {
        var direct = Path.Combine(controllers_root, relative_folder);
        if (Directory.Exists(direct)) return direct;

        try
        {
            var current = controllers_root;
            foreach (var segment in relative_folder.Split(
                         [Path.DirectorySeparatorChar, Path.AltDirectorySeparatorChar],
                         StringSplitOptions.RemoveEmptyEntries))
            {
                var next = Directory.EnumerateDirectories(current)
                    .FirstOrDefault(d =>
                        string.Equals(Path.GetFileName(d), segment, StringComparison.OrdinalIgnoreCase));
                if (next is null) return null;
                current = next;
            }
            return current;
        }
        catch
        {
            return null;
        }
    }

    private static void TryAddFile(
        MenuResourceBundle bundle,
        string program_path,
        string file_path,
        ControllerFileKind kind,
        string controller_name)
    {
        if (bundle.Files.Any(f =>
                string.Equals(f.FullPath, file_path, StringComparison.OrdinalIgnoreCase)))
            return;
        bundle.Files.Add(CreateFileItem(program_path, file_path, kind, controller_name));
    }

    private static ControllerFileItem CreateFileItem(
        string program_path,
        string file_path,
        ControllerFileKind kind,
        string controller_name)
    {
        var file_name = Path.GetFileName(file_path);
        var folder_label = kind switch
        {
            ControllerFileKind.TemplateUpload => "Templates/Upload",
            ControllerFileKind.TemplateExcel => "Templates/Excel",
            ControllerFileKind.TemplateRpt => "Templates/Rpt",
            ControllerFileKind.Aspx => "Main",
            _ => kind.ToString()
        };

        return new ControllerFileItem
        {
            Kind = kind,
            ControllerName = controller_name,
            DisplayName = kind == ControllerFileKind.Aspx
                ? file_name
                : $"{folder_label}/{file_name}",
            RelativePath = Path.GetRelativePath(program_path, file_path),
            FullPath = file_path
        };
    }

    private static MenuResourceBundle SortBundle(MenuResourceBundle bundle)
    {
        var sorted = bundle.Files
            .OrderBy(f => f.SortOrder)
            .ThenBy(f => f.DisplayName, StringComparer.OrdinalIgnoreCase)
            .ToList();
        bundle.Files.Clear();
        bundle.Files.AddRange(sorted);
        return bundle;
    }

    public static string? ResolveControllersRoot(string program_path)
    {
        var direct = Path.Combine(program_path, "App_Data", "Controllers");
        if (Directory.Exists(direct)) return direct;

        try
        {
            var app_data = Directory.EnumerateDirectories(program_path)
                .FirstOrDefault(d => string.Equals(Path.GetFileName(d), "App_Data", StringComparison.OrdinalIgnoreCase));
            if (app_data is null) return null;

            return Directory.EnumerateDirectories(app_data)
                .FirstOrDefault(d => string.Equals(Path.GetFileName(d), "Controllers", StringComparison.OrdinalIgnoreCase));
        }
        catch
        {
            return null;
        }
    }

    public static string? FindControllerFile(string controllers_root, string folder, string controller_name)
    {
        if (string.IsNullOrWhiteSpace(controller_name)) return null;

        var dir = ResolveSubFolder(controllers_root, folder);
        if (dir is null) return null;

        foreach (var ext in FormExtensions)
        {
            var direct = Path.Combine(dir, controller_name + ext);
            if (File.Exists(direct)) return direct;
        }

        try
        {
            var files = Directory.EnumerateFiles(dir, "*", SearchOption.TopDirectoryOnly)
                .Where(f =>
                {
                    var ext = Path.GetExtension(f);
                    return FormExtensions.Any(e => string.Equals(ext, e, StringComparison.OrdinalIgnoreCase));
                })
                .Where(f => string.Equals(
                    Path.GetFileNameWithoutExtension(f),
                    controller_name,
                    StringComparison.OrdinalIgnoreCase))
                .ToList();

            var xml = files.FirstOrDefault(f => f.EndsWith(".xml", StringComparison.OrdinalIgnoreCase));
            if (xml is not null) return xml;

            return files.FirstOrDefault(f => f.EndsWith(".f", StringComparison.OrdinalIgnoreCase));
        }
        catch
        {
            return null;
        }
    }

    private static string? ResolveSubFolder(string controllers_root, string folder)
    {
        var direct = Path.Combine(controllers_root, folder);
        if (Directory.Exists(direct)) return direct;

        try
        {
            return Directory.EnumerateDirectories(controllers_root)
                .FirstOrDefault(d => string.Equals(Path.GetFileName(d), folder, StringComparison.OrdinalIgnoreCase));
        }
        catch
        {
            return null;
        }
    }

    internal static string? ResolveAspxPath(string program_path, string link)
    {
        if (string.IsNullOrWhiteSpace(link)) return null;

        var normalized = link.Trim()
            .Replace('/', Path.DirectorySeparatorChar)
            .Replace('\\', Path.DirectorySeparatorChar);

        if (normalized.StartsWith($"~{Path.DirectorySeparatorChar}", StringComparison.Ordinal))
            normalized = normalized[2..];
        else if (normalized.StartsWith('~'))
            normalized = normalized[1..].TrimStart(Path.DirectorySeparatorChar);

        var q = normalized.IndexOf('?', StringComparison.Ordinal);
        if (q >= 0) normalized = normalized[..q];

        var candidates = new List<string>
        {
            Path.Combine(program_path, normalized)
        };

        if (!normalized.EndsWith(".aspx", StringComparison.OrdinalIgnoreCase))
            candidates.Add(Path.Combine(program_path, normalized + ".aspx"));

        foreach (var path in candidates)
        {
            if (File.Exists(path)) return Path.GetFullPath(path);
        }

        var file_name = Path.GetFileName(normalized);
        if (string.IsNullOrEmpty(file_name)) return null;

        try
        {
            return Directory.EnumerateFiles(program_path, file_name, SearchOption.AllDirectories)
                .FirstOrDefault(f => f.EndsWith(".aspx", StringComparison.OrdinalIgnoreCase)
                                     || string.Equals(Path.GetFileName(f), file_name, StringComparison.OrdinalIgnoreCase));
        }
        catch
        {
            return null;
        }
    }

    internal static IReadOnlyList<MenuTreeNode> BuildTree(IReadOnlyList<WCommandItem> items)
    {
        var by_id = items
            .Where(i => !string.IsNullOrWhiteSpace(i.WmenuId))
            .GroupBy(i => i.WmenuId, StringComparer.OrdinalIgnoreCase)
            .ToDictionary(g => g.Key, g => g.First(), StringComparer.OrdinalIgnoreCase);

        var children_map = items
            .Where(i => !string.IsNullOrWhiteSpace(i.WmenuId0))
            .GroupBy(i => i.WmenuId0!, StringComparer.OrdinalIgnoreCase)
            .ToDictionary(g => g.Key, g => g.ToList(), StringComparer.OrdinalIgnoreCase);

        var roots = items
            .Where(i => string.IsNullOrWhiteSpace(i.WmenuId0))
            .Select(i => ToNode(i, level: 1))
            .ToList();

        foreach (var root in roots)
            AttachChildren(root, children_map, by_id, max_level: 3);

        return roots;
    }

    private static void AttachChildren(
        MenuTreeNode parent,
        Dictionary<string, List<WCommandItem>> children_map,
        Dictionary<string, WCommandItem> by_id,
        int max_level)
    {
        if (parent.Level >= max_level) return;
        if (!children_map.TryGetValue(parent.WmenuId, out var children)) return;

        foreach (var child_item in children)
        {
            if (string.Equals(child_item.WmenuId, parent.WmenuId, StringComparison.OrdinalIgnoreCase))
                continue;

            var child_node = ToNode(child_item, parent.Level + 1);
            parent.Children.Add(child_node);
            if (!child_node.IsSeparator)
                AttachChildren(child_node, children_map, by_id, max_level);
        }
    }

    private static MenuTreeNode ToNode(WCommandItem item, int level) => new()
    {
        WmenuId = item.WmenuId,
        WmenuId0 = item.WmenuId0,
        Title = item.DisplayName,
        TitleEn = item.Bar2,
        SysId = item.SysId,
        SysCode = item.SysCode,
        Type = item.Type,
        Link = item.IsSeparator ? null : item.Link,
        Parameter = item.Parameter,
        Level = level,
        Source = item,
        IsSeparator = item.IsSeparator
    };
}
