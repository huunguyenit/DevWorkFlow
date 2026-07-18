<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo nhu cầu công suất của trung tâm công việc" e="Work Center Load Report"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ky" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Kỳ" e="Period"></header>
    </field>
    <field name="ma_nl" width="100" allowSorting="true" allowFilter="true">
      <header v="Trung tâm công việc" e="Work Center"></header>
    </field>
    <field name="ten_nl" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên trung tâm công việc" e="Work Center Name"></header>
    </field>
    <field name="ngay_bd" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Ngày bắt đầu" e="Start Use Date"></header>
    </field>
    <field name="so_dh" width="100" align="right" allowSorting="true" allowFilter="true">
      <header v="Số đơn hàng" e="Order No."></header>
    </field>
    <field name="ten_nguon" width="300" allowSorting="true" allowFilter="true">
      <header v="Loại đơn hàng" e="Order Type"></header>
    </field>
    <field name="dien_giai" width="300" allowSorting="true" allowFilter="true">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="ngay_ht" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Ngày hoàn thành" e="Due Date"></header>
    </field>
    <field name="so_luong" width="100" type="Decimal" dataFormatString="@quantityViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Số lượng" e="Quantity"></header>
    </field>
    <field name="cong_suat" type="Decimal" dataFormatString="@CapacityNumberViewFormat" width="100" align="right" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Công suất sử dụng" e="Capacity Used"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_cong_suat" type="Decimal" dataFormatString="@CapacityNumberViewFormat" width="100" align="right" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Tổng nhu cầu" e="Total Capacity Req."></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_vt" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã vật tư" e="Item Code"></header>
    </field>
    <field name="ten_vt" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên vật tư" e="Item Name"></header>
    </field>
  </fields>
  <views>
    <view id="Grid">
      <field name="ky"/>
      <field name="ma_nl"/>
      <field name="ten_nl"/>
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

  &XMLStandardReportToolbar;
</grid>