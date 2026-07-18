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

<grid type="Report" filter="&Repetition.Key.007;" repetition="&Repetition.Key.008;" valid="systotal = 1" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo tình trạng lệnh sản xuất" e="Production Status"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="stt" type="Int16" width="30" dataFormatString="### ###" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma" width="100" allowSorting="true" allowFilter="true">
      <header v="Lsx/Sp/Ycsx" e="MO/Product/WO"></header>
    </field>
    <field name="ten" width="300" allowSorting="true" allowFilter="true">
      <header v="Diễn giải" e="Description"></header>
    </field>

    <field name="ngay_ct" type="DateTime" width="80" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày ct" e="VC. Date"></header>
    </field>
    <field name="ngay_bd" type="DateTime" width="80" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày bắt đầu" e="Start Date"></header>
    </field>
    <field name="ngay_kt" type="DateTime" width="80" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày kết thúc" e="Due Date"></header>
    </field>

    <field name="sl_yc" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số lượng yêu cầu" e="Order Quantity"></header>
    </field>
    <field name="sl_th" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số lượng thực hiện" e="Run Quantity"></header>
    </field>

    <field name="tinh_trang" width="120" allowFilter="true" allowSorting="true">
      <header v="Trạng thái" e="WO Status"/>
    </field>
    <field name="systotal" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma"/>
      <field name="ten"/>
      <field name="ngay_ct"/>
      <field name="ngay_bd"/>
      <field name="ngay_kt"/>
      <field name="sl_yc"/>
      <field name="sl_th"/>
      <field name="tinh_trang"/>
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