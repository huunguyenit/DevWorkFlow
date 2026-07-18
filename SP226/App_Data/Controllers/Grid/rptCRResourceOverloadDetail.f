<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo chi tiết nguồn lực vượt mức" e="Resource Overload Detail Report"></title>
  <subTitle v="Mã nguồn lực: %c, kỳ: %p..." e="Resource: %c, Period: %p..."></subTitle>
  <fields>
    <field name="ngay_bd" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Ngày bắt đầu" e="Start Use Date"></header>
    </field>
    <field name="so_dh" width="100" align="right" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số đơn hàng" e="Order No."></header>
    </field>
    <field name="ten_nguon" width="300" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Loại đơn hàng" e="Order Type"></header>
    </field>
    <field name="dien_giai" width="300" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="ngay_ht" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Ngày hoàn thành" e="Due Date"></header>
    </field>
    <field name="so_luong" width="100" type="Decimal" dataFormatString="@quantityViewFormat" aggregate="Sum" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="cong_suat" width="100" type="Decimal" dataFormatString="@CapacityNumberViewFormat" aggregate="Sum" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Công suất sử dụng" e="Capacity Used"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_cong_suat" width="100" type="Decimal" dataFormatString="@CapacityNumberViewFormat" aggregate="Sum" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tổng nhu cầu" e="Total Capacity Req."></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_vt" width="100" readOnly="true" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Mã vật tư" e="Item Code"></header>
    </field>
    <field name="ten_vt" width="300" readOnly="true" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tên vật tư" e="Item Name"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ngay_bd"/>
      <field name="so_dh"/>
      <field name="ten_nguon"/>
      <field name="dien_giai"/>
      <field name="ngay_ht"/>
      <field name="so_luong"/>
      <field name="cong_suat"/>
      <field name="t_cong_suat"/>
      <field name="ma_vt"/>
      <field name="ten_vt"/>
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

  <toolbar>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Aggregate">
      <title v="Toolbar.Aggregate" e="Toolbar.Aggregate"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>