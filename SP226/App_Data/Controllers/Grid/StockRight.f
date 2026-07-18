<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessSite "(@@admin = 1)">
]>

<grid table="vsysstockrights" code="name" order="name" filter="&FilterCheckAccessSite;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Phân quyền truy cập theo số liệu thực tế và số liệu hóa đơn" e="Access Right by Physical Stock and Books"></title>
  <subTitle v="Phân quyền truy cập theo số liệu thực tế và số liệu hóa đơn: thêm, sửa, xóa..." e="Add, Edit, Delete Access Right by Physical Stock and Books..."></subTitle>
  <fields>
    <field name="user_id" width="50" isPrimaryKey="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="name" width="100" dataFormatString="@upperCaseFormat" allowFilter="true" allowSorting="true">
      <header v="Người sử dụng" e="User"></header>
    </field>
    <field name="comment%l" width="300" allowFilter="true" allowSorting="true">
      <header v="Tên đầy đủ" e="Description"></header>
    </field>
    <field name="tt_yn" type="Boolean" width="100" allowFilter="true" allowSorting="true">
      <header v="Số liệu thực tế" e="Physics"></header>
    </field>
    <field name="hd_yn" type="Boolean" width="100" allowFilter="true" allowSorting="true">
      <header v="Số liệu hóa đơn" e="Book"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="user_id"/>
      <field name="name"/>
      <field name="comment%l"/>
      <field name="tt_yn"/>
      <field name="hd_yn"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHZ0oyQejAKOjhPui1Zh6zxP9xM3UmV7HEvMqw14jUltMU8Ne/0SbDOuQHgl2hh9grXzQizHaaqpLKcaDvt1+FarlPIMaclSrJHv4++p71OVxD0W5drouSjZsyzVaHPx34tAgU2umqkU51AfPbe6cqh6vQDIihw0dnB3ZpDCH2TO9g==</encrypted>]]>
      </text>
    </command>
  </commands>
</grid>