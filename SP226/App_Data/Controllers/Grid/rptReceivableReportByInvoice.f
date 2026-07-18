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

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Bảng kê công nợ theo hóa đơn" e="Receivable Report by Invoice"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>

  <fields>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width ="80" allowSorting="true" allowFilter="true">
      <header v="Ngày h.toán" e="GL. Date"></header>
    </field>
    <field name="ma_ct0" width="60" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã ct" e="VC. Code"></header>
    </field>
    <field name="ngay_ct0" type="DateTime" dataFormatString="@datetimeFormat" width ="80" allowSorting="true" allowFilter="true">
      <header v="Ngày ct" e="VC. Date"></header>
    </field>
    <field name="so_ct" width="80" align="right" allowSorting="true" allowFilter="true">
      <header v="Số ct" e="Voucher No."></header>
    </field>

    &ReferenceNumberFields;

    <field name="ma_kh" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã khách" e="Cust. ID"></header>
    </field>
    <field name="ten_kh" width="300" allowSorting="true" external="true" allowFilter="true">
      <header v="Tên khách hàng" e="Customer Name"></header>
    </field>

    <field name="ma_hd" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã hợp đồng" e="Contract"></header>
    </field>
    <field name="ten_hd_ex" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên hợp đồng" e="Contract Name"></header>
    </field>

    <field name="t_tt_nt0" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Số tiền nt" e="FC Amount"></header>
    </field>
    <field name="t_tt_nt1" type="Decimal"  width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Đã thu nt" e="Received FC Amt."></header>
    </field>
    <field name="con_pt_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Phải thu nt" e="Receivable FC Amt."></header>
    </field>

    <field name="ty_gia" type="Decimal" width="100" dataFormatString="@exchangeRateViewFormat" allowSorting="true">
      <header v="Tỷ giá" e="Exchange Rate"></header>
    </field>

    <field name="t_tt0" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Số tiền" e="Amount"></header>
    </field>
    <field name="t_tt1" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Đã thu" e="Received Amt."></header>
    </field>
    <field name="con_pt" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Phải thu" e="Receivable Amt."></header>
    </field>

    <field name="han_tt" width="100" align="right" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Hạn t.toán" e="Payment Terms"></header>
    </field>
    <field name="ngay_tt0" type="DateTime" dataFormatString="@datetimeFormat" width ="80" allowSorting="true" allowFilter="true">
      <header v="Ngày t.toán" e="Due Date"></header>
    </field>

    <field name="ma_vv" width="100" allowSorting="true" allowFilter="true">
      <header v="Vụ việc" e="Job"></header>
    </field>
    <field name="tk" width="100" allowSorting="true" allowFilter="true">
      <header v="Tài khoản" e="Account"></header>
    </field>

    <field name="ma_ct" width="0" hidden="true">
      <header v="Mã ct" e="VC. Code"></header>
    </field>
    <field name="stt_rec" width="0" hidden="true" >
      <header v="Stt_rec" e="Stt_rec"></header>
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

      <field name="t_tt_nt0"/>
      <field name="t_tt_nt1"/>
      <field name="con_pt_nt"/>

      <field name="ty_gia"/>

      <field name="t_tt0"/>
      <field name="t_tt1"/>
      <field name="con_pt"/>

      <field name="han_tt"/>
      <field name="ngay_tt0"/>
      <field name="ma_vv"/>
      <field name="tk"/>

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