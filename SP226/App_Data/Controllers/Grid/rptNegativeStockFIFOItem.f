<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % ReferenceNumber SYSTEM "..\Include\ReferenceNumber.ent">
  %ReferenceNumber;

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo vật tư NTXT xuất âm kho" e="Negative Stock FIFO Item"></title>
  <subTitle v="%s..." e="%s..."></subTitle>
  <fields>
    <field name="ma_ct0" width="80" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}" allowFilter="true" allowSorting="true">
      <header v="Mã ct" e="VC Code"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="100" readOnly="true" allowFilter="true" allowSorting="true">
      <header v="Ngày ct" e="Date"></header>
    </field>
    <field name="so_ct" width="100" align="right" allowFilter="true" allowSorting="true">
      <header v="Số ct" e="Number"></header>
    </field>

    &ReferenceNumberFields;

    <field name="ma_vt" width="100" allowFilter="true" allowSorting="true">
      <header v="Mã vật tư" e="Item"></header>
    </field>
    <field name="ten_vt" width="300" external="true" allowFilter="true" allowSorting="true">
      <header v="Tên vật tư" e="Item Name"></header>
    </field>
    <field name="ma_kho" width="100" readOnly="true" allowFilter="true" allowSorting="true">
      <header v="Mã kho" e="Site"></header>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityViewFormat" width="120" clientDefault="0" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Số lương" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="dvt" width="100" readOnly="true" allowFilter="true" allowSorting="true">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="ma_ct" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_ct0"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>

      &ReferenceNumberViews;

      <field name="ma_vt"/>
      <field name="ten_vt"/>
      <field name="ma_kho"/>
      <field name="so_luong"/>
      <field name="dvt"/>
      <field name="stt_rec"/>
      <field name="ma_ct"/>
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