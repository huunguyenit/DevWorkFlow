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
  <title v="Báo cáo cấp phát công cụ dụng cụ" e="Tool &amp; Supply Issue Report"></title>
  <subTitle v="Ngày cấp từ %d1 đến ngày %d2..." e="Issue Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="stt" type="Int16" width="60" dataFormatString="####" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_nv" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ho_ten_nv" width="150" allowSorting="true" allowFilter="true">
      <header v="Họ và tên" e="Full Name"></header>
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
    <field name="so_luong" width="100" type="Decimal" allowSorting="true" dataFormatString="@quantityViewFormat" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Số lượng" e="Quantity"></header>
    </field>
    <field name="ngay_cap" type="DateTime" dataFormatString="@datetimeFormat" width ="100" allowSorting="true" allowFilter="true">
      <header v="Ngày cấp" e="Issue Date"/>
    </field>
    <field name="ngay_hh" type="DateTime" dataFormatString="@datetimeFormat" width ="100" allowSorting="true" allowFilter="true">
      <header v="Ngày hết hạn" e="Expiry Date"/>
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
      <field name="so_luong"/>
      <field name="ngay_cap"/>
      <field name="ngay_hh"/>
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