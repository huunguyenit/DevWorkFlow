<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
  <!ENTITY % Repetition SYSTEM "..\Include\Repetition.ent">
  %Repetition;
]>

<grid type="Report" filter="&Repetition.Key.003;" valid="systotal = 1" repetition="&Repetition.Key.004;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo số dư vụ việc" e="Project/Job Balance Summary"></title>
  <subTitle v="Tài khoản: %s, ngày: %d..." e="Account: %s, Date: %d..."></subTitle>

  <fields>
    <field name="stt" type="Int16" dataFormatString="### ### ###" width="30" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_vv" width="100" allowSorting="true" allowFilter="true">
      <header v="Vụ việc" e="Job"></header>
    </field>
    <field name="ten_vv%l" type="String" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên vụ việc" e="Job Name"></header>
    </field>

    <field name="du_no_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Dư nợ nt" e="FC Debit Balance"></header>
    </field>
    <field name="du_co_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Dư có nt" e="FC Credit Balance"></header>
    </field>
    <field name="du_no" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Dư nợ" e="Debit Balance"></header>
    </field>
    <field name="du_co" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Dư có" e="Credit Balance"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma_vv"/>
      <field name="ten_vv%l"/>

      <field name="du_no_nt"/>
      <field name="du_co_nt"/>
      <field name="du_no"/>
      <field name="du_co"/>
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

  &XMLStandardReportToolbar;
</grid>