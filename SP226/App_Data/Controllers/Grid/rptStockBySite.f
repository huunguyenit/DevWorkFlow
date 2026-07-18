<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY Identification "rptStockBySite">

  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLGraphReportToolbar SYSTEM "..\Include\XML\GraphReportToolbar.xml">
  <!ENTITY CSSGraphReport SYSTEM "..\Include\Javascript\GraphReportCss.txt">
  <!ENTITY JavascriptGraphReportInit SYSTEM "..\Include\Javascript\GraphReportInit.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" valid="systotal = 1" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo tồn theo kho" e="Stock Report by Site"></title>
  <subTitle v="Ngày: %d2..." e="Date: %d2..."></subTitle>
  <pivot rowField="ma_vt" columnField="sysColumn" dataFields="so_luong, tien, tien_nt" indexTable="2" indexColumn="1" indexHeader="2" indexView="4"/>
  <fields>
    <field name="stt" type="Int16" width="30" dataFormatString="# ###" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_vt" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã vật tư" e="Item Code"></header>
    </field>
    <field name="ten_vt%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên vật tư" e="Item Name"></header>
    </field>

    <field name="dvt" width="100" allowSorting="true" allowFilter="true">
      <header v="Đvt" e="UOM"></header>
    </field>

    <field name="so_luong" type="Decimal" dataFormatString="@quantityViewFormat" width="100" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số lượng" e="Quantity"></header>
    </field>

    <field name="tien_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Giá trị nt" e="FC Amount"></header>
    </field>
    <field name="tien" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
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
      <field name="ten_vt%l"/>
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
    </text>
  </script>

  &CSSGraphReport;
  &XMLGraphReportToolbar;
</grid>