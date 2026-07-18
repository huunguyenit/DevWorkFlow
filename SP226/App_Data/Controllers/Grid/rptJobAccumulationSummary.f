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
  <title v="Tổng hợp số phát sinh lũy kế theo vụ việc" e="Job Accumulation Summary"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="tk" width="100" allowSorting="true" allowFilter="true">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="ma_vv" width="100" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'query_covvlk1', Controller: 'rptJobAccumulationSummary', Name: '[ma_vv]', Value: '[tk] + String.fromCharCode(253) + [ma_vv] + this._queryFilterString'}, Script: 'beforeDrillDown(this);'">
      <header v="Vụ việc" e="Job"></header>
    </field>
    <field name="ten_vv%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên vụ việc" e="Job Name"></header>
    </field>

    <field name="ps_nt00" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lk đến đầu năm nt" e="FC YB Accum. Amount"></header>
    </field>
    <field name="ps_nt1" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lk đến đầu kỳ nt" e="FC PB Accum. Amount"></header>
    </field>
    <field name="ps_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Ps trong kỳ nt" e="FC Amount"></header>
    </field>
    <field name="ps_nt20" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lk từ đầu năm nt" e="FC YTD Accum. Amount"></header>
    </field>
    <field name="ps_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lk đến cuối kỳ nt" e="FC PE Accum. Amount"></header>
    </field>

    <field name="ps00" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lk đến đầu năm" e="YB Accum. Amount"></header>
    </field>
    <field name="ps1" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lk đến đầu kỳ" e="PB Accum. Amount"></header>
    </field>
    <field name="ps" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Ps trong kỳ" e="Amount in Period"></header>
    </field>
    <field name="ps20" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lk từ đầu năm" e="YTD Accum. Amount"></header>
    </field>
    <field name="ps2" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lk đến cuối kỳ" e="PE Accum. Amount"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="tk"/>
      <field name="ma_vv"/>
      <field name="ten_vv%l"/>

      <field name="ps_nt00"/>
      <field name="ps_nt1"/>
      <field name="ps_nt"/>
      <field name="ps_nt20"/>
      <field name="ps_nt2"/>

      <field name="ps00"/>
      <field name="ps1"/>
      <field name="ps"/>
      <field name="ps20"/>
      <field name="ps2"/>
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