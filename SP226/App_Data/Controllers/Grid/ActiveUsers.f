<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCurrentlyActiveUsers "name in (select name from userinfo2 with(nolock) where lastaccess is null and lastchange &gt;= dateadd(minute, -60, getdate()))">
]>

<grid table="userinfo2" code="name" order="name" filter="&FilterCurrentlyActiveUsers;" database="Sys" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Thông tin người sử dụng" e="User Information"></title>
  <subTitle v="Danh sách người sử dụng đang thực hiện chương trình trong thời gian gần đây." e="Currently Active Users List."></subTitle>
  <fields>
    <field name="name" isPrimaryKey="true" width="120" allowSorting="true" allowFilter="true">
      <header v="Tên" e="Name"></header>
    </field>
    <field name="comment" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên đầy đủ" e="Full Name"></header>
    </field>
    <field name="lastchange" width="125" type="DateTime" dataFormatString="dd/MM/yyyy HH:mm:ss" allowSorting="true" allowFilter="true">
      <header v="Thời gian" e="Last Request"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="name"/>
      <field name="comment"/>
      <field name="lastchange"/>
    </view>
  </views>

  <toolbar>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>