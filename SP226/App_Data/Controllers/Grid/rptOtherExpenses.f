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
  <title v="Chi phí khác" e="Other Expenses"></title>
  <subTitle v="%f1, từ ngày %d1 đến ngày %d2..." e="%f1, Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="chi_tieu" width="300" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'query_dtcpkhac', Controller: 'rptOtherExpenses', Name: '[ma_so_ct]', Value: '[ma_so_ct] + String.fromCharCode(253)+ [ma_vv] + this._queryFilterString'}, Script: 'beforeDrillDownWithCondition(this);'">
      <header v="Chỉ tiêu" e="Norm"></header>
    </field>
    <field name="chi_tieu2" width="300" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'query_dtcpkhac', Controller: 'rptOtherExpenses', Name: '[ma_so_ct]', Value: '[ma_so_ct] + String.fromCharCode(253)+ [ma_vv] + this._queryFilterString'}, Script: 'beforeDrillDownWithCondition(this);'">
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
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Trong kỳ" e="In Period"></header>
    </field>
    <field name="lk_dn" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lk đầu năm" e="YTD Amount"></header>
    </field>
    <field name="lk_kc" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lk khởi công" e="Accumulation"></header>
    </field>

    <field name="kh_nam_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Kh năm nt" e="FC Year Planning"></header>
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
      <field name="tien"/>
      <field name="lk_dn"/>
      <field name="lk_kc"/>

      <field name="kh_nam_nt"/>
      <field name="tien_nt"/>
      <field name="lk_dn_nt"/>
      <field name="lk_kc_nt"/>

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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJteSFht8yuUiTj8eqyrjtrQDocEOGlrP2GQLOc4F5b/MMtvaMdDaCpM4waN/OY+xFqy+iimRuKUE5TwSNuj/SD+P701hCx1kuLgtQKYTCzzAE/4pmBaYpEJYy9g3pTnHKoSROJ4xWR/keEk36DscHOtOg0AIJdSTrCIyrOgwIN3d5</Encrypted>]]>
    </text>
  </script>

  &XMLStandardReportToolbar;
</grid>