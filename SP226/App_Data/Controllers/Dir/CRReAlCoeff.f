<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY k0 "@ma_vt = $ma_vt.OldValue and @ma_nl = $ma_nl.OldValue and @ngay_hl = $ngay_hl.OldValue">
  <!ENTITY k1 "ma_vt = @ma_vt and ma_nl = @ma_nl and ngay_hl = @ngay_hl">
  <!ENTITY k2 "ma_vt = $ma_vt.OldValue and ma_nl = $ma_nl.OldValue and ngay_hl = $ngay_hl.OldValue">
]>

<dir table="crdmhspbnl" code="ma_vt, ma_nl, ngay_hl" order="ma_vt, ma_nl, ngay_hl" xmlns="urn:schemas-fast-com:data-dir">
  <title v="hệ số phân bổ nguồn lực" e="Resource Allocation Coefficient"></title>
  <fields>
    <field name="ma_vt" isPrimaryKey="true" allowNulls="false" dataFormatString="@upperCaseFormat">
      <header v="Mã sản phẩm" e="Product Code"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="kieu_hd &lt;&gt; '0' and status = '1' and loai_vt in ('41', '51')" check="kieu_hd &lt;&gt; '0' and loai_vt in ('41', '51')" information="ma_vt$dmvt.ten_vt%l"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''" inactivate="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nl" isPrimaryKey="true" allowNulls="false" dataFormatString="@upperCaseFormat">
      <header v="Mã nguồn lực" e="Resource ID"></header>
      <items style="AutoComplete" controller="CRCriticalResourceList" reference="ten_nl%l" key="status = '1'" check="1=1" information="ma_nl$crdmnl.ten_nl%l"/>
    </field>
    <field name="ten_nl%l" readOnly="true" external="true" defaultValue="''" inactivate="true">
      <header v="" e=""></header>
    </field>
    <field name="he_so" type="Decimal" allowNulls="false" dataFormatString="&CoefficientInputFormat;">
      <header v="Hệ số phân bổ" e="Allocation Coeff."></header>
      <items style="Numeric"/>
    </field>
    <field name="ngay_hl" isPrimaryKey="true" allowNulls="false" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Hiệu lực từ" e="Effective Start"></header>
    </field>
    <field name="dien_giai">
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" categoryIndex="-1">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="232">
      <item value="120, 30, 70, 330"/>
      <item value="1101: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="1101: [ma_nl].Label, [ma_nl], [ten_nl%l]"/>
      <item value="110-: [he_so].Label, [he_so]"/>
      <item value="110-: [ngay_hl].Label, [ngay_hl]"/>
      <item value="1100: [dien_giai].Label, [dien_giai]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3aN/7PxwrNmja2J0eINLzr7yQXqGj/Z9MadUpxjxPIGGvCZZbf9BoF7dav+kRY88dkP/omEk8QNHSdeelDXFkq/q4t0/DWgUPD6cW9IF1ARRYWKS8rUWA+692Nj69GuVV/H2xvtaxRdc+w4ymQumVCgtuDbp2Xpi3ivZSrhaEquC6dX2dNjceVDH07gKYS/dSGUKZHpenW1DsPqTyFiTbmsfzFWtAysunDocQ/glwEOo2v4A5g646P94SN7EVXwTF//aKVWqq36Grj4TFZym1GGJMHXt2NNTOJFa1cc+twiOc7l7HwIgkrx25gA5ss7FEjx7+BGfYgIEnIaxNf+cB+++hkmFteh7hiU0suzSiZDIZQuTnNDpa3kOAEHiOwtWm8UQN7uv+O4FGUF5oD3tyn7igggk4RiIlDcDroK+coPGDOpMWLKUFT1kU6uJBgduSvRlwY4bWlkFS2UDdif0jEbzCCfNwoqMDsD5BIvA1AHNxHS0ADcrp2vghXrSHYilQofLRprXvv3+C4a0ypBpe9GkXBO7vQ6wzfQOMoBxSQxKGUraxdmO1I3/ZL4+4XHnsl</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5+QRWddH3AlR+z9nDTz+7CqQkA+CAc0ekwifZZLEvnfA==</Encrypted>]]>&k1;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLZMHckGCQw6x8e76tZNpJUO2W9aiQTkPy96RE7VCMEY1+dp4q89lFuaJabDMgpZSfIPVLN/gCpbKO0KxMf8wpUprW2ufhyqO6epkyUYDzFf+KUCUOise+QtVx2uzMIpyrboKJIr/9WWrr/Ca2lWoxyIVTvULcXo3DXZGfOLx8We/88Rds7ANVCbPt8Lt9VHkYqLt0DBNjSNGhUJGj8wXKLvwZ/AoFs32RNUFE5BUHe5NlHY0pev05cSuGpKELzyqew==</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp9ozwmNWaFXFGEKfmQZvzteUI1QmUgP10yHksf+Ca1iWw==</Encrypted>]]>&k2;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLZMHckGCQw6x8e76tZNpJUO2W9aiQTkPy96RE7VCMEY11MOJ+DinUtShztLg2q1F3qU9X2kQuPGd77v43pSgVLE3iRShZ8gcTK/LUUrNuWjqzCZu1MH0Hb44ZGKKqJ0Kv95Ey42UI7KNSjOXCMhWOFoeIYMz0jwyzPtVOs4nYiehpV5ZmxdeYvtL0EmA7YpToSc95Q6bES+041Egts/C6TOcRf9cou12ak2OCIDPonydQ1TmHjgxlwacct8n08lpow==</Encrypted>]]>&k0;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLbWKoL5jETtroDAedIqUQR42mEpHAQGseHKQPt+hO6zMVZCLu0/56nviMMRE2b0t5VXIS9FErUnVAIrYHbfYuSE=</Encrypted>]]>&k2;<![CDATA[<Encrypted>&YARH0qdfPiWP620v9FAeSPICrzWaA8H4buAdoshnAjQ=</Encrypted>]]>&k1;<![CDATA[<Encrypted>&x2vMhmcVHH3IWkEVW8yP6+iSr8HCVbXk+kp2q9xQCyo8Qix25f6ADZ1OFKBXUlJJQhBu7mkDqx6VEg6xuNod3xFUejyy4byan3lo3qM9MN/0pc62yCozP1f2LOXHAdKf8FMUm4AlmlXYe9OpcnvHciNyoIMeg1z4mJY1Ht5L28qVh/58IfyTQTRQPXT3GtEO/3MM1MfQAznwZxJ3MzTYJA==</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XV+ON7PtGJwPs+Ue1dhk9iTEMusobpy/mpGNP17+b7z99</Encrypted>]]>&k1;
      </text>
    </command>

  </commands>
</dir>