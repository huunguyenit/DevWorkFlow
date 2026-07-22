using DevWorkFlow.Application.Design;
using DevWorkFlow.Application.Engine;
using DevWorkFlow.Domain.Models.Fbo;
using Xunit;

namespace DevWorkFlow.Application.Tests.Design;

public sealed class DesignFormHtmlBuilderTests
{
    private const string CustomerDir = """
        <dir xmlns="urn:schemas-fast-com:data-dir">
          <title v="Khách" e="Customer"/>
          <fields>
            <field name="ma_kh"><header v="Mã khách" e="Customer"/></field>
            <field name="doi_tac" categoryIndex="1"><header v="Đối tác" e="Partner"/></field>
            <field name="status" categoryIndex="-1">
              <header v="Trạng thái" e="Status"/>
              <footer v="&lt;div class=&quot;Break&quot;&gt;1 - Còn dùng&lt;/div&gt;" e="&lt;div class=&quot;Break&quot;&gt;1 - Active&lt;/div&gt;"/>
            </field>
          </fields>
          <views>
            <view id="Dir" height="274">
              <item value="120, 30, 45, 25"/>
              <item value="1100: [ma_kh].Label, [ma_kh]"/>
              <item value="1010: [doi_tac].Description, [doi_tac]"/>
              <item value="-110: [status], [status].Description"/>
              <categories>
                <category index="1" columns="120,30,45,25">
                  <header v="Thông tin chính" e="General"/>
                </category>
              </categories>
            </view>
          </views>
        </dir>
        """;

    private static string BuildHtml(string xml)
    {
        var document = new FboXmlParser().Parse(xml, "Customer.xml");
        return new DesignFormHtmlBuilder().Build(
            document.Form!,
            vietnamese: true,
            new FboOptionsCatalog(),
            new Dictionary<string, DesignElementIdentity>(),
            new Dictionary<string, string>());
    }

    [Fact]
    public void Build_LabelHeaderHtmlEntitiesBecomeSafeMarkup()
    {
        const string xml = """
            <dir xmlns="urn:schemas-fast-com:data-dir">
              <title v="T" e="T"/>
              <fields>
                <field name="fax">
                  <header v="Số gửi bản sao &lt;span class=&quot;LabelDescription&quot;&gt;(Fax)&lt;/span&gt;" e="Fax"/>
                </field>
              </fields>
              <views>
                <view id="Dir">
                  <item value="100"/>
                  <item value="1: [fax].Label"/>
                </view>
              </views>
            </dir>
            """;
        var html = BuildHtml(xml);
        Assert.Contains("<span class=\"LabelDescription\">(Fax)</span>", html);
        Assert.DoesNotContain("&lt;span", html);
    }

    [Fact]
    public void Build_WrapsFormInFormParentWithUpdateDlgTitle()
    {
        var html = BuildHtml(CustomerDir);

        Assert.Contains("class=\"FormParent UpdateDlgPanel\"", html);
        Assert.Contains("data-dwf-region=\"form-parent\"", html);
        Assert.Contains("class=\"UpdateDlgTitle\"", html);
        Assert.Contains("class=\"UpdateDlgTitleText\"", html);
        Assert.Contains(">Thêm Khách</div>", html); // luôn «Thêm » + <title v>
        // Title + main/tabs/footer đều nằm trong FormParent
        var parent_open = html.IndexOf("data-dwf-region=\"form-parent\"", StringComparison.Ordinal);
        var parent_close = html.LastIndexOf("</div>", StringComparison.Ordinal);
        Assert.True(parent_open >= 0 && parent_close > parent_open);
        var inner = html.Substring(parent_open, parent_close - parent_open);
        Assert.Contains("data-dwf-region=\"main\"", inner);
        Assert.Contains("data-dwf-region=\"footer\"", inner);
        Assert.Contains("role=\"tablist\"", inner);
    }

    [Fact]
    public void Build_LabelFormContainerHasMaxHeightInline_InputDoesNot()
    {
        var html = BuildHtml(CustomerDir);

        Assert.Contains(
            "class=\"FormContainer\" style=\"width:100%;max-height:13px;overflow:hidden;vertical-align:middle;\"",
            html);
        Assert.Contains("class=\"FormContainer FormContainerInput\"", html);
        Assert.DoesNotContain(
            "FormContainer FormContainerInput\" style=\"width:100%;max-height:13px",
            html);
    }

    [Fact]
    public void Build_RendersMainTableWidthsSpansAndLabels()
    {
        var html = BuildHtml(CustomerDir);

        Assert.Contains("class=\"FormTable\"", html);
        Assert.Contains("<th style=\"width:120px\"", html);
        Assert.Contains("colspan=\"3\"", html);   // ma_kh input spans 3 columns
        Assert.Contains("Mã khách", html);        // .Label
        Assert.Contains("data-dwf-region=\"main\"", html);
    }

    [Fact]
    public void Build_AppliesViewHeightToNonGridTabPanel_NotMain()
    {
        var html = BuildHtml(CustomerDir);

        Assert.DoesNotContain("data-dwf-region=\"main\" style=\"height:274px\"", html);
        Assert.DoesNotContain("data-dwf-region=\"main\"style=\"height:274px\"", html);
        // Tab panel for category 1 (doi_tac is not Grid-style)
        Assert.Contains("data-category-index=\"1\"", html);
        Assert.Contains("height:274px", html);
        Assert.Matches(@"DwfTabPanel[^>]*style=""[^""]*height:274px", html);
    }

    [Fact]
    public void Build_FormTableHasSumWidthTableLayoutAndPadding()
    {
        var html = BuildHtml(CustomerDir);
        // 120+30+45+25 = 220
        Assert.Contains(
            "class=\"FormTable\" style=\"width:220px;table-layout:fixed;padding:8px\"",
            html);
    }

    [Fact]
    public void Build_RendersCategoriesAsTabs()
    {
        var html = BuildHtml(CustomerDir);

        Assert.Contains("role=\"tablist\"", html);
        Assert.Contains("Thông tin chính", html);
        Assert.Contains("data-category-index=\"1\"", html);
    }

    [Fact]
    public void Build_RendersFooterRegionAndSanitizedDescription()
    {
        var html = BuildHtml(CustomerDir);

        Assert.Contains("data-dwf-region=\"footer\"", html);
        Assert.Contains("class=\"UpdateDlgContent\"", html);
        Assert.Contains("<div class=\"Break\"", html);
        // Footer table: không padding trên table (padding ở UpdateDlgContent)
        Assert.Matches(
            @"data-dwf-region=""footer""[\s\S]*?class=""FormTable"" style=""width:\d+px;table-layout:fixed""",
            html);
        Assert.DoesNotMatch(
            @"data-dwf-region=""footer""[\s\S]*?class=""FormTable"" style=""[^""]*padding:8px",
            html);
    }

    [Fact]
    public void Build_DescriptionFallsBackToHeaderWhenFooterAbsent()
    {
        var html = BuildHtml(CustomerDir);

        // doi_tac has no footer → its .Description cell shows the header text.
        Assert.Contains("Đối tác", html);
    }

    private const string DirWithGridTab = """
        <dir xmlns="urn:schemas-fast-com:data-dir">
          <title v="T" e="T"/>
          <fields>
            <field name="ma"><header v="Mã" e="Code"/></field>
            <field name="d_grid" categoryIndex="1" rows="120">
              <header v="Lưới" e="Grid"/>
              <items style="Grid" controller="DetailX"/>
            </field>
          </fields>
          <views>
            <view id="Dir" height="274">
              <item value="100,100"/>
              <item value="10: [ma].Label"/>
              <item value="10: [d_grid]"/>
              <categories>
                <category index="1" columns="200">
                  <header v="Chi tiết" e="Detail"/>
                </category>
              </categories>
            </view>
          </views>
        </dir>
        """;

    [Fact]
    public void Build_GridTab_UsesFieldRowsOnDwfGridBody_NotViewHeightOnPanel()
    {
        var document = new FboXmlParser().Parse(DirWithGridTab, "T.xml");
        var detail_html = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase)
        {
            ["DetailX"] = "<table class=\"GridTable DwfDetailGrid\"></table>"
        };
        var html = new DesignFormHtmlBuilder().Build(
            document.Form!, true, new FboOptionsCatalog(),
            new Dictionary<string, DesignElementIdentity>(), detail_html);

        Assert.Contains("class=\"DwfGridBody\"", html);
        Assert.Contains("height:120px", html);
        Assert.DoesNotContain("data-category-index=\"1\" style=\"height:274px\"", html);
        Assert.DoesNotMatch(@"data-category-index=""1""[^>]*height:274px", html);
    }

    [Fact]
    public void SanitizeFragment_EncodesDisallowedTags()
    {
        var sanitized = DesignFormHtmlBuilder.SanitizeFragment(
            "<div class=\"Break\">ok<script>alert(1)</script></div>");

        Assert.Contains("<div class=\"Break\">", sanitized);
        Assert.DoesNotContain("<script>", sanitized);
        Assert.Contains("&lt;script&gt;", sanitized);
    }
}
