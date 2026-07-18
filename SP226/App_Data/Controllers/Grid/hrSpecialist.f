<?xml version="1.0" encoding="utf-8"?>

<grid table="hrdmcm" code="ma_cm" order="ma_cm" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục chuyên môn" e="Speciality List"></title>
  <subTitle v="Cập nhật chuyên môn: thêm, sửa, xóa..." e="Add, Edit, Delete Speciality..."></subTitle>
  <fields>
    <field name="ma_cm" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã chuyên môn" e="Code"></header>
    </field>
    <field name="ten_cm%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên chuyên môn" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_cm"/>
      <field name="ten_cm%l"/>
    </view>
  </views>
</grid>