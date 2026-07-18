<?xml version="1.0" encoding="utf-8"?>

<grid table="vhrrmhttt" code="ma_ht" order="ma_ht" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo hình thức thi tuyển" e="Examination Form"></title>
  <subTitle v="Khai báo hình thức thi tuyển: thêm, sửa, xóa..." e="Add, Edit, Delete Examination Form..."></subTitle>

  <fields>
    <field name="ma_ht" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã hình thức" e="Form Code"></header>
    </field>
    <field name="ten_ht%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên hình thức" e="Form Name"></header>
    </field>
    <field name="ma_vtr" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã vị trí" e="Vacancy"></header>
    </field>
    <field name="ten_vtr%l" width="150" allowSorting="true" allowFilter="true">
      <header v="Vị trí tuyển dụng" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_ht"/>
      <field name="ten_ht%l"/>
      <field name="ma_vtr"/>
      <field name="ten_vtr%l"/>
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
    <button command="Clone">
      <title v="Toolbar.Copy" e="Toolbar.Copy"></title>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>