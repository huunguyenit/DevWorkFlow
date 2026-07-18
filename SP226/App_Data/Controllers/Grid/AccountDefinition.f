<?xml version="1.0" encoding="utf-8"?>

<grid table="kbtknd" code="ma_loai" order="ma_loai" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Khai báo tài khoản ngầm định" e="Account Definition"></title>
  <subTitle v="Cập nhật tài khoản ngầm định: thêm, sửa, xóa..." e="Add, Edit, Delete Account Definition..."></subTitle>

  <fields>
    <field name="ma_loai" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã loại" e="Code"></header>
    </field>
    <field name="ten_loai%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên loại" e="Description"></header>
    </field>
    <field name="ds_tk" width="300" allowSorting="true" allowFilter="true">
      <header v="Danh sách tài khoản" e="Account List"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_loai"/>
      <field name="ten_loai%l"/>
      <field name="ds_tk"/>
    </view>
  </views>

</grid>