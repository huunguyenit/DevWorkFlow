namespace DevWorkFlow.Domain.Models.Fbo;

public class FboDropDownItem
{
    public string Value { get; set; } = string.Empty;
    public LocalizedText Text { get; set; } = new();

    public string GetText(bool vietnamese) => Text.Get(vietnamese);
}
