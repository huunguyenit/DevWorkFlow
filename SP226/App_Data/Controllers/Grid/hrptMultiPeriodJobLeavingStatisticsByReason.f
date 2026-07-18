<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY Identification "hrptMultiPeriodJobLeavingStatisticsByReason">

  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLGraphReportToolbar SYSTEM "..\Include\XML\GraphReportToolbar.xml">
  <!ENTITY CSSGraphReport SYSTEM "..\Include\Javascript\GraphReportCss.txt">
  <!ENTITY JavascriptGraphReportInit SYSTEM "..\Include\Javascript\GraphReportInit.txt">

  <!ENTITY % Repetition SYSTEM "..\Include\Repetition.ent">
  %Repetition;
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" filter="sysorder &lt; 9&Repetition.And;&Repetition.Key.001;" valid="sysprint = 1" repetition="&Repetition.Key.002;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo thống kê nghỉ việc nhiều kỳ theo lý do" e="Multi-period Job Leaving Statistics by Reason"></title>
  <subTitle v="%r, báo cáo theo: %t, số kỳ báo cáo: %p, ngày bắt đầu: %d..." e="%r, Report by: %t, Number Period: %p, Start Date: %d..."></subTitle>
  <pivot rowField="xRow" columnField="xColumn" dataFields="so_nv" indexTable="2" indexColumn="1" indexHeader="2" indexView="1"/>
  <fields>
    <field name="xRowName" width="300" allowSorting="true" allowFilter="true">
      <header v="Lý do" e="Reason"></header>
    </field>
    <field name="so_nv" type="Decimal" width="120" dataFormatString="# ###" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Số nhân viên" e="Count"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="xRowName"/>
    </view>
  </views>

  <commands>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      &JavascriptGraphReportInit;
    </text>
  </script>

  &CSSGraphReport;
  &XMLGraphReportToolbar;
</grid>