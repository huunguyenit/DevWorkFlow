<?xml version="1.0" encoding="utf-8"?>

<grid table="hrdmkt" code="ma_kt" order="ma_kt" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục khen thưởng" e="Award List"></title>
  <subTitle v="Cập nhật khen thưởng: thêm, sửa, xóa..." e="Add, Edit, Delete Award..."></subTitle>
  <fields>
    <field name="ma_kt" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã khen thưởng" e="Award"></header>
    </field>
    <field name="ten_kt%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên khen thưởng" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_kt"/>
      <field name="ten_kt%l"/>
    </view>
  </views>
</grid>