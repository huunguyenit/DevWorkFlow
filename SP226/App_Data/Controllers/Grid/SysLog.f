<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterAccess "(name in (select name from userinfo2 where id = @@userID) or (@@admin = 1))">
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vsyslogs" code="id" order="date_time desc, id" database="Sys" filter="&FilterAccess;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Nhật ký hệ thống" e="System Logs"></title>
  <subTitle v="Các thông tin thực hiện chức năng của người sử dụng." e="Detailed information about the user's activities."></subTitle>
  <fields>
    <field name="id" isPrimaryKey="true" width="0" hidden="true" readOnly="true">
      <header v="ID" e="ID"></header>
    </field>
    <field name="date_time" width="125" type="DateTime" dataFormatString="dd/MM/yyyy HH:mm:ss" allowSorting="true" allowFilter="&GridListAllowFilter.Column;">
      <header v="Thời gian" e="Time"></header>
    </field>
    <field name="hostname" width="150" allowSorting="true" allowFilter="true">
      <header v="Địa chỉ truy cập" e="IP Address"></header>
    </field>
    <field name="name" width="120" allowSorting="true" allowFilter="true">
      <header v="Tên" e="Name"></header>
    </field>
    <field name="comment%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên đầy đủ" e="Full Name"></header>
    </field>
    <field name="content%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Thông tin" e="Information"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="id"/>
      <field name="date_time"/>
      <field name="hostname"/>
      <field name="name"/>
      <field name="comment%l"/>
      <field name="content%l"/>
    </view>
  </views>
  <commands>
    <command event ="Showing">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Yu+f/yhn08FbPmfDpBT6nMtmOP9rfDLVjJer6CTnnUSiKw9qJOqVmnuclCuDEJw6o6DLhAYYHs4rn+LF/FmWQRAGLVLNKl9o2GfT/QIOYFLV64H+FS9jJLks0hh0dWZbAPoGRoosSoaelrQC/LA9e9tZhmt2qagm/jwosoIk6VwbpG4kzB95u0pdhEdFXBxs3yvx4wADVpfP5H31eDA63Y=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <toolbar>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>