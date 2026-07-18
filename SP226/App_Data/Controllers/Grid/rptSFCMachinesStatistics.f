<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" valid="systotal = 1" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Thống kê máy móc" e="Machine Statistics"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="stt" type="Int16" width="30" dataFormatString="### ###" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_px" width="100" allowSorting="true" allowFilter="true">
      <header v="Phân xưởng" e="Shop"></header>
    </field>
    <field name="ma_lsx" width="100" allowSorting="true" allowFilter="true">
      <header v="Yêu cầu sản xuất" e="Work Order"></header>
    </field>
    <field name="ma_cd" width="100" allowSorting="true" allowFilter="true">
      <header v="Công đoạn" e="Operation"></header>
    </field>
    <field name="ten_gd" width="100" allowSorting="true" allowFilter="true">
      <header v="Giao dịch" e="Transaction"></header>
    </field>
    <field name="ngay_ct" type="DateTime" width="80" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="so_ct" width="80" allowSorting="true" allowFilter="true" align="right">
      <header v="Số ct" e="Voucher No."></header>
    </field>
    <field name="ma_ca" width="100" allowSorting="true" allowFilter="true">
      <header v="Ca" e="Working Shift"></header>
    </field>
    <field name="ma_may" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã máy" e="Machine Code"></header>
    </field>
    <field name="ten_may" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên máy" e="Machine Name"></header>
    </field>
    <field name="gio_bd" dataFormatString="HH:ss" align="right" width="60" allowSorting="true" allowFilter="true">
      <header v="Bắt đầu" e="Start"></header>
    </field>
    <field name="gio_kt" dataFormatString="HH:ss" align="right" width="60" allowSorting="true" allowFilter="true">
      <header v="Kết thúc" e="End"></header>
    </field>
    <field name="so_gio" type="Decimal" dataFormatString="#0.00" width="60" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Số giờ" e="Hours"></header>
    </field>
    <field name="systotal" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma_px"/>
      <field name="ma_lsx"/>
      <field name="ma_cd"/>
      <field name="ten_gd"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>
      <field name="ma_ca"/>
      <field name="ma_may"/>
      <field name="ten_may"/>
      <field name="gio_bd"/>
      <field name="gio_kt"/>
      <field name="so_gio"/>

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