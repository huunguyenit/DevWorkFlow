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

<grid type="Report" filter="&Repetition.Key.007;&Repetition.And;sysorder &lt; 99" valid="systotal = 1" repetition="&Repetition.Key.008;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Bảng tính khấu hao TSCĐ theo nguồn vốn" e="Fixed Asset Depreciation by Capital Report"/>
  <subTitle v="Từ kỳ %p1 năm %y1 đến kỳ %p2 năm %y2..." e="From Period %p1 Year %y1 to Period %p2 Year %y2..."></subTitle>
  <pivot rowField="xRow" columnField="sysColumn" dataFields="gt_kh_ky_nt, gt_kh_ky" indexTable="2" indexColumn="1" indexHeader="2" indexView="9"/>
  <fields>
    <field name="stt" type="Int16" width="30" allowSorting="true" allowFilter="true" align="right">
      <header v="Stt" e="No."></header>
    </field>
    <field name="so_the_ts" width="100" allowSorting="true" allowFilter="true">
      <header v="Số thẻ tài sản" e="FA Code"></header>
    </field>
    <field name="ten_ts%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên tài sản" e="Decription"></header>
    </field>
    <field name="ngay_kh0" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Ngày khấu hao" e="Depr. Date"></header>
    </field>
    <field name="so_ky_kh" type="Int16" width="60" allowSorting="true" allowFilter="true" align="right" aggregate="Sum">
      <header v="Số kỳ kh" e="Periods"></header>
    </field>
    <field name="nguyen_gia_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Nguyên giá nt" e="FC Original Cost"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nt" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nt" e="Currency Code"></header>
    </field>
    <field name="ty_gia" type="Decimal" width="100" dataFormatString="@exchangeRateViewFormat" allowSorting="true" allowFilter="true">
      <header v="Tỷ giá" e="Exchange Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="nguyen_gia" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Nguyên giá" e="Original Cost"></header>
      <items style="Numeric"/>
    </field>

    <field name="gt_kh_ky_nt" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_kh_ky" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="gt_da_kh_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Đã khấu hao nt" e="FC Accumu. Depr."></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_cl_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Còn lại nt" e="FC Remain"></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_da_kh" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Đã khấu hao" e="Accumu. Depr."></header>
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
      <field name="so_the_ts"/>
      <field name="ten_ts%l"/>
      <field name="ngay_kh0"/>
      <field name="so_ky_kh"/>
      <field name="nguyen_gia_nt"/>
      <field name="ma_nt"/>
      <field name="ty_gia"/>
      <field name="nguyen_gia"/>

      <field name="gt_da_kh_nt"/>
      <field name="gt_cl_nt"/>
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