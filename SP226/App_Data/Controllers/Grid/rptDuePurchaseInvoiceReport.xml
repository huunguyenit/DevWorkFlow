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

<grid type="Report" filter="&Repetition.Key.005;" repetition="&Repetition.Key.006;" valid="systotal = 1" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo các hóa đơn sắp đến hạn thanh toán" e="Due Invoice Report"></title>
  <subTitle v="Tài khoản: %s, ngày báo cáo: %d, số ngày cảnh báo: %n..." e="Debt Account: %s, Report Date: %d, Days of Warning: %n..."></subTitle>
  <fields>
    <field name="stt" type="Int16" dataFormatString="# ###" width="30" allowSorting="true" allowFilter="true" align="right">
      <header v="Stt" e="No."></header>
    </field>
    <field name="so_ct" width="80" allowSorting="true" allowFilter="true" align="right" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
      <header v="Số hóa đơn" e="Invoice No."></header>
    </field>
    <field name="ngay_ct0" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowSorting="true" allowFilter="true">
      <header v="Ngày ct" e="VC. Date"></header>
    </field>
    <field name="ten_dg" width="300" allowSorting="true" allowFilter="true">
      <header v="Diễn giải" e="Description"></header>
    </field>

    <field name="ma_hd" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã hợp đồng" e="Contract"></header>
    </field>
    <field name="ten_hd_ex" width="300" allowSorting="true" external="true" allowFilter="true">
      <header v="Tên hợp đồng" e="Contract Name"></header>
    </field>

    <field name="ma_nt" type="String" width="60" allowSorting="true" allowFilter="true">
      <header v="Mã nt" e="FC Code"></header>
    </field>
    <field name="t_tt_nt0" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Tiền trên hđ nt" e="FC Invoice Amount"></header>
    </field>
    <field name="da_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Đã trả nt" e="FC Paid Amount"></header>
    </field>
    <field name="cl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Phải trả nt" e="FC Payable Amount"></header>
    </field>

    <field name="t_tt0" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Tiền trên hđ" e="Invoice Amount"></header>
    </field>
    <field name="da_tt" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Đã trả" e="Paid Amount"></header>
    </field>
    <field name="cl" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Phải trả" e="Payable Amount"></header>
    </field>

    <field name="ngay_dh" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowSorting="true" allowFilter="true">
      <header v="Ngày đến hạn" e="Due Date"></header>
    </field>
    <field name="so_ngay_dh" type="Decimal" dataFormatString="# ###" width="100" allowSorting="true" allowFilter="true">
      <header v="Số ngày đến hạn" e="Due Day(s)"></header>
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
      <field name="stt"/>
      <field name="so_ct"/>
      <field name="ngay_ct0"/>
      <field name="ten_dg"/>
      <field name="ma_hd"/>
      <field name="ten_hd_ex"/>
      <field name="ma_nt"/>
      <field name="t_tt_nt0"/>
      <field name="da_tt_nt"/>
      <field name="cl_nt"/>

      <field name="t_tt0"/>
      <field name="da_tt"/>
      <field name="cl"/>

      <field name="ngay_dh"/>
      <field name="so_ngay_dh"/>

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