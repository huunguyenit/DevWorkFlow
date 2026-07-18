<?xml version="1.0" encoding="utf-8"?>

<grid table="hrdmttnv" code="ma_ttnv" order="ma_ttnv" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục tình trạng nhân viên" e="Employee Status List"></title>
  <subTitle v="Cập nhật tình trạng nhân viên: thêm, sửa, xóa..." e="Add, Edit, Delete Employee Status..."></subTitle>
  <fields>
    <field name="ma_ttnv" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã tình trạng" e="Status"></header>
    </field>
    <field name="ten_ttnv%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên tình trạng" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_ttnv"/>
      <field name="ten_ttnv%l"/>
    </view>
  </views>
</grid>