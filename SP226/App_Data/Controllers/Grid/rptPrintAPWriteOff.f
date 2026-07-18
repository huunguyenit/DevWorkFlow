<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;

  <!ENTITY % Repetition SYSTEM "..\Include\Repetition.ent">
  %Repetition;
]>

<grid type="Report" filter="&Repetition.Key.001;" repetition="&Repetition.Key.002;" valid="systotal = 1" xmlns="urn:schemas-fast-com:data-grid">
  <title v="In bút toán tất toán số dư cho các hóa đơn" e="Print AP Write-off"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ngay_ct0" type="DateTime" dataFormatString="@datetimeFormat" width ="80" allowSorting="true" allowFilter="true">
      <header v="Ngày hđ" e="Invoice Date" />
    </field>
    <field name="so_ct0" width="80" allowSorting="true" allowFilter="true" align="right">
      <header v="Số hđ" e="Invoice No."></header>
    </field>

    <field name="ma_kh" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã ncc" e="Supplier ID"></header>
    </field>
    <field name="ten_kh%l" width="300" allowSorting="true" external="true" allowFilter="true">
      <header v="Tên nhà cung cấp" e="Supplier Name"></header>
    </field>
    <field name="tk" width="100" allowSorting="true" allowFilter="true">
      <header v="Tài khoản nợ" e="Debit Account"></header>
    </field>
    <field name="tk_du" width="100" allowSorting="true" allowFilter="true">
      <header v="Tài khoản có" e="Credit Account"></header>
    </field>
    <field name="ps_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Phát sinh nt" e="FC Amount"></header>
    </field>
    <field name="ps" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Phát sinh" e="Amount"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ngay_ct0"/>
      <field name="so_ct0"/>

      <field name="ma_kh"/>
      <field name="ten_kh%l"/>
      <field name="tk"/>
      <field name="tk_du"/>
      <field name="ps_nt"/>
      <field name="ps"/>
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