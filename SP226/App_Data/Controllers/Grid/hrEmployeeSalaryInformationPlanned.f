<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>

<grid table="hrttdkluong" code="stt_rec, stt_rec0" order="stt_rec, line_nbr" type="Planned" freezeColumns="3" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="hrttdkluong" prime="hrttdkluong" field="" expression="''" increase="{0}" default=""/>

  <fields>
    <field name="he_so_luong" type="Decimal" dataFormatString="##0.00" width="80" clientDefault="Default">
      <header v="Hệ số lương" e="Salary Coefficient"></header>
      <items style="Numeric"/>
    </field>
    <field name="he_so_dc" type="Decimal" inactivate="true" hidden="true" dataFormatString="##0.00" width="80" clientDefault="Default">
      <header v="Hệ số điều chỉnh" e="Adjusted Coefficient"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_khoan" type="Decimal" dataFormatString="@generalCurrencyAmountInputFormat" clientDefault="Default" width="100" allowContain="true">
      <header v="Tiền khoán" e="Piece Rate Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ngay_hl" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="100" allowNulls="false">
      <header v="Ngày hiệu lực" e="Effective Date"></header>
    </field>
    <field name="dien_giai" width="300">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" width="0" hidden="true">
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
      <field name="he_so_luong"/>
      <field name="he_so_dc"/>
      <field name="tien_khoan"/>
      <field name="ngay_hl"/>
      <field name="dien_giai"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiEsj65rpjrdsc3hcZBdTQMXMDaW2G0eIDl8DSiQLHdHkVFrM0rB2XGeDzozApnhbKliJNBb1ths2xaeTDp+spo7urekBGLRBfGjIyI1EL6Qw</encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiNGGbgpt/sYYDycpkPWOJe2sPH7I7A+Of5Akn8LhPfK3qNgIOC8xPFditSW3Za9UVZJmP7xbGzlPEfdxv10vh50tsNdhEYfkeXvSxB+jEYQ9</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AWYs1WMbXW4t6rMGyKy+hn1H53gtOlsCwaPiLn4V3OzfVpok8ELf4AN+AMV4gMAqyzpRORgeMZxPWQEhgd0fvRdVVIscoaCgGJ+0zyfXR2Nm1om5Rvzd4F95S2QKe5E3NzApF1BoA+kEFE2i/nZftL3L18WXaRoLPrlUMbyq7mqvShpfDfYXnnMHgWgFNjBC0NXNF4ixZRqGNWMXR9GDdS+LoxqnsVf36plB4x0/k8N9y6CCO8uwlA63mTj7CXHAtv5pD6/pMlOIiVzTa/16kCY1VhgSsyWClP/Ftblb/Y2gm9IMbymDgFXke0JEmXnI7fPDAFgUh4JSvDocRRwEnnq4LCbWwGDbKd7QDpzNlSpojsHMdpWnkFn+0lOjhnYImL0cuQ9L4znt/cBDcZczZoLu6tqfMhDXC8sDhjim4mxHzY+frggRELZfuvsOBrS2KjvktMG4FyGY4o7KWPn9ZLvSpj/ysg3ejbznR/BJNEPyPUf2ZsxJ0os6jmFSl7yMKBFnE5nNWesnN/rDwLeLus=</encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1OrDTQdK1c5LVXuryLCGmrZE6rTiEG3WmDYUe1Vl45KmkYnCcU4ocCBz1RBywnpKdOFQ3ioDlUYAKKY8tUZVvcl1LqpYVrdGxq9TKO+nPIsvq/6BXyyS2YwimoQnO0NMQ==</encrypted>]]>
      </text>
    </query>
  </queries>

  &XMLStandardDetailToolbar;
</grid>