<?xml version="1.0" encoding="utf-8"?>

<grid table="blacklistip" code="ip_address" order="ip_address" database="Sys" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Giới hạn địa chỉ truy cập" e="Limit IP Address"></title>
  <subTitle v="Cập nhật giới hạn địa chỉ truy cập." e="Edit IP Address."></subTitle>

  <fields>
    <field name="ip_address" isPrimaryKey="true" width="150" allowSorting="true" allowFilter="true">
      <header v="Địa chỉ truy cập" e="IP Address"></header>
    </field>
    <field name="dien_giai" width="300" allowSorting="true" allowFilter="true">
      <header v="Diễn giải" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ip_address"/>
      <field name="dien_giai"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb3fo5H/YFkrmgBgukOI3tOqUr2A7uGo01ul+Ia5TiiJVhnJddg2FCvbj8+qk7s6dOse3DIzpg25XWAGumcqMZu0o3ssPBXRIzQN+9P8qxyCXNPQCIEgHhvGulb14jMy+Awrjh12bxrD5xABRxbCEO8YKbYqVbcTjLieeY0SsJ1tA==</encrypted>]]>
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
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>