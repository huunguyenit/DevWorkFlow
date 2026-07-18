<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="mcthsdb" code="ma_ky, stt" order="ma_ky, stt" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lọc dữ liệu" e="Filter Data"></title>

  <fields>
    <field name="ma_ky">
      <header v="Mã kỳ" e="Period Code"></header>
      <items style="AutoComplete" controller="MRPPeriodList" reference="ten_ky%l" key="status='1'" check="1=1"/>
    </field>
    <field name="ten_ky%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330"/>
      <item value="1101: [ma_ky].Label, [ma_ky], [ten_ky%l]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBZ6BzPonTyq1dLDhtA6QszE7aoypIsUqjgvE2qA3HdcQUn4vlTLqb7d8SDMIwsCqZVyhom7S8Ri57YICCZawDmaLJv75iaWsIH6zdqflq9pxgBMVJqFrIhszV+Z8boXBTifgJFSMm4yWLqEDWv7MEobE4ZjoDheGrTxYd/QVTWXkCwl1uV7ElUzWsdLfscfDrlq9etCP6Rg4LAk4h69mqafiyN7JgB99kMBbFZHl38GTYFNMwQOVY7F7sHGXvA1UICwvpi9AuOf23LOhjlxjU2tu+Az4sicKabJYW+aF1S0QBkJR974v6jT18n+7Xr/lW6w3FzhLntxpYUVDR367Nj85VpyfOdbpTXdy5S81q6II1feaJLZiMWh/LJpYqLYPpNF78YmdGfWmB2st+E7uPNikyRXfJvMm/+Uzx0rP7e/KTGPPC7tq61TbXsTLF3cHtB+9QN963UzQiKl3rw3vkKO</encrypted>]]>
    </text>
  </script>
</dir>