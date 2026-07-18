<?xml version="1.0" encoding="utf-8"?>

<grid table="vhrphepnv" filter="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))" code="stt_rec, ngay_hl" order="ma_nv, ngay_hl" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo số phép cộng thêm cho nhân viên" e="Employee Additional Annual Leave"></title>
  <subTitle v="Khai báo số phép cộng thêm cho nhân viên: thêm, sửa, xóa..." e="Add, Edit, Delete Employee Additional Annual Leave..."></subTitle>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ho_ten" width="150" allowSorting="true" allowFilter="true">
      <header v="Họ và tên" e="Employee Name"></header>
    </field>
    <field name="so_phep" type="Decimal" dataFormatString="##0.00" width="100" align="right" allowSorting="true" allowFilter="true">
      <header v="Số ngày" e="Annual Leave"></header>
    </field>
    <field name="ngay_hl" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày hiệu lực" e="Effective Date"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ma_nv"/>
      <field name="ho_ten"/>
      <field name="so_phep"/>
      <field name="ngay_hl"/>
    </view>
  </views>
</grid>