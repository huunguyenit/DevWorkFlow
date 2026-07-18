<?xml version="1.0" encoding="utf-8"?>

<grid table="hrdmdt" code="ma_dt" order="ma_dt" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục dân tộc" e="Ethnic List"></title>
  <subTitle v="Cập nhật dân tộc: thêm, sửa, xóa..." e="Add, Edit, Delete Ethnic..."></subTitle>
  <fields>
    <field name="ma_dt" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã dân tộc" e="Ethnic"></header>
    </field>
    <field name="ten_dt%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên dân tộc" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_dt"/>
      <field name="ten_dt%l"/>
    </view>
  </views>

</grid>