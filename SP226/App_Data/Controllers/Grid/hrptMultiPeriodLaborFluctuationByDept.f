<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY Identification "hrptMultiPeriodLaborFluctuationByDept">

  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY CSSGraphReport SYSTEM "..\Include\Javascript\GraphReportCss.txt">
  <!ENTITY JavascriptGraphReportInit SYSTEM "..\Include\Javascript\GraphReportInit.txt">

  <!ENTITY % Repetition SYSTEM "..\Include\Repetition.ent">
  %Repetition;
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" valid="systotal = 1" filter="sysorder &lt; 9&Repetition.And;&Repetition.Key.001;" repetition="&Repetition.Key.002;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Bảng tổng hợp tăng giảm lao động theo bộ phận nhiều kỳ" e="Multi Period Labor Fluctuation Report"></title>
  <subTitle v="Số kỳ báo cáo: %n, từ tháng %p năm %y..." e="Report Periods: %n, From Month %p Year %y..."></subTitle>
  <pivot rowField="sysRow" columnField="sysColumn" dataFields="so_nv_bq, so_nv_ct, so_nv_ta, so_nv_ng" indexTable="2" indexColumn="1" indexHeader="2" indexView="2"/>
  <fields>
    <field name="sysRow" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã bộ phận" e="Department"></header>
    </field>
    <field name="sysRowName" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên bộ phận" e="Description"></header>
    </field>
    <field name="so_nv_bq" width="80" type="Decimal" dataFormatString="### ### ### ###.00" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lao động bình quân" e="Average Labour"/>
    </field>
    <field name="so_nv_ct" width="80" type="Decimal" dataFormatString="### ### ### ###" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lao động cuối tháng" e="Labour at the end of the month"/>
    </field>
    <field name="so_nv_ta" width="80" type="Decimal" dataFormatString="### ### ### ###" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lao động tăng" e="Increasing"/>
    </field>
    <field name="so_nv_ng" width="80" type="Decimal" dataFormatString="### ### ### ###" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lao động giảm" e="Decreasing"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="sysRow"/>
      <field name="sysRowName"/>
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

  <toolbar>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Print">
      <title v="Toolbar.Print" e="Toolbar.Print"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Graph">
      <title v="Đồ thị$" e="Graph$"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>