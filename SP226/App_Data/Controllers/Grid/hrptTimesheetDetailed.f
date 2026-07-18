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
  <title v="Bảng kê chi tiết kết quả chấm công" e="Detailed Time Record Sheet"></title>
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
    <field name="ngay" type="DateTime" dataFormatString="@datetimeFormat" width ="100" allowSorting="true" allowFilter="true">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="ma_ca" width="100" allowSorting="true" allowFilter="true">
      <header v="Ca" e="Shift"></header>
    </field>
    <field name="ma_ca_ct" width="100" allowSorting="true" allowFilter="true">
      <header v="Chi tiết ca" e="Detail Shift"></header>
    </field>
    <field name="s_ngay_cham_tu" width ="120" allowSorting="true" align="center" allowFilter="true">
      <header v="Giờ chấm công vào" e="Actual Time In"></header>
    </field>
    <field name="s_ngay_cham_den" width ="120" allowSorting="true" align="center" allowFilter="true">
      <header v="Giờ chấm công ra" e="Actual Time Out"></header>
    </field>
    <field name="s_ngay_tinh_tu" width ="120" allowSorting="true" align="center" allowFilter="true">
      <header v="Giờ tính công vào" e="Regular Time In"></header>
    </field>
    <field name="s_ngay_tinh_den" width ="120" allowSorting="true" align="center" allowFilter="true">
      <header v="Giờ tính công ra" e="Regular Time Out"></header>
    </field>
    <field name="so_gio" type="Int16" width="100" dataFormatString="# ### ### ###.00" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số giờ" e="Hours"></header>
    </field>
    <field name="ma_cong" width="100" allowSorting="true" allowFilter="true">
      <header v="Công" e="Workday"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="stt"/>
      <field name="ma_nv"/>
      <field name="ho_ten_nv"/>
      <field name="ten_bp"/>
      <field name="ngay"/>
      <field name="ma_ca"/>
      <field name="ma_ca_ct"/>
      <field name="s_ngay_cham_tu"/>
      <field name="s_ngay_cham_den"/>
      <field name="s_ngay_tinh_tu"/>
      <field name="s_ngay_tinh_den"/>
      <field name="so_gio"/>
      <field name="ma_cong"/>
    </view>
  </views>

  &XMLStandardReportToolbar;
</grid>