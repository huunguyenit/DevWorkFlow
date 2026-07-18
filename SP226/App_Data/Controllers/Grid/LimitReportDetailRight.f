<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessSite "(@@admin = 1)">
]>

<grid table="vsysvaluelimitsdetail" code="name" order="name, user_id" filter="&FilterCheckAccessSite;" database="Sys" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Giới hạn chi tiết quyền truy cập cho các báo cáo" e="Limit Detail Access Right to Reports"></title>
  <subTitle v="Khi giới hạn, người sử dụng sẽ không xem các thông tin liên quan đến giá, tiền..." e="Do not allow users to see any columns with price information or amount information..."></subTitle>
  <fields>
    <field name="user_id" width="50" isPrimaryKey="true" hidden="true">
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
      <field name="name"/>
      <field name="comment"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHZ0oyQejAKOjhPui1Zh6zxP9xM3UmV7HEvMqw14jUltMU8Ne/0SbDOuQHgl2hh9grXzQizHaaqpLKcaDvt1+FarlPIMaclSrJHv4++p71OVxD0W5drouSjZsyzVaHPx34tAgU2umqkU51AfPbe6cqh6vQDIihw0dnB3ZpDCH2TO9g==</encrypted>]]>
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
    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>