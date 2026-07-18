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
  <title v="Tờ khai quyết toán thuế thu nhập doanh nghiệp" e="Corporation Income Tax Finalization"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="stt_in" width="60" allowSorting="true" allowFilter="true">
      <header v="Stt in" e="No."></header>
    </field>
    <field name="chi_tieu%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Chỉ tiêu" e="Article"></header>
    </field>
    <field name="ma_so" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã chỉ tiêu" e="Code"></header>
    </field>

    <field name="tien_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Số tiền nt" e="FC Amount"></header>
    </field>
    <field name="tien" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Số tiền" e="Amount"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_in"/>
      <field name="chi_tieu%l"/>
      <field name="ma_so"/>

      <field name="tien_nt"/>
      <field name="tien"/>
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