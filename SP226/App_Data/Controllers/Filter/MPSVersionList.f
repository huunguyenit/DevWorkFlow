<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="mpversion" code="loai, code" order="loai, code" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="loai" allowNulls="false" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Loại" e="Type"></header>
      <footer v="1 - Kế hoạch sản xuất, 2 - Nhu cầu vật tư" e="1 - Master Production Scheduling, 2 - Material Requirements Planning"></footer>
      <items style="Mask"/>
    </field>
  </fields>
  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330, 0"/>
      <item value="111000: [loai].Label, [loai], [loai].Description"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBZ6BzPonTyq1dLDhtA6QszE7aoypIsUqjgvE2qA3HdcQUn4vlTLqb7d8SDMIwsCqZVyhom7S8Ri57YICCZawDmaLJv75iaWsIH6zdqflq9pxgBMVJqFrIhszV+Z8boXBTifgJFSMm4yWLqEDWv7MEobE4ZjoDheGrTxYd/QVTWXkCwl1uV7ElUzWsdLfscfDrlq9etCP6Rg4LAk4h69mqafiyN7JgB99kMBbFZHl38GTfWLEzJeNkS8M+RHBFU5P0dqC8Uo04zJ5pD9viNYH8oCr9Iq+jivWIivkfLkWOlwmnqJInfTkrapYq+Hf2o+hgR2AvhxGeWFhgXHUSFnaic9YxfnTPtTiaiDNxXO9wmyCzZed8Sp+hJ2ijxvI1JrHyiyFNph7UkEIITSVYVJbUPqKv0g81+NsT0zqCu3mudeVR4vRHdodjE5DzI15+BInMqBPdOVdJFzismmSoM0UT41kgjS3DU6Ruv/d33tf/Ej0mLWgg9cVL69a/RNPkeb4eQDMjfh3maZtzjhWEaeRzeNZ6Iuo6lkQ8t4zwFtYcHa9C6xfjsly+XrbSWly/ElUks50i5+bcWzOPJkhBX7JBZ8</encrypted>]]>
    </text>
  </script>
</dir>