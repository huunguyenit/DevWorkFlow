<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo thống kê số lần đi muộn, về sớm" e="Employee Late In/ Early Out Statistics"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>

  <fields>
    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt" type="Int16" width="60" dataFormatString="####" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_nv" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ho_ten_nv" width="150" allowSorting="true" allowFilter="true">
      <header v="Họ và tên" e="Employee Full Name"></header>
    </field>
    <field name="ten_bp" width="300" allowSorting="true" allowFilter="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="sl_di_muon" type="Int16" width="120" dataFormatString="# ### ###" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Số lần đi muộn" e="Late In Times"></header>
    </field>
    <field name="sp_di_muon" type="Int16" width="120" dataFormatString="# ### ###" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Số phút đi muộn" e="Late In Minutes"></header>
    </field>
    <field name="sl_ve_som" type="Int16" width="120" dataFormatString="# ### ###" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Số lần về sớm" e="Early Out Times"></header>
    </field>
    <field name="sp_ve_som" type="Int16" width="120" dataFormatString="# ### ###" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Số phút về sớm" e="Early Out Minutes"></header>
    </field>
    <field name="t_so_lan" type="Int16" width="120" dataFormatString="# ### ###" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tổng số lần" e="Total Times"></header>
    </field>
    <field name="t_so_phut" type="Int16" width="120" dataFormatString="# ### ###" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tổng số phút" e="Total Minutes"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="stt"/>
      <field name="ma_nv"/>
      <field name="ho_ten_nv"/>
      <field name="ten_bp"/>
      <field name="sl_di_muon"/>
      <field name="sp_di_muon"/>
      <field name="sl_ve_som"/>
      <field name="sp_ve_som"/>
      <field name="t_so_lan"/>
      <field name="t_so_phut"/>
    </view>
  </views>

  &XMLStandardReportToolbar;
</grid>