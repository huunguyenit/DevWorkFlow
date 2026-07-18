<?xml version="1.0" encoding="utf-8"?>

<grid table="vhrnvql" code="datetime0" order="datetime0" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Điều chuyển người quản lý trực tiếp" e="Direct Supervisor Changing"></title>
  <subTitle v="Điều chuyển người quản lý trực tiếp: thêm..." e="Direct Supervisor Changing: Add..."></subTitle>
  <fields>
    <field name="datetime0" type="DateTime" isPrimaryKey="true" dataFormatString="dd/MM/yyyy HH:mm:ss" width="130" allowSorting="true" allowFilter="true">
      <header v="Ngày thay đổi" e="Change Date"></header>
    </field>
    <field name="nv_ql_cu" width="100" allowSorting="true" allowFilter="true">
      <header v="Quản lý cũ" e="Old Supervisor ID"/>
    </field>
    <field name="ten_ql_cu" width="300" allowSorting="true" allowFilter="true">
      <header v="Họ và tên" e="Old Supervisor Full Name"></header>
    </field>
    <field name="nv_ql_moi" width="100" allowSorting="true" allowFilter="true">
      <header v="Quản lý mới" e="New Supervisor ID"/>
    </field>
    <field name="ten_ql_moi" width="300" allowSorting="true" allowFilter="true">
      <header v="Họ và tên" e="New Supervisor Full Name"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="datetime0"/>
      <field name="nv_ql_cu"/>
      <field name="ten_ql_cu"/>
      <field name="nv_ql_moi"/>
      <field name="ten_ql_moi"/>
    </view>
  </views>

  <toolbar>
    <button command="New">
      <title v="Toolbar.New" e="Toolbar.New"/>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>