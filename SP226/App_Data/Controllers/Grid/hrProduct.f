<?xml version="1.0" encoding="utf-8"?>

<grid table="hrdmsp" code="ma_sp" order="ma_sp" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục sản phẩm" e="Product List"></title>
  <subTitle v="Cập nhật sản phẩm: thêm, sửa, xóa..." e="Add, Edit, Delete Product..."></subTitle>
  <fields>
    <field name="ma_sp" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã sản phẩm" e="Product"></header>
    </field>
    <field name="ten_sp%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên sản phẩm" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_sp"/>
      <field name="ten_sp%l"/>
    </view>
  </views>
</grid>