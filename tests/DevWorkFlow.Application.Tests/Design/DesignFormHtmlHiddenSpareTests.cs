using System.Text.RegularExpressions;
using DevWorkFlow.Application.Design;
using DevWorkFlow.Application.Engine;
using DevWorkFlow.Domain.Models.Fbo;
using Xunit;

namespace DevWorkFlow.Application.Tests.Design;

/// <summary>P6 4b: hàng hidden-only ẩn hẳn + spare render-side visible-aware (không duplicate).</summary>
public sealed class DesignFormHtmlHiddenSpareTests
{
    private static string BuildHtml(string xml)
    {
        var document = new FboXmlParser().Parse(xml, "T.xml");
        return new DesignFormHtmlBuilder().Build(
            document.Form!, true, new FboOptionsCatalog(),
            new Dictionary<string, DesignElementIdentity>(),
            new Dictionary<string, FboControllerDocument>());
    }

    [Fact]
    public void HiddenOnlyRow_IsNotEmitted()
    {
        // row0 visible (a); row1 chỉ có field hidden (h) → hidden-only → không emit.
        const string xml = """
            <dir xmlns="urn:schemas-fast-com:data-dir">
              <title v="T" e="T"/>
              <fields>
                <field name="a"><header v="A" e="A"/></field>
                <field name="h" hidden="true"><header v="H" e="H"/></field>
              </fields>
              <views>
                <view id="Dir">
                  <item value="60,60"/>
                  <item value="1-: [a]"/>
                  <item value="1-: [h]"/>
                </view>
              </views>
            </dir>
            """;
        var html = BuildHtml(xml);

        // Slot của hàng 0 (a) có; slot hàng 1 (hidden-only) không có.
        Assert.Contains("data-dwf-slot=\"main:0:", html);
        Assert.DoesNotContain("data-dwf-slot=\"main:1:", html);
    }

    [Fact]
    public void MixedRow_HiddenCell_HasNoSlot()
    {
        // 1 hàng: a visible @0, h hidden @1 → hàng render (hỗn hợp), ô hidden không có slot.
        const string xml = """
            <dir xmlns="urn:schemas-fast-com:data-dir">
              <title v="T" e="T"/>
              <fields>
                <field name="a"><header v="A" e="A"/></field>
                <field name="h" hidden="true"><header v="H" e="H"/></field>
              </fields>
              <views>
                <view id="Dir">
                  <item value="60,60"/>
                  <item value="11: [a], [h]"/>
                </view>
              </views>
            </dir>
            """;
        var html = BuildHtml(xml);

        Assert.Contains("data-dwf-slot=\"main:0:0:", html); // a
        Assert.Contains("DwfHiddenCell", html);
        Assert.DoesNotContain("data-dwf-slot=\"main:0:1:", html); // h không phải drop target
    }

    [Fact]
    public void MainRegion_RendersExactlyOneTrailingSpareRow()
    {
        // row0 đầy (Label+Input) → builder thêm 1 spare visible row (index=1).
        const string xml = """
            <dir xmlns="urn:schemas-fast-com:data-dir">
              <title v="T" e="T"/>
              <fields><field name="a"><header v="A" e="A"/></field></fields>
              <views>
                <view id="Dir">
                  <item value="60,60"/>
                  <item value="11: [a].Label, [a]"/>
                </view>
              </views>
            </dir>
            """;
        var html = BuildHtml(xml);

        Assert.Contains("DwfSpareRow", html);
        // Đúng một spare row cho vùng main.
        Assert.Single(Regex.Matches(html, "DwfSpareRow"));
        Assert.Contains("data-dwf-slot=\"main:1:0:1\"", html);
    }

    [Fact]
    public void LastRowAlreadyEmpty_NoExtraSpare()
    {
        // row0 đầy, row1 đã toàn Empty (spare sẵn) → builder KHÔNG thêm spare nữa.
        const string xml = """
            <dir xmlns="urn:schemas-fast-com:data-dir">
              <title v="T" e="T"/>
              <fields><field name="a"><header v="A" e="A"/></field></fields>
              <views>
                <view id="Dir">
                  <item value="60,60"/>
                  <item value="11: [a].Label, [a]"/>
                  <item value="--"/>
                </view>
              </views>
            </dir>
            """;
        var html = BuildHtml(xml);

        Assert.DoesNotContain("DwfSpareRow", html);
    }

    [Fact]
    public void SpareIgnoresTrailingHiddenOnlyRow()
    {
        // row0 đầy, row1 hidden-only → hàng visible cuối là row0 (đầy) → cần spare.
        const string xml = """
            <dir xmlns="urn:schemas-fast-com:data-dir">
              <title v="T" e="T"/>
              <fields>
                <field name="a"><header v="A" e="A"/></field>
                <field name="h" hidden="true"><header v="H" e="H"/></field>
              </fields>
              <views>
                <view id="Dir">
                  <item value="60,60"/>
                  <item value="11: [a].Label, [a]"/>
                  <item value="1-: [h]"/>
                </view>
              </views>
            </dir>
            """;
        var html = BuildHtml(xml);

        Assert.Contains("DwfSpareRow", html);
        Assert.DoesNotContain("data-dwf-slot=\"main:1:", html); // hidden-only row 1 không emit
        Assert.Contains("data-dwf-slot=\"main:2:0:1\"", html);  // spare tại index model = 2
    }
}
