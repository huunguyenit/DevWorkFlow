using DevWorkFlow.Application.Abstractions;
using DevWorkFlow.Domain.Models;

namespace DevWorkFlow.Infrastructure.Services;

/// <summary>In-memory implementation – swap sang DB repository sau.</summary>
public class TemplateService : ITemplateService
{
    private readonly Dictionary<string, TemplateItem> _store = [];

    public TemplateService() => Seed();

    private void Seed()
    {
        Add("Danh mục Hàng hoá",   TemplateType.Catalog,   "PackageVariant");
        Add("Danh mục Khách hàng", TemplateType.Catalog,   "AccountGroup");
        Add("Phiếu nhập kho",      TemplateType.Document,  "FileDocumentPlus");
        Add("Phiếu xuất kho",      TemplateType.Document,  "FileDocumentMinus");
        Add("Hoá đơn bán hàng",    TemplateType.Document,  "ReceiptText");
        Add("Báo cáo tồn kho",     TemplateType.Report,    "ChartBar");
        Add("Stored – Chốt kỳ",    TemplateType.Stored,    "DatabaseCog");
    }

    private void Add(string name, TemplateType type, string icon)
    {
        var item = new TemplateItem { Name = name, TemplateType = type, IconKind = icon };
        _store[item.Id] = item;
    }

    public Task<IEnumerable<TemplateItem>> GetAllAsync() =>
        Task.FromResult<IEnumerable<TemplateItem>>(_store.Values.OrderBy(i => i.TemplateType).ThenBy(i => i.Name));

    public Task<TemplateItem?> GetByIdAsync(string id) =>
        Task.FromResult(_store.TryGetValue(id, out var item) ? item : null);

    public Task<TemplateItem> CreateAsync(string name, TemplateType type)
    {
        var item = new TemplateItem { Name = name, TemplateType = type };
        _store[item.Id] = item;
        return Task.FromResult(item);
    }

    public Task DeleteAsync(string id)
    {
        _store.Remove(id);
        return Task.CompletedTask;
    }

    public Task<bool> UpdateAsync(TemplateItem item)
    {
        _store[item.Id] = item;
        return Task.FromResult(true);
    }
}

/// <summary>In-memory FormService – lưu FormDefinition theo Id.</summary>
public class FormService : IFormService
{
    private readonly Dictionary<string, FormDefinition> _store = [];

    public Task<FormDefinition?> GetFormAsync(string id) =>
        Task.FromResult(_store.TryGetValue(id, out var f) ? f : null);

    public Task<IEnumerable<FormDefinition>> GetAllFormsAsync() =>
        Task.FromResult<IEnumerable<FormDefinition>>(_store.Values);

    public Task SaveFormAsync(FormDefinition form)
    {
        _store[form.Id] = form;
        return Task.CompletedTask;
    }

    public Task DeleteFormAsync(string id)
    {
        _store.Remove(id);
        return Task.CompletedTask;
    }
}
