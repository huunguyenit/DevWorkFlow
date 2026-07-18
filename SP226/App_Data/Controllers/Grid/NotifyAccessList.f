<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessRight "@@admin = 1 and nguon_dl = (select code from entity where cdata = '@@appDatabaseName')">
]>

<grid table="vdmquyentb" code="ma_quyen" order="ma_quyen" filter="&FilterCheckAccessRight;" database="Sys" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo quyền sử dụng" e="Access Right List"></title>
  <subTitle v="Cập nhật quyền: thêm, sửa, xóa..." e="Add, Edit, Delete Access Right..."></subTitle>

  <fields>
    <field name="ma_quyen" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã quyền" e="Access Right"></header>
    </field>
    <field name="ten_quyen%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên quyền" e="Description"></header>
    </field>
    <field name="sms" type="Boolean" width="60" allowSorting="true" allowFilter="true">
      <header v="Gửi tin nhắn" e="Send Message"></header>
      <items style="CheckBox"/>
    </field>
    <field name="ds_tb" width="300" allowSorting="true" allowFilter="true">
      <header v="Danh sách mẫu báo cáo" e="Report Template List"></header>
    </field>
    <field name="ma_dvcs" width="300" allowSorting="true" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_quyen"/>
      <field name="ten_quyen%l"/>
      <field name="sms"/>
      <field name="ds_tb"/>
      <field name="ma_dvcs"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHvfKT5nJujskDjXDvZeTq+1L/sCYM+/SfUGMhlSZ+Y28aNTCa0ZBIPXgleY8GQbcD5lSafd+bUbxMWS5EcyViUy2VtbgOTnF0EVyr3tcARtmRgUXM0mntdKJ55lEWm4yQ==</Encrypted>]]>
      </text>
    </command>
  </commands>
</grid>