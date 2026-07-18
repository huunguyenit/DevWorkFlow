<?xml version="1.0" encoding="utf-8"?>

<grid table="mpversion" code="loai, code" order="loai, code" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục phiên bản" e="MPS/MRP Version List"></title>
  <subTitle v="Loại: %s" e="Type: %s"></subTitle>

  <fields>
    <field name="loai" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="code" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã phiên bản" e="Version Code"></header>
    </field>
    <field name="name%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên phiên bản" e="Version Name"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="loai"/>
      <field name="code"/>
      <field name="name%l"/>
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
      <title v="Toolbar.Export" e="Toolbar.Export"/>
    </button>
    <button command="-">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>