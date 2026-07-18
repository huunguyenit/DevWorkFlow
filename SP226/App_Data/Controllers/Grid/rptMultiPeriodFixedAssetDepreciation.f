<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY Identification "rptMultiPeriodFixedAssetDepreciation">

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

<grid type="Report" filter="&Repetition.Key.005;" valid="systotal = 1" repetition="&Repetition.Key.006;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Bảng tính khấu hao TSCĐ nhiều kỳ" e="Multi Period Fixed Asset Depreciation Report"></title>
  <subTitle v="Từ kỳ %p1 năm %y1 đến kỳ %p2 năm %y2..." e="From Period %p1 Year %y1 to Period %p2 to Year %y2..."></subTitle>
  <pivot rowField="sysRow" columnField="sysColumn" dataFields="gt_kh_ky_nt, gt_kh_ky" indexTable="2" indexColumn="1" indexHeader="2" indexView="5"/>
  <fields>
    <field name="stt" width="30" type="Int16" dataFormatString="# ###" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ten_ts%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên tài sản" e="FA Name"></header>
    </field>
    <field name="so_the_ts" width="100" allowSorting="true" allowFilter="true">
      <header v="Số thẻ ts" e="FA Code"></header>
    </field>

    <field name="ngay_kh0" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowSorting="true" allowFilter="true">
      <header v="Ngày tính kh" e="Depr. Date"></header>
    </field>
    <field name="so_ky_kh" type="Decimal" dataFormatString="# ###" width="100" allowSorting="true" allowFilter="true">
      <header v="Số kỳ khấu hao" e="Depr. Periods"></header>
      <items style="Numeric"></items>
    </field>

    <field name="nguyen_gia_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Nguyên giá nt" e="FC Original Cost"></header>
    </field>
    <field name="gt_kh_ky_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tổng khấu hao nt" e="Total FC Depr."></header>
    </field>

    <field name="nguyen_gia" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Nguyên giá" e="Original Cost"></header>
    </field>
    <field name="gt_kh_ky" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tổng khấu hao" e="Total Depr."></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ten_ts%l"/>
      <field name="so_the_ts"/>

      <field name="ngay_kh0"/>
      <field name="so_ky_kh"/>
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