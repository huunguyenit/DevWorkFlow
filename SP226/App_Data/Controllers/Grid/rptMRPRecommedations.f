<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cảnh báo nhu cầu nguyên liệu" e="MRP Recommendations Report"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ma_vt" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã vật tư" e="Item Code"></header>
    </field>
    <field name="ten_vt" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên vật tư" e="Item Name"></header>
    </field>
    <field name="dvt" width="100" allowSorting="true" allowFilter="true">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Ngày yêu cầu" e="Due Date"></header>
    </field>
    <field name="so_dh" width="100" align="right" allowSorting="true" allowFilter="true">
      <header v="Số đơn hàng" e="Order No."></header>
    </field>
    <field name="ten_dh" width="300" allowSorting="true" allowFilter="true">
      <header v="Loại đơn hàng" e="Order Type"></header>
    </field>
    <field name="sl_dh" width="100" type="Decimal" dataFormatString="@quantityViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số lượng đơn hàng" e="Order Q'ty"></header>
      <items style="Numeric"/>
    </field>
    <field name="sl_da_yc" width="100" type="Decimal" dataFormatString="@quantityViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Đã phân bổ" e="Allocated Q'ty"></header>
      <items style="Numeric"/>
    </field>
    <field name="sl_nhap" width="100" type="Decimal" dataFormatString="@quantityViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số lượng còn lại" e="Remain Q'ty"></header>
      <items style="Numeric"/>
    </field>
    <field name="ngay_dat" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Ngày đặt" e="Release Date"></header>
    </field>
    <field name="ten_cb" width="300" allowSorting="true" allowFilter="true">
      <header v="Cảnh báo" e="Action Message"></header>
    </field>
    <field name="ten_nguon" width="300" allowSorting="true" allowFilter="true">
      <header v="Nguồn" e="Peg Type"></header>
    </field>
    <field name="so_ct" width="100" align="right" allowSorting="true" allowFilter="true">
      <header v="Số chứng từ" e="Pegged To"></header>
    </field>
    <field name="sl_xuat" width="100" type="Decimal" dataFormatString="@quantityViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số lượng yêu cầu" e="Required Q'ty"></header>
      <items style="Numeric"/>
    </field>
    <field name="sl_ton" width="100" type="Decimal" dataFormatString="@quantityViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số lượng tồn" e="Projected Inventory"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_sp" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã sản phẩm" e="Product"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_vt"/>
      <field name="ten_vt"/>
      <field name="dvt"/>
      <field name="ngay_ct"/>
      <field name="so_dh"/>
      <field name="ten_dh"/>
      <field name="sl_dh"/>
      <field name="sl_da_yc"/>
      <field name="sl_nhap"/>
      <field name="ngay_dat"/>
      <field name="ten_cb"/>
      <field name="ten_nguon"/>
      <field name="so_ct"/>
      <field name="sl_xuat"/>
      <field name="sl_ton"/>
      <field name="ma_sp"/>
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