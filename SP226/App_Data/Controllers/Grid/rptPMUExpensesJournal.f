<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
  <!ENTITY % ReferenceNumber SYSTEM "..\Include\ReferenceNumber.ent">
  %ReferenceNumber;
  <!ENTITY PivotIndexView "6">
]>

<grid type="Report" valid="systotal = 1" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Sổ chi phí ban quản lý dự án" e="PMU Expenses Journal"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>
  <pivot rowField="tag2" columnField="sysColumn" dataFields="ps, ps_nt" indexTable="2" indexColumn="1" indexHeader="2" indexView="&PivotIndexView;"/>
  <fields>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" width ="80" allowSorting="true" allowFilter="true">
      <header v="Ngày gs" e="Booked Date" />
    </field>
    <field name="so_ct" width="80" allowSorting="true" allowFilter="true" align="right">
      <header v="Số ct" e="Number"></header>
    </field>

    &ReferenceNumberFields;

    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width ="80" allowSorting="true" allowFilter="true">
      <header v="Ngày ct" e="Date" />
    </field>
    <field name="ma_ct0" width="60" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã ct" e="VC Code"></header>
    </field>
    <field name="dien_giai" width="300" allowSorting="true" allowFilter="true">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="tk_du" width="100" allowSorting="true" allowFilter="true">
      <header v="Tk đối ứng" e="Ref. Account"></header>
    </field>
    <field name="ps_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="" e=""></header>
    </field>
    <field name="ps" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="" e=""></header>
    </field>

    <field name="ma_ct" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ngay_lct"/>
      <field name="so_ct"/>

      &ReferenceNumberViews;

      <field name="ngay_ct"/>
      <field name="ma_ct0"/>
      <field name="dien_giai"/>
      <field name="tk_du"/>

      <field name="ma_ct"/>
      <field name="stt_rec"/>
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