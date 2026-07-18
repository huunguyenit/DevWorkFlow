<?xml version="1.0" encoding="utf-8"?>

<grid table="vdmhttthddt" code="code, ma_tt" order="code, ma_tt" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo hình thức thanh toán" e="Payment Method List"></title>
  <subTitle v="Cập nhật khai báo hình thức thanh toán: thêm, sửa, xóa..." e="Add, Edit, Delete Payment Method..."></subTitle>

  <fields>
    <field name="code" isPrimaryKey="true" hidden="true" width="0">
      <header v="Nhà cung cấp" e="Provider"></header>
    </field>
    <field name="ma_tt" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã thanh toán" e="Payment Terms"></header>
    </field>
    <field name="ten_ngan%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Hình thức thanh toán" e="Payment Method"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="code"/>
      <field name="ma_tt"/>
      <field name="ten_ngan%l"/>
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
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>

    <button command="Separate">
      <title v="-" e="-"/>
    </button>

    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>