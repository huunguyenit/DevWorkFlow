<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessRight "@@admin = 1 and nguon_dl = (select code from entity where cdata = '@@appDatabaseName') and user_yn = 0">
]>

<grid table="vdmtbnsd" code="ma_quyen, user_id" order="name, user_id, ma_quyen" filter="&FilterCheckAccessRight;" database="Sys" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Phân quyền nhóm người sử dụng" e="Group Access Control"></title>
  <subTitle v="Mã quyền: %s1 - %s2." e="Right: %s1 - %s2."></subTitle>

  <fields>
    <field name="user_id" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_quyen" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã quyền" e="Access Right"></header>
    </field>
    <field name="ten_quyen%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên quyền" e="Description"></header>
    </field>
    <field name="name" width="100" allowSorting="true" allowFilter="true">
      <header v="Nhóm" e="Group"></header>
    </field>
    <field name="comment%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên nhóm" e="Name"></header>
    </field>

  </fields>

  <views>
    <view id="Grid">
      <field name="user_id"/>
      <field name="ma_quyen"/>
      <field name="ten_quyen%l"/>
      <field name="name"/>
      <field name="comment%l"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHvfKT5nJujskDjXDvZeTq+1L/sCYM+/SfUGMhlSZ+Y28aNTCa0ZBIPXgleY8GQbcD5lSafd+bUbxMWS5EcyViUy2VtbgOTnF0EVyr3tcARtmRgUXM0mntdKJ55lEWm4yQ==</Encrypted>]]>
      </text>
    </command>
  </commands>

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
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>