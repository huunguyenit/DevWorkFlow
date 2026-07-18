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
  <title v="Báo cáo lợi nhuận theo khách hàng" e="Profitability by Customer"></title>
  <subTitle v="Từ ngày %d1 đến %d2..." e="Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="stt" width="30" type="Int16" dataFormatString="# ###" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_kh" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã khách hàng" e="Customer ID"></header>
    </field>
    <field name="ten_kh%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên khách hàng" e="Customer Name"></header>
    </field>

    <field name="sl_ban" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Sl bán" e="Sales Qty."></header>
    </field>
    <field name="sl_tl" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Sl trả lại" e="Returned Qty."></header>
    </field>

    <field name="tien_nt0" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Doanh thu bán nt" e="FC Turnover"></header>
    </field>
    <field name="tien_nt1" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Doanh thu trả lại nt" e="FC Returned"></header>
    </field>
    <field name="ck_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Chiết khấu nt" e="FC Discount"></header>
    </field>
    <field name="ck_tl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Chiết khấu trả lại nt" e="Return Discount Amount"></header>
    </field>
    <field name="tien_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Giảm giá nt" e="FC Devaluation"></header>
    </field>
    <field name="tien_nt3" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tiền vốn nt" e="FC Cogs Amount"></header>
    </field>
    <field name="tien_nt4" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tiền vốn trả lại nt" e="FC Returned Cogs"></header>
    </field>
    <field name="t_tien_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lãi gộp nt" e="FC Gross Profit"></header>
    </field>
    <field name="ty_le12" type="Decimal" dataFormatString="##.#0" width="100" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="% Lãi/Dt nt" e="% FC GP/Turnover"></header>
    </field>
    <field name="ty_le22" type="Decimal" dataFormatString="##.#0" width="100" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="% Lãi/Tv nt" e="% FC GP/Cogs"></header>
    </field>

    <field name="tien0" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Doanh thu bán" e="Turnover"></header>
    </field>
    <field name="tien1" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Doanh thu trả lại" e="Returned Turnover"></header>
    </field>
    <field name="ck" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Chiết khấu" e="Discount"></header>
    </field>
    <field name="ck_tl" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Chiết khấu trả lại" e="Return Discount Amount"></header>
    </field>
    <field name="tien2" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Giảm giá" e="Devaluation"></header>
    </field>
    <field name="tien3" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tiền vốn" e="Cogs Amount"></header>
    </field>
    <field name="tien4" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tiền vốn trả lại" e="Returned Cogs"></header>
    </field>
    <field name="t_tien2" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lãi gộp" e="Gross Profit"></header>
    </field>

    <field name="ty_le1" type="Decimal" dataFormatString="##.#0" width="100" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="% Lãi/Dt" e="% GP/Turnover"></header>
    </field>
    <field name="ty_le2" type="Decimal" dataFormatString="##.#0" width="100" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="% Lãi/Tv" e="% GP/Amount"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma_kh"/>
      <field name="ten_kh%l"/>

      <field name="sl_ban"/>
      <field name="sl_tl"/>

      <field name="tien_nt0"/>
      <field name="tien_nt1"/>
      <field name="ck_nt"/>
      <field name="ck_tl_nt"/>
      <field name="tien_nt2"/>
      <field name="tien_nt3"/>
      <field name="tien_nt4"/>
      <field name="t_tien_nt2"/>
      <field name="ty_le12"/>
      <field name="ty_le22"/>

      <field name="tien0"/>
      <field name="tien1"/>
      <field name="ck"/>
      <field name="ck_tl"/>
      <field name="tien2"/>
      <field name="tien3"/>
      <field name="tien4"/>
      <field name="t_tien2"/>

      <field name="ty_le1"/>
      <field name="ty_le2"/>
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