using DevWorkFlow.Application.Engine;
using DevWorkFlow.Domain.Models.Fbo;

namespace DevWorkFlow.Application.Tests.Design.Layout;

/// <summary>Fixture XML dùng chung cho test Layout Engine / Writer Adapter.</summary>
internal static class LayoutTestXml
{
    public const string SimpleDir = """
        <dir xmlns="urn:schemas-fast-com:data-dir">
          <title v="T" e="T"/>
          <fields><field name="a"><header v="A" e="A"/></field></fields>
          <views>
            <view id="Dir">
              <item value="100, 100, 100, 100"/>
              <item value="1111: [a].Label, [a], [a].Description, [a]."/>
            </view>
          </views>
        </dir>
        """;

    public const string OneControlDir = """
        <dir xmlns="urn:schemas-fast-com:data-dir">
          <title v="T" e="T"/>
          <fields><field name="a"><header v="A" e="A"/></field></fields>
          <views>
            <view id="Dir">
              <item value="50,50,50,50"/>
              <item value="1---: [a].Label"/>
            </view>
          </views>
        </dir>
        """;

    public const string SpannedControlDir = """
        <dir xmlns="urn:schemas-fast-com:data-dir">
          <title v="T" e="T"/>
          <fields><field name="a"><header v="A" e="A"/></field></fields>
          <views>
            <view id="Dir">
              <item value="50,50,50,50"/>
              <item value="1000: [a].Label"/>
            </view>
          </views>
        </dir>
        """;

    /// <summary>Có tab category (index 1, columns riêng) + footer category index -1.</summary>
    public const string CategoryAndFooterDir = """
        <dir xmlns="urn:schemas-fast-com:data-dir">
          <title v="T" e="T"/>
          <fields>
            <field name="a"><header v="A" e="A"/></field>
            <field name="b" categoryIndex="1"><header v="B" e="B"/></field>
            <field name="c" categoryIndex="-1"><header v="C" e="C"/></field>
          </fields>
          <views>
            <view id="Dir">
              <item value="100, 100"/>
              <item value="11: [a].Label, [a]"/>
              <item value="11: [b].Label, [b]"/>
              <item value="11: [c].Label, [c]"/>
              <categories>
                <category index="1" columns="60, 140"><header v="Tab" e="Tab"/></category>
                <category index="-1" columns="80, 120"><header v="" e=""/></category>
              </categories>
            </view>
          </views>
        </dir>
        """;

    public static FboFormModel ParseForm(string xml) =>
        new FboXmlParser().Parse(xml, "t.xml").Form!;
}
