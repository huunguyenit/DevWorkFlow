<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY FilterCheckRight "(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))">
]>
<grid table="vhrbdld" filter="&FilterCheckRight;" code="ngay_ps, stt_rec" order="ngay_ps asc, ma_nv" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật thông báo biến động lao động" e="Labor Fluctuation Input"></title>
  <subTitle v="Cập nhật thông báo biến động lao động: mới, sửa, xóa..." e="Add New, Edit, Delete Labor Fluctuation..."></subTitle>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ps" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Ngày phát sinh" e="Fluctuation Date"></header>
    </field>
    <field name="ma_nv" width="100" allowSorting="true" allowFilter="true">
      <header v="Nhân viên" e="Employee"></header>
    </field>
    <field name="ho_ten" width="150" allowSorting="true" allowFilter="true">
      <header v="Họ và tên" e="Employee Name"></header>
    </field>
    <field name="tg_bhtn" width="200" allowSorting="true" allowFilter="true">
      <header v="Thời gian tham gia BHTN" e="UI Joining Time"></header>
    </field>
    <field name="ht_cu" width="200" allowSorting="true" allowFilter="true">
      <header v="Hình thức giao kết cũ" e="Old Commitment"></header>
    </field>
    <field name="ht_moi" width="200" allowSorting="true" allowFilter="true">
      <header v="Hình thức giao kết mới" e="New Commitment"></header>
    </field>
    <field name="ngay_th_tu" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Tạm hoãn từ" e="Susp. Date from"></header>
    </field>
    <field name="ngay_th_den" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Đến" e="To"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ngay_ps"/>
      <field name="ma_nv"/>
      <field name="ho_ten"/>
      <field name="tg_bhtn"/>
      <field name="ht_cu"/>
      <field name="ht_moi"/>
      <field name="ngay_th_tu"/>
      <field name="ngay_th_den"/>
    </view>
  </views>
</grid>