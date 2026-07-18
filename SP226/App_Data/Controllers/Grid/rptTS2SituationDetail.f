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
  <title v="Báo cáo chi tiết tình hình tăng giảm CCDC" e="Tool &amp; Supply Increase and Decrease Situation Detail Report"></title>
  <subTitle v="Từ kỳ %p1 năm %y1 đến kỳ %p2 năm %y2..." e="From Period %p1 Year %y1 to Period %p2 to Year %y2..."></subTitle>
  <fields>
    <field name="stt" width="30" type="Int16" dataFormatString="# ### ###"  allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ten_dc%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên công cụ" e="Tool &amp; Supply Name"></header>
    </field>
    <field name="ma_dc" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã công cụ" e="T&amp;S Code"></header>
    </field>
    <field name="ma_bp_dc" width="100" allowSorting="true" allowFilter="true">
      <header v="Bộ phận sử dụng" e="Using Department"></header>
    </field>
    <field name="so_ky_pb" type="Decimal" width="100" dataFormatString="# ### ###" allowSorting="true" allowFilter="true">
      <header v="Số kỳ p.bổ" e="Distr. Periods"></header>
    </field>

    <field name="sl_dk" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số lượng đk" e="Original Quantity"></header>
    </field>
    <field name="ng_dk_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Nguyên giá đk nt" e="FC Opening Orig. Cost"></header>
    </field>
    <field name="da_pb_dk_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Pb lũy kế đk nt" e="FC Accum. Distr."></header>
    </field>
    <field name="cl_dk_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Còn lại đk nt" e="FC Current Value"></header>
    </field>

    <field name="gt_pb_bq_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Pb tháng nt" e="FC Average Distr."></header>
    </field>
    <field name="gt_pb_ky_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Pb trong kỳ nt" e="FC Distr. in Period"></header>
    </field>

    <field name="sl_nhap" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số lượng tăng" e="Increa. Quantity"></header>
    </field>
    <field name="ng_tang_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Nguyên giá tăng nt" e="FC Inc. Orig. Cost"></header>
    </field>
    <field name="da_pb_tang_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Pb lũy kế tăng nt" e="FC Accum. Distr."></header>
    </field>
    <field name="cl_tang_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Còn lại tăng nt" e="FC Current Value"></header>
    </field>

    <field name="sl_xuat" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số lượng giảm" e="Decr. Quantity"></header>
    </field>
    <field name="ng_giam_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Nguyên giá giảm nt" e="FC Dec. Orig. Cost"></header>
    </field>
    <field name="da_pb_giam_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Pb lũy kế giảm nt" e="FC Accum. Distr."></header>
    </field>
    <field name="cl_giam_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Còn lại giảm nt" e="FC Current Value"></header>
    </field>

    <field name="sl_ck" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số lượng ck" e="Closing Quantity"></header>
    </field>
    <field name="ng_ck_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Nguyên giá ck nt" e="FC Closing Orig. Cost"></header>
    </field>
    <field name="da_pb_ck_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Pb lũy kế ck nt" e="FC Accum. Distr."></header>
    </field>
    <field name="cl_ck_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Còn lại ck nt" e="FC Current Value"></header>
    </field>

    <field name="ma_nt" width="60" allowSorting="true" allowFilter="true">
      <header v="Mã nt" e="FC Code"></header>
    </field>
    <field name="ty_gia" type="Decimal" allowFilter="&GridReportAllowFilter.Number;" dataFormatString="@exchangeRateViewFormat" width="100" allowSorting="true">
      <header v="Tỷ giá" e="Ex. Rate"></header>
    </field>

    <field name="ng_dk" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Nguyên giá đk" e="Opening Orig. Cost"></header>
    </field>
    <field name="da_pb_dk" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Pb lũy kế đk" e="Accum. Distr."></header>
    </field>
    <field name="cl_dk" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Còn lại đk" e="Current Value"></header>
    </field>

    <field name="gt_pb_bq" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Pb tháng" e="Average Distr."></header>
    </field>
    <field name="gt_pb_ky" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Pb trong kỳ" e="Distr. in Period"></header>
    </field>

    <field name="ng_tang" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Nguyên giá tăng" e="Inc. Orig. Cost"></header>
    </field>
    <field name="da_pb_tang" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Pb lũy kế tăng" e="Accum. Distr."></header>
    </field>
    <field name="cl_tang" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Còn lại tăng" e="Current Value - Increase"></header>
    </field>

    <field name="ng_giam" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Nguyên giá giảm" e="Dec. Orig. Cost"></header>
    </field>
    <field name="da_pb_giam" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Pb lũy kế giảm" e="Accum. Distr."></header>
    </field>
    <field name="cl_giam" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Còn lại giảm" e="Current Value"></header>
    </field>

    <field name="ng_ck" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Nguyên giá ck" e="Closing Orig. Cost"></header>
    </field>
    <field name="da_pb_ck" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Pb lũy kế ck" e="Accum. Distr."></header>
    </field>
    <field name="cl_ck" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Còn lại ck" e="Current Value"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ten_dc%l"/>
      <field name="ma_dc"/>
      <field name="ma_bp_dc"/>
      <field name="so_ky_pb"/>

      <field name="ng_dk_nt"/>
      <field name="da_pb_dk_nt"/>
      <field name="cl_dk_nt"/>

      <field name="gt_pb_bq_nt"/>
      <field name="gt_pb_ky_nt"/>

      <field name="ng_tang_nt"/>
      <field name="da_pb_tang_nt"/>
      <field name="cl_tang_nt"/>

      <field name="ng_giam_nt"/>
      <field name="da_pb_giam_nt"/>
      <field name="cl_giam_nt"/>

      <field name="ng_ck_nt"/>
      <field name="da_pb_ck_nt"/>
      <field name="cl_ck_nt"/>
      <field name="ma_nt"/>
      <field name="ty_gia"/>

      <field name="sl_dk"/>
      <field name="ng_dk"/>
      <field name="da_pb_dk"/>
      <field name="cl_dk"/>

      <field name="gt_pb_bq"/>
      <field name="gt_pb_ky"/>

      <field name="sl_nhap"/>
      <field name="ng_tang"/>
      <field name="da_pb_tang"/>
      <field name="cl_tang"/>
      <field name="sl_xuat"/>
      <field name="ng_giam"/>
      <field name="da_pb_giam"/>
      <field name="cl_giam"/>
      <field name="sl_ck"/>
      <field name="ng_ck"/>
      <field name="da_pb_ck"/>
      <field name="cl_ck"/>
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