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
  <title v="Quyết toán đầu tư theo dự án, công trình, hạng mục công trình" e="Investment Liquidation by Project, Work and Work Detail"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ma_vv" width="100" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'query_dtqtdtvv', Controller: 'rptInvestmentLiquidationbyProject', Name: '[ma_vv]', Value: '[ma_vv] + this._queryFilterString'}, Script: 'beforeDrillDown(this);'">
      <header v="Vụ việc" e="Job Code"></header>
    </field>
    <field name="ten_vv%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên vụ việc" e="Job Name"></header>
    </field>

    <field name="du_toan" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Dự toán" e="Plan"></header>
    </field>
    <field name="ps_xl" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Ps xây lắp" e="Construct"></header>
    </field>
    <field name="ps_tb" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Ps thiết bị" e="Machine"></header>
    </field>
    <field name="ps_cp_bt" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Ps bồi thường" e="Compensation"></header>
    </field>
    <field name="ps_cp_ql" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Ps quản lý dự án" e="PMU"></header>
    </field>
    <field name="ps_cp_tv" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Ps tư vấn" e="Consultant"></header>
    </field>
    <field name="ps_khac" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Ps khác" e="Other"></header>
    </field>
    <field name="ps_cong" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Ps cộng" e="Total"></header>
    </field>
    <field name="lk_xl" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lk xây lắp" e="Construct Accu."></header>
    </field>
    <field name="lk_tb" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lk thiết bị" e="Machine Accu."></header>
    </field>
    <field name="lk_cp_bt" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lk bồi thường" e="Compensation Accu."></header>
    </field>
    <field name="lk_cp_ql" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lk quản lý dự án" e="PMU Accu."></header>
    </field>
    <field name="lk_cp_tv" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lk tư vấn" e="Consultant Accu."></header>
    </field>
    <field name="lk_khac" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lk khác" e="Other Accu."></header>
    </field>
    <field name="lk_cong" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lk cộng" e="Total Accu."></header>
    </field>
    <field name="kc_xl" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Kc xây lắp" e="Construct Closing"></header>
    </field>
    <field name="kc_tb" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Kc thiết bị" e="Machine Closing"></header>
    </field>
    <field name="kc_cp_bt" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Kc bồi thường" e="Compensation Closing"></header>
    </field>
    <field name="kc_cp_ql" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Kc quản lý dự án" e="PMU Closing"></header>
    </field>
    <field name="kc_cp_tv" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Kc tư vấn" e="Consultant Closing"></header>
    </field>
    <field name="kc_khac" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Kc khác" e="Other Closing"></header>
    </field>
    <field name="kc_cong" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Kc cộng" e="Total Closing"></header>
    </field>

    <field name="du_toan_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Dự toán" e="Plan"></header>
    </field>
    <field name="ps_xl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Ps xây lắp" e="Construct"></header>
    </field>
    <field name="ps_tb_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Ps thiết bị" e="Machine"></header>
    </field>
    <field name="ps_cp_bt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Ps bồi thường" e="Compensation"></header>
    </field>
    <field name="ps_cp_ql_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Ps quản lý dự án" e="PMU"></header>
    </field>
    <field name="ps_cp_tv_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Ps tư vấn" e="Consultant"></header>
    </field>
    <field name="ps_khac_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Ps khác" e="Other"></header>
    </field>
    <field name="ps_cong_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Ps cộng" e="Total"></header>
    </field>
    <field name="lk_xl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lk xây lắp" e="Construct Accu."></header>
    </field>
    <field name="lk_tb_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lk thiết bị" e="Machine Accu."></header>
    </field>
    <field name="lk_cp_bt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lk bồi thường" e="Compensation Accu."></header>
    </field>
    <field name="lk_cp_ql_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lk quản lý dự án" e="PMU Accu."></header>
    </field>
    <field name="lk_cp_tv_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lk tư vấn" e="Consultant Accu."></header>
    </field>
    <field name="lk_khac_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lk khác" e="Other Accu."></header>
    </field>
    <field name="lk_cong_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Lk cộng" e="Total Accu."></header>
    </field>
    <field name="kc_xl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Kc xây lắp" e="Construct Closing"></header>
    </field>
    <field name="kc_tb_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Kc thiết bị" e="Machine Closing"></header>
    </field>
    <field name="kc_cp_bt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Kc bồi thường" e="Compensation Closing"></header>
    </field>
    <field name="kc_cp_ql_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Kc quản lý dự án" e="PMU Closing"></header>
    </field>
    <field name="kc_cp_tv_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Kc tư vấn" e="Consultant Closing"></header>
    </field>
    <field name="kc_khac_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Kc khác" e="Other Closing"></header>
    </field>
    <field name="kc_cong_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Kc cộng" e="Total Closing"></header>
    </field>

    <field name="systotal" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_vv"/>
      <field name="ten_vv%l"/>
      <field name="du_toan"/>
      <field name="ps_xl"/>
      <field name="ps_tb"/>
      <field name="ps_cp_bt"/>
      <field name="ps_cp_ql"/>
      <field name="ps_cp_tv"/>
      <field name="ps_khac"/>
      <field name="ps_cong"/>
      <field name="lk_xl"/>
      <field name="lk_tb"/>
      <field name="lk_cp_bt"/>
      <field name="lk_cp_ql"/>
      <field name="lk_cp_tv"/>
      <field name="lk_khac"/>
      <field name="lk_cong"/>
      <field name="kc_xl"/>
      <field name="kc_tb"/>
      <field name="kc_cp_bt"/>
      <field name="kc_cp_ql"/>
      <field name="kc_cp_tv"/>
      <field name="kc_khac"/>
      <field name="kc_cong"/>
      <field name="du_toan_nt"/>
      <field name="ps_xl_nt"/>
      <field name="ps_tb_nt"/>
      <field name="ps_cp_bt_nt"/>
      <field name="ps_cp_ql_nt"/>
      <field name="ps_cp_tv_nt"/>
      <field name="ps_khac_nt"/>
      <field name="ps_cong_nt"/>
      <field name="lk_xl_nt"/>
      <field name="lk_tb_nt"/>
      <field name="lk_cp_bt_nt"/>
      <field name="lk_cp_ql_nt"/>
      <field name="lk_cp_tv_nt"/>
      <field name="lk_khac_nt"/>
      <field name="lk_cong_nt"/>
      <field name="kc_xl_nt"/>
      <field name="kc_tb_nt"/>
      <field name="kc_cp_bt_nt"/>
      <field name="kc_cp_ql_nt"/>
      <field name="kc_cp_tv_nt"/>
      <field name="kc_khac_nt"/>
      <field name="kc_cong_nt"/>
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
    </text>
  </script>

  &XMLStandardReportToolbar;
</grid>