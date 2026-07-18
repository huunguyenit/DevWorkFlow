<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 and (@@table.id in (select id from @@table where user_yn = 0)))">
]>

<grid table="userinfo2" code="name" order="name, id" filter="&FilterCheckAccessUnit;" database="Sys" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo nhóm sử dụng" e="Group Maintenance"></title>
  <subTitle v="Cập nhật nhóm sử dụng: thêm, sửa, xóa..." e="Add, Edit, Delete User..."></subTitle>

  <fields>
    <field name="id" width="80" hidden="true" readOnly="true">
      <header v="Mã số" e="Id"></header>
    </field>
    <field name="name" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Nhóm" e="Group"></header>
    </field>
    <field name="comment%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên nhóm" e="Description"></header>
    </field>
    <field name="user_lst" width="300" allowSorting="true" allowFilter="true">
      <header v="Danh sách người sử dụng" e="User List"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="id"/>
      <field name="name"/>
      <field name="comment%l"/>
      <field name="user_lst"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6i0eHBHOVNNUA1QFUCgPtmy7sWynJX+gBPDXfC5ijRCaIz0x2ysNEYPhF8XKbpLCbvEoZqjIDi3oICK3U0ZQ9qbpuHH/aTbkkisJQlLIPIXdnQqkm4YRY4zH2CIqx7h8k+</Encrypted>]]>
      </text>
    </command>
  </commands>
</grid>