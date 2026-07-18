<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo lưu chuyển tiền tệ tổng hợp theo phương pháp trực tiếp" e="Cash Flow Statement Summary under the Direct Method"></title>
  <subTitle v="%f1, từ ngày %d1 đến ngày %d2..." e="%f1, Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ma_so" width="100"  allowSorting="true" allowFilter="true">
      <header v="Mã số" e="Number"></header>
    </field>
    <field name="chi_tieu%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Chỉ tiêu" e="Norm"></header>
    </field>
    <field name="ma_so_in" width="100"  allowSorting="true" allowFilter="true">
      <header v="Mã số in" e="Print Number"></header>
    </field>
    <field name="thuyet_minh" width="100" allowSorting="true" allowFilter="true">
      <header v="Thuyết minh" e="Interpretation"></header>
    </field>

    <field name="ky_naynt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Năm nay nt" e="FC Current Year"></header>
    </field>
    <field name="ky_truocnt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Năm trước nt" e="FC Previous Year"></header>
    </field>

    <field name="ky_nay" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Năm nay" e="Current Year"></header>
    </field>
    <field name="ky_truoc" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Năm trước" e="Previous Year"></header>
    </field>

    <field name="lk_kn" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lũy kế năm nay" e="Accumulation Current Year"></header>
    </field>
    <field name="lk_kt" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lũy kế năm trước" e="Accumulation Previous Year"></header>
    </field>

    <field name="lk_kn_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lũy kế năm nay nt" e="FC Accumulation Current Year"></header>
    </field>
    <field name="lk_kt_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lũy kế năm trước nt" e="FC Accumulation Previous Year"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_so"/>
      <field name="chi_tieu%l"/>
      <field name="ma_so_in"/>
      <field name="thuyet_minh"/>

      <field name="ky_naynt"/>
      <field name="ky_truocnt"/>

      <field name="lk_kn_nt"/>
      <field name="lk_kt_nt"/>

      <field name="ky_nay"/>
      <field name="ky_truoc"/>

      <field name="lk_kn"/>
      <field name="lk_kt"/>
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