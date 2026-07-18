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
  <title v="Danh sách nhân viên bị tai nạn" e="Employees Having Work Accidents"></title>
  <subTitle v="%s..." e="%s..."></subTitle>

  <fields>
    <field name="stt" type="Int16" width="60" dataFormatString="# ###" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_nv" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ten_nv" width="150" allowSorting="true" allowFilter="true">
      <header v="Họ và tên" e="Employee Full Name"></header>
    </field>
    <field name="gioi_tinh" width="80" allowSorting="true" allowFilter="true">
      <header v="Giới tính" e="Gender"></header>
    </field>
    <field name="ten_bp" width="300" allowSorting="true" allowFilter="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="ten_vtr" width="150" allowSorting="true" allowFilter="true">
      <header v="Vị trí công việc" e="Position"></header>
    </field>
    <field name="ngay_vao" type="DateTime" dataFormatString="@datetimeFormat" width ="100" allowSorting="true" allowFilter="true">
      <header v="Ngày vào cty" e="Date in"></header>
    </field>
    <field name="loai_tn" width="150" allowSorting="true" allowFilter="true">
      <header v="Loại tai nạn" e="Accident Type"></header>
    </field>
    <field name="ngay_tn" type="DateTime" dataFormatString="@datetimeFormat" width ="100" allowSorting="true" allowFilter="true">
      <header v="Ngày" e="Accident Date"></header>
    </field>
    <field name="so_ngay_nghi" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Số ngày nghỉ" e="No. of Days off"></header>
    </field>
    <field name="muc_do" width="150" allowSorting="true" allowFilter="true">
      <header v="Mức độ" e="Degree"></header>
    </field>
    <field name="ten_ttnv" width="150" allowSorting="true" allowFilter="true">
      <header v="Tình trạng" e="Status"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma_nv"/>
      <field name="ten_nv"/>
      <field name="gioi_tinh"/>
      <field name="ten_bp"/>
      <field name="ten_vtr"/>
      <field name="ngay_vao"/>
      <field name="loai_tn"/>
      <field name="ngay_tn"/>
      <field name="so_ngay_nghi"/>
      <field name="muc_do"/>
      <field name="ten_ttnv"/>
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