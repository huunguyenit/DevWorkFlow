<?xml version="1.0" encoding="utf-8"?>

<grid table="mdmky" code="ma_ky" order="ma_ky" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Danh mục kỳ hoạch định" e="Time Bucket List"></title>
  <subTitle v="Cập nhật kỳ hoạch định: thêm, sửa, xóa..." e="Add, Edit, Delete Time Bucket..."></subTitle>

  <fields>
    <field name="ma_ky" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã kỳ" e="Period Code"></header>
    </field>
    <field name="ten_ky%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên kỳ" e="Period Name"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_ky"/>
      <field name="ten_ky%l"/>
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
      <title v="Toolbar.Export" e="Toolbar.Export"/>
    </button>
    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>