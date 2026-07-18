<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="cthspbdc" code="ngay_hl_tu, ngay_hl_den" order="ngay_hl_tu, ngay_hl_den" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lọc số liệu" e="Filter Data"></title>
  <fields>
    <field name="ngay_hl_tu1" type="DateTime" dataFormatString="@datetimeFormat" align="left" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày hiệu lực từ từ" e="Effective Date from from"></header>
      <footer v="Ngày hiệu lực từ" e="Effective Date from"></footer>
    </field>
    <field name="ngay_hl_tu2" type="DateTime" dataFormatString="@datetimeFormat" align="left" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày hiệu lực từ đến" e="Effective Date from to"></header>
    </field>
    <field name="ngay_hl_den1" type="DateTime" dataFormatString="@datetimeFormat" align="left" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày hiệu lực đến từ" e="Effective Date to from"></header>
      <footer v="Ngày hiệu lực đến" e="Effective Date to"></footer>
    </field>
    <field name="ngay_hl_den2" type="DateTime" dataFormatString="@datetimeFormat" align="left" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày hiệu lực đến đến" e="Effective Date to to"></header>
    </field>
    <field name="ma_dc" dataFormatString="@upperCaseFormat">
      <header v="Mã công cụ" e="Tool &#38; Supply"></header>
      <items style="AutoComplete" controller="TS2Tran" reference="ten_dc%l" key="(ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_access = 1) or @@admin = 1)" check="1 = 1"/>
    </field>
    <field name="ten_dc%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 100, 130"/>
      <item value="1101-: [ngay_hl_tu1].Description, [ngay_hl_tu1], [ngay_hl_tu2]"/>
      <item value="1101-: [ngay_hl_den1].Description, [ngay_hl_den1], [ngay_hl_den2]"/>
      <item value="110100: [ma_dc].Label, [ma_dc], [ten_dc%l]"/>
      <item value="110100: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBZ6BzPonTyq1dLDhtA6QszE7aoypIsUqjgvE2qA3HdcQUn4vlTLqb7d8SDMIwsCqZVyhom7S8Ri57YICCZawDmaLJv75iaWsIH6zdqflq9pxgBMVJqFrIhszV+Z8boXBTifgJFSMm4yWLqEDWv7MEobE4ZjoDheGrTxYd/QVTWXkCwl1uV7ElUzWsdLfscfDrlq9etCP6Rg4LAk4h69mqafiyN7JgB99kMBbFZHl38GTbVrIeLq26GkBztgqB1Bz4K4AD+wvazzqcFLn3lT7bssPKwO1bBCcCcNJro4Jlkltk4SsRSQccYXSehcYGLHnwIWpzwGfW3DLqK3QIgQZUciS1+81SbYB/1mxazJ0slDfoH0B2N0cISooQyGoMdvSAzzXsICvG3VmP59+Co2r5H6reCaLZRBNNw3w7BP6NChbxJ2TwsFMrGrK/d6kyb7lPS1d+nZdQ9P6L1N/RYxSFvSlUxLtHRR35mTpv41/e36HxiZBbaqtxawC+sAyLye6y+J3Xr1Btdf6q8t+LAmy7NAZNtSs+jw5Xyqcnah8w0Z7NIbDHBLjCkTaRKdqRNwyOX/PojY27Lu0hL6GJpHm3jMYg6bxjgjnBMC+3rxZceLww==</encrypted>]]>
    </text>
  </script>

</dir>