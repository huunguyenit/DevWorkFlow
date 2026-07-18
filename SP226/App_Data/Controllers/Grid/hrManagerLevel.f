<?xml version="1.0" encoding="utf-8"?>

<grid table="hrdmbql" code="ma_bac" order="ma_bac" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục bậc quản lý" e="Job Grade List"></title>
  <subTitle v="Cập nhật bậc quản lý: thêm, sửa, xóa..." e="Add, Edit, Delete Job Grade..."></subTitle>
  <fields>
    <field name="ma_bac" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã bậc" e="Code"></header>
    </field>
    <field name="ten_bac%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên bậc" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_bac"/>
      <field name="ten_bac%l"/>
    </view>
  </views>
</grid>