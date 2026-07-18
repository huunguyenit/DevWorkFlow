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
  <title v="Báo cáo tổng hợp chi phí trong kỳ theo đơn vị cơ sở" e="Expenses Arising Summary by Unit Report"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="stt" type="Int16" width="30" dataFormatString="# ###" allowSorting="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="tk" width="100" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'query_glbccp1kydvcs', Controller: 'rptExpensesArisingSummaryByUnit', Name: '[ma]', Value: '$func.trim([tk]) + String.fromCharCode(253) + $func.trim([ma_phi]) + String.fromCharCode(253) + $func.trim([ma_dvcs]) + this._queryFilterString'}, Script: 'beforeDrillDown(this);'">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="ma_phi" width="100" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'query_glbccp1kydvcs', Controller: 'rptExpensesArisingSummaryByUnit', Name: '[ma]', Value: '$func.trim([tk]) + String.fromCharCode(253) + $func.trim([ma_phi]) + String.fromCharCode(253) + $func.trim([ma_dvcs]) + this._queryFilterString'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã phí" e="Expense"></header>
    </field>
    <field name="ma_dvcs" width="100" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'query_glbccp1kydvcs', Controller: 'rptExpensesArisingSummaryByUnit', Name: '[ma]', Value: '$func.trim([tk]) + String.fromCharCode(253) + $func.trim([ma_phi]) + String.fromCharCode(253) + $func.trim([ma_dvcs]) + this._queryFilterString'}, Script: 'beforeDrillDown(this);'">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ten_key%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="ps_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Phát sinh nt" e="FC Arising"></header>
    </field>
    <field name="ps" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Phát sinh" e="Arising"></header>
    </field>
    <field name="lk_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Lũy kế nt" e="FC Accumulation"></header>
    </field>
    <field name="lk" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Lũy kế" e="Accumulation"></header>
    </field>
    <field name="systotal" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="tk"/>
      <field name="ma_phi"/>
      <field name="ma_dvcs"/>
      <field name="ten_key%l"/>
      <field name="ps_nt"/>
      <field name="ps"/>
      <field name="lk_nt"/>
      <field name="lk"/>
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