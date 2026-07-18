<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo giảm công cụ dụng cụ" e="Tool &amp; Supply Decrease Report"></title>
  <subTitle v="Ngày giảm từ ngày %d1 đến ngày %d2..." e="Decrease Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="stt" type="Int16" width="60" dataFormatString="####" allowFilter="&GridListAllowFilter.Number;">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_nv" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ho_ten_nv" width="150" allowSorting="true" allowFilter="true">
      <header v="Họ và tên" e="Employee Name"></header>
    </field>
    <field name="bo_phan" width="300" allowSorting="true" allowFilter="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="vi_tri" width="150" allowSorting="true" allowFilter="true">
      <header v="Vị trí công việc" e="Position"></header>
    </field>
    <field name="cong_cu" width="150" allowSorting="true" allowFilter="true">
      <header v="Công cụ, dụng cụ" e="Tool &#38; Supply"></header>
    </field>
    <field name="loai_giam" width="100" allowSorting="true" allowFilter="true">
      <header v="Loại giảm" e="Decrease Type"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width ="100" allowSorting="true" allowFilter="true">
      <header v="Ngày giảm" e="Decrease Date"/>
    </field>
    <field name="so_luong" width="100" type="Decimal" allowSorting="true" dataFormatString="@quantityViewFormat" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Số lượng" e="Quantity"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma_nv"/>
      <field name="ho_ten_nv"/>
      <field name="bo_phan"/>
      <field name="vi_tri"/>
      <field name="cong_cu"/>
      <field name="loai_giam"/>
      <field name="ngay_ct"/>
      <field name="so_luong"/>
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