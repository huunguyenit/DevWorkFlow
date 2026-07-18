using DevWorkFlow.Application.Engine;
using DevWorkFlow.Domain.Language;
using DevWorkFlow.Domain.Language.Syntax;
using DevWorkFlow.Domain.Models.Fbo;

namespace DevWorkFlow.Application.Language;

/// <summary>
/// Bind SyntaxTree (+ adapter Fbo* chuyển tiếp) → ERP Semantic Model.
/// </summary>
public sealed class ErpSemanticBinder
{
    private readonly FboXmlParser _parser = new();

    public ErpSemanticModel Bind(
        ErpDocumentId document_id,
        string path,
        string raw_text,
        ISyntaxTree? syntax_tree,
        ErpMetadataProfile? profile = null)
    {
        profile ??= ErpMetadataProfile.Default;
        var symbols = new List<ErpSymbol>();
        var diagnostics = new List<ErpDiagnostic>();
        FboControllerDocument? legacy = null;

        if (string.IsNullOrWhiteSpace(raw_text))
            return new ErpSemanticModel(document_id, symbols, diagnostics, profile);

        EntityBindResult? entity_result = null;
        if (syntax_tree is not null)
        {
            entity_result = new EntitySymbolBinder().Bind(path, raw_text, syntax_tree);
            symbols.AddRange(entity_result.Symbols);
            diagnostics.AddRange(entity_result.Diagnostics);
        }

        try
        {
            legacy = _parser.Parse(raw_text, path);
            MapFromLegacy(legacy, symbols, path);
        }
        catch (Exception ex)
        {
            diagnostics.Add(new ErpDiagnostic
            {
                Id = "ERP0002",
                Severity = ErpDiagnosticSeverity.Info,
                Message = $"Semantic: chưa bind Fbo* — {ex.Message}",
                Location = new SourceLocation { Path = path }
            });

            if (syntax_tree is not null)
            {
                MapControllerStubFromSyntax(syntax_tree, symbols, path);
                MapFieldsFromSyntax(syntax_tree, symbols, path);
            }
        }

        if (syntax_tree is not null)
            EnrichFromSyntax(syntax_tree, symbols, path);

        AddDuplicateFieldDiagnostics(symbols, diagnostics, path);
        return new ErpSemanticModel(
            document_id,
            symbols,
            diagnostics,
            profile,
            legacy,
            entity_result?.ClearText,
            entity_result?.Segments);
    }

    private static void MapFieldsFromSyntax(ISyntaxTree tree, List<ErpSymbol> symbols, string path)
    {
        var controller = symbols.OfType<ControllerSymbol>().FirstOrDefault();
        var parent_id = controller?.Id ?? "controller:unknown";

        foreach (var node in Walk(tree.Root))
        {
            if (node.Kind != SyntaxKind.Element
                || !node.Name.Equals("field", StringComparison.OrdinalIgnoreCase)
                || string.IsNullOrWhiteSpace(node.Qualifier))
                continue;

            symbols.Add(new FieldSymbol
            {
                Id = $"field:{node.Qualifier}:{node.Span.StartOffset}",
                Name = node.Qualifier,
                DisplayName = node.Qualifier,
                ParentSymbolId = parent_id,
                Definition = Loc(path, node)
            });
        }
    }

    private static void MapFromLegacy(FboControllerDocument fbo_doc, List<ErpSymbol> symbols, string path)
    {
        var controller_id = $"controller:{fbo_doc.ControllerName}";
        symbols.Add(new ControllerSymbol
        {
            Id = controller_id,
            Name = fbo_doc.ControllerName,
            DisplayName = fbo_doc.DisplayTitle,
            FolderKind = fbo_doc.FolderKind.ToString(),
            Table = fbo_doc.Form?.Table ?? fbo_doc.Grid?.Table ?? fbo_doc.Lookup?.Table,
            CodeField = fbo_doc.Form?.CodeField ?? fbo_doc.Grid?.CodeField ?? fbo_doc.Lookup?.CodeField,
            Definition = new SourceLocation { Path = path, Line = 1 }
        });

        IEnumerable<FboField> fields =
            fbo_doc.Form?.Fields ?? fbo_doc.Grid?.Fields ?? fbo_doc.Lookup?.Fields
            ?? Enumerable.Empty<FboField>();

        foreach (var field in fields)
        {
            if (string.IsNullOrWhiteSpace(field.Name)) continue;
            symbols.Add(new FieldSymbol
            {
                Id = $"field:{field.Name}",
                Name = field.Name,
                DisplayName = field.Header.Get(true),
                HeaderV = field.Header.V,
                HeaderE = field.Header.E,
                DataType = field.DataType,
                CategoryIndex = field.CategoryIndex,
                IsPrimaryKey = field.IsPrimaryKey,
                IsRequired = field.IsRequired,
                AllowNulls = field.AllowNulls,
                ParentSymbolId = controller_id,
                Definition = new SourceLocation { Path = path }
            });
        }

        var layout = fbo_doc.Form?.Layout;
        if (layout is not null)
        {
            var view_id = string.IsNullOrWhiteSpace(layout.ViewId) ? "Dir" : layout.ViewId;
            symbols.Add(new ViewSymbol
            {
                Id = $"view:{view_id}",
                Name = view_id,
                DisplayName = view_id,
                ViewId = view_id,
                ParentSymbolId = controller_id,
                Definition = new SourceLocation { Path = path }
            });
        }

        if (fbo_doc.Grid is { VisibleFieldNames.Count: > 0 })
        {
            symbols.Add(new ViewSymbol
            {
                Id = "view:Grid",
                Name = "Grid",
                DisplayName = "Grid",
                ViewId = "Grid",
                ParentSymbolId = controller_id,
                Definition = new SourceLocation { Path = path }
            });
        }
    }

    private static void MapControllerStubFromSyntax(ISyntaxTree tree, List<ErpSymbol> symbols, string path)
    {
        if (symbols.OfType<ControllerSymbol>().Any()) return;

        var root_el = tree.Root.Children.FirstOrDefault(c => c.Kind == SyntaxKind.Element)
                      ?? tree.Root;
        var name = string.IsNullOrWhiteSpace(root_el.Name) || root_el.Name == "(document)"
            ? Path.GetFileNameWithoutExtension(path)
            : root_el.Name;
        if (string.IsNullOrWhiteSpace(name)) name = "document";

        symbols.Add(new ControllerSymbol
        {
            Id = $"controller:{name}",
            Name = name,
            DisplayName = name,
            FolderKind = GuessFolder(root_el.Name),
            Definition = new SourceLocation
            {
                Path = path,
                Span = root_el.Span,
                Line = root_el.StartLine
            }
        });
    }

    private static void EnrichFromSyntax(ISyntaxTree tree, List<ErpSymbol> symbols, string path)
    {
        var controller = symbols.OfType<ControllerSymbol>().FirstOrDefault();
        var parent_id = controller?.Id ?? "controller:unknown";

        foreach (var node in Walk(tree.Root))
        {
            if (node.Kind == SyntaxKind.Element
                && node.Name.Equals("command", StringComparison.OrdinalIgnoreCase))
            {
                var ev = node.Qualifier ?? string.Empty;
                var id = string.IsNullOrWhiteSpace(ev) ? $"command:{node.Span.StartOffset}" : $"command:{ev}";
                if (symbols.Any(s => s.Id.Equals(id, StringComparison.OrdinalIgnoreCase))) continue;
                symbols.Add(new CommandSymbol
                {
                    Id = id,
                    Name = string.IsNullOrWhiteSpace(ev) ? "command" : ev,
                    DisplayName = string.IsNullOrWhiteSpace(ev) ? "command" : ev,
                    EventName = ev,
                    ParentSymbolId = parent_id,
                    Definition = Loc(path, node)
                });
            }
            else if (node.Kind == SyntaxKind.Element
                     && node.Name.Equals("query", StringComparison.OrdinalIgnoreCase))
            {
                var ev = node.Qualifier ?? string.Empty;
                var id = string.IsNullOrWhiteSpace(ev) ? $"query:{node.Span.StartOffset}" : $"query:{ev}";
                if (symbols.Any(s => s.Id.Equals(id, StringComparison.OrdinalIgnoreCase))) continue;
                symbols.Add(new QuerySymbol
                {
                    Id = id,
                    Name = string.IsNullOrWhiteSpace(ev) ? "query" : ev,
                    DisplayName = string.IsNullOrWhiteSpace(ev) ? "query" : ev,
                    EventName = ev,
                    ParentSymbolId = parent_id,
                    Definition = Loc(path, node)
                });
            }
            else if (node.Kind == SyntaxKind.Element
                     && node.Name.Equals("response", StringComparison.OrdinalIgnoreCase))
            {
                var id = $"response:{node.Span.StartOffset}";
                if (symbols.Any(s => s.Id.Equals(id, StringComparison.OrdinalIgnoreCase))) continue;
                symbols.Add(new ResponseActionSymbol
                {
                    Id = id,
                    Name = node.Qualifier ?? "response",
                    DisplayName = node.Qualifier ?? "response",
                    ParentSymbolId = parent_id,
                    Definition = Loc(path, node)
                });
            }
            else if (node.Kind == SyntaxKind.ScriptIsland && node.Qualifier == "function")
            {
                var id = $"script:{node.Name}";
                if (symbols.Any(s => s.Id.Equals(id, StringComparison.OrdinalIgnoreCase))) continue;
                symbols.Add(new ScriptFunctionSymbol
                {
                    Id = id,
                    Name = node.Name,
                    DisplayName = node.Name,
                    ParentSymbolId = parent_id,
                    Definition = Loc(path, node)
                });
            }
            else if (node.Kind == SyntaxKind.Element
                     && node.Name.Equals("field", StringComparison.OrdinalIgnoreCase)
                     && !string.IsNullOrWhiteSpace(node.Qualifier))
            {
                // Gắn SourceLocation cho FieldSymbol đã có
                var field = symbols.OfType<FieldSymbol>()
                    .FirstOrDefault(f => f.Name.Equals(node.Qualifier, StringComparison.OrdinalIgnoreCase));
                if (field is not null && field.Definition.Span.IsEmpty)
                {
                    // FieldSymbol init-only — thay bằng bản có location
                    var idx = symbols.IndexOf(field);
                    symbols[idx] = new FieldSymbol
                    {
                        Id = field.Id,
                        Name = field.Name,
                        DisplayName = field.DisplayName,
                        HeaderV = field.HeaderV,
                        HeaderE = field.HeaderE,
                        DataType = field.DataType,
                        CategoryIndex = field.CategoryIndex,
                        IsPrimaryKey = field.IsPrimaryKey,
                        IsRequired = field.IsRequired,
                        AllowNulls = field.AllowNulls,
                        ParentSymbolId = field.ParentSymbolId,
                        Definition = Loc(path, node)
                    };
                }
            }
            else if (node.Kind == SyntaxKind.Element
                     && node.Name.Equals("view", StringComparison.OrdinalIgnoreCase))
            {
                var view_id = string.IsNullOrWhiteSpace(node.Qualifier)
                    ? $"@{node.Span.StartOffset}"
                    : node.Qualifier;
                var id = $"view:{view_id}";
                var existing = symbols.OfType<ViewSymbol>().FirstOrDefault(v =>
                    v.Id.Equals(id, StringComparison.OrdinalIgnoreCase)
                    || (!string.IsNullOrWhiteSpace(v.ViewId)
                        && v.ViewId.Equals(view_id, StringComparison.OrdinalIgnoreCase)));

                if (existing is not null)
                {
                    var idx = symbols.IndexOf(existing);
                    symbols[idx] = new ViewSymbol
                    {
                        Id = existing.Id.StartsWith("view:", StringComparison.OrdinalIgnoreCase)
                            ? existing.Id
                            : id,
                        Name = view_id,
                        DisplayName = view_id,
                        ViewId = view_id,
                        ParentSymbolId = existing.ParentSymbolId ?? parent_id,
                        Definition = Loc(path, node)
                    };
                }
                else
                {
                    symbols.Add(new ViewSymbol
                    {
                        Id = id,
                        Name = view_id,
                        DisplayName = view_id,
                        ViewId = view_id,
                        ParentSymbolId = parent_id,
                        Definition = Loc(path, node)
                    });
                }
            }
        }
    }

    private static void AddDuplicateFieldDiagnostics(
        List<ErpSymbol> symbols,
        List<ErpDiagnostic> diagnostics,
        string path)
    {
        var dupes = symbols.OfType<FieldSymbol>()
            .GroupBy(f => f.Name, StringComparer.OrdinalIgnoreCase)
            .Where(g => g.Count() > 1);

        foreach (var g in dupes)
        {
            diagnostics.Add(new ErpDiagnostic
            {
                Id = "ERP2001",
                Severity = ErpDiagnosticSeverity.Warning,
                Message = $"Field trùng tên: {g.Key}",
                Location = g.First().Definition.Path.Length > 0
                    ? g.First().Definition
                    : new SourceLocation { Path = path }
            });
        }
    }

    private static IEnumerable<SyntaxNode> Walk(SyntaxNode node)
    {
        yield return node;
        foreach (var c in node.Children)
        foreach (var x in Walk(c))
            yield return x;
    }

    private static SourceLocation Loc(string path, SyntaxNode node) => new()
    {
        Path = path,
        Span = node.Span,
        Line = node.StartLine
    };

    private static string GuessFolder(string root_name) =>
        root_name.ToLowerInvariant() switch
        {
            "dir" => "Dir",
            "filter" => "Filter",
            "grid" => "Grid",
            "lookup" => "Lookup",
            "report" => "Report",
            _ => "Other"
        };
}
