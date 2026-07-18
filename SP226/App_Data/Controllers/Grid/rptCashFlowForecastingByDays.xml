<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % ReferenceNumber SYSTEM "..\Include\ReferenceNumber.ent">
  %ReferenceNumber;

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" valid="systotal = 1" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Dự báo dòng tiền theo ngày" e="Cash Flow Forecasting by Days"></title>
  <subTitle v="%f1, từ ngày: %df đến ngày %dt..." e="%f1, Date from %df to %dt..."></subTitle>
  <fields>

    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowSorting="true" allowFilter="true">
      <header v="Ngày ct" e="VC. Date"></header>
    </field>
    <field name="so_ct" width="100" align="right" allowSorting="true" allowFilter="true">
      <header v="Số ct" e="Voucher Number"></header>
    </field>

    &ReferenceNumberFields;

    <field name="ngay_dh" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowSorting="true" allowFilter="true">
      <header v="Ngày đến hạn" e="Due Date"></header>
    </field>
    <field name="ma_kh" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Mã khách" e="Customer ID"></header>
    </field>
    <field name="ten_kh" width="300" external="true" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tên khách" e="Customer Name"></header>
    </field>
    <field name="dien_giai" width="300" allowSorting="true" allowFilter="true">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="tien_thu" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Tiền thu" e="Cash Inflows"></header>
    </field>
    <field name="tien_chi" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Tiền chi" e="Cash Outflows"></header>
    </field>
    <field name="tien_ton" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tiền tồn" e="Balance Cash Flow"></header>
    </field>
    <field name="nguon_dl" width="100" allowSorting="true" allowFilter="true">
      <header v="Nguồn dữ liệu" e="Data Source"></header>
    </field>

  </fields>

  <views>
    <view id="Grid">
      <field name="ngay_ct"/>
      <field name="so_ct"/>

      &ReferenceNumberViews;

      <field name="ngay_dh"/>
      <field name="ma_kh"/>
      <field name="ten_kh"/>
      <field name="dien_giai"/>
      <field name="tien_thu"/>
      <field name="tien_chi"/>
      <field name="tien_ton"/>
      <field name="nguon_dl"/>

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