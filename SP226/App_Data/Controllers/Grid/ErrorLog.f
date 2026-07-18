<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterAccess "(user_name in (select name from userinfo2 where id = @@userID) or (@@admin = 1 and user_name = ''))">
]>

<grid table="errorlog" database="Sys" code="id" order="datetime0 desc, id" filter="&FilterAccess;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Nhật ký người sử dụng" e="User Logs"></title>
  <subTitle v="Thông tin về lỗi chương trình, truy cập trái phép hệ thống..." e="Detailed information about error messages..."></subTitle>
  <fields>
    <field name="id" width="0" isPrimaryKey="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ip" width="150" allowSorting="true" allowFilter="true">
      <header v="Địa chỉ truy cập" e="IP Adress"></header>
    </field>
    <field name="user_name" width="100" allowSorting="true" allowFilter="true">
      <header v="Người sử dụng" e="User Name"></header>
    </field>
    <field name="datetime0" type="DateTime" dataFormatString="dd/MM/yyyy HH:mm:ss" width="125" allowSorting="true" allowFilter="true">
      <header v="Thời gian" e="Time"></header>
    </field>
    <field name="message" width="450" allowSorting="true" allowFilter="true">
      <header v="Nội dung" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="id"/>
      <field name="ip"/>
      <field name="user_name"/>
      <field name="datetime0"/>
      <field name="message"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Yu+f/yhn08FbPmfDpBT6nMtmOP9rfDLVjJer6CTnnUSiKw9qJOqVmnuclCuDEJw6o6DLhAYYHs4rn+LF/FmWQQlWqzMZKFm8lHH7fsObcCo7+CWDFD6imsK+BCBdq/+4d1xd3H7Ndxgm2zFj362VmQbTYF3FANz5a8D15IF5zcL0e5X6VEQIsJI+I7mB82g3w==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <toolbar>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>