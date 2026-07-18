<?xml version="1.0" encoding="utf-8"?>

<grid table="vuserallowip" code="user_id, ip_address" order="user_id, ip_address" database="Sys" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Giới hạn địa chỉ truy cập của người sử dụng" e="Limit IP Address for Users"></title>
  <subTitle v="Khai báo các địa chỉ giới hạn người sử dụng &lt;span style=&quot;color:green;&quot; &gt;chỉ được phép&lt;/span&gt; truy cập." e="Only defined &lt;span style=&quot;color:green;&quot; &gt;ip addresses are allow&lt;/span&gt; to access."></subTitle>

  <fields>
    <field name="user_id" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="name" width="100" allowSorting="true" allowFilter="true">
      <header v="Người sử dụng" e="User"></header>
    </field>
    <field name="comment%l" width="300" allowFilter="true" allowSorting="true">
      <header v="Tên đầy đủ" e="Description"></header>
    </field>
    <field name="ip_address" isPrimaryKey="true" width="150" allowSorting="true" allowFilter="true">
      <header v="Địa chỉ truy cập" e="IP Address"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="user_id"/>
      <field name="name"/>
      <field name="comment%l"/>
      <field name="ip_address"/>
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