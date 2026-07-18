<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" valid="systotal = 1" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Bảng cân đối phát sinh theo các đối tượng quản trị" e="Management Object Balance"></title>
  <subTitle v="Loại đối tượng: %s0, tài khoản: %s1, từ ngày %d1 đến ngày %d2..." e="Object Type: %s0, Account: %s1, Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="stt" type="Int16" width="30" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_dtqt" width="100" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'query_cdpsdt', Controller: 'rptManagementObjectBalance', Name: '[ma_dtqt]', Value: '[ma_dtqt] + this._queryFilterString'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã đối tượng" e="Object Code"></header>
    </field>
    <field name="ten_dtqt%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên đối tượng" e="Object Name"></header>
    </field>

    <field name="no_dk_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum">
      <header v="Nợ đầu kỳ nt" e="FC Dr. Opening Bal."></header>
    </field>
    <field name="no_dk" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum">
      <header v="Nợ đầu kỳ" e="Dr. Opening Bal."></header>
    </field>
    <field name="co_dk_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum">
      <header v="Có đầu kỳ nt" e="FC Cr. Opening Bal."></header>
    </field>
    <field name="co_dk" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum">
      <header v="Có đầu kỳ" e="Cr. Opening Bal."></header>
    </field>
    <field name="ps_no_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum">
      <header v="Phát sinh nợ nt" e="FC Dr. Amount"></header>
    </field>
    <field name="ps_no" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum">
      <header v="Phát sinh nợ" e="Dr. Amount"></header>
    </field>
    <field name="ps_co_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum">
      <header v="Phát sinh có nt" e="FC Cr. Amount"></header>
    </field>
    <field name="ps_co" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum">
      <header v="Phát sinh có" e="Cr. Amount"></header>
    </field>
    <field name="no_ck_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum">
      <header v="Nợ cuối kỳ nt" e="FC Dr. Closing Bal."></header>
    </field>
    <field name="no_ck" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum">
      <header v="Nợ cuối kỳ" e="Dr. Closing Bal."></header>
    </field>
    <field name="co_ck_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum">
      <header v="Có cuối kỳ nt" e="FC Cr. Closing Bal."></header>
    </field>
    <field name="co_ck" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum">
      <header v="Có cuối kỳ" e="Cr. Closing Bal."></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma_dtqt"/>
      <field name="ten_dtqt%l"/>

      <field name="no_dk_nt"/>
      <field name="co_dk_nt"/>
      <field name="ps_no_nt"/>
      <field name="ps_co_nt"/>
      <field name="no_ck_nt"/>
      <field name="co_ck_nt"/>
      <field name="no_dk"/>
      <field name="co_dk"/>
      <field name="ps_no"/>
      <field name="ps_co"/>
      <field name="no_ck"/>
      <field name="co_ck"/>
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