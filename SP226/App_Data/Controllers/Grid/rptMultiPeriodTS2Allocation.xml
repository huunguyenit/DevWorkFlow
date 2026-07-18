<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY Identification "rptMultiPeriodTS2Allocation">

  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLGraphReportToolbar SYSTEM "..\Include\XML\GraphReportToolbar.xml">
  <!ENTITY CSSGraphReport SYSTEM "..\Include\Javascript\GraphReportCss.txt">
  <!ENTITY JavascriptGraphReportInit SYSTEM "..\Include\Javascript\GraphReportInit.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
  <!ENTITY % Repetition SYSTEM "..\Include\Repetition.ent">
  %Repetition;
]>

<grid type="Report" filter="&Repetition.Key.005;" valid="systotal = 1" repetition="&Repetition.Key.006;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Bảng tính chi phí CCDC nhiều kỳ" e="Multi Period Tool &amp; Supply Allocation Report"></title>
  <subTitle v="Từ kỳ %p1 năm %y1 đến kỳ %p2 năm %y2..." e="From Period %p1 Year %y1 to Period %p2 to Year %y2..."></subTitle>
  <pivot rowField="sysRow" columnField="sysColumn" dataFields="gt_pb_ky_nt, gt_pb_ky" indexTable="2" indexColumn="1" indexHeader="2" indexView="6"/>
  <fields>
    <field name="stt" width="30" type="Int16" dataFormatString="# ###" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ten_dc%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên CCDC" e="Tool &amp; Supply Name"></header>
    </field>
    <field name="ma_dc" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã công cụ" e="Tool &amp; Supply Code"></header>
    </field>

    <field name="ngay_pb0" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowSorting="true" allowFilter="true">
      <header v="Ngày tính pb" e="Distr. Date"></header>
    </field>
    <field name="so_ky_pb" type="Decimal" dataFormatString="# ###" width="100" allowSorting="true" allowFilter="true">
      <header v="Số kỳ pb" e="Distr. Periods"></header>
      <items style="Numeric"></items>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Sl cuối kỳ" e="Quantity"></header>
      <items style="Numeric"></items>
    </field>
    <field name="gt_pb_ky_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tổng phân bổ nt" e="Total FC Distr."></header>
      <items style="Numeric"></items>
    </field>
    <field name="gt_pb_ky" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tổng phân bổ" e="Total Distr."></header>
      <items style="Numeric"></items>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ten_dc%l"/>
      <field name="ma_dc"/>

      <field name="ngay_pb0"/>
      <field name="so_ky_pb"/>
      <field name="so_luong"/>
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