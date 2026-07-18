<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>
<grid type="Report" valid="sysorder = 4" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo chi tiết tình hình tiền vay" e="Loan Contract Status Detail Report"></title>
  <subTitle v="Tài khoản: %s, từ ngày %d1 đến ngày %d2..." e="Account: %s, Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ma_ku_in" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã khế ước" e="Loan Contract"></header>
    </field>
    <field name="dien_giai" width="300" allowSorting="true" allowFilter="true">
      <header v="Nội dung" e="Description"></header>
    </field>
    <field name="tk" width="100" allowSorting="true" allowFilter="true">
      <header v="Tài khoản" e="Account"></header>
    </field>

    <field name="ngay_vay" type="DateTime" dataFormatString="@datetimeFormat" width ="80" allowSorting="true" allowFilter="true">
      <header v="Ngày vay" e="Loan Date"/>
    </field>
    <field name="ngay_dh" type="DateTime" dataFormatString="@datetimeFormat" width ="80" allowSorting="true" allowFilter="true">
      <header v="Ngày đh" e="Due Date"/>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width ="80" allowSorting="true" allowFilter="true">
      <header v="Ngày ct" e="VC. Date"/>
    </field>

    <field name="du_dk_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Dư đầu nt" e="FC Opening Balance"></header>
    </field>
    <field name="ps_no_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Thanh toán nt" e="FC Loan Payment"></header>
    </field>
    <field name="ps_co_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Tiền vay nt" e="FC Amount"></header>
    </field>
    <field name="du_ck_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Số dư tiền vay nt" e="FC Balance Amount"></header>
    </field>

    <field name="du_dk" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Dư đầu" e="Opening Balance"></header>
    </field>
    <field name="ps_no" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Thanh toán" e="Loan Payment"></header>
    </field>
    <field name="ps_co" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Tiền vay" e="Amount"></header>
    </field>
    <field name="du_ck" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Số dư tiền vay" e="Balance Amount"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_ku_in"/>
      <field name="dien_giai"/>
      <field name="tk"/>

      <field name="ngay_vay"/>
      <field name="ngay_dh"/>
      <field name="ngay_ct"/>

      <field name="du_dk_nt"/>
      <field name="ps_no_nt"/>
      <field name="ps_co_nt"/>
      <field name="du_ck_nt"/>

      <field name="du_dk"/>
      <field name="ps_no"/>
      <field name="ps_co"/>
      <field name="du_ck"/>
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