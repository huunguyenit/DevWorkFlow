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

<grid type="Report" filter="&Repetition.Key.007;&Repetition.And;sysorder &lt; 9" valid="systotal = 1" repetition="&Repetition.Key.008;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo chi tiết TSCĐ theo nguồn vốn" e="Fixed Asset Detail by Capital Report"></title>
  <subTitle v="%c %d1 năm %d2..." e="%c %d1 Year %d2..."></subTitle>
  <pivot rowField="sysrow" columnField="ma_nv" dataFields="nguyen_gia, gt_da_kh, gt_cl, nguyen_gia_nt, gt_da_kh_nt, gt_cl_nt" indexTable="2" indexColumn="1" indexHeader="2" indexView="7"/>
  <fields>
    <field name="stt" width="30" type="Int16" dataFormatString="# ###" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ten_ts" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên tài sản" e="FA Name"></header>
    </field>
    <field name="so_the_ts" width="100" allowSorting="true" allowFilter="true">
      <header v="Số thẻ ts" e="FA Code"></header>
    </field>

    <field name="ngay_mua" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowSorting="true" allowFilter="true">
      <header v="Ngày mua" e="Buying Date"></header>
    </field>
    <field name="so_ky_kh" type="Decimal" dataFormatString="# ###" width="60" allowSorting="true" allowFilter="true">
      <header v="Số kỳ kh" e="Periods"></header>
    </field>
    <field name="ma_nt" width="60" allowSorting="true" allowFilter="true">
      <header v="Mã nt" e="FC Code"></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateViewFormat" width="100" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tỷ giá" e="Exchange Rate"></header>
    </field>

    <field name="nguyen_gia" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Nguyên giá" e="Original Cost"></header>
    </field>
    <field name="gt_da_kh" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Gt đã khấu hao" e="Accum. Depr."></header>
    </field>
    <field name="gt_cl" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Gt còn lại" e="Remain"></header>
    </field>
    <field name="nguyen_gia_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Nguyên giá nt" e="FC Original Cost"></header>
    </field>
    <field name="gt_da_kh_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Gt đã khấu hao nt" e="FC Accum. Depr."></header>
    </field>
    <field name="gt_cl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Gt còn lại nt" e="FC Remain"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ten_ts"/>
      <field name="so_the_ts"/>

      <field name="ngay_mua"/>
      <field name="so_ky_kh"/>
      <field name="ma_nt"/>
      <field name="ty_gia"/>
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