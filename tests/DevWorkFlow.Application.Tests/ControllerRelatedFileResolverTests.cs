using DevWorkFlow.Application.Engine;
using Xunit;

namespace DevWorkFlow.Application.Tests;

public class ControllerRelatedFileResolverTests
{
    [Fact]
    public void FindRelated_TidyGrid_ReturnsGridController()
    {
        const string xml = """
            <fields>
            <field name="d85" allowNulls="false" external="true" filterSource="Tidy" categoryIndex="1">
              <header v="" e=""></header>
              <label v="Chi tiết" e="Detail"></label>
              <items style="Grid" controller="ITDetail" row="1">
                <item value="ForeignKey">
                  <text v="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
                </item>
              </items>
            </field>
            </fields>
            """;

        var related = ControllerRelatedFileResolver.FindRelated(xml);

        Assert.Contains(related, r =>
            r.Kind == ControllerRelatedFileResolver.RelatedKind.Grid
            && r.ControllerName.Equals("ITDetail", StringComparison.OrdinalIgnoreCase));
    }

    [Fact]
    public void FindRelated_GridWithoutTidy_Ignored()
    {
        const string xml = """
            <field name="x">
              <items style="Grid" controller="NoTidy"></items>
            </field>
            """;

        var related = ControllerRelatedFileResolver.FindRelated(xml);

        Assert.DoesNotContain(related, r =>
            r.Kind == ControllerRelatedFileResolver.RelatedKind.Grid
            && r.ControllerName.Equals("NoTidy", StringComparison.OrdinalIgnoreCase));
    }

    [Fact]
    public void FindRelated_ShowForm_ReturnsFilter()
    {
        const string script = "function onClick(sender) { f.showForm('SRFilter'); }";

        var related = ControllerRelatedFileResolver.FindRelated(script);

        Assert.Contains(related, r =>
            r.Kind == ControllerRelatedFileResolver.RelatedKind.Filter
            && r.ControllerName.Equals("SRFilter", StringComparison.OrdinalIgnoreCase));
    }

    [Fact]
    public void FindRelated_CheckingUpload_LiteralAndDynamic()
    {
        const string xml = """
            <command event="Checking">
            <text><![CDATA[
            var form = $get('uploadForm'), query = {
              Language: f._language,
              Controller: 'SRMaster',
              Key: k,
              Memvars: importMemvars,
              Time: new Date().getTime().toString()
            };
            ]]></text>
            </command>
            <command event="Checking">
            <text><![CDATA[
            var form = $get('uploadForm'), query = { Controller: g._controller };
            ]]></text>
            </command>
            """;

        var related = ControllerRelatedFileResolver.FindRelated(xml, parent_controller: "Item");

        Assert.Contains(related, r =>
            r.Kind == ControllerRelatedFileResolver.RelatedKind.Upload
            && r.ControllerName.Equals("SRMaster", StringComparison.OrdinalIgnoreCase));
        Assert.Contains(related, r =>
            r.Kind == ControllerRelatedFileResolver.RelatedKind.Upload
            && r.ControllerName.Equals("Item", StringComparison.OrdinalIgnoreCase));
    }

    [Fact]
    public void FindRelated_ReportForms_RptAndExcel()
    {
        const string xml = """
            <forms>
              <form id="030" reportFile="SVTran_01" templateFile="SVTran_01"/>
            </forms>
            """;

        var related = ControllerRelatedFileResolver.FindRelated(xml);

        Assert.Contains(related, r =>
            r.Kind == ControllerRelatedFileResolver.RelatedKind.Rpt
            && r.ControllerName.Equals("SVTran_01", StringComparison.OrdinalIgnoreCase));
        Assert.Contains(related, r =>
            r.Kind == ControllerRelatedFileResolver.RelatedKind.Excel
            && r.ControllerName.Equals("SVTran_01", StringComparison.OrdinalIgnoreCase));
    }
}
