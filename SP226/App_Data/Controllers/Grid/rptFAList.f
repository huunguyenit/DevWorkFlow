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

<grid type="Report" filter="&Repetition.Key.003;" valid="systotal = 1" repetition="&Repetition.Key.004;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục tài sản cố định" e="Fixed Asset List"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="stt" type="Int16" width="30" dataFormatString="# ###" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="so_the_ts" width="100" allowSorting="true" allowFilter="true">
      <header v="Số thẻ ts" e="Code"></header>
    </field>
    <field name="ten_ts%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên tài sản" e="Description"></header>
    </field>
    <field name="so_hieu_ts" width="100" allowSorting="true" allowFilter="true">
      <header v="Số hiệu ts" e="Notation"></header>
    </field>

    <field name="nguyen_gia_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Nguyên giá nt" e="FC Original Cost"></header>
    </field>
    <field name="gt_da_kh_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Đã khấu hao nt" e="FC Accum. Depr."></header>
    </field>
    <field name="gt_cl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Còn lại nt" e="FC Remaining"></header>
    </field>
    <field name="gt_kh_ky_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Kh trong kỳ nt" e="FC Depr. in Period"></header>
    </field>
    <field name="ma_nt" type="String" width="60" allowSorting="true" allowFilter="true">
      <header v="Mã nt" e="FC Code"></header>
    </field>
    <field name="ty_gia" type="Decimal" allowFilter="&GridReportAllowFilter.Number;" dataFormatString="@exchangeRateViewFormat" width="100" allowSorting="true">
      <header v="Tỷ giá" e="Exchange Rate"></header>
    </field>

    <field name="nguyen_gia" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Nguyên giá" e="Original Cost"></header>
    </field>
    <field name="gt_da_kh" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Gt đã khấu hao" e="Accumulated Depr."></header>
    </field>
    <field name="gt_cl" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Còn lại" e="Remaining"></header>
    </field>
    <field name="gt_kh_ky" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Kh trong kỳ" e="Depr. in Period"></header>
    </field>

    <field name="ngay_mua" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowSorting="true" allowFilter="true">
      <header v="Ngày mua" e="Buying Date"></header>
    </field>
    <field name="ngay_kh0" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowSorting="true" allowFilter="true">
      <header v="Ngày tính kh" e="Depr. Date"></header>
    </field>
    <field name="ngay_giam" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowSorting="true" allowFilter="true">
      <header v="Ngày giảm" e="Decr. Date"></header>
    </field>
    <field name="so_ky_kh" type="Int16" dataFormatString="### ### ###" width="100" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số kỳ khấu hao" e="Depr. Periods"></header>
    </field>

    <field name="so_ct" width="80" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="Số ct" e="Voucher No."></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width ="80" allowSorting="true" allowFilter="true">
      <header v="Ngày ct" e="Voucher Date"/>
    </field>

    <field name="tk_ts" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tk tài sản" e="Fixed Asset Account"></header>
    </field>
    <field name="tk_kh" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tk khấu hao" e="Depreciation Account"></header>
    </field>
    <field name="tk_cp" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tk chi phí" e="Expense Account."></header>
    </field>

    <field name="ma_bp" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã bộ phận" e="Department"></header>
    </field>
    <field name="ma_phi" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã phí" e="Expense"></header>
    </field>

  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="so_the_ts"/>
      <field name="ten_ts%l"/>
      <field name="so_hieu_ts"/>

      <field name="nguyen_gia_nt"/>
      <field name="gt_da_kh_nt"/>
      <field name="gt_cl_nt"/>
      <field name="gt_kh_ky_nt"/>
      <field name="ma_nt"/>
      <field name="ty_gia"/>

      <field name="nguyen_gia"/>
      <field name="gt_da_kh"/>
      <field name="gt_cl"/>
      <field name="gt_kh_ky"/>

      <field name="ngay_mua"/>
      <field name="ngay_kh0"/>
      <field name="ngay_giam"/>
      <field name="so_ky_kh"/>

      <field name="ngay_ct"/>
      <field name="so_ct"/>

      <field name="tk_ts"/>
      <field name="tk_kh"/>
      <field name="tk_cp"/>

      <field name="ma_bp"/>
      <field name="ma_phi"/>
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