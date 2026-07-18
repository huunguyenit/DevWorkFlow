<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ControlFocus "loai_yt">
  <!ENTITY LockedDateKey "ngay_ks >= dateadd(mm, 1, cast(str(@nam, 4) + replace(str(@ky, 2), ' ', '0') + '01' as smalldatetime)) - 1">

  <!ENTITY CostingUnitLockedBeforeEdit SYSTEM "..\Include\Command\CostingUnitLockedBeforeEdit.txt">
  <!ENTITY CostingUnitLockedBeforeDelete SYSTEM "..\Include\Command\CostingUnitLockedBeforeDelete.txt">
  <!ENTITY CostingUnitFunction SYSTEM "..\Include\Javascript\CostingUnitFunction.txt">
  <!ENTITY CostingUnitFormOpening SYSTEM "..\Include\Command\CostingUnitFilterFormOpening.txt">
]>

<dir table="xcdloaiytdd" code="ky, nam, ma_dvcs, loai_yt, ma_sp, ma_bp, so_lsx" order="ky, nam, ma_dvcs, loai_yt, ma_sp, ma_bp, so_lsx" xmlns="urn:schemas-fast-com:data-dir">
  <title v="số lượng sản phẩm dở dang cuối kỳ" e="Closing WIP Quantity"></title>
  <fields>
    <field name="ky" type="Decimal" isPrimaryKey="true" align="right" readOnly="true" hidden="true" >
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal" isPrimaryKey="true" align="right" readOnly="true" hidden="true">
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
      <items style="AutoComplete" controller="Section" reference="ten_bp%l" key="status = '1' and truc_tiep ='1' and ma_bp in (select ma_bp from dmbp where status = '1')" check="truc_tiep ='1' and ma_bp in (select ma_bp from dmbp where status = '1')" information="ma_bp$vxdmbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="so_lsx" isPrimaryKey="true" allowNulls="false" align="right" filterSource="Optional">
      <header v="Số lsx" e="MO Number"></header>
      <items style="AutoComplete" controller="MO" reference="dien_giai%l" key="(ma_dvcs = '{$%c[ma_dvcs]}' or exists(select 1 from options where name = 'm_gt_dvcs' and val = '0'))" information="so_lsx$phlsx.dien_giai%l" />
    </field>
    <field name="ten_lsx%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="sl_dd_ck0" type="Decimal" dataFormatString="@quantityInputFormat">
      <header v="Số lượng dở dang" e="WIP Quantity"></header>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZYI253gxZqk5Xs4VcX3Ri6/dqgoVXTHNgNDGpNhcsuZobdck9tQu0J3UOuW9cKpyyg==</encrypted>]]></clientScript>
      <items style="Numeric"/>
    </field>
    <field name="tl_ht" type="Decimal" dataFormatString="#00.00">
      <header v="Tỉ lệ hoàn thành" e="Finish Rate"></header>
      <footer v="%" e="%"></footer>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZYI253gxZqk5Xs4VcX3Ri6/dqgoVXTHNgNDGpNhcsuZobdck9tQu0J3UOuW9cKpyyg==</encrypted>]]></clientScript>
    </field>
    <field name="sl_dd_ck" type="Decimal" dataFormatString="@quantityInputFormat">
      <header v="Số lượng quy đổi" e="Exchange Quantity"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 50, 50, 330"/>
      <item value="1101: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="1101: [loai_yt].Label, [loai_yt], [ten_loai_yt%l]"/>
      <item value="1101: [ma_sp].Label, [ma_sp], [ten_sp%l]"/>
      <item value="1101: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="1101: [so_lsx].Label, [so_lsx], [ten_lsx%l]"/>
      <item value="1101: [sl_dd_ck0].Label, [sl_dd_ck0], [ky]"/>
      <item value="1101: [tl_ht].Label, [tl_ht], [tl_ht].Description"/>
      <item value="1101: [sl_dd_ck].Label, [sl_dd_ck],[nam]"/>
    </view>
  </views>

  <commands>
    &CostingUnitFormOpening;
    <command event="Loading">
      <text>
        &CostingUnitLockedBeforeEdit;
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHY1X8UtDmCQxRKhh6aOFgFa3q8t4B29WBmoXEwhwbrorq85dMEUc4bpMtnUsVtRy/4l8vbT1nc+IAu5qpb3wXci61+IITjQDZQgIqGtosoiNRmrTtZlbqAlzWRI1N8m6uju6lZyxNv/6BXLGmfylLPcCrd0YyZKrPBlhPFc9fAo/VKI14ViA+PKirFupsTnX70=</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CostingUnitLockedBeforeEdit;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3TtItULdVva6LAifNb3idZRZHoHvT1IwycMXQWmDpA7hO4fBjn3emlqyrFGOkjycJIgaQEimwSdk0I+AwGlIBgvm+DT7Rs8yW3EZplA612V</encrypted>]]>
      </text>
    </command>
    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliDHM40QpvMHWFEm7nU9iXtRa/LovLRF7BI5fDpOp0/ctAxS/sx4a4xUWgYGelBbDDT75VJhiuBT4m2CXm6mvrYf7by7jtLIA5RpFyWu3Ey/h+EJpdSPfR/+EsDj3juiHIx9ScJJ7d5b+m/xxgM1WYM3ztXGT+SBXrXxXxItPPvf9KKGcbi09XJGku5rEDMgH8c9F0CVe9ue/3TWqWPRpafg/REUlOGUl8oewutv40euu+LMpEFdpeu61qHR9pMkivZD8WGVwHNyAUL+DQw8PSeT/CQa3HRNDy4WL0hVWsRK5zRINSilQk/pbBE/WCtUj8J6LnC31pOYNFmEQSb/189Zm0pIyILbfX7CZKgLxUEAJhdSOPGLvaO/gKGhbYR0gUgiEQaacMnMQzO5t//CIBGNMQWFFv/1KJdCrS08zzICM=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nAOrOZxyVGGDKRK+zbLuJ+ivgeAL8A4pEIxXbQ4WxqIreJ8wi0cbO+RoIjiQ6LoWaZUoNgRhxXvWs1GHN/mDCPQTUp80BosGkdY1fwJQqGkhXqJV7QNsx8bVvS2qkSpPTmdOFplXFp32SecwSpDR4zyQtg/OO5HOXUr8sJZ37ZKd3h5FqkGrsS9S2YZ+9xhIY46U08G1fIvuUCLC3O4h3iXkwVCgx/2haZke9h6KItEY=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jzydpBRLZc7FqA1Xm5nA40wHWjw0zM717GEbS2YLveKU/xPVRclZfeLpSSFjrgy1o/KzlbsGwbN0Lfi6xjC1Uv4OBefZiuWqqX2Axj3jY0m1tX0gG1wzfvrmIpz9bkTBPabAHqwsKJCC2NlyM8mGDPgT4ONNdS/aQbXs4uy4NPoIMGYUCtRISBD31HJZmn42Cb9ZT10NbvarfagtE7/elXqNIknUINTT01wmZNeXALopgmYnbIkJMfjstW4DGON0FBZluvD/krql0YYRGcholmRPQ5TI7XpGoUlMyB9N/kBXxqzCz1KO7iXoTrAG1z9pJI8Fe3R0Nl6z7WMKRB0xC0XCys4nfVmAndcs9U02K48u34iWrGdvIJdgPiVUM4ZoQ</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70LJ+iMc3ZdWQIXRRhYZi4Vg2wZ/mxHPVomjv8Mv5dBP41I1M0BBp8Xcl5D/sb6YXw2YEEWkEp5N0gsp9vHqrCdpAAhUG6/R1A8lIoZoFdP2iEvPjPeoor1sNzLNOGz/JCrrFdLyzb552y38e3PYagrC5wxStd513gmljAuJk1yqelT4uXkutKyVBt6dS7TrnrzPiAYMALBWc0n42iS2t9NR+fItc/kEuKcTKSPZpjSHISO8lEUm9yUNaf99GunK6xaMocANYQD2de6Tin+FQF4+GL5DFTkxNfaoNh+nNt22cne9wdUu4uIRYcjAztzpUbtdWy8bCNI84CDMKnR7FOdZ/RNh6CuLOx1G/xoQfFIZ+swSPKTVHxfCFCglmEWgbBg==</encrypted>]]>
      &CostingUnitFunction;
    </text>
  </script>
</dir>