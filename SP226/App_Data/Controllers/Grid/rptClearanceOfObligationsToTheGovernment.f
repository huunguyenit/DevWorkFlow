<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo tình hình thực hiện nghĩa vụ với nhà nước" e="Clearance of Obligations to The Government"></title>
  <subTitle v="%f1, từ ngày %d1 đến ngày %d2..." e="%f1, Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="chi_tieu%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Chỉ tiêu" e="Norm"></header>
    </field>
    <field name="ma_so" width="100"  allowSorting="true" allowFilter="true">
      <header v="Mã số" e="Number"></header>
    </field>

    <field name="du_dau_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số phải nộp đầu kỳ nt" e="FC Out-Standing Previous Period"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ps_co_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số phải nộp trong kỳ nt" e="FC Arising Payable Amount"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ps_no_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số đã nộp trong kỳ nt" e ="FC Arising Paid Amount"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ps_co_nt0" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số phải nộp lũy kế nt" e ="FC Accumulate Payable Amount"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ps_no_nt0" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số đã nộp lũy kế nt" e ="FC Accumulate Paid Amount"></header>
      <items style="Numeric"></items>
    </field>
    <field name="du_cuoi_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số phải nộp cuối kỳ nt" e ="FC Closing Payable Amount"></header>
      <items style="Numeric"></items>
    </field>

    <field name="du_dau" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số phải nộp đầu kỳ" e="Out-Standing Previous Period"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ps_co" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số phải nộp trong kỳ" e="Arising Payable Amount"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ps_no" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số đã nộp trong kỳ" e="Arising Paid Amount"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ps_co0" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số phải nộp lũy kế" e="Accumulate Payable Amount"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ps_no0" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số đã nộp lũy kế" e="Accumulate Paid Amount"></header>
      <items style="Numeric"></items>
    </field>
    <field name="du_cuoi" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số phải nộp cuối kỳ" e="Closing Payable Amount"></header>
      <items style="Numeric"></items>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="chi_tieu%l"/>
      <field name="ma_so"/>

      <field name="du_dau_nt"/>
      <field name="ps_co_nt"/>
      <field name="ps_no_nt"/>
      <field name="ps_co_nt0"/>
      <field name="ps_no_nt0"/>
      <field name="du_cuoi_nt"/>

      <field name="du_dau"/>
      <field name="ps_co"/>
      <field name="ps_no"/>
      <field name="ps_co0"/>
      <field name="ps_no0"/>
      <field name="du_cuoi"/>
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