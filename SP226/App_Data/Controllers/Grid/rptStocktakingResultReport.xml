<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" filter="sysorder = 5" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo kết quả kiểm kê" e="Stocktaking Result Report"></title>
  <subTitle v="Số yêu cầu: %s..." e="Voucher No.: %s..."></subTitle>
  <fields>
    <field name="ma_vt" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Mã vật tư" e="Item Code"></header>
    </field>
    <field name="ten_vt" width="300" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tên vật tư" e="Item Name"></header>
    </field>
    <field name="ma_kho" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Kho" e="Site"></header>
    </field>
    <field name="ma_vi_tri" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Vị trí" e="Location"></header>
    </field>
    <field name="ma_lo" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Lô" e="Lot"></header>
    </field>
    <field name="dvt" width="50" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="sl_ss" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" aggregate="Sum" readOnly="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Sl sổ sách" e="Book Q'ty"></header>
    </field>
    <field name="sl_kk" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" aggregate="Sum" readOnly="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Sl kiểm kê" e="Stocktaking Q'ty"></header>
    </field>
    <field name="sl_cl" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" aggregate="Sum" readOnly="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Sl chênh lệch" e="Variance Q'ty"></header>
    </field>

  </fields>

  <views>
    <view id="Grid">
      <field name="ma_vt"/>
      <field name="ten_vt"/>
      <field name="ma_kho"/>
      <field name="ma_vi_tri"/>
      <field name="ma_lo"/>
      <field name="dvt"/>
      <field name="sl_ss"/>
      <field name="sl_kk"/>
      <field name="sl_cl"/>
    </view>
  </views>

  <commands>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      &JavascriptReportInit;
    </text>
  </script>

  &XMLStandardReportToolbar;
</grid>