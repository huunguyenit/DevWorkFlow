<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="errorlog" database="Sys" code="id" order="datetime0" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thông tin" e="Information"></title>
  <fields>
    <field name="id" isPrimaryKey="true" allowNulls="false" hidden="true">
      <header v="" e=""/>
    </field>
    <field name="ip" allowNulls="false">
      <header v="Địa chỉ truy cập" e="IP Address"/>
    </field>
    <field name="user_name">
      <header v="Người sử dụng" e="User Name"/>
    </field>
    <field name="datetime0" type="DateTime" dataFormatString="dd/MM/yyyy H:mm:ss" allowNulls="false">
      <header v="Thời gian" e="Time"/>
    </field>
    <field name="message" clientDefault="Default" readOnly="true">
      <header v="Nội dung" e="Description"></header>
    </field>
    <field name="error" rows="10" clientDefault="Default" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="280">
      <item value="120, 30, 70, 40, 60, 230"/>
      <item value="1100: [ip].Label, [ip]"/>
      <item value="1100: [user_name].Label, [user_name]"/>
      <item value="1100: [datetime0].Label, [datetime0], [id]"/>
      <item value="110000: [message].Label, [message]"/>
      <item value="110000: [error].Label, [error]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVY7vkeq16zWb0iPEBUfe411koWW8YL/n1WHmhy8ujtBnQUh/XVUT6JiiTtlNSn+megGo8Tlb4BUxau4CTNgJ95XhKCuPKxu867L7E6QSKXW421pu/mDVqP5RTVDHC5e0MHsJN1CE65vYkP2ORH/s9OkbgQ9qCsq56pkYovm/cgWQM=</encrypted>]]>
    </text>
  </script>
</dir>