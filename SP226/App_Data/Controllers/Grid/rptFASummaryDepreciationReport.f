<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" valid="systotal = 1" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Bảng tổng hợp trích khấu hao TSCĐ" e="Fixed Asset Depreciation Summary Report"/>
  <subTitle v="Từ kỳ %p1 năm %y1 đến kỳ %p2 năm %y2..." e="From Period %p1 Year %y1 to Period %p2 Year %y2..."></subTitle>
  <pivot rowField="xpivot" columnField="ma_nv" dataFields="gia_tri, gia_tri_nt" indexTable="2" indexColumn="1" indexHeader="2" indexView="3"/>
  <fields>
    <field name="stt" type="Int16" width="30" allowSorting="true" allowFilter="true" align="right">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ten_loai" width="300" allowSorting="true" allowFilter="true">
      <header v="Loại tài sản" e="Asset Type"></header>
    </field>
    <field name="gia_tri" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;">
      <header v="" e=""></header>
    </field>
    <field name="gia_tri_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;">
      <header v="" e=""></header>
    </field>
    <field name="systotal" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ten_loai"/>
      <field name="systotal"/>
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
    <button command="Print">
      <title v="Toolbar.Print" e="Toolbar.Print"></title>
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