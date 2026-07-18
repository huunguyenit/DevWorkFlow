<?xml version="1.0" encoding="utf-8"?>

<grid table="vhrctloailuong" filter="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))" code="ma_bp, ma_cong" order="ma_bp, ma_cong" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo chi tiết loại lương theo công" e="Salary Category by Workday"></title>
  <subTitle v="Cập nhật chi tiết loại lương theo công: thêm, sửa, xóa..." e="Add, Edit, Delete Salary Category by Workday..."></subTitle>
  <fields>
    <field name="ma_bp" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã bộ phận" e="Department"></header>
    </field>
    <field name="ten_bp%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên bộ phận" e="Description"></header>
    </field>
    <field name="ma_cong" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã công" e="Workday"></header>
    </field>
    <field name="ten_cong%l" width="0" allowSorting="true" allowFilter="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="loai_luong" width="100" allowSorting="true" allowFilter="true">
      <header v="Loại lương" e="Category"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_bp"/>
      <field name="ten_bp%l"/>
      <field name="ma_cong"/>
      <field name="ten_cong%l"/>
      <field name="loai_luong"/>
    </view>
  </views>
</grid>