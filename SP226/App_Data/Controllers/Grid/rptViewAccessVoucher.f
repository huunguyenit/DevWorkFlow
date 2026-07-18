<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report"  xmlns="urn:schemas-fast-com:data-grid">
  <title v="Xem các chứng từ phát sinh, sửa" e="View Added, Edited Vouchers"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>
  <fields>
     <field name="so_ct" width="80" type="String" allowSorting="true" align="right" allowFilter="true">
      <header v="Số ct" e="Voucher No."></header>
    </field>
    <field name="ngay_ct" width="80" type="DateTime" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày ct" e="Voucher Date"></header>
    </field>
    <field name="ngay" width="80" type="DateTime" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày nhập ct" e="Create Date"></header>
    </field>
    <field name="dien_giai" width="300" type="String" allowSorting="true" allowFilter="true">
      <header v="Diễn giải" e="Descriptions"></header>
    </field>
    <field name="userID" width="100" type="String" allowSorting="true" allowFilter="true">
      <header v="Mã người dùng" e="User ID"></header>
    </field>
    <field name="userName" width="300" type="String" allowSorting="true" allowFilter="true">
      <header v="Tên người dùng" e="User Name"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="so_ct"/>
      <field name="ngay_ct"/>
      <field name="ngay"/>
      <field name="dien_giai"/>
      <field name="userID"/>
      <field name="userName"/>
    </view>
  </views>
  
  <toolbar>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>