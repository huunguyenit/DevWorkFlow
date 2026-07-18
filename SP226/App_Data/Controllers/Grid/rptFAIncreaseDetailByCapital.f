<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Repetition SYSTEM "..\Include\Repetition.ent">
  %Repetition;
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" filter="&Repetition.Key.005;&Repetition.And;sysorder &lt; 99" valid="systotal = 1" repetition="&Repetition.Key.006;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo chi tiết tăng TSCĐ theo nguồn vốn" e="Fixed Asset Increase Detail by Capital Report"/>
  <subTitle v="Từ kỳ %p1 năm %y1 đến kỳ %p2 năm %y2..." e="From Period %p1 Year %y1 to Period %p2 Year %y2..."></subTitle>
  <pivot rowField="xRow" columnField="sysColumn" dataFields="nguyen_gia, gt_da_kh, gt_cl, nguyen_gia_nt, gt_da_kh_nt, gt_cl_nt" indexTable="2" indexColumn="1" indexHeader="2" indexView="8"/>
  <fields>
    <field name="stt" type="Int16" width="30" allowSorting="true" allowFilter="true" align="right">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ten_ts" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên tài sản" e="Decription"></header>
    </field>
    <field name="so_the_ts" width="100" allowSorting="true" allowFilter="true">
      <header v="Số thẻ tài sản" e="FA Code"></header>
    </field>
    <field name="ngay_mua" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Ngày tăng" e="Increase Date"></header>
    </field>
    <field name="so_ky_kh" type="Int16" width="60" allowSorting="true" allowFilter="true" align="right">
      <header v="Số kỳ kh" e="Periods"></header>
    </field>
    <field name="ten_tg_ts" width="300" allowSorting="true" allowFilter="true">
      <header v="Lý do" e="Reason"></header>
    </field>
    <field name="ma_nt" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nt" e="Currency Code"></header>
    </field>
    <field name="ty_gia" type="Decimal" width="100" dataFormatString="@exchangeRateViewFormat" allowSorting="true" allowFilter="true">
      <header v="Tỷ giá" e="Exchange Rate"></header>
      <items style="Numeric" />
    </field>
    <field name="nguyen_gia" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Nguyên giá" e="Original Cost"></header>
      <items style="Numeric" />
    </field>
    <field name="gt_da_kh" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Đã khấu hao" e="Accumulated Depr."></header>
      <items style="Numeric" />
    </field>
    <field name="gt_cl" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Còn lại" e="Remain"></header>
      <items style="Numeric" />
    </field>
    <field name="nguyen_gia_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Nguyên giá nt" e="FC Original Cost"></header>
      <items style="Numeric" />
    </field>
    <field name="gt_da_kh_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Đã khấu hao nt" e="FC Accumulated Depr."></header>
      <items style="Numeric" />
    </field>
    <field name="gt_cl_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Còn lại nt" e="FC Remain"></header>
      <items style="Numeric" />
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ten_ts"/>
      <field name="so_the_ts"/>
      <field name="ngay_mua"/>
      <field name="so_ky_kh"/>
      <field name="ten_tg_ts"/>
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