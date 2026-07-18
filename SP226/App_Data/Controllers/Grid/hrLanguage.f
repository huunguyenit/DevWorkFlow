<?xml version="1.0" encoding="utf-8"?>

<grid table="hrdmnn" code="ma_nn" order="ma_nn" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục ngoại ngữ" e="Language List"></title>
  <subTitle v="Cập nhật ngoại ngữ: thêm, sửa, xóa..." e="Add, Edit, Delete Language..."></subTitle>
  <fields>
    <field name="ma_nn" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã ngoại ngữ" e="Language"></header>
    </field>
    <field name="ten_nn%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên ngoại ngữ" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_nn"/>
      <field name="ten_nn%l"/>
    </view>
  </views>
</grid>