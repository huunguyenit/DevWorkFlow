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
  <title v="Phân tích bán hàng theo khách hàng" e="Sales Analysis by Customer"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="stt" type="Int16" dataFormatString="# ###" width="30" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_kh" width="100" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'query_sobcbhkh', Controller: 'rptSalesAnalysisByCustomer', Name: '[ma_kh]', Value: '[ma_kh] + this._queryFilterString'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã khách" e="Customer ID"></header>
    </field>
    <field name="ten_kh%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên khách" e="Customer Name"></header>
    </field>

    <field name="tien_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Doanh số nt" e="FC Turn."></header>
    </field>
    <field name="tien_cd_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Ds cộng dồn nt" e="FC Accum. Turn."></header>
    </field>
    <field name="ty_le_nt" type="Decimal" dataFormatString="##.#0" width="100" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="% Doanh số" e="% Turn."></header>
    </field>
    <field name="ty_le_nt_cd" type="Decimal" dataFormatString="##.#0" width="100" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="% Cộng dồn" e="% Accum. Turn."></header>
    </field>
    <field name="tien2" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Doanh số" e="Turnover"></header>
    </field>
    <field name="tien_cd" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Ds cộng dồn" e="Accum. Turnover"></header>
    </field>
    <field name="ty_le" type="Decimal" dataFormatString="##.#0" width="100" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="% Doanh số" e="% Turnover"></header>
    </field>
    <field name="ty_le_cd" type="Decimal" dataFormatString="##.#0" width="100" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="% Cộng dồn" e="% Accum. Turn."></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma_kh"/>
      <field name="ten_kh%l"/>

      <field name="tien_nt2"/>
      <field name="tien_cd_nt"/>
      <field name="ty_le_nt"/>
      <field name="ty_le_nt_cd"/>
      <field name="tien2"/>
      <field name="tien_cd"/>
      <field name="ty_le"/>
      <field name="ty_le_cd"/>
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