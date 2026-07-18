<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" database="Sys" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh sách thông báo" e="List of Notification"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>

  <fields>
    <field name="group_code" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhóm" e="Group Code"></header>
    </field>
    <field name="group_name" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên nhóm" e="Group Name"></header>
    </field>
    <field name="datetime0" type="DateTime" dataFormatString="dd/MM/yyyy HH:mm" width="120" allowFilter="true">
      <header v="Ngày phát sinh" e="Generated Date"></header>
    </field>
    <field name="datetime2" type="DateTime" dataFormatString="dd/MM/yyyy HH:mm" width="120" allowFilter="true">
      <header v="Ngày cập nhật" e="Updated Date"></header>
    </field>
    <field name="title" width="300" allowSorting="true" allowFilter="true">
      <header v="Tiêu đề" e="Title"></header>
    </field>
    <field name="subtitle" width="300" allowSorting="true" allowFilter="true">
      <header v="Tiêu đề phụ" e="Subtitle"></header>
    </field>
    <field name="user_name" width="100" allowSorting="true" allowFilter="true">
      <header v="Người nhận" e="Recipient"></header>
    </field>
    <field name="view_detail" width="100">
      <header v="Xem chi tiết" e="View Detail"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJfliV+mbvfhnNQh/lLRGnFOPfRNoM8eev6hgR7D4L/PJk/qRI9b1rH2Ea21pr+DVGw==</Encrypted>]]></clientScript>
    </field>
    <field name="content" width="0" hidden="true">
      <header v="Nội dung" e="Content"></header>
    </field>
    <field name="sent_status" width="100" allowSorting="true" allowFilter="true">
      <header v="Trạng thái" e="Status"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="group_code"/>
      <field name="group_name"/>
      <field name="datetime0"/>
      <field name="datetime2"/>
      <field name="title"/>
      <field name="subtitle"/>
      <field name="user_name"/>
      <field name="view_detail"/>
      <field name="content"/>
      <field name="sent_status"/>
    </view>
  </views>

  <commands>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtaFbMm+T39HT1YFSZ263ybuywlVK9pPBf5aazxieyXdiGh9YBPIfDgcbmQISsEVrbjxsSPC+y035XqnQpPGKAlcb/0JHU7FxJovFUS15jq4bDsNIL8FAw8xcB2MjZMtbkeSaEgcc6UYQMMlNiOprr+Svx0Z5ZtJBx88vlHiy4SrYN+bCzdnrdoh3bLVninsME05MAIu77JgH5gL/UKdCcWVFjZDNYQKcmayUXZG8ZiT46HYav7G6Lymfh3u4UYuFgdR6UDwOCPvRK9R+kgNMq37zao0kpMmKVbIuUlVbd/Lc</Encrypted>]]>
    </text>
  </script>

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