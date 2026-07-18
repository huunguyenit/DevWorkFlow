<?xml version="1.0" encoding="utf-8"?>

<grid table="hrdmlkn" code="ma_loai" order="ma_loai" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục loại kỹ năng" e="Skill Type List"></title>
  <subTitle v="Cập nhật loại kỹ năng: thêm, sửa, xóa..." e="Add, Edit, Delete Skill Type..."></subTitle>
  <fields>
    <field name="ma_loai" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã loại" e="Type Code"></header>
    </field>
    <field name="ten_loai%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên loại" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_loai"/>
      <field name="ten_loai%l"/>
    </view>
  </views>
</grid>