<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="khdttuan" code="nam, ky, ma_dvcs, ma_bp, ma_vv, ma_ct, lan" order="nam, ky, ma_dvcs, ma_bp, ma_vv, stt, ma_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ky_tu" type="Decimal" dataFormatString="#0" aliasName="fromPeriod" defaultValue="(new Date()).getMonth() + 1;">
      <header v="Kỳ từ" e="Period from"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZdhKMyDcSZVXQLrMIZtUm+tMJyAizOnFubpPidvPgCF/AapbbrQaKLr6cArPOgwZjttMIvRY1aIIMkBE/30kaQc=</encrypted>]]></clientScript>
      <footer v="Kỳ từ/đến" e="Period from/to"></footer>
    </field>
    <field name="ky_den" type="Decimal" dataFormatString="#0" aliasName="toPeriod" defaultValue="(new Date()).getMonth() + 1;">
      <header v="Kỳ đến" e="Period to"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZdhKMyDcSZVXQLrMIZtUm+tMJyAizOnFubpPidvPgCF/AapbbrQaKLr6cArPOgwZjttMIvRY1aIIMkBE/30kaQc=</encrypted>]]></clientScript>
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
      <item value="120, 20, 10, 10, 20, 40, 100, 230"/>
      <item value="1100----: [nam].Label, [nam]"/>
      <item value="11010---: [ky_tu].Description, [ky_tu], [ky_den]"/>
      <item value="11000010: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="11000010: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="11000010: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBZ6BzPonTyq1dLDhtA6QszE7aoypIsUqjgvE2qA3HdcQUn4vlTLqb7d8SDMIwsCqZVyhom7S8Ri57YICCZawDmaLJv75iaWsIH6zdqflq9pxgBMVJqFrIhszV+Z8boXBTifgJFSMm4yWLqEDWv7MEobE4ZjoDheGrTxYd/QVTWXkCwl1uV7ElUzWsdLfscfDrlq9etCP6Rg4LAk4h69mqafiyN7JgB99kMBbFZHl38GTbVrIeLq26GkBztgqB1Bz4JqHQ/GFqreN//iobGWlFu7m+z1s/v6l67LdzcC+jZ5YhddRZjlR7JpNIYVD2lL8R6+LOuR0X+zLpjgv+RuS4Jmg41Bj79KDS08oqg3CKmFWn7R89D5ETF0aXQcBLa0Rzqz3tdqZSGrk5eWUcCeCzbi0am9udQ0nHp1ZutjxWP2/JxRDYuHu0BBcwGqpbOvP4qxDvdAwkrtXrcM3I/2cqnvi2Q+zqowGZBB0UJ73WCF4KkvOuTzSzkyCyHgmsZM880lOB0bNQZ0gDrA+IwjG2bXghu07e9/d2PRqPDgSJgrO3jf6ITKabY6C/64+F8aJ7m/DptuGzVwuzx7LZ6Dxtr/NCG5l7uxGKJgHjuIsk6uI+cPAKjMnHSteNVUFepr6mokmGv3Kxmzx055XmwxkbMJ2UD3yzYLI2FUpx4HQice9iQWNBwzHdNCFqbSKcnxyFFhl/C9J0GMDq5mVZO+YIMeE9Juck///GDTuI2BWDWkOE/i+aBQxSqZiYhuxGCviSQueTSSq6tDYitDu+3HZz5h8yGbNL3psmHfUp1LLEWcZQ==</encrypted>]]>
    </text>
  </script>
</dir>