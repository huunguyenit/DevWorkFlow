<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ControlFocus "loai_yt">
  <!ENTITY LockedDateKey "ngay_ks >= str(@nam, 4) + replace(str(@ky, 2), ' ', '0') + '01'">

  <!ENTITY CostingUnitLockedBeforeEdit SYSTEM "..\Include\Command\CostingUnitLockedBeforeEdit.txt">
  <!ENTITY CostingUnitLockedBeforeDelete SYSTEM "..\Include\Command\CostingUnitLockedBeforeDelete.txt">
  <!ENTITY CostingUnitFunction SYSTEM "..\Include\Javascript\CostingUnitFunction.txt">
  <!ENTITY CostingUnitFormOpening SYSTEM "..\Include\Command\CostingUnitFilterFormOpening.txt">
]>

<dir table="xcdloaiytdd0" code="ky, nam, ma_dvcs, loai_yt, ma_sp, ma_bp, so_lsx" order="ky, nam, ma_dvcs, loai_yt, ma_sp, ma_bp, so_lsx" xmlns="urn:schemas-fast-com:data-dir">
  <title v="số lượng sản phẩm dở dang đầu kỳ" e="Opening WIP Quantity"></title>
  <fields>
    <field name="ky" type="Decimal" isPrimaryKey="true" align="right" readOnly="true" hidden="true" >
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal"  isPrimaryKey="true" align="right" readOnly="true" hidden="true">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_dvcs" isPrimaryKey="true" dataFormatString="@upperCaseFormat" inactivate="true" disabled="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status='1'" check="1=1" information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="loai_yt" isPrimaryKey="true" allowNulls="false">
      <header v="Loại yếu tố" e="Factor Type"></header>
      <items style="AutoComplete" controller="FactorType" reference="ten_loai_yt%l" key="status = '1'" check="1 = 1" information="ma_loai$xdmloaiyt.ten_loai%l"/>
    </field>
    <field name="ten_loai_yt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_sp" isPrimaryKey="true" allowNulls="false">
      <header v="Mã sản phẩm" e="Product"></header>
      <items style="AutoComplete" controller="Product" reference="ten_sp%l" key="status = '1'" check="1 = 1" information="ma_vt$dmvt.ten_vt%l" new="Item"/>
    </field>
    <field name="ten_sp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" isPrimaryKey="true" filterSource="Optional">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Section" reference="ten_bp%l" key="truc_tiep = '1' and status = '1' and ma_bp in (select ma_bp from dmbp where status = '1')" check="truc_tiep = '1'" information="ma_bp$vxdmbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="so_lsx" isPrimaryKey="true" align="right" filterSource="Optional">
      <header v="Số lsx" e="MO Number"></header>
      <items style="AutoComplete" controller="MO" reference="dien_giai%l" key="(ma_dvcs = '{$%c[ma_dvcs]}' or exists(select 1 from options where name = 'm_gt_dvcs' and val = '0'))" information="so_lsx$phlsx.dien_giai%l" />
    </field>
    <field name="dien_giai%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="sl_dd_dk0" type="Decimal" dataFormatString="@quantityInputFormat">
      <header v="Số lượng dở dang" e="WIP Quantity"></header>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZYI253gxZqk5Xs4VcX3Ri6/K89TLiXNOy659ramAMcrNdFDZmx2lUjmg3LoGpjBy6A==</encrypted>]]></clientScript>
      <items style="Numeric"/>
    </field>

    <field name="tl_ht" type="Decimal" dataFormatString="#00.00">
      <header v="Tỉ lệ hoàn thành" e="Finish Rate"></header>
      <footer v="%" e="%"></footer>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZYI253gxZqk5Xs4VcX3Ri6/K89TLiXNOy659ramAMcrNdFDZmx2lUjmg3LoGpjBy6A==</encrypted>]]></clientScript>
    </field>

    <field name="sl_dd_dk" type="Decimal" dataFormatString="@quantityInputFormat">
      <header v="Số lượng quy đổi" e="Exchange Quantity"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 0, 330"/>
      <item value="1101: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="1101: [loai_yt].Label, [loai_yt], [ten_loai_yt%l]"/>
      <item value="1101: [ma_sp].Label, [ma_sp], [ten_sp%l]"/>
      <item value="1101: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="1101: [so_lsx].Label, [so_lsx], [dien_giai%l]"/>
      <item value="1101: [sl_dd_dk0].Label, [sl_dd_dk0], [ky]"/>
      <item value="1111: [tl_ht].Label, [tl_ht], [nam],[tl_ht].Description"/>
      <item value="110: [sl_dd_dk].Label, [sl_dd_dk]"/>
    </view>
  </views>

  <commands>
    &CostingUnitFormOpening;

    <command event="Loading">
      <text>
        &CostingUnitLockedBeforeEdit;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfw9P9keegRGTJEvWuNJvU7880aZF/jy7sGqVpRLWzXAC7Ldi6J0u2qxHmw/VZ3W4gQ+pD+yWNPa6WVQptvjO2bA=</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CostingUnitLockedBeforeEdit;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfw9P9keegRGTJEvWuNJvU7880aZF/jy7sGqVpRLWzXAC7Ldi6J0u2qxHmw/VZ3W4gQ+pD+yWNPa6WVQptvjO2bA=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliDHM40QpvMHWFEm7nU9iXtRa/LovLRF7BI5fDpOp0/cvi7B6jRK9FaSs32Hkpqq4/WdZSP7ZrAjNS4JEa7zCLyFayaNliRTgi2gO1TzHiAxzl/YX6Zl/if8HN6fFaZbIwAfKe9bKjvir/jrTQ14n4ORFrRvIgiqRffoL3LGEX7nGsTP/TWIno+an+4N47q5USSz/RNhchB2XJvzGdidQIn6UZgETKki9ddM8BrnOvQApdRXAUxriHZJN/50hGpcIorB0MpVRGAPvFwCpmQUozECksfr4735jtZREX2CfzhgBL0ykFe1Ea7MSivcVTlop2D9bhDcJAgaqcrCrhMRKFrPvzbk5+JNbo1/CaCYGfWw3sYEFXlupsm0zajgyiQKvlJnVg/OlD45uw/AQQYRXeTnilFadmsLD3jW8VS6Qa9cc=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nAOrOZxyVGGDKRK+zbLuJ+ivgeAL8A4pEIxXbQ4WxqIreJ8wi0cbO+RoIjiQ6LoWaZUoNgRhxXvWs1GHN/mDCPQTUp80BosGkdY1fwJQqGkhXqJV7QNsx8bVvS2qkSpPTmdOFplXFp32SecwSpDR4zyQtg/OO5HOXUr8sJZ37ZKd3h5FqkGrsS9S2YZ+9xhIY46U08G1fIvuUCLC3O4h3iXkwVCgx/2haZke9h6KItEY=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jzydpBRLZc7FqA1Xm5nA40wHWjw0zM717GEbS2YLveKU/xPVRclZfeLpSSFjrgy1o/KzlbsGwbN0Lfi6xjC1Uv4OBefZiuWqqX2Axj3jY0m1tX0gG1wzfvrmIpz9bkTBPabAHqwsKJCC2NlyM8mGDPgT4ONNdS/aQbXs4uy4NPoIMGYUCtRISBD31HJZmn42Cb9ZT10NbvarfagtE7/elXqNIknUINTT01wmZNeXALopgmYnbIkJMfjstW4DGON0FBZluvD/krql0YYRGcholmRPQ5TI7XpGoUlMyB9N/kBWJY9tcj+EzNwWGUMJlPlb3/LQktNtE4YaNHkCiQJi2G+0VGnZbaS470LuI8G002kiIWZMIFlv1erthE6pFoo30</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeoa0w+CPb4N3csANl6HRMO9+k5UbvuavP8ILz2sx3NAzsyT6Y3hBZlFqfo/VNt3MCIJjnBSE6upfe2TmWC5iYzNnOfAtaOBrJ63itYpOb4hm</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CostingUnitLockedBeforeDelete;
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Kw9xKZUg/hs/uweeYRI1Uvrm7JawuxlHYgWOPOaF3OAGKxq0Nq929iJbWVAVwMEIrTZaU6nLjGsayouUUjiLfHNkBKDkxbGlqod/q+DfhW0DY25IA/GHNOij5XnyWPVupNTmrL+5+f2c0tKJpDBA/OzmVB9BlB/AF8v7CZ/m0uaKGCn9b+1SaRGcWhSRjuMq/9OvkTEHk4DCdzEGWOheKgSgRtnYcZ6R1gbUItpAQDcHtTg5q+zfYjmyrYdMNlHwo1PznJPWe7jM5mmn4rsEraggatDb7R3NSmrF+tY4TIoTfsVPbsq2KAnjYG5NOXbMhJlQPyOisUToPr/0TC1nFb6QKJg5WMM48U5gKNsPvjy</encrypted>]]>
      &CostingUnitFunction;
    </text>
  </script>
</dir>