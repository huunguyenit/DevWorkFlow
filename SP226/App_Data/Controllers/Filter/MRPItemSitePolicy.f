<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="mdmvtkho" code="ma_vt, ma_kho" order="ma_vt, ma_kho" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ma_vt">
      <header v="Mã vật tư" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="kieu_hd &lt;&gt; '0' and status = '1'" check="kieu_hd &lt;&gt; '0' " information="ma_vt$dmvt.ten_vt%l" new="Default"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="ma_kho">
      <header v="Mã kho" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
  </fields>
  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330"/>
      <item value="1101: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="1101: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBZ6BzPonTyq1dLDhtA6QszE7aoypIsUqjgvE2qA3HdcQUn4vlTLqb7d8SDMIwsCqZVyhom7S8Ri57YICCZawDmaLJv75iaWsIH6zdqflq9pxgBMVJqFrIhszV+Z8boXBTifgJFSMm4yWLqEDWv7MEobE4ZjoDheGrTxYd/QVTWXkCwl1uV7ElUzWsdLfscfDrlq9etCP6Rg4LAk4h69mqafiyN7JgB99kMBbFZHl38GTbVrIeLq26GkBztgqB1Bz4Ll3IWpD/KNlHbVgwWCv+cgquZqsGkCeIjyNloiYgp51QaMpL+Lc1dvt7W+f6QydMG+xH9aHrkO0UfuLDmXIEpukLfJeLCknD6wYSRnz4FDZtBqCokNu9tL/k5f3wvFGz6MNFyfV13vE5BahniLVlTgDcIaUvV5WJSezFHMpBFsW2TYgCEqTzx1tgtjf9GzErtcsMPtWOo2NztEo+LXmKFDz97LrHrbGi35b/tGohThJOBjdOFwkIEV8cXqq/0ksPU=</encrypted>]]>
    </text>
  </script>
</dir>