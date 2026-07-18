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
  <title v="Báo cáo hóa đơn điều chỉnh, thay thế" e="Adjustment Invoice and Replacement Invoice Report"></title>
  <subTitle v="%t, ngày hóa đơn từ %d1 đến %d2..." e="%t, Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ngay_ct0" type="DateTime" width="80" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày hđ gốc" e="Original Date"></header>
    </field>
    <field name="so_ct0" width="80" align="right" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct0]', Value: '[stt_rec0]'}, Script: 'beforeDrillDown(this);'">
      <header v="Số hđ gốc" e="Original Number"></header>
    </field>
    <field name="so_ct_hddt0" width="80" align="right" allowSorting="true" allowFilter="true">
      <header v="Số xác thực hđ gốc" e="Original Reference Number"></header>
    </field>
    <field name="so_seri_hddt0" width="80" align="right" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true">
      <header v="Ký hiệu hđ gốc" e="Original Serial Number"></header>
      <items style="Mask"/>
    </field>
    <field name="mau_hddt0" width="80" clientDefault="Default" dataFormatString="@upperCaseFormat" allowNulls="false" align="right" allowSorting="true" allowFilter="true">
      <header v="Mẫu số hđ gốc" e="Original Form"></header>
    </field>
    <field name="ma_nt0" width="80" allowSorting="true" allowFilter="true">
      <header v="Mã nt hđ gốc" e="Original Currency"></header>
    </field>
    <field name="tien_nt0" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tiền hđ gốc" e="Original Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="ngay_ct" type="DateTime" width="80" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày hđ" e="Invoice Date"></header>
    </field>
    <field name="so_ct" width="80" align="right" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
      <header v="Số hđ" e="Invoice Number"></header>
    </field>
    <field name="so_ct_hddt" width="80" align="right" allowSorting="true" allowFilter="true">
      <header v="Số xác thực" e="Reference Number"></header>
    </field>
    <field name="so_seri_hddt" width="80" align="right" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true">
      <header v="Ký hiệu" e="Serial Number"></header>
      <items style="Mask"/>
    </field>
    <field name="mau_hddt" width="80" clientDefault="Default" dataFormatString="@upperCaseFormat" allowNulls="false" align="right" allowSorting="true" allowFilter="true">
      <header v="Mẫu số" e="Form"></header>
    </field>
    <field name="ma_nt" width="80" allowSorting="true" allowFilter="true">
      <header v="Mã nt" e="Currency"></header>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_kh" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã khách" e="Customer ID"></header>
    </field>
    <field name="ten_kh" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên khách hàng" e="Customer Name"></header>
    </field>
    <field name="nguoi_th" width="150" allowSorting="true" allowFilter="true">
      <header v="Người thực hiện" e="Released by"></header>
    </field>
    <field name="ma_ct" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_ct0" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ngay_ct0"/>
      <field name="so_ct0"/>
      <field name="so_ct_hddt0"/>
      <field name="so_seri_hddt0"/>
      <field name="mau_hddt0"/>
      <field name="ma_nt0"/>
      <field name="tien_nt0"/>

      <field name="ngay_ct"/>
      <field name="so_ct"/>
      <field name="so_ct_hddt"/>
      <field name="so_seri_hddt"/>
      <field name="mau_hddt"/>
      <field name="ma_nt"/>
      <field name="tien_nt"/>

      <field name="ma_kh"/>
      <field name="ten_kh"/>
      <field name="nguoi_th"/>

      <field name="ma_ct"/>
      <field name="stt_rec"/>
      <field name="ma_ct0"/>
      <field name="stt_rec0"/>
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