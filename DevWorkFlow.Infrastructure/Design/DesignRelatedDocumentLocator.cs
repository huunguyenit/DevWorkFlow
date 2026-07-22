using DevWorkFlow.Application.Design;
using DevWorkFlow.Domain.Models;
using DevWorkFlow.Infrastructure.Services;

namespace DevWorkFlow.Infrastructure.Design;

/// <summary>Tìm file Grid Detail (App_Data/Controllers/Grid/{name}.xml) — chỉ trả path, Language Service parse.</summary>
public sealed class DesignRelatedDocumentLocator : IDesignRelatedDocumentLocator
{
    public string? FindGridPath(ProgramContext program, string controller_name)
    {
        var controllers_root = MenuService.ResolveControllersRoot(program.ProgramPath);
        return controllers_root is null
            ? null
            : MenuService.FindControllerFile(controllers_root, "Grid", controller_name);
    }
}
