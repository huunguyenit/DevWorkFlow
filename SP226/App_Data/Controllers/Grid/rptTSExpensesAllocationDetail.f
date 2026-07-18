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
  <title v="Bảng chi tiết phân bổ chi phí CCDC" e="Tool &amp; Supply Expenses Allocation Detail Report"></title>
  <subTitle v="%s...Từ kỳ %p1 năm %y1 đến kỳ %p2 năm %y2..." e="%s...From Period %p1 Year %y1 to Period %p2 to Year %y2..."></subTitle>
  <fields>
    <field name="stt" width="30" type="Int16" dataFormatString="# ###" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>

    <field name="ten_ts%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên công cụ" e="Decription"></header>
    </field>
    <field name="so_the_ts" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã công cụ" e="TS Code"></header>
    </field>

    <field name="nguyen_gia_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Nguyên giá nt" e="FC Original Cost"></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_kh_ky_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Phân bổ nt trong kỳ" e="FC Alloc. in Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_da_kh_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Đã phân bổ nt" e="FC Accumu. Alloc."></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_cl_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Còn lại nt" e="FC Remain"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_nt" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nt" e="Currency Code"></header>
    </field>
    <field name="ty_gia" type="Decimal" allowFilter="&GridReportAllowFilter.Number;" width="100" dataFormatString="@exchangeRateViewFormat" allowSorting="true">
      <header v="Tỷ giá" e="Exchange Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="nguyen_gia" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Nguyên giá" e="Original Cost"></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_kh_ky" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Phân bổ trong kỳ" e="Alloc. in Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_da_kh" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Đã phân bổ" e="Accumu. Alloc."></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_cl" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Còn lại" e="Remain"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ten_ts%l"/>
      <field name="so_the_ts"/>

      <field name="nguyen_gia_nt"/>
      <field name="gt_kh_ky_nt"/>
      <field name="gt_da_kh_nt"/>
      <field name="gt_cl_nt"/>
      <field name="ma_nt"/>
      <field name="ty_gia"/>
      <field name="nguyen_gia"/>
      <field name="gt_kh_ky"/>
      <field name="gt_da_kh"/>
      <field name="gt_cl"/>
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