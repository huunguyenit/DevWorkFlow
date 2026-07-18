<?xml version="1.0" encoding="utf-8"?>

<grid table="xdmnhyt" code="ma_nh" order="ma_nh" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục nhóm yếu tố" e="Cost Factor Group List"></title>
  <subTitle v="Cập nhật nhóm yếu tố: thêm, sửa, xóa..." e="Add, Edit, Delete Cost Factor Group..."></subTitle>
  <fields>
    <field name="ma_nh" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhóm" e="Code"></header>
    </field>
    <field name="ten_nh%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên nhóm" e="Description"></header>
    </field>
    <field name="ten_ngan%l" width="150" allowSorting="true" allowFilter="true">
      <header v="Tên ngắn" e="Short Description"></header>
    </field>
  </fields>
  <views>
    <view id="Grid">
      <field name="ma_nh"/>
      <field name="ten_nh%l"/>
      <field name="ten_ngan%l"/>
    </view>
  </views>
</grid>