<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY Control ",@$control = '10001'">
  <!ENTITY CostingUnitFilterShowing SYSTEM "..\Include\Command\CostingUnitFilterShowing.txt">
  <!ENTITY CostingUnitFilter SYSTEM "..\Include\Javascript\CostingUnitFilter.txt">
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\CostingUnitLockedProcess.txt">
]>

<dir table="vxdmvt2x" code="ky, nam, ma_dvcs, ma_vt, ma_vt0" order="ky, nam, ma_dvcs, ma_vt, ma_vt0" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn kỳ" e="Select Period"></title>
  <fields>
    <field name="ky" isPrimaryKey="true" allowNulls="false" align="right" type="Decimal" dataFormatString="#0" aliasName="Period" defaultValue="(new Date()).getMonth() + 1">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" isPrimaryKey="true" allowNulls="false" align="right" type="Decimal" dataFormatString="###0" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_dvcs" isPrimaryKey="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="copy" dataFormatString="0, 1" clientDefault="0" align="right" inactivate="true">
      <header v="Sao chép dữ liệu" e="Copy"></header>
      <footer v="1 - Lấy dữ liệu từ kỳ trước, 0 - Không" e="1 - Copy data from previous period, 0 - No"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 230"/>
      <item value="11: [ky].Label, [ky]"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="11010: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="11100: [copy].Label, [copy], [copy].Description"/>
    </view>
  </views>

  <commands>
    &CostingUnitFilterShowing;

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf21s0RqkLRL/Gff2E4FsevyedsQIwB+V0LEbxP2riQaQ</encrypted>]]>&CommandCheckLockedDate;<![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7KnojAVBwh/R/UldKXrhGXWmMzvcfiWSCDCwDUcGqaIGrdzKgfWoT2b+rDDZDU67CxYyE4FGDdsFtxwlhNmtE0VuLYwn35ZGkAF6xB55a1AM2HpgTDDYj6To0+pU5qEZTwoFqGXwR7mrKq/IWwW2rBjxGpq5sRZrPzEahXW48BivdraOr/8F8MCx2VAbpwevux0fMRdeGY4n8UeJPUIYOqLw=</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBZ6BzPonTyq1dLDhtA6QszE7aoypIsUqjgvE2qA3HdcQUn4vlTLqb7d8SDMIwsCqZVyhom7S8Ri57YICCZawDmaLJv75iaWsIH6zdqflq9pxgBMVJqFrIhszV+Z8boXBTifgJFSMm4yWLqEDWv7MEobE4ZjoDheGrTxYd/QVTWXkCwl1uV7ElUzWsdLfscfDrlq9etCP6Rg4LAk4h69mqafiyN7JgB99kMBbFZHl38GTYFNMwQOVY7F7sHGXvA1UIAA7VcBePLMsMhBjkKlkHOfvzgEwAo0YyJOKgJ1piK69qCgkgRmhsAuCleVgq3Td3wjcxF/EydWDO6C4nTyscQTamV5hhVQBsn3Vs8HIhvEtcZt2FzMYyJlgZprkbBkBJxnGPAK+YuMe8XlPgMkYO5VEYbnn49hanpfFiYVQtQRHcKzFnH3jykLwZyIi50Ue3aycTvHUIhhPLZVoNradtz4XGALi0XGRhrnAKaWGOAZmc3pxIWVZdYUsBkYFlnzxrE8pLP4rz7cJtv9i6t0eBZHBbq53lR5DA4KPqXUWIXTWj6dcEUSTtZHOTo4/p096ALcnAgu99ypllGOARe+Egbv7wTdHZnQLjOK7I8Qx8uDmNHcVRN70F7VNJN4ZdlEqpQQj4LduuZzlmbxGFtG7kqzvGPMkOwZ+Uv+awVEg4xQnFBLHjh10FHEh4XYUsoluDY=</encrypted>]]>
      &CostingUnitFilter;
    </text>
  </script>

</dir>