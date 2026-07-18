<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>
<dir table="glns" code="nam, ma_dvcs, ma_bp, ma_vv, ma_ct, lan" order="nam, ma_dvcs, ma_bp, ma_vv, ma_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status='1'" check="1=1"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_vv">
      <header v="Vụ việc" e="Job"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status='1'" check="1=1">
      </items>
    </field>
    <field name="ten_vv%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status='1'" check="1=1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 20, 20, 60, 100, 230"/>
      <item value="110---: [nam].Label, [nam]"/>
      <item value="110010: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="110010: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110010: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBZ6BzPonTyq1dLDhtA6QszE7aoypIsUqjgvE2qA3HdcQUn4vlTLqb7d8SDMIwsCqZVyhom7S8Ri57YICCZawDmaLJv75iaWsIH6zdqflq9pxgBMVJqFrIhszV+Z8boXBTifgJFSMm4yWLqEDWv7MEobE4ZjoDheGrTxYd/QVTWXkCwl1uV7ElUzWsdLfscfDrlq9etCP6Rg4LAk4h69mqafiyN7JgB99kMBbFZHl38GTbVrIeLq26GkBztgqB1Bz4JqHQ/GFqreN//iobGWlFu7m+z1s/v6l67LdzcC+jZ5YhddRZjlR7JpNIYVD2lL8R7k38550I9Z5OIZHkqFeDaKdMtbrBVVI24BXulxpBHzaYmh2KPnR7HhAvtX0+qMcAG4iKjK1JmMuzi0SBIRpGZvhZjiQZa36jpkonz85XkuI8DVYRl13xfw4vz/Vn2xmHPRcgfvGjGs5bAEN7LXHLaGQlFkgNgnpM4gG6+K5zVsjWVDIqwhAr/lz8PuOgtNNB4JF/NzHlC0vLO9TUY2GCv6y3I1PCZVQLcPPCY1qu0UI/2w+pX9Cu3iMYkH6XZQb+uVQyXQBEvagbkGGAx86fEiORFBsIjp5/f413qZWdVT3w==</encrypted>]]>
    </text>
  </script>
</dir>