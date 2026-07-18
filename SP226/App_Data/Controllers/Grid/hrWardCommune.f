<?xml version="1.0" encoding="utf-8"?>

<grid table="hrdmphuong" code="ma_tinh, ma_quan, ma_phuong" order="ma_tinh, ma_quan, ma_phuong" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục phường/xã" e="Ward/Commune List"></title>
  <subTitle v="Cập nhật phường/xã: thêm, sửa, xóa..." e="Add, Edit, Delete Ward/Commune..."></subTitle>

  <fields>
    <field name="ma_tinh" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã tỉnh/thành" e="Province/City"></header>
    </field>
    <field name="ma_quan" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã quận/huyện" e="District"></header>
    </field>
    <field name="ma_phuong" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã phường/xã" e="Ward/Commune"></header>
    </field>
    <field name="ten_phuong%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên phường/xã" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_tinh"/>
      <field name="ma_quan"/>
      <field name="ma_phuong"/>
      <field name="ten_phuong%l"/>
    </view>
  </views>

</grid>