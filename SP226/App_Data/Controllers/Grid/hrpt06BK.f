<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Bảng kê thuế TNCN từ chuyển nhượng chứng khoán" e="Personal Income Tax on Transfering Values of Securities Listing"></title>
  <subTitle v="Năm %y..." e="Year %y..."></subTitle>
  <fields>
    <field name="ma_dvcs" width="100" allowSorting="true" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ma_ns" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ten_ns" width="150" allowSorting="true" allowFilter="true">
      <header v="Tên nhân viên" e="Employee Name"></header>
    </field>
    <field name="ma_so_thue" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã số thuế" e="PIT Code"></header>
    </field>
    <field name="cmnd" width="100" allowSorting="true" allowFilter="true">
      <header v="CMND/Hộ chiếu" e="ID/Passport"></header>
    </field>

    <field name="cn_tk_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Chuyển nhượng" e="Transfers in Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="thue_dkt_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Thuế đã khấu trừ" e="Amount of PIT Deducted"></header>
      <items style="Numeric"/>
    </field>
    <field name="cn_tk" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Chuyển nhượng" e="Transfers in Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="thue_dkt" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Thuế đã khấu trừ" e="Tax Deducted"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_dvcs"/>
      <field name="ma_ns"/>
      <field name="ten_ns"/>
      <field name="ma_so_thue"/>
      <field name="cmnd"/>

      <field name="cn_tk_nt"/>
      <field name="thue_dkt_nt"/>
      <field name="cn_tk"/>
      <field name="thue_dkt"/>
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