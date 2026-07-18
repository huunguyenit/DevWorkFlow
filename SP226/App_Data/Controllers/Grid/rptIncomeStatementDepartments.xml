<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY Identification "rptIncomeStatementDepartments">

  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY CSSGraphReport SYSTEM "..\Include\Javascript\GraphReportCss.txt">
  <!ENTITY JavascriptGraphReportInit SYSTEM "..\Include\Javascript\GraphReportInit.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo kết quả sản xuất kinh doanh theo nhiều bộ phận" e="Income Statement by Departments"></title>
  <subTitle v="%f, từ ngày %d1 đến %d2..." e="%f, Date from %d1 to %d2..."></subTitle>
  <pivot rowField="xRow" columnField="xColumn" dataFields="ky_nay, ky_nay_nt" indexTable="2" indexColumn="1" indexHeader="2" indexView="2"/>
  <fields>
    <field name="chi_tieu" width="300" allowSorting="true" allowFilter="true">
      <header v="Chỉ tiêu" e="Norm"></header>
    </field>
    <field name="ma_so" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã số" e="Number"></header>
    </field>
    <field name="ky_nay_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Giá trị nt" e="FC Amount"></header>
    </field>
    <field name="ky_nay" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Giá trị" e="Amount"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="chi_tieu"/>
      <field name="ma_so"/>
    </view>
  </views>

  <commands>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      &JavascriptGraphReportInit;
    </text>
  </script>

  &CSSGraphReport;

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
    <button command="Graph">
      <title v="Đồ thị$" e="Graph$"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>