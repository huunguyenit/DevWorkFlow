<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "@@admin = 1 and user_yn = 0">
]>

<grid table="userinfo2" code="name, id" order="name, id" filter="&FilterCheckAccessUnit;" database="Sys" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Nhóm người sử dụng" e="User Group"></title>
  <subTitle v="Cập nhật giới hạn quyền truy cập cho nhóm người sử dụng" e="Limit Access Right to User Groups"></subTitle>

  <fields>
    <field name="id" type="Int32" align="left" width="80" allowSorting="true" allowFilter="true">
      <header v="Mã số" e="Id"></header>
    </field>
    <field name="name" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Tên" e="Name"></header>
    </field>
    <field name="comment%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên đầy đủ" e="Full name"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="id"/>
      <field name="name"/>
      <field name="comment%l"/>
    </view>
  </views>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7x3hzVjb+R6o+3hwXnmae14JAkAufuEojlgYrzY6gVLD/0tEU2x1w+6TBAK8b/TvvVYUCF/Mn6lWy6hUttxIN8/G+/s79MXLNi7UDKBg4736QGfF05Xka6qZEDfdjJBR9PG9ijY+LEZxTMthH45u7fQvBJq+Vr50jBIuMWsoor+p6VHeEjh3/aeOVx/IhqlBQ==</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Edit">
      <title v="Giới hạn (Ctrl + E)$$120" e="Toolbar.Edit"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>