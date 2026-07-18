<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>

<grid table="cthd1" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="HDC" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="cthd1" prime="cthd1" inquiry="cthd1" field="" expression="''" increase="{0}" default=""/>

  <fields>
    <field name="ma_nk" width="100" allowNulls="false" aliasName="a">
      <header v="Mã quyển" e="Voucher Book"></header>
      <items style="AutoComplete" controller="InvoiceBook" reference="ten_nk%l" key="status = '1' and ((ma_dvcs = '') or ('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}'))" check="((ma_dvcs = '') or ('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}'))" information="ma_nk$v20dmhd.ten_nk%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQp/R96AhaucyVV1pMknkJAXeJYBHO2cSEN6TjPXMfALthZm62PBdn2iUXP3FBgK01g=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_nk%l" readOnly="true" external="true" defaultValue="''" hidden="true" inactivate="true" width="0">
      <header v="Tên quyển" e="Voucher Book Name"></header>
    </field>
    <field name="ky_hieu" width="100" readOnly="true" inactivate="true" aliasName="b" external="true">
      <header v="Ký hiệu mẫu hóa đơn" e="Invoice Form"></header>
    </field>

    <field name="loai_hd" width="0" readOnly="true" inactivate="true" aliasName="a" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ten_loai_hd%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="c">
      <header v="Tên loại hóa đơn" e="Invoice Type"></header>
    </field>

    <field name="so_seri" readOnly="true" inactivate="true" width="100" aliasName="b" external="true">
      <header v="Ký hiệu hóa đơn" e="Invoice Series"></header>
    </field>
    <field name="tu_so" type="Decimal" allowNulls="false" width="100" align="right" dataFormatString="### ### ### ##0">
      <header v="Từ số" e="Number from"></header>
      <items style="Numeric"/>
    </field>
    <field name="den_so" type="Decimal" allowNulls="false" width="100" align="right" dataFormatString="### ### ### ##0">
      <header v="Đến số" e="Number to"></header>
      <items style="Numeric"/>
    </field>
    <field name="so_luong" type="Decimal" readOnly="true" dataFormatString="### ### ### ##0" clientDefault="0" inactivate="true" width="80" aliasName="a">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>

    <field name="so_ct1" readOnly="true" external="true" defaultValue="''" inactivate="true" aliasName="b" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="so_ct2" readOnly="true" external="true" defaultValue="''" inactivate="true" aliasName="b" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_nk"/>
      <field name="ten_nk%l"/>
      <field name="ky_hieu"/>
      <field name="loai_hd"/>
      <field name="ten_loai_hd%l"/>
      <field name="so_seri"/>
      <field name="tu_so"/>
      <field name="den_so"/>
      <field name="so_luong"/>

      <field name="so_ct1"/>
      <field name="so_ct2"/>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ6AUMZqevdhU1w9/FmVctxKTEfy8nSMu+uMpM5NcrEaLT0P/tQz5GcPNIoVQeIOg3ppW6JASPSCsXNqUXhkbW1qJq1RlgxuJkKGVxeFKJqARoIUKRwSKujaHgIE6m4OTDD1jD67d9pzDa9larXwY0zqYqhZN1yRcDpaaDJbPc4B+4yl0LM9ZA4XUmYRdD5O0JJvKQfsZPgnzrebsjiPjuVvz7AFD82QmwSPX4H7oE/HKm7P2G0RlXll42GbezchQgDPF0vPxsIw3ofj7OfpGKRwub8dZD7y/bOmx5c4E8hHxmB2vf+B51viAqAQqwPSDsNIGj2jLX7ZDDQUKhrg0xbflCcTG2+UYdxRm2eHPcxbIbef+7GvgYY9BulsTEuocdA3edX6Lw7yCH84izFbEnPmXMgv4ZGX7/fTboV5rxU1BgsJr7AHKPRH1N24f+Z/eagvJKGDWZku+BU60WL5BhSiRBEQUxQd9aJQunuJESRRr95SyG6orm4DbR3y5GvHzZVNZb1buq0nxMtjAOe+ozFNmg7myU8/6AvvV9sTgAAzQU2VxV60ytmogzSVfW8irPLr7Y7SpqTx/Eg2snRK+Acw+XepsN2P1yVBwobtwQfE0ytqeHVSW0NmXRJIKGk3lCtoIW4kicXNXOpyJsEraKlN9MA/qo34QLviUe4FB44bNF8rMVq8tDSkT0xPaCf4no6cPY63BopU2VZMVgK9ya6reXJRuTKgtWyaZ8qhf+GDJ/PJA7tx5+1EbriPq9OeWkc=</Encrypted>]]>
    </text>
  </script>

  <response>

    <action id="InvoiceBook">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4GjVb+3C2d8CQdNwRa9XVmedF9RJ3mQGKVdZ+jlg4yRIAm0G9SQ4GcZAXE/VqfSQfogMPqr7nBVl91uo2rb203GuZEWeqKmnfRyFjIgwG3xtIJaUTz0lqOsb5nJDsqpd3sRLWXkxCVBMQoCRJjdlrj</Encrypted>]]>
      </text>
    </action>
  </response>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/KWW0H3wllwc+j4G03oLj1B66Jra2RsWCSZPM3/TkJSMmPbUjNEDGB2jVuQ2MltbSC28Xm2jqHjKU1HPKJdxT9AkKCf1ao2iSMCemfWafBKiFWcmZX7RYuFkENInrN1OAEcNIvztV2Ma5MQEvnq8RIk9V/1qm0yJgHvijmA+4/pg==</Encrypted>]]>
      </text>
    </query>
  </queries>

  &XMLStandardDetailToolbar;
</grid>