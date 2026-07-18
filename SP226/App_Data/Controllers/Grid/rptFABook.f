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

<grid type="Report" filter="&Repetition.Key.001;" valid="systotal = 1" repetition="&Repetition.Key.002;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Sổ tài sản cố định" e="Fixed Asset Book"></title>
  <subTitle v="Năm %d1, loại tài sản: %c..." e="Year %d1, Asset Type: %c..."></subTitle>
  <fields>
    <field name="ngay_mua" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowSorting="true" allowFilter="true">
      <header v="Ngày ghi sổ" e="Booked Date"></header>
    </field>
    <field name="so_the_ts" width="100" allowSorting="true" allowFilter="true">
      <header v="Số hiệu" e="FA Code"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowSorting="true" allowFilter="true">
      <header v="Ngày ct" e="VC Date"></header>
    </field>
    <field name="ten_ts%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên tài sản" e="FA Name"></header>
    </field>
    <field name="nuoc_sx" width="100" allowSorting="true" allowFilter="true">
      <header v="Nước sx" e="Made in"></header>
    </field>
    <field name="ngay_dvsd" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowSorting="true" allowFilter="true">
      <header v="Ngày sd" e="Using Date"></header>
    </field>
    <field name="so_hieu_ts" width="100" allowSorting="true" allowFilter="true">
      <header v="Số hiệu TSCĐ" e="Code"></header>
    </field>

    <field name="nguyen_gia_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Nguyên giá nt" e="FC Original Cost"></header>
    </field>
    <field name="nguyen_gia" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Nguyên giá" e="Original Cost"></header>
    </field>
    <field name="tl_kh" type="Decimal" dataFormatString="##.00" width="80" allowSorting="true" allowFilter="true">
      <header v="Tỉ lệ kh" e="Depr. Rate"></header>
    </field>
    <field name="muc_kh_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Mức kh nt" e="FC Depr. Level"></header>
    </field>
    <field name="kh_dk_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Kh nt các năm trước" e="FC Opening Depr."></header>
    </field>
    <field name="kh_ck_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Kh nt trong năm" e="FC Year Depr."></header>
    </field>
    <field name="kh_lk_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Kh lũy kế nt" e="FC Accumulation"></header>
    </field>
    <field name="gt_cl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Giá trị cl nt" e="FC Remaining"></header>
    </field>
    <field name="ma_nt" width="60" allowSorting="true" allowFilter="true">
      <header v="Mã nt" e="FC Code"></header>
    </field>
    <field name="ty_gia" type="Decimal" allowFilter="&GridReportAllowFilter.Number;" dataFormatString="@exchangeRateViewFormat" width="100" allowSorting="true">
      <header v="Tỷ giá" e="Exchange Rate"></header>
    </field>

    <field name="muc_kh" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Mức kh" e="Depr. Level"></header>
    </field>
    <field name="kh_dk" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Kh các năm trước" e="Opening Depr."></header>
    </field>
    <field name="kh_ck" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Kh trong năm" e="Year Depr."></header>
    </field>
    <field name="kh_lk" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Kh lũy kế" e="Accumulation"></header>
    </field>
    <field name="gt_cl" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Giá trị còn lại" e="Remaining"></header>
    </field>

    <field name="so_ct_giam" width="100" allowSorting="true" allowFilter="true">
      <header v="Số hiệu giảm" e="Decrease No."></header>
    </field>
    <field name="ngay_giam" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowSorting="true" allowFilter="true">
      <header v="Ngày giảm" e="Date"></header>
    </field>
    <field name="ly_do_giam" width="100" allowSorting="true" allowFilter="true">
      <header v="Lý do giảm" e="Reason"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ngay_mua"/>
      <field name="so_the_ts"/>
      <field name="ngay_ct"/>
      <field name="ten_ts%l"/>
      <field name="nuoc_sx"/>
      <field name="ngay_dvsd"/>
      <field name="so_hieu_ts"/>

      <field name="nguyen_gia_nt"/>
      <field name="nguyen_gia"/>
      <field name="tl_kh"/>
      <field name="muc_kh_nt"/>
      <field name="kh_dk_nt"/>
      <field name="kh_ck_nt"/>
      <field name="kh_lk_nt"/>
      <field name="gt_cl_nt"/>
      <field name="ma_nt"/>
      <field name="ty_gia"/>

      <field name="muc_kh"/>
      <field name="kh_dk"/>
      <field name="kh_ck"/>
      <field name="kh_lk"/>
      <field name="gt_cl"/>

      <field name="so_ct_giam"/>
      <field name="ngay_giam"/>
      <field name="ly_do_giam"/>
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