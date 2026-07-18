<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY XMLGetUOMConversion SYSTEM "..\Include\XML\GetUOMConversion.xml">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>

<grid table="ctdm" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="DM1" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="ctdm" prime="ctdm" inquiry="ctdm" field="" expression="''" increase="{0}" default=""/>

  <fields>
    <field name="ma_vt" width="100" allowNulls="false" aliasName="a">
      <header v="Mã hàng" e="Item"></header>
      <handle source="dmvt.ma_vt" foreward="true"/>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQrtNZry7qPMbwHsBNsjc6Mk1WRLgRhbTBAqb5u7VmEUWTYQCFG+3awI/CHACMPUNGw=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b.ten_vt">
      <header v="Tên mặt hàng" e="Item Description"></header>
    </field>
    <field name="dvt" width="50" aliasName="a" allowNulls="false" >
      <header v="Đvt" e="UOM"></header>
      <items style="AutoComplete" controller="UOMItem" reference="ten_dvt%l" key="(ma_vt = '{$%c$%r.[ma_vt]}' or ma_vt = '*')" information="dvt$vdmvtqddvt.ten_dvt%l" normal="true"/>
      <handle key="[nhieu_dvt]"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQrHAErFytBmVTuYM2/+h6tbHTSuJe4+eNimX9Xcx5swAaVOb3OVZQuway3Ncnl3yjQ=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_dvt%l" readOnly="true" external="true" defaultValue="''" width="300" hidden="true" >
      <header v="" e=""></header>
    </field>
    <field name="he_so" type="Decimal" dataFormatString="&CoefficientInputFormat;" width="0" align="right" hidden="true">
      <header v="Hệ số" e="Coefficient"></header>
    </field>

    <field name="so_luong" type="Decimal" dataFormatString="@coefficientInputFormat" clientDefault="0" width="80">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="100">
      <header v="Hiệu lực từ ngày" e="Effective from"></header>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="100">
      <header v="Đến ngày" e="Effective to"></header>
    </field>
    <field name="tl_hh" type="Decimal" dataFormatString="#0.00" clientDefault="0" width="50">
      <header v="Tỷ lệ hao hụt" e="Scrap Factor"></header>
      <items style="Numeric"/>
    </field>
    <field name="tg_th" type="Decimal" dataFormatString="#0.00" clientDefault="0" width="80" aliasName="a">
      <header v="Thời gian thực hiện" e="Lead Time"></header>
      <items style="Numeric"/>
    </field>
    <field name="tl_pb" type="Decimal" dataFormatString="#0.00" clientDefault="0" width="50" aliasName="a">
      <header v="Tỷ lệ phân bổ (%)" e="Cost Allocation Rate (%)"></header>
      <items style="Numeric"/>
    </field>
    <field name="dien_giai" width="300" clientDefault="Default" aliasName="a" >
      <header v="Diễn giải" e="Description"></header>
    </field>

    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
      <handle key="[nhieu_dvt = 1]" field="ma_vt"/>
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
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>
      <field name="ten_dvt%l"/>
      <field name="he_so"/>

      <field name="so_luong"/>
      <field name="tl_hh"/>
      <field name="ngay_ct1"/>
      <field name="ngay_ct2"/>
      <field name="tg_th"/>
      <field name="tl_pb"/>
      <field name="dien_giai"/>

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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtTElG1hN6LKG0Vp8Y9kWhG8aFFhpNj5+u9WMGtcb4/eEMLihrtTjxnXvNsRcJeT3kEXgAAQ/T0sSk3cxYRQvsMzqRYkLGpqyYqf4RJkd5KVZeEcZ/5yiIfvZ/oOpLaQB+Y9VV/6irRocXNk5gs0BNVa3giDVRFisipLYTaIeeFPilV/6CMocD5mA9J5+TFk4Q0jf0bvHQo1sJ5urCpknArUU4SjNR+JMzJdMhplMqqI4RDhuTbeCzpu/uBNzbMI2xKDuOo95SAm3sPtLaFD+bA5pUy/Psr2vt9gIPZKbjGo34qxF2EX7PK00lLJvz8eReFyvVS3qXLQWvuXhMRQPxc+rhzf6BtvUNHosDrcCLtBJpV0AsHpssEvLxVMIOY2nkIXZ1a2zp3CuHPHpuZyJpzSTjocHuC1q+osrZaRX8Yt0hbUa3EAOE/9zIN7EFx4QxsTY3D7dmkn4TIsmpYcJ/qIOzlhYhsOwuEHhQ3p5jQoyaI1KaTjSksRzIxfv2T8T9tMO13YySJckPj09QkO49Wv1FaFUqkiMmCeUq0pCbrw9J7WLGvg6NGTE4VvFTb/7VqgD2UV3lOSux2iUVtMFCS75wCRFROkfR29UOfc9mfpske3t3KHK+LjzeRp9j4ureH3l/8/5a8tq7eRop6TeAfb6UttYlKiY+Ga40PVKNvasa6PT3Xfku/PgA6JnD5BYVFSaZRmuWPRp6K3zY8DTN/FhcBaSXR9LNi5R9B3x/ubxqmVCjyXCWcQzgICsh3vucT2DRgoOjtS62npOAPabV76gozUynIYcnP1maksFNGGf2UVwIZLcy0ZYkrpELSEuQA==</Encrypted>]]>
    </text>
  </script>

  <response>
    &XMLGetUOMConversion;

    <action id="Item">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7OgXRUOS55f1qZWUcxbp07QCYNyTiLuGjsdOg0xgEQXAeL5Ke19lC+lVRifStSEgDTdUNkofgZQuP7+KeYGt32</Encrypted>]]>
      </text>
    </action>
  </response>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/KWW0H3wllwc+j4G03oLj1B66Jra2RsWCSZPM3/TkJSNWLrl2QcXbqLH/L3cyqz4R5WPurvONXlXPy/jxQyx5/tygPniSGVrG82pjVdXduiJK//ZfrB6eByq2D0qY0hOEQZq4i0Iu/MeeIoceyfWC3</Encrypted>]]>
      </text>
    </query>
  </queries>

  &XMLStandardDetailToolbar;
</grid>