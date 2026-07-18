<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>
<grid type="Report" valid="systotal = 1 and ma_vv = ''" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Thực hiện đầu tư" e="Investment Implementation"></title>
  <subTitle v="%f1, từ ngày %d1 đến ngày %d2..." e="%f1, Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="chi_tieu" width="300" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'query_dtthdt', Controller: 'rptInvestmentImplementation', Name: '[ma_so_ct]', Value: '[sysorder] + String.fromCharCode(253) + [ma_so_ct] + String.fromCharCode(253) + [ma_vv] + this._queryFilterString'}, Script: 'beforeDrillDownWithCondition(this);'">
      <header v="Chỉ tiêu" e="Norm"></header>
    </field>
    <field name="chi_tieu2" width="300" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'query_dtthdt', Controller: 'rptInvestmentImplementation', Name: '[ma_so_ct]', Value: '[sysorder] + String.fromCharCode(253) + [ma_so_ct] + String.fromCharCode(253) + [ma_vv] + this._queryFilterString'}, Script: 'beforeDrillDownWithCondition(this);'">
      <header v="Chỉ tiêu" e="Norm"></header>
    </field>
    <field name="ma_so_ct" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_vv" width="0" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="kh_nam" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Kh năm" e="Year Planning"></header>
    </field>
    <field name="du_dau" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Th đầu kỳ" e="Opening"></header>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Trong kỳ" e="In Period"></header>
    </field>
    <field name="lk_dn" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lk đầu năm" e="YTD Amount"></header>
    </field>
    <field name="lk_kc" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lk khởi công" e="Accumulation"></header>
    </field>

    <field name="tien2" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Trong kỳ" e="In Period"></header>
    </field>
    <field name="lk_dn2" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lk đầu năm" e="YTD Amount"></header>
    </field>
    <field name="lk_kc2" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lk khởi công" e="Accumulation"></header>
    </field>
    <field name="du_cuoi" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Th cuối kỳ" e="Closing"></header>
    </field>

    <field name="kh_nam_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Kh năm nt" e="FC Year Planning"></header>
    </field>
    <field name="du_dau_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Th đầu kỳ nt" e="FC Opening"></header>
    </field>

    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Trong kỳ nt" e="FC Value In Period"></header>
    </field>
    <field name="lk_dn_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lk đầu năm nt" e="FC YTD Amount"></header>
    </field>
    <field name="lk_kc_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lk khởi công nt" e="FC Accumulation"></header>
    </field>

    <field name="tien_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Trong kỳ nt" e="FC Value In Period"></header>
    </field>
    <field name="lk_dn_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lk đầu năm nt" e="FC YTD Amount"></header>
    </field>
    <field name="lk_kc_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lk khởi công nt" e="FC Accumulation"></header>
    </field>
    <field name="du_cuoi_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Th cuối kỳ nt" e="FC Closing"></header>
    </field>

    <field name="sysorder" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="systotal" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="chi_tieu"/>
      <field name="chi_tieu2"/>
      <field name="ma_so_ct"/>
      <field name="ma_vv"/>

      <field name="kh_nam"/>
      <field name="du_dau"/>
      <field name="tien"/>
      <field name="lk_dn"/>
      <field name="lk_kc"/>

      <field name="tien2"/>
      <field name="lk_dn2"/>
      <field name="lk_kc2"/>
      <field name="du_cuoi"/>

      <field name="kh_nam_nt"/>
      <field name="du_dau_nt"/>
      <field name="tien_nt"/>
      <field name="lk_dn_nt"/>
      <field name="lk_kc_nt"/>

      <field name="tien_nt2"/>
      <field name="lk_dn_nt2"/>
      <field name="lk_kc_nt2"/>
      <field name="du_cuoi_nt"/>

      <field name="sysorder"/>
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJteSFht8yuUiTj8eqyrjtrQDocEOGlrP2GQLOc4F5b/MMtvaMdDaCpM4waN/OY+xFq1WxLPq5lnDOJTsrU7mE1v3Zl4Mopjwsh1jbm8jyq0qgrFOsmnHqfLzjtMr50XT+E0pI8BGL+xn3CR55UMTSRfb9d0MrTLhlccX4/+tdAUXK</Encrypted>]]>
    </text>
  </script>

  &XMLStandardReportToolbar;
</grid>