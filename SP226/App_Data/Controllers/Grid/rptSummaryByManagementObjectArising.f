<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" valid="systotal = 1" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Tổng hợp phát sinh theo các đối tượng quản trị" e="Summary by Management Object Report"></title>
  <subTitle v="Loại đối tượng: %s0, %s1, từ ngày %d1 đến ngày %d2..." e="Object Type: %s0, %s1, date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ma_dtqt" width="100" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'query_gldtth', Controller: 'rptSummaryByManagementObjectArising', Name: '[ma_dtqt]', Value: '[ma_dtqt] + this._queryFilterString'}, Script: 'beforeDrillDown(this);'">
      <header v="Đối tượng" e="Object Code"></header>
    </field>
    <field name="ten_dtqt" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên đối tượng" e="Object Name"></header>
    </field>

    <field name="ps_no_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="Phát sinh nợ nt" e="FC Debit Arising"></header>
    </field>
    <field name="ps_co_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="Phát sinh có nt" e="FC Credit Arising"></header>
    </field>

    <field name="ps_no" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="Phát sinh nợ" e="Debit Arising"></header>
    </field>
    <field name="ps_co" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="Phát sinh có" e="Credit Arising"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_dtqt"/>
      <field name="ten_dtqt"/>
      <field name="ps_no_nt"/>
      <field name="ps_co_nt"/>
      <field name="ps_no"/>
      <field name="ps_co"/>
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