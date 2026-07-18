<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report"  xmlns="urn:schemas-fast-com:data-grid">
  <title v="Kiểm tra kết chuyển chứng từ" e="Voucher Posting Checking"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ma_ct" width="60" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã ct" e="VC. Code"></header>
    </field>
    <field name="ten_ct" width="150" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tên chứng từ" e="Voucher Name"></header>
    </field>
    <field name="so_ct" width="80" type="String" allowSorting="true" align="right" allowFilter="true">
      <header v="Số ct" e="Voucher No."></header>
    </field>
    <field name="ngay_ct" width="80" type="DateTime" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày ct" e="Voucher Date"></header>
    </field>
    <field name="dien_giai" width="300" type="String" allowSorting="true" allowFilter="true">
      <header v="Diễn giải" e="Descriptions"></header>
    </field>
    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_ct"/>
      <field name="ten_ct"/>
      <field name="so_ct"/>
      <field name="ngay_ct"/>
      <field name="dien_giai"/>
      <field name="stt_rec"/>
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