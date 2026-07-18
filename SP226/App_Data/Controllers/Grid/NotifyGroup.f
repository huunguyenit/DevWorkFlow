<?xml version="1.0" encoding="utf-8"?>

<grid table="notifygroup" code="code" order="stt, code" database="Sys" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh mục nhóm thông báo" e="Notification Group List"></title>
  <subTitle v="Cập nhật nhóm thông báo: sửa..." e="Edit Notification Group..."></subTitle>

  <fields>
    <field name="stt" width="0" hidden="true">
      <header v="Thứ tự" e="Order"></header>
    </field>
    <field name="code" isPrimaryKey="true" width="100" dataFormatString="X" allowSorting="true" allowFilter="true">
      <header v="Mã nhóm" e="Group Code"></header>
    </field>
    <field name="name%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên nhóm" e="Description"></header>
    </field>

  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="code"/>
      <field name="name%l"/>
    </view>
  </views>

  <toolbar>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"></title>
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