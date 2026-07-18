<?xml version="1.0" encoding="utf-8"?>

<grid table="hrdmca" code="ma_ca" order="ma_ca" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục ca làm việc" e="Working Shift List"></title>
  <subTitle v="Cập nhật ca làm việc: thêm, sửa, xóa..." e="Add, Edit, Delete Working Shift..."></subTitle>
  <fields>
    <field name="ma_ca" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã ca" e="Code"></header>
    </field>
    <field name="ten_ca%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên ca" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_ca"/>
      <field name="ten_ca%l"/>
    </view>
  </views>
</grid>