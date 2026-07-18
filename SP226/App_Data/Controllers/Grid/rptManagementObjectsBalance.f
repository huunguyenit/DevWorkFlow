<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" valid="systotal = 1" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Bảng tổng hợp số dư đối tượng quản trị" e="Management Object Balance Summary"></title>
  <subTitle v="Loại đối tượng: %s0, tài khoản: %s1, ngày %d..." e="Object Type: %s0, Account: %s1, Date %d..."></subTitle>
  <fields>
    <field name="stt" type="Int16" width="30" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_dtqt" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã đối tượng" e="Object Code"></header>
    </field>
    <field name="ten_dtqt%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên đối tượng" e="Object Name"></header>
    </field>

    <field name="du_no_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="Dư nợ nt" e="FC Debit Balance"></header>
    </field>
    <field name="du_co_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="Dư có nt" e="FC Credit Balance"></header>
    </field>
    <field name="du_no" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="Dư nợ" e="Debit Balance"></header>
    </field>
    <field name="du_co" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="Dư có" e="Credit Balance"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma_dtqt"/>
      <field name="ten_dtqt%l"/>

      <field name="du_no_nt"/>
      <field name="du_co_nt"/>
      <field name="du_no"/>
      <field name="du_co"/>
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