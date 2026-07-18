<?xml version="1.0" encoding="utf-8"?>

<grid table="hrdmtthn" code="ma_tthn" order="ma_tthn" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục tình trạng hôn nhân" e="Marital Status List"></title>
  <subTitle v="Cập nhật tình trạng hôn nhân: thêm, sửa, xóa..." e="Add, Edit, Delete Marital Status..."></subTitle>
  <fields>
    <field name="ma_tthn" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã tình trạng" e="Marital Status"></header>
    </field>
    <field name="ten_tthn%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên tình trạng" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_tthn"/>
      <field name="ten_tthn%l"/>
    </view>
  </views>
</grid>