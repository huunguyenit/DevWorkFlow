<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessSite "(@@admin = 1)">
]>

<grid table="vhdrights" code="name" order="name, id_nsd, ma_mau" filter="&FilterCheckAccessSite;" database="Sys" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo ẩn trường cho người sử dụng" e="Hidden Fields Control by User Declaration"></title>
  <subTitle v="Cập nhật khai báo ẩn trường cho người sử dụng: thêm, sửa, xóa..." e="Add, Edit, Delete Hidden Fields Control by User Declaration..."></subTitle>
  <fields>
    <field name="id_nsd" width="50" isPrimaryKey="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="name" width="100" dataFormatString="@upperCaseFormat" allowFilter="true" allowSorting="true">
      <header v="Người sử dụng" e="User"></header>
    </field>
    <field name="comment" width="300" allowFilter="true" allowSorting="true">
      <header v="Tên đầy đủ" e="Description"></header>
    </field>
    <field name="ma_mau" isPrimaryKey="true" width="100" allowFilter="true" allowSorting="true">
      <header v="Mã mẫu" e="Rule Code"></header>
    </field>
    <field name="ten_mau%l" width="300" allowFilter="true" allowSorting="true">
      <header v="Tên mẫu" e="Rule Name"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="id_nsd"/>
      <field name="name"/>
      <field name="comment"/>
      <field name="ma_mau"/>
      <field name="ten_mau%l"/>
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