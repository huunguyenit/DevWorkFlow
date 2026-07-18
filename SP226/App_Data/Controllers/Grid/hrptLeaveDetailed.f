<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo chi tiết nhân viên nghỉ phép" e="Leave Detailed Report"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2, %s..." e="Date from %d1 to %d2, %s..."></subTitle>

  <fields>
    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="tt" type="Int16" width="60" dataFormatString="####" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_nv" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ho_ten_nv" width="150" allowSorting="true" allowFilter="true">
      <header v="Họ và tên" e="Employee Full Name"></header>
    </field>
    <field name="ten_vi_tri" width="150" allowSorting="true" allowFilter="true">
      <header v="Vị trí công việc" e="Position"></header>
    </field>
    <field name="ngay_nghi" type="DateTime" dataFormatString="@datetimeFormat" width ="100" allowSorting="true" allowFilter="true">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="so_gio" type="Int16" width="100" dataFormatString="##.00" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số giờ" e="Hours"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="tt"/>
      <field name="ma_nv"/>
      <field name="ho_ten_nv"/>
      <field name="ten_vi_tri"/>
      <field name="ngay_nghi"/>
      <field name="so_gio"/>
    </view>
  </views>

  &XMLStandardReportToolbar;
</grid>