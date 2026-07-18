<?xml version="1.0" encoding="utf-8"?>

<grid table="hdrules" code="ma_mau" order="ma_mau" database="Sys" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Khai báo ẩn các trường" e="Hidden Fields Rule"></title>
  <subTitle v="Cập nhật khai báo ẩn các trường: thêm, sửa, xóa..." e="Add, Edit, Delete Hidden Fields Rule..."></subTitle>

  <fields>
    <field name="ma_mau" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã mẫu" e="Code"></header>
    </field>
    <field name="ten_mau%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên mẫu" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_mau"/>
      <field name="ten_mau%l"/>
    </view>
  </views>

  <toolbar>
    <button command="New">
      <title v="Toolbar.New" e="Toolbar.New"></title>
    </button>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"></title>
    </button>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"></title>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>