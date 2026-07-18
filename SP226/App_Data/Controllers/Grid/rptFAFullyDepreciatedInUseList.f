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
  <title v="Bảng kê TSCĐ hết khấu hao còn sử dụng" e="Fixed Asset Fully Depreciated in Use Report"></title>
  <subTitle v="Tính đến ngày %d1..." e="Date %d1..."></subTitle>
  <fields>
    <field name="stt" width="30" type="Int16" dataFormatString="# ###" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="so_the_ts" width="100" allowSorting="true" allowFilter="true">
      <header v="Số thẻ ts" e="FA Code"></header>
    </field>
    <field name="ten_ts%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên tài sản" e="Description"></header>
    </field>
    <field name="ma_bp" width="100" allowSorting="true" allowFilter="true">
      <header v="Bộ phận " e="Department"></header>
    </field>

    <field name="nguyen_gia_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Nguyên giá nt" e="FC Original Cost"></header>
    </field>
    <field name="gt_da_kh_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Gt đã khấu hao nt" e="FC Accum. Depr."></header>
    </field>
    <field name="ma_nt" width="60" allowSorting="true" allowFilter="true">
      <header v="Mã nt" e="FC Code"></header>
    </field>
    <field name="ty_gia" type="Decimal" allowFilter="&GridReportAllowFilter.Number;" dataFormatString="@exchangeRateViewFormat" width="100" allowSorting="true">
      <header v="Tỷ giá" e="Exchange Rate"></header>
    </field>

    <field name="nguyen_gia" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Nguyên giá" e="Original Cost"></header>
    </field>
    <field name="gt_da_kh" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Gt đã khấu hao" e="Accum. Depr."></header>
    </field>

    <field name="ngay_mua" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowSorting="true" allowFilter="true">
      <header v="Ngày mua" e="Buying Date"></header>
    </field>
    <field name="ngay_kh0" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowSorting="true" allowFilter="true">
      <header v="Ngày tính kh" e="Depr. Date"></header>
    </field>
    <field name="so_ky_kh" type="Decimal" dataFormatString="# ###" width="100" allowSorting="true" allowFilter="true">
      <header v="Số kỳ khấu hao" e="Depr. Periods"></header>
    </field>
    <field name="ngay_kt_kh" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowSorting="true" allowFilter="true">
      <header v="Ngày kt kh" e="Depr. End Date"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="so_the_ts"/>
      <field name="ten_ts%l"/>
      <field name="ma_bp"/>

      <field name="nguyen_gia_nt"/>
      <field name="gt_da_kh_nt"/>
      <field name="ma_nt"/>
      <field name="ty_gia"/>

      <field name="nguyen_gia"/>
      <field name="gt_da_kh"/>

      <field name="ngay_mua"/>
      <field name="ngay_kh0"/>
      <field name="so_ky_kh"/>
      <field name="ngay_kt_kh"/>
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