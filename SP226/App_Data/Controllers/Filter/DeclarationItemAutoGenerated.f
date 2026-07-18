<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>
<dir table="dmvtxktd" code="ma_dvcs, ma_vt" order="ma_dvcs, ma_vt" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ma_dvcs" dataFormatString="@upperCaseFormat">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="@@admin = 1 or ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1) and status = '1'" check="@@admin = 1 or ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1)"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="loai_vt" dataFormatString="1, 2, *" clientDefault="*" align="right">
      <header v="Loại vật tư" e="Item Type"></header>
      <footer v="1 - Thành phẩm, 2 - Nguyên vật liệu, * - Tất cả" e="1 - Finished Product, 2 - Material, * - All"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>

    <view id="Dir">
      <item value="120, 30, 70, 100, 230"/>
      <item value="11010: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="11100: [loai_vt].Label, [loai_vt], [loai_vt].Description"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBZ6BzPonTyq1dLDhtA6QszE7aoypIsUqjgvE2qA3HdcQUn4vlTLqb7d8SDMIwsCqZVyhom7S8Ri57YICCZawDmaLJv75iaWsIH6zdqflq9pxgBMVJqFrIhszV+Z8boXBTifgJFSMm4yWLqEDWv7MEobE4ZjoDheGrTxYd/QVTWXkCwl1uV7ElUzWsdLfscfDrlq9etCP6Rg4LAk4h69mqafiyN7JgB99kMBbFZHl38GTbVrIeLq26GkBztgqB1Bz4KErNPHyfovxxKXAc+FS040eZ4h8Nk+2Ae3s2XFpM9E+LOTba2TTSOcCHJZDB94UE7sxLZ3qnSE4H6/TPpP52daDOtUm7pXHpRG9l3c5zkYEp9R/kJ8KlTxkKu8ZmcIaEwLQMttTnB0V3BHGtdQLo+aHvX8u7sG+70DagFUD921PcBm79plk0qFOTltNNfzv9PjcSRgfmWJQFFPuiLXtOxZ/kirloVnmWoWfYABAl76lzHa4E0x1ZDH37rCdLCDp05yLz1WPKVAxjk1BP+g9JfmMA+wnN8FAR+4AP6GtGmlnGz0sQH/RcQ11S4uDJNlhpONzGHLu/T9pDqBB0r9IDmPZG1IAsOmDvjWwYUQ2p+gcJvYuYstIyZrwmh96+sSY+pybcNMPvrCbHbOZdFs+8kX2bVHgKeQ+2aXgd6XOlG6yw==</encrypted>]]>
    </text>
  </script>
</dir>