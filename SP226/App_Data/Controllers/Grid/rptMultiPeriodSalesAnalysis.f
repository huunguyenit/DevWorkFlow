<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY Identification "rptMultiPeriodSalesAnalysis">

  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLGraphReportToolbar SYSTEM "..\Include\XML\GraphReportToolbar.xml">
  <!ENTITY CSSGraphReport SYSTEM "..\Include\Javascript\GraphReportCss.txt">
  <!ENTITY JavascriptGraphReportInit SYSTEM "..\Include\Javascript\GraphReportInit.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" valid="systotal = 1" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Phân tích bán hàng nhiều kỳ" e="Multi-period Sales Analysis"></title>
  <subTitle v="%t, %p, từ ngày: %d2..." e="%t, %p, Date from: %d2..."></subTitle>
  <pivot rowField="ma_vt" columnField="xCycle" dataFields="so_luong, tien2, tien_nt2" indexTable="2" indexColumn="1" indexHeader="2" indexView="4"/>
  <fields>
    <field name="stt" type="Int16" width="30" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_vt" width="100" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'query_soth5', Controller: 'rptMultiPeriodSalesAnalysis', Name: '[ma_vt]', Value: '[ma_vt] + this._queryFilterString'}, Script: 'beforeDrillDownWithCondition(this);'">
      <header v="Mã vật tư" e="Item Code"></header>
    </field>
    <field name="ten_vt" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên vật tư" e="Item Name"></header>
    </field>
    <field name="dvt" width="100" allowSorting="true" allowFilter="true">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityViewFormat" width="100" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số lượng" e="Quantity"></header>
    </field>
    <field name="tien_nt2" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Giá trị nt" e="FC Amount"></header>
    </field>
    <field name="tien2" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Giá trị" e="Amount"></header>
    </field>
    <field name="systotal" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma_vt"/>
      <field name="ten_vt"/>
      <field name="dvt"/>

      <field name="systotal"/>
    </view>
  </views>

  <commands>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      &JavascriptGraphReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJteSFht8yuUiTj8eqyrjtrQDocEOGlrP2GQLOc4F5b/MMtvaMdDaCpM4waN/OY+xFq1WxLPq5lnDOJTsrU7mE1v3Zl4Mopjwsh1jbm8jyq0qgrFOsmnHqfLzjtMr50XT+E0pI8BGL+xn3CR55UMTSRfb9d0MrTLhlccX4/+tdAUXK</Encrypted>]]>
    </text>
  </script>

  &CSSGraphReport;
  &XMLGraphReportToolbar;
</grid>