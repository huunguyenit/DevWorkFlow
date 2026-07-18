<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">

  <!ENTITY % Repetition SYSTEM "..\Include\Repetition.ent">
  %Repetition;
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" filter="&Repetition.Key.001;" valid="systotal = 1" repetition="&Repetition.Key.002;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Bảng chi tiết thu nhập, giảm trừ cho nhân viên theo bộ phận" e="Employee Incomes, Deductions Detailed Sheet"></title>
  <subTitle v="Từ kỳ %p1 năm %y1 đến kỳ %p2 năm %y2, bộ phận: %bp..." e="From Period %p1 Year %y1 to Period %p2 Year %y2, Department: %bp..."></subTitle>
  <pivot rowField="stt_rec" columnField="loai" dataFields="tien, tien_nt" indexTable="2" indexColumn="1" indexHeader="2" indexView="3"/>
  <fields>
    <field name="stt" type="Int16" width="30" dataFormatString="# ###" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_nv" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ten_nv" width="150" allowSorting="true" allowFilter="true">
      <header v="Họ và tên" e="Full Name"/>
    </field>
    <field name="tien" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tiền" e="Amount"></header>
    </field>
    <field name="tien_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tiền ngoại tệ" e="FC Amount"></header>
    </field>
    <field name="systotal" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma_nv"/>
      <field name="ten_nv"/>
      <field name="systotal"/>
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