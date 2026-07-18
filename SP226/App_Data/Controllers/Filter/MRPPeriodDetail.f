<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="mctdmky" code="ma_ky, nam, ky" order="ma_ky, nam, ky" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ma_ky" allowNulls="false">
      <header v="Mã kỳ" e="Period Code"></header>
      <items style="AutoComplete" controller="MRPPeriodList" reference="ten_ky" key="status='1'" check="1=1"/>
    </field>
    <field name="ten_ky" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nam" allowNulls="false" type="Int32" dataFormatString="###0" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
  </fields>
  
  <views>
    <view id="Dir">
      <item value="120, 40, 10, 50, 330"/>
      <item value="11001: [ma_ky].Label, [ma_ky], [ten_ky]"/>
      <item value="11--: [nam].Label, [nam]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBZ6BzPonTyq1dLDhtA6QszE7aoypIsUqjgvE2qA3HdcQUn4vlTLqb7d8SDMIwsCqZVyhom7S8Ri57YICCZawDmaLJv75iaWsIH6zdqflq9pxgBMVJqFrIhszV+Z8boXBTifgJFSMm4yWLqEDWv7MEobE4ZjoDheGrTxYd/QVTWXkCwl1uV7ElUzWsdLfscfDrlq9etCP6Rg4LAk4h69mqafiyN7JgB99kMBbFZHl38GTYFNMwQOVY7F7sHGXvA1UIC01u30alPNwi5hgCnq4eXDEY/HVUH19f2EpdsTdXAq1ZoQKw9y1udbYSVHwFVBI5dhTvGIr+btQEiU2S4PszVjeLdH5R8nCnDWFx45kPsVlqVYuCNDqrnByjRxEPvV25U3dGzk+9dC8RwXdBlyqpjxUFsqNwdEEajcPpQJeL12WiecWtQdQVcwCNETxp1abPXN198M7Uiy445wvzD5FUgTSbDm9SlL+aY9bz8wDuwe2OCNIffYUhQcNxETzouhQrqqqel+oAYPPQJw9rbvoFpJfXLYaBebFfM1ntCEelCqbd2Mwx6PjjBww0A/TwXBODiwTsg+M7a0gv9PsH14Shaf</encrypted>]]>
    </text>
  </script>
</dir>