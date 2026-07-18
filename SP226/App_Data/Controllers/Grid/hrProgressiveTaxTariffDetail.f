<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>

<grid table="d06$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="CN1" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c06$000000" prime="d06$" inquiry="i06$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="ma_nv" external="true" defaultValue="''" width="100" allowNulls="false" aliasName="rtrim(b.ma_nv)" allowContain="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="hrPITEmployee" reference="ten_nv" key="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}')) and status = '1'" check="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}'))" information="ma_nv$vhrpitnv.ten"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Bb/qspxo/In64/zacjRF5X0sQs7qjzsK/7ycA1fO/E2hCBritmFMBqCB7q4j2cRoj8JJTybAnIhdrhG1LEorqk=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_nv" readOnly="true" external="true" inactivate="true" width="150" defaultValue="rtrim(ho_nv) + space(1) + rtrim(ten_nv)">
      <header v="Họ và tên" e="Employee Name"></header>
    </field>
    <field name="tn_ct_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Tiền nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tn_ct" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="stt_rec_nv" readOnly="true" width="0" hidden="true">
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
      <field name="tn_ct_nt"/>
      <field name="tn_ct"/>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ6AUMZqevdhU1w9/FmVctxKTEfy8nSMu+uMpM5NcrEaLT0P/tQz5GcPNIoVQeIOg3ppW6JASPSCsXNqUXhkbW1qJq1RlgxuJkKGVxeFKJqARoIUKRwSKujaHgIE6m4OTDBmVy8405NIi2IOcTzhsReiBQco9QifiXexssfrT5W3yczWP0Z7jK7KWsIGQIwwyQX9CkdsvKob3prG70i49QRIxA3PXImkOWZt12GIs7XJacDYKxv3ubY+aeYz5mmgF/1WeiycEgsi/me8z6jOFBDMD1arwKRyUiLjqh4iKEvxcDTIdsbXoMz8OpTJ/YvFnLkjbAIPSWWZuU/OSHJWRsGWOyViaUxjNO5ySa09Zj9artciQ+IhMWHPcu312qPaS+wBNO1L6v0IiQHxhZH/XBAwxYDYeHcNCYk/h+SCTPdqP8PoiuWaWPaNG8mlDzd9Zw7j+VawVdQhkKrLaFwJEfpy6Qh5+XFAMfwVNkR4CTYE/rVpe4mTN3y3L6mtPGHGd2r/SLUh9bDqXPce97QHZIzYwsSDgH3jktss/0JB0w6TvPI0B5AP7n/VLJ4gu/uxTuEItlg2nTJJkCet8iIYcEnaz/BVMLlDLdEX6h31ZPMo22HO1LAx2y7BRKAKa/KcbVqI9Z85GjaxOESOu7A12RmWQJt/Doh2LhkJk3CYVRswFS+7LpirkipLL1sLY8IoIMEdHwVdV6RdTWItBFVkbmHbnvAPolMT9fW2N5AjOhNoMI0/DR2QXYZWq0i9P6qA5tpySEd50xT4Jt1U03GIkeZPEZ466Aeft5Az6gbog3ubYg==</Encrypted>]]>
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