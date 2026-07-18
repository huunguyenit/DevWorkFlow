<?xml version="1.0" encoding="utf-8"?>

<grid table="hrdmmh" code="ma_mh" order="ma_mh" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục môn học" e="Subject List"></title>
  <subTitle v="Cập nhật môn học: thêm, sửa, xóa..." e="Add, Edit, Delete Subject..."></subTitle>
  <fields>
    <field name="ma_mh" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã môn học" e="Subject Code"></header>
    </field>
    <field name="ten_mh%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên môn học" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_mh"/>
      <field name="ten_mh%l"/>
    </view>
  </views>
</grid>