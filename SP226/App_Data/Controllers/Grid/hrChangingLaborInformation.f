<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckRight "(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>
<grid table="vhrbhtdtt" code="stt_rec, ngay_hl" order="ma_nv, ngay_hl"  filter="&FilterCheckRight;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật thay đổi thông tin" e="Changing Labor’s Information Input"></title>
  <subTitle v="Cập nhật thay đổi thông tin: thêm, sửa, xóa..." e="Add, Edit, Delete Labor’s Information..."></subTitle>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ngay_hl" type="DateTime" isPrimaryKey="true" allowSorting="true" allowFilter="true" dataFormatString="@datetimeFormat" width="100">
      <header v="Ngày hiệu lực" e="Effective Date" />
    </field>
    <field name="ho_ten" width="150" allowSorting="true" allowFilter="true">
      <header v="Họ và tên" e="Employee Name"></header>
    </field>
    <field name="tn_bhxhtn" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tiền đóng BHXH" e="SI Contribution Amount"></header>
    </field>
    <field name="pt_bhxhtn" width="150" allowSorting="true" allowFilter="true">
      <header v="Phương thức đóng" e="Payment Method"></header>
    </field>
    <field name="noi_dung_khac" width="150" allowSorting="true" allowFilter="true">
      <header v="Nội dung thay đổi" e="Content"></header>
    </field>
    <field name="ho_so_gk" width="150" allowSorting="true" allowFilter="true">
      <header v="Hồ sơ gởi kèm" e="Including Document"></header>
    </field>

    <field name="ghi_chu" width="300" allowSorting="true" allowFilter="true">
      <header v="Ghi chú" e="Note"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ma_nv"/>
      <field name="ho_ten"/>
      <field name="ngay_hl"/>
      <field name="tn_bhxhtn"/>
      <field name="pt_bhxhtn"/>
      <field name="noi_dung_khac"/>
      <field name="ho_so_gk"/>
      <field name="ghi_chu"/>
    </view>
  </views>
</grid>