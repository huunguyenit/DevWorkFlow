<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>
<grid table="hrctsi01" code="stt_rec, stt_rec0" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="SI1" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="hrctsi01" prime="hrctsi01" inquiry="hrisi01" field="ngay_ct" expression="''" increase="{0}" default=""/>
  <fields>
    <field name="ma_nv" external="true" defaultValue="''" width="100" allowNulls="false" aliasName="rtrim(b.ma_nv)" allowContain="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten_nv" key="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}')) and status = '1'" check="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}'))" information="ma_nv$vhrnv.ten"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Bb/qspxo/In64/zacjRF5X0sQs7qjzsK/7ycA1fO/E2hCBritmFMBqCB7q4j2cRoj8JJTybAnIhdrhG1LEorqk=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_nv" readOnly="true" external="true" inactivate="true" width="150" defaultValue="rtrim(ho_nv) + space(1) + rtrim(ten_nv)">
      <header v="Họ và tên" e="Employee Name"></header>
    </field>

    <field name="ma_so" width="100">
      <header v="Mã số" e="Code"></header>
    </field>
    <field name="noi_dung" width="300">
      <header v="Nội dung đề nghị" e="Content"></header>
    </field>
    <field name="nd_cu" width="100">
      <header v="Cũ" e="Old"></header>
    </field>
    <field name="nd_moi" width="100">
      <header v="Mới" e="New"></header>
    </field>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="100">
      <header v="Từ ngày" e="Date from"></header>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="100">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="loai" type="Byte" width="50" dataFormatString="0, 1" clientDefault="1" align="right">
      <header v="Loại" e="Type"></header>
      <items style="Mask"></items>
    </field>
    <field name="can_cu" width="300">
      <header v="Căn cứ điều chỉnh" e="Basis of Change"></header>
    </field>
    <field name="stt_rec_nv" readOnly="true" width="100" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_nv"/>
      <field name="ten_nv"/>
      <field name="ma_so"/>
      <field name="noi_dung"/>
      <field name="nd_cu"/>
      <field name="nd_moi"/>
      <field name="ngay_tu"/>
      <field name="ngay_den"/>
      <field name="loai"/>
      <field name="can_cu"/>

      <field name="stt_rec_nv"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75zYoXBjtLCfuFJhfaX79HdwFAx5OVbQ+jTUUESwFkfYbPs3P9K5Y+XULO/oJbfc57BB1xGnusZZZlkvf/JskCbaz6VqXVVlG/IxWEuUNoazi</Encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL756/JB6dPeVkwCfYuq8ju3IgTyvaYmP5SXM3CTuGAFlasExTxCBQbPEXIWZA/Ry229hH4j2n/gnYZn8ybEUcQSpI=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ6AUMZqevdhU1w9/FmVctxKaiCJDPkl9c450L/15/d9Lpb9GxPgsFMkAY0IboiRenoxYDp+1+4HHoahZY5/ecN1u62BqDrI1i/vRWWBqtw6Y57PpLproJXneWHMO9kOIDiAKFnFsJxgPCCHhQ/AZqJb4QpiVkNgfOFVXYjWyUAp+y9TlMzAB8+JR/R1bqE+nD0ZNMqVe58Vo7/eJRq/LxBqwBM439ZMm5D3V9sX98HU/RN7WnAe84Kpib7Ae8s2Ed6rskLpzq3+30KL7JzGusSOdHUoDgsgGKRykq7ZeNv2C0oAFkgtOJUaXDEgYlbuuF0nuwSlVpcznuL/vrjQvsQfSIoA1TTItZC/br1up2aFVUbZOADDBMooChJn4QXD88an6WXYtr0neeOFEb8iimsNTARY/qSWRTyUAsDNl2mfM4Ho2RB4PE8Q0yHTa64NGGyOmAkQIE4NF4bm0yk+u3bV9vqYu0Fcp36dZK3s+bWKYA==</Encrypted>]]>
    </text>
  </script>
  <response>
    <action id="EmployeeID">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5p1ONhnQ/dVeNDqmQY5tBTf9gniI5ZdZXG2dYHCvwCWNRE7oibOz15UAauBnUtmvG2plJ0n8VduM9zqgaRb4YlgHc2QW3PV5HfWGJB4RT7LQ==</Encrypted>]]>
      </text>
    </action>
  </response>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/KWW0H3wllwc+j4G03oLj1B66Jra2RsWCSZPM3/TkJSE9lpqvYo/pe/te+bQwVILLwzF5t8H+o2aDrlhsSVUOj7FY5xC6hGAgmDthcTLiWbCP6pNGeN2kn65iDBon81iuWeM48jJfKzeUOHpAhoim3</Encrypted>]]>
      </text>
    </query>
  </queries>

  &XMLStandardDetailToolbar;
</grid>