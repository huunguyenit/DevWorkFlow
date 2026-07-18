<?xml version="1.0" encoding="utf-8"?>

<grid table="vcntb" code="ma_tb" order="datetime0" filter="user_id0 = @@userID" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật thông báo" e="Notification Entry"></title>
  <subTitle v="Cập nhật thông báo: thêm, sửa, xóa..." e="New, Edit, Delete Notification..."></subTitle>

  <fields>
    <field name="ma_tb" isPrimaryKey="true" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="datetime0" type="DateTime" dataFormatString="dd/MM/yyyy HH:mm" width="120" allowFilter="true">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="tieu_de" width="300" allowSorting="true" allowFilter="true">
      <header v="Tiêu đề" e="Title"></header>
    </field>
    <field name="user_name" width="100" allowSorting="true" allowFilter="true">
      <header v="Người nhận" e="Recipient"></header>
    </field>
    <field name="comment%l" width="300" allowFilter="true" allowSorting="true">
      <header v="Tên đầy đủ" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_tb"/>
      <field name="datetime0"/>
      <field name="tieu_de"/>
      <field name="user_name"/>
      <field name="comment%l"/>
    </view>
  </views>

</grid>