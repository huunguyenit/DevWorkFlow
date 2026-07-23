using DevWorkFlow.Application.Design.Layout;
using DevWorkFlow.Application.Design.Toolbox;
using Xunit;

namespace DevWorkFlow.Application.Tests.Design.Toolbox;

public sealed class ToolboxControlCatalogTests
{
    private const string CatalogXml = """
        <toolbox version="1">
          <group id="basic" title="Basic Controls">
            <control id="TextBox" name="TextBox" icon="FormTextbox" enabled="true"
                     prefix="text" type="String" placeKinds="Input,Label,Description"/>
            <control id="DateTime" name="DateTime" icon="Calendar" enabled="true"
                     prefix="date" type="DateTime" dataFormatString="@dateTimeFormat"
                     placeKinds="Input,Label,Description"/>
            <control id="Numeric" name="Numeric" icon="Numeric" enabled="true"
                     prefix="num" type="Decimal" dataFormatString=""
                     placeKinds="Input,Label,Description"/>
            <control id="CheckBox" name="CheckBox" icon="CheckboxMarkedOutline" enabled="true"
                     prefix="check" type="Boolean" itemsStyle="Checkbox"
                     placeKinds="Input,Label,Description"/>
            <control id="ComboBox" name="ComboBox" icon="FormDropdown" enabled="true"
                     prefix="combo" type="String" itemsStyle="DropDownList"
                     placeKinds="Input,Label,Description"/>
            <control id="AutoComplete" name="AutoComplete" icon="TextSearch" enabled="true"
                     prefix="ac" type="String" itemsStyle="AutoComplete" createReference="true"
                     placeKinds="Input,Label,Description"/>
            <control id="Lookup" name="Lookup" icon="Magnify" enabled="true"
                     prefix="lookup" type="String" itemsStyle="Lookup"
                     placeKinds="Input,Label,Description"/>
          </group>
          <group id="tabs" title="Tabs">
            <control id="TabNormal" name="Tab (Normal)" icon="Tab" enabled="true" tabKind="Normal"/>
            <control id="TabGrid" name="Tab (Grid)" icon="TableLarge" enabled="true" tabKind="Grid"/>
            <control id="TabPost" name="Tab (Post)" icon="FileDocument" enabled="true" tabKind="Post"/>
            <control id="TabList" name="Tab (List)" icon="ViewList" enabled="true" tabKind="List"/>
          </group>
        </toolbox>
        """;

    [Fact]
    public void ParseXml_Returns7BasicAnd4TabControls()
    {
        var data = ToolboxControlCatalogParser.ParseXml(CatalogXml);

        Assert.Equal(1, data.Version);
        Assert.Equal(2, data.Groups.Count);
        Assert.Equal(7, data.Groups.Single(g => g.Id == "basic").Controls.Count);
        Assert.Equal(4, data.Groups.Single(g => g.Id == "tabs").Controls.Count);
    }

    [Fact]
    public void ParseXml_ReadsControlAttributes()
    {
        var data = ToolboxControlCatalogParser.ParseXml(CatalogXml);
        var date = data.AllControls.Single(c => c.Id == "DateTime");

        Assert.Equal("date", date.Prefix);
        Assert.Equal("DateTime", date.DataType);
        Assert.Equal("@dateTimeFormat", date.DataFormatString);
        Assert.Equal(new[] { "Input", "Label", "Description" }, date.PlaceKinds);
        Assert.False(date.IsTab);
    }

    [Fact]
    public void ParseXml_KeepsEmptyDataFormatString()
    {
        var data = ToolboxControlCatalogParser.ParseXml(CatalogXml);
        var numeric = data.AllControls.Single(c => c.Id == "Numeric");

        Assert.Equal(string.Empty, numeric.DataFormatString);
    }

    [Fact]
    public void ParseXml_ReadsAutoCompleteCreateReference()
    {
        var data = ToolboxControlCatalogParser.ParseXml(CatalogXml);
        var ac = data.AllControls.Single(c => c.Id == "AutoComplete");

        Assert.True(ac.CreateReference);
        Assert.Equal("AutoComplete", ac.ItemsStyle);
    }

    [Fact]
    public void ParseXml_ReadsTabKind()
    {
        var data = ToolboxControlCatalogParser.ParseXml(CatalogXml);
        var grid = data.AllControls.Single(c => c.Id == "TabGrid");

        Assert.True(grid.IsTab);
        Assert.Equal("Grid", grid.TabKind);
    }

    [Fact]
    public void EveryControlId_MapsToToolboxControlKind()
    {
        var data = ToolboxControlCatalogParser.ParseXml(CatalogXml);
        foreach (var control in data.AllControls)
            Assert.True(Enum.TryParse<ToolboxControlKind>(control.Id, out _), $"unmapped id: {control.Id}");
    }

    [Fact]
    public void ParseXml_MissingOrBroken_ReturnsEmpty()
    {
        Assert.Empty(ToolboxControlCatalogParser.ParseXml("").Groups);
        Assert.Empty(ToolboxControlCatalogParser.ParseXml("<not-closed").Groups);
        Assert.Empty(ToolboxControlCatalogParser.ParseFile("Z:\\does\\not\\exist.xml").Groups);
    }
}
