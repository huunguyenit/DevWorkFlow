<?xml version="1.0" encoding="utf-8"?>

<grid table="hrdmloaidtbh" code="ma_loai" order="ma_loai" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục loại đối tượng" e="Type of Participant"></title>
  <subTitle v="Cập nhật loại đối tượng: thêm, sửa, xóa..." e="Add, Edit, Delete Type of Participant..."></subTitle>
  <fields>
    <field name="ma_loai" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Loại đối tượng" e="Code"></header>
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