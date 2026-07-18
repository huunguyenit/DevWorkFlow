<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\ProcessLockedDate4Unit.txt">

  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
]>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Tính khấu hao tài sản cố định" e="Calculate Fixed Asset Depreciation"></title>
  <fields>
    <field name="ky" type="Decimal" dataFormatString="#0" allowNulls="false" align="right" aliasName="Period" defaultValue="(new Date()).getMonth() + 1">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit(s)"></header>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1)"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 100, 130"/>
      <item value="11: [ky].Label, [ky]"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="110000: [ma_dvcs].Label, [ma_dvcs]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        <![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7Km+dol4/BOPUmr1Zp4rxdiEKk7bfbNfdGHDImvvgaNzECvl/sapFGkexGDUk0ZVowpKT5+/KVxAMoIKZssYgFDw=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBYC1QDmH+YK5VOwQjUqNs+eOkvO/saKH7fGzeWoXhxH9bHvXDj9WoNnZ5nvaWjDGAUro/C0XRK5BWnzl4zkCdVPmZpYdQutYZ6pJqHG2qKuqQ==</encrypted>]]>
    </text>
  </script>

</dir>