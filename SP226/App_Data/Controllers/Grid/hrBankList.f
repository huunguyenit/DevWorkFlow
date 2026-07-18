<?xml version="1.0" encoding="utf-8"?>

<grid table="hrdmnh" code="ma_nh" order="ma_nh" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Danh mục ngân hàng" e="Bank List"></title>
  <subTitle v="Cập nhật ngân hàng: thêm, sửa, xóa..." e="Add, Edit, Delete Bank..."></subTitle>

  <fields>
    <field name="ma_nh" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã ngân hàng" e="Bank"></header>
    </field>
    <field name="ten_nh%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên ngân hàng" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_nh"/>
      <field name="ten_nh%l"/>
    </view>
  </views>

</grid>