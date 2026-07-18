<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Repetition SYSTEM "..\Include\Repetition.ent">
  %Repetition;
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" valid="systotal = 0" filter="&Repetition.Key.012;" repetition="&Repetition.Key.013;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Chi tiết nguồn vốn đầu tư" e="Detail of Investment Source"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ma_vv" width="100" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'query_dtctnvdt', Controller: 'rptDetailOfInvestmentSource', Name: '[ma_vv]', Value: '[ma_vv] + this._queryFilterString'}, Script: ''">
      <header v="Vụ việc" e="Job"></header>
    </field>
    <field name="ten_vv%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên công trình" e="Project Name"></header>
    </field>

    <field name="du_dau_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Dư đầu nt" e="FC Openning Bal."></header>
    </field>
    <field name="tien_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Phát sinh tăng nt" e="FC Increase"></header>
    </field>
    <field name="lk_dn_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lk đầu năm nt" e="FC YTD Amount"></header>
    </field>
    <field name="lk_kc_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lk khởi công nt" e="FC Accumulation"></header>
    </field>

    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Phát sinh giảm nt" e="FC Decrease"></header>
    </field>
    <field name="lk_dn_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lk đầu năm nt" e="FC YTD Amount"></header>
    </field>
    <field name="lk_kc_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lk khởi công nt" e="FC Accumulation"></header>
    </field>
    <field name="du_cuoi_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Dư cuối nt" e="FC Closing Bal."></header>
    </field>

    <field name="du_dau" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Dư đầu" e="Openning Bal."></header>
    </field>
    <field name="tien2" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Phát sinh tăng" e="Increase"></header>
    </field>
    <field name="lk_dn2" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lk đầu năm" e="YTD Amount"></header>
    </field>
    <field name="lk_kc2" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lk khởi công" e="Accumulation"></header>
    </field>

    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Phát sinh giảm" e="Decrease"></header>
    </field>
    <field name="lk_dn" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lk đầu năm" e="YTD Amount"></header>
    </field>
    <field name="lk_kc" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lk khởi công" e="Accumulation"></header>
    </field>
    <field name="du_cuoi" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Dư cuối" e="Closing Bal."></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_vv"/>
      <field name="ten_vv%l"/>

      <field name="du_dau_nt"/>
      <field name="tien_nt2"/>
      <field name="lk_dn_nt2"/>
      <field name="lk_kc_nt2"/>

      <field name="tien_nt"/>
      <field name="lk_dn_nt"/>
      <field name="lk_kc_nt"/>
      <field name="du_cuoi_nt"/>

      <field name="du_dau"/>
      <field name="tien2"/>
      <field name="lk_dn2"/>
      <field name="lk_kc2"/>

      <field name="tien"/>
      <field name="lk_dn"/>
      <field name="lk_kc"/>
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

  &XMLStandardReportToolbar;
</grid>