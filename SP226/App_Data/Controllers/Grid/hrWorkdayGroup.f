<?xml version="1.0" encoding="utf-8"?>

<grid table="hrdmnhcong" code="ma_nh" order="ma_nh" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục nhóm công" e="Workday Group List"></title>
  <subTitle v="Cập nhật nhóm công: thêm, sửa, xóa..." e="Add, Edit, Delete Workday Group..."></subTitle>
  <fields>
    <field name="ma_nh" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhóm" e="Group Code"></header>
    </field>
    <field name="ten_nh%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên nhóm" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_nh"/>
      <field name="ten_nh%l"/>
    </view>
  </views>
</grid>