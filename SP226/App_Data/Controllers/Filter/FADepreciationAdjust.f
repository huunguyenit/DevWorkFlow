<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\ProcessLockedDate.txt">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="vctkhts2" code="so_the_ts, ma_nv, ky, nam, ma_bp" order="so_the_ts, ma_nv, ky, nam, ma_bp" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lọc số liệu" e="Filter Data"></title>
  <fields>
    <field name="ky" type="Decimal" dataFormatString="#0" allowNulls="false" align="right" aliasName="Period" defaultValue="(new Date()).getMonth() + 1">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 230"/>
      <item value="11---: [ky].Label, [ky]"/>
      <item value="11---: [nam].Label, [nam]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBZ6BzPonTyq1dLDhtA6QszE7aoypIsUqjgvE2qA3HdcQUn4vlTLqb7d8SDMIwsCqZVyhom7S8Ri57YICCZawDmaLJv75iaWsIH6zdqflq9pxgBMVJqFrIhszV+Z8boXBTifgJFSMm4yWLqEDWv7MEobE4ZjoDheGrTxYd/QVTWXkCwl1uV7ElUzWsdLfscfDrlq9etCP6Rg4LAk4h69mqafiyN7JgB99kMBbFZHl38GTYFNMwQOVY7F7sHGXvA1UIAA7VcBePLMsMhBjkKlkHOfvzgEwAo0YyJOKgJ1piK69obzQazehs0BjIb2AcZ9NPw9hmEYCOXUCIT0s05+6Nk2g5vpVvn5s18plR+yBYWRDPzr3oxsKLVCsBOLlxlkoEZ71e5XbLS4KmVCaK/aQV6w3d08xgv7Nz+aOJdYqAzXHinOZSVCBEZvdqvARMU8TVqxCBdNlVthWGxT+XIATtnuvvGZCJGTseRyQXGXzLjh3rA7aZjWXkHi6b8zMSeZoXXRloC2BRAnAEFAwyjq7HDl+1qgsEM4iPHFnyh29XGI1A==</encrypted>]]>
    </text>
  </script>

</dir>