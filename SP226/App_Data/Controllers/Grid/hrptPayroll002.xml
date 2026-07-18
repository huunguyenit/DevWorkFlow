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

<grid type="Report" filter="&Repetition.Key.016;" repetition="&Repetition.Key.017;" valid="ma_nv &lt;&gt; ''" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Bảng chi tiết thanh toán lương cho nhân viên theo bộ phận" e="Employee Salary Sheet"></title>
  <subTitle v="Từ kỳ %p1 năm %y1 đến kỳ %p2 năm %y2, bộ phận: %s1 - %s2..." e="From Period %p1 Year %y1 to Period %p2 Year %y2, Department: %s1 - %s2..."></subTitle>
  <pivot rowField="stt_rec" columnField="ma_so" dataFields="gt, gt_nt" indexTable="2" indexColumn="1" indexHeader="2" indexView="4"/>
  <fields>
    <field name="stt2" type="Int16" dataFormatString="####" width="30" allowSorting="true" allowFilter="true" align="right">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_nv" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ten_nv" width="150" allowSorting="true" allowFilter="true">
      <header v="Họ và tên" e="Full Name"></header>
    </field>
    <field name="bo_phan" width="300" allowSorting="true" allowFilter="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="gt" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="" e=""></header>
    </field>
    <field name="gt_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt2"/>
      <field name="ma_nv"/>
      <field name="ten_nv"/>
      <field name="bo_phan"/>
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