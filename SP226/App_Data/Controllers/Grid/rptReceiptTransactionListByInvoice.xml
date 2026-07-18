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

<grid type="Report" valid="loai_tt = 0" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Bảng kê chi tiết thu tiền của các hóa đơn" e="Detail Receipt Transaction List by Invoice"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>

  <fields>
    <field name="ngay_ct" type="DateTime" width="80" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày h.toán" e="GL. Date"></header>
    </field>
    <field name="ma_ct0" width="60" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã ct" e="VC. Code"></header>
    </field>
    <field name="ngay_ct0" type="DateTime" width="80" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày ct" e="VC. Date"></header>
    </field>
    <field name="so_ct" width="80" allowSorting="true" allowFilter="true" align="right">
      <header v="Số ct" e="VC. No."></header>
    </field>

    &ReferenceNumberFields;

    <field name="ma_kh" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã khách" e="Customer"></header>
    </field>
    <field name="ten_kh" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên khách" e="Customer Name"></header>
    </field>

    <field name="ma_hd" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã hợp đồng" e="Contract"></header>
    </field>
    <field name="ten_hd_ex" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên hợp đồng" e="Contract Name"></header>
    </field>

    <field name="ma_nt" width="60" allowSorting="true" allowFilter="true">
      <header v="Mã nt" e="FC Code"></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateViewFormat" width="100" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tỷ giá" e="Exchange Rate"></header>
    </field>

    <field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Số tiền nt" e="FC Amt."></header>
    </field>
    <field name="tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Đã thu nt" e="FC Amt. Received"></header>
    </field>
    <field name="con_pt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Phải thu nt" e="FC Amt. Receivable"></header>
    </field>

    <field name="t_tt" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Số tiền" e="Amt."></header>
    </field>
    <field name="tt" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Đã thu" e="Amt. Received"></header>
    </field>
    <field name="con_pt" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Phải thu" e="Amt. Receivable"></header>
    </field>

    <field name="han_tt" type="Decimal" dataFormatString="# ###" width="100" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Hạn t.toán" e="Payment Term"></header>
    </field>
    <field name="ngay_tt0" type="DateTime" width="80" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày t.toán" e="Due Date"></header>
    </field>

    <field name="ma_vv" width="100" allowSorting="true" allowFilter="true">
      <header v="Vụ việc" e="Job"></header>
    </field>
    <field name="tk" width="100" allowSorting="true" allowFilter="true">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="dien_giai" width="300" allowSorting="true" allowFilter="true">
      <header v="Diễn giải" e="Description"></header>
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
      <field name="ngay_ct"/>
      <field name="ma_ct0"/>
      <field name="ngay_ct0"/>
      <field name="so_ct"/>

      &ReferenceNumberViews;

      <field name="ma_kh"/>
      <field name="ten_kh"/>
      <field name="ma_hd"/>
      <field name="ten_hd_ex"/>
      <field name="ma_nt"/>
      <field name="ty_gia"/>
      <field name="t_tt_nt"/>
      <field name="tt_nt"/>
      <field name="con_pt_nt"/>
      <field name="t_tt"/>
      <field name="tt"/>
      <field name="con_pt"/>
      <field name="han_tt"/>
      <field name="ngay_tt0"/>
      <field name="ma_vv"/>
      <field name="tk"/>
      <field name="dien_giai"/>
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