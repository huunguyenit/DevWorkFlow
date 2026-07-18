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
  <title v="Báo cáo doanh thu, chi phí" e="Sales, Expenses Report"></title>
  <subTitle v="Từ tháng %t1 đến tháng %t2 năm %y..." e="Month from %t1 to %t2 Year %y..."></subTitle>
  <pivot rowField="ma_so" columnField="thang" dataFields="tien, tien_nt, tl" indexTable="2" indexColumn="1" indexHeader="2" indexView="2"/>
  <fields>
    <field name="stt_in" width ="50" allowSorting="true" allowFilter="true">
      <header v="Stt" e="Number" />
    </field>
    <field name="chi_tieu" width="300" allowSorting="true" allowFilter="true">
      <header v="Chỉ tiêu" e="Article"></header>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowFilter="&GridReportAllowFilter.Number;">
      <header v="" e=""></header>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowFilter="&GridReportAllowFilter.Number;">
      <header v="" e=""></header>
    </field>
    <field name="tl" type="Decimal" dataFormatString="###.00" width="100" allowFilter="&GridReportAllowFilter.Number;">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_in"/>
      <field name="chi_tieu"/>
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