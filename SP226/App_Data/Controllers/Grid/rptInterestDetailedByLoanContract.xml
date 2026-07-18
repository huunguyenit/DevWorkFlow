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
  <title v="Bảng kê tính lãi chi tiết theo khế ước" e="Interest Sheet Detailed by Loan Contract"></title>
  <subTitle v="Tài khoản: %s1, từ ngày %d1 đến ngày %d2..." e="Account: %s1, Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ngay_tu" type="DateTime" width="80" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Từ ngày" e="Date from"></header>
    </field>
    <field name="ngay_den" type="DateTime" width="80" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Đến ngày" e="Date to"></header>
    </field>

    <field name="ma_ku" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã khế ước" e="Loan Contract"></header>
    </field>
    <field name="ten_ku%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên khế ước" e="Description"></header>
    </field>

    <field name="so_ngay_th" type="Decimal" dataFormatString="# ###" width="100" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Trong hạn" e="In Due Days"></header>
    </field>
    <field name="so_ngay_qh" type="Decimal" dataFormatString="# ###" width="100" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Quá hạn" e="Over Due Days"></header>
    </field>
    <field name="so_ngay_tong" type="Decimal" dataFormatString="# ###" width="100" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Tổng" e="Total"></header>
    </field>

    <field name="ls_th" type="Decimal" dataFormatString="##.#0" width="100" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Ls trong hạn" e="In Due Rate"></header>
    </field>
    <field name="ls_qh" type="Decimal" dataFormatString="##.#0" width="100" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Ls quá hạn" e="Over Due Rate"></header>
    </field>

    <field name="da_tra_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Đã thanh toán nt" e="FC Paid"></header>
    </field>
    <field name="so_du_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Số dư nt" e="FC Balance"></header>
    </field>
    <field name="tl_th_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Lãi trong hạn nt" e="FC in Due Amt."></header>
    </field>
    <field name="tl_qh_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Lãi quá hạn nt" e="FC over Due Amt."></header>
    </field>
    <field name="tl_tong_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Lãi nt" e="FC Total Amount"></header>
    </field>

    <field name="da_tra" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Đã thanh toán" e="Paid"></header>
    </field>
    <field name="so_du" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Số dư" e="Balance"></header>
    </field>
    <field name="tl_th" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Lãi trong hạn" e="In Due Amt."></header>
    </field>
    <field name="tl_qh" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Lãi quá hạn" e="Over Due Amt."></header>
    </field>
    <field name="tl_tong" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Lãi" e="Total Amount"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_ku"/>
      <field name="ten_ku%l"/>

      <field name="ngay_tu"/>
      <field name="ngay_den"/>

      <field name="so_ngay_th"/>
      <field name="so_ngay_qh"/>
      <field name="so_ngay_tong"/>

      <field name="ls_th"/>
      <field name="ls_qh"/>

      <field name="da_tra_nt"/>
      <field name="so_du_nt"/>
      <field name="tl_th_nt"/>
      <field name="tl_qh_nt"/>
      <field name="tl_tong_nt"/>

      <field name="da_tra"/>
      <field name="so_du"/>
      <field name="tl_th"/>
      <field name="tl_qh"/>
      <field name="tl_tong"/>
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