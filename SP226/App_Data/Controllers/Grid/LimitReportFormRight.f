<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessSite "(@@admin = 1)">
]>

<grid table="vsysreportidright" code="user_id, controller" order="user_id, controller" filter="&FilterCheckAccessSite;" database="Sys" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Giới hạn quyền truy cập cho mẫu in" e="Limit Access Right to Report Templates"></title>
  <subTitle v="Báo cáo: %f0..." e="Report: %f0..."></subTitle>
  <fields>
    <field name="user_id" width="0" isPrimaryKey="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="controller" width="0" isPrimaryKey="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="name" width="100" dataFormatString="@upperCaseFormat" allowFilter="true" allowSorting="true">
      <header v="Người sử dụng" e="User"></header>
    </field>
    <field name="comment" width="300" allowFilter="true" allowSorting="true">
      <header v="Tên đầy đủ" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="user_id"/>
      <field name="controller"/>
      <field name="name"/>
      <field name="comment"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22alPjDnV4JapQMqYNEp52dVk3waJzJqFnYvAIGzHRkQyt0qrlSHwJckZr9bTBqkTU1NJOOMeX2qR0MJDYSvX7KdDenJYRGD7+Zl3YtHFpO5oOxGr84uWvlROwcAODJaW0NruNKuC90iRXuH8Fm2/WZo=</Encrypted>]]>
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