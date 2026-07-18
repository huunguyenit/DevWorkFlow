<?xml version="1.0" encoding="utf-8"?>

<grid table="v20covvct1" code="form, stt, ma_so" order="form, stt, ma_so" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo mẫu KQ SXKD theo công trình, vụ việc" e="Income Statement by Job Declaration"></title>
  <subTitle v="Cập nhật chỉ tiêu: thêm, sửa, xóa..." e="Add, Edit, Delete Item..."></subTitle>

  <fields>
    <field name="form" isPrimaryKey="true" width="" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt" isPrimaryKey="true" width="60" align="right" allowFilter="true" allowSorting="true">
      <header v="Stt" e="Number"></header>
    </field>
    <field name="ma_so" isPrimaryKey="true" width="100" allowFilter="true" allowSorting="true">
      <header v="Mã số" e="Code"></header>
    </field>
    <field name="ten%l" width="300" allowFilter="true" allowSorting="true">
      <header v="Tên" e="Name"></header>
    </field>
    <field name="ma_vvct" width="100" allowFilter="true" allowSorting="true">
      <header v="Chỉ tiêu" e="Norm"></header>
    </field>
    <field name="cach_tinh" width="300" allowFilter="true" allowSorting="true">
      <header v="Công thức" e="Formula"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="form"/>
      <field name="stt"/>
      <field name="ma_so"/>

      <field name="ten%l"/>
      <field name="ma_vvct"/>
      <field name="cach_tinh"/>
    </view>
  </views>
</grid>