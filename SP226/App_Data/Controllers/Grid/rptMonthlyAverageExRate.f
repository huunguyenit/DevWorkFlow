<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid" valid="systotal = 1">
  <title v="Bảng tỷ giá ghi sổ trung bình tháng" e="Monthly - Average Exchange Rate Table"></title>
  <subTitle v="Tháng %m, năm %y..." e="Month %m, Year %y..."></subTitle>

  <fields>
    <field name="ma_nt" width="60" allowSorting="true" allowFilter="true">
      <header v="Mã nt" e="FC Code"></header>
    </field>
    <field name="tk" width="100" allowSorting="true" allowFilter="true">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="ten_tk%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên tài khoản" e="Account Name"></header>
    </field>
    <field name="ma_kh" width="100" allowSorting="true" allowFilter="true">
      <header v="Khách hàng" e="Customer ID"></header>
    </field>
    <field name="ten_kh%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên khách hàng" e="Customer Name"></header>
    </field>
    <field name="no_co" width="60" allowSorting="true" allowFilter="true">
      <header v="Nợ/có" e="Dr/Cr"></header>
    </field>
    <field name="ty_gia_gs" type="Decimal" width="120" dataFormatString="@exchangeRateViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tỷ giá ghi sổ" e="Exchange Rate"></header>
    </field>
  </fields>
  <views>
    <view id="Grid">
      <field name="ma_nt"/>
      <field name="tk"/>
      <field name="ten_tk%l"/>
      <field name="ma_kh"/>
      <field name="ten_kh%l"/>
      <field name="no_co"/>
      <field name="ty_gia_gs"/>
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