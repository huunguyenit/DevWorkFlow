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

<grid type="Report" filter="&Repetition.Key.001;" valid="systotal = 1" repetition="&Repetition.Key.013;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Bảng bút toán phân bổ định kỳ" e="Periodic Allocation Entry Report"></title>
  <subTitle v="Từ kỳ %p1 năm %y1 đến kỳ %p2 năm %y2..." e="From Period %p1 Year %y1 to Period %p2 to Year %y2..."></subTitle>
  <fields>
    <field name="stt" type="Int16" width="30" dataFormatString="# ###" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_bt" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã bút toán" e="Entry"></header>
    </field>
    <field name="ten_bt%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên bút toán" e="Description"></header>
    </field>

    <field name="so_ky_pb" type="Decimal" dataFormatString="# ###" width="100" allowSorting="true" allowFilter="true">
      <header v="Số kỳ pb" e="Allocation Period(s)"></header>
    </field>
    <field name="ngay_bd" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowSorting="true" allowFilter="true">
      <header v="Ngày bắt đầu" e="Start Date"></header>
    </field>

    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Column;" aggregate="Sum">
      <header v="Giá trị nt" e="FC Value"></header>
    </field>
    <field name="tien_pb_ky_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Column;" aggregate="Sum">
      <header v="Gt pb kỳ nt" e="FC Allocation Value"></header>
    </field>
    <field name="tien_pb_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Column;" aggregate="Sum">
      <header v="Gt đã pb nt" e="FC Allocated Amount"></header>
    </field>
    <field name="tien_cl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Column;" aggregate="Sum">
      <header v="Gt còn lại nt" e="FC Current Value"></header>
    </field>

    <field name="ma_nt" width="60" allowSorting="true" allowFilter="true">
      <header v="Mã nt" e="FC Code"></header>
    </field>


    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Column;" aggregate="Sum">
      <header v="Giá trị" e="Value"></header>
    </field>
    <field name="tien_pb_ky" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Column;" aggregate="Sum">
      <header v="Gt pb kỳ" e="Allocation Value"></header>
    </field>
    <field name="tien_pb" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Column;" aggregate="Sum">
      <header v="Gt đã pb" e="Allocated Amount"></header>
    </field>
    <field name="tien_cl" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Column;" aggregate="Sum">
      <header v="Gt còn lại" e="Current Value"></header>
    </field>

  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma_bt"/>
      <field name="ten_bt%l"/>

      <field name="so_ky_pb"/>
      <field name="ngay_bd"/>

      <field name="tien_nt"/>
      <field name="tien_pb_ky_nt"/>
      <field name="tien_pb_nt"/>
      <field name="tien_cl_nt"/>

      <field name="ma_nt"/>

      <field name="tien"/>
      <field name="tien_pb_ky"/>
      <field name="tien_pb"/>
      <field name="tien_cl"/>
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