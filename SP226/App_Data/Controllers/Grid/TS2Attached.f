<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>

<grid table="dmdcpt" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="CC2" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="dmdcpt" prime="dmdcpt" inquiry="idmdc" field="ngay_ct" expression="''" increase="{0}" default=""/>
  <fields>
    <field name="ma_bp_dc" isPrimaryKey="true" allowNulls="false" width="100" aliasName="a">
      <header v="Mã bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="TSDepartment" reference="ten_bp%l" key="status = '1'" check="1 = 1" information="ma_bp$dmbpcc.ten_bp%l"/>
      <handle source="dmbpcc.ma_bp" foreward="true"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b">
      <header v="Tên bộ phận" e="Department Name"></header>
    </field>
    <field name="ten_pt" width="300" allowNulls="false">
      <header v="Tên phụ tùng kèm theo" e="Spare Parts"></header>
    </field>
    <field name="dvt" width="50" allowNulls="false">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="100">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia_tri_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Giá trị nt" e="FC Value"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia_tri" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Giá trị" e="Value"></header>
      <items style="Numeric"/>
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
      <field name="ma_bp_dc"/>
      <field name="ten_bp%l"/>
      <field name="ten_pt"/>
      <field name="dvt"/>
      <field name="so_luong"/>
      <field name="gia_tri_nt"/>
      <field name="gia_tri"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75zYoXBjtLCfuFJhfaX79HdwFAx5OVbQ+jTUUESwFkfYbA6mYkgjgQUGZIBGXRLIzdESy9YuUJ56LDOakVUW/0zTo77BVCcAph6IO2Js8iGIDkXMhxeOdhBDO89SixkQPFg==</Encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL756/JB6dPeVkwCfYuq8ju3IjHBy2lZiRe+p4roymKc8hpgKt07AMplWFf+yFHgrBsqcwSlxnYqUCjRk/IXOhDuyw=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ6rdgYMp95c6ydkAOgvQXvcIvHebADlVT4X09SfppYH4gwNIvICEmKAXf1i9ySAZvB2BENOS5OlrMTy3+gYqcss/ZZ+nG65eEVV9h0wDQMTW3ngtDRhWjGio6OTEg7JSHFBiT6aGCRIQm0bDjeoxlGnIGEJpOuI2gPWksxfrh3YiUQbtA9gQeQUsite0GDyFQjbkA8XFDx7iYkLxlAv4idEugISI8EyuT3TWpHOq4i+mbPAUuGn+H89MuWY5Uht5HUUDG+fgY7ZBq9SOFKegoHSVktLL36l9ZZ1aeb9rsToyQhEGerYciztsXiY4B6N5/vCrTj2zfcjcHv1MX4Rr4EztcnJ12xXChlqT95JY+oW7R95axPixFRTtFeJzumRlejQrk7ftznh3GyFyL7zuW4Qd+lU8WUGukelMy6riRnhPgUurS1WARGfG31q0UhdKRy6n/QQVE5lHPMbfcmV4WiHft6ZU/MIl6Y9FQqyfb8zRw==</Encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/KWW0H3wllwc+j4G03oLj1B66Jra2RsWCSZPM3/TkJSIKJMi1TbCiSuUYn7FAMYne2WAdT0RGbicEy2YjfBxb/VKTKrohhKSSnilJSptTjcbimMHwhdtcveg0kJphfxEnPR/8BEsgunW0V7K2sQhj/</Encrypted>]]>
      </text>
    </query>
  </queries>

  &XMLStandardDetailToolbar;
</grid>