<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" valid="systotal = 1" filter="sysorder = 5" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Bảng phân bổ chi phí CCDC theo bộ phận" e="Tool &amp; Supply Expenses Allocation by Department Report"/>
  <subTitle v="Từ kỳ %p1 năm %y1 đến kỳ %p2 năm %y2..." e="From Period %p1 Year %y1 to Period %p2 Year %y2..."></subTitle>
  <pivot rowField="tk_pb2" columnField="sysColumn" dataFields="gt_pb_ky, gt_pb_ky_nt" indexTable="2" indexColumn="1" indexHeader="2" indexView="4"/>
  <fields>
    <field name="stt" type="Int16" width="30" allowSorting="true" allowFilter="true" align="right">
      <header v="Stt" e="No."></header>
    </field>
    <field name="tk_pb" width="100" allowSorting="true" allowFilter="true">
      <header v="Tk phân bổ" e="Allo. Account"></header>
    </field>
    <field name="ten_tk_pb" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên tài khoản phân bổ" e="Allocation Account Name"></header>
    </field>
    <field name="ma_bp" width="100" allowSorting="true" allowFilter="true">
      <header v="Bộ phận" e="Department"></header>
    </field>

    <field name="gt_pb_ky" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tiền" e="Amount"></header>
    </field>
    <field name="gt_pb_ky_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tiền nt" e="FC Amount"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="tk_pb"/>
      <field name="ten_tk_pb"/>
      <field name="ma_bp"/>
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