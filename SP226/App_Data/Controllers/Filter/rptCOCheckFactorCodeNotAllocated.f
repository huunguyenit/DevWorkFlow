<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">

  <!ENTITY Control ",@$control = '10000'">
  <!ENTITY CostingUnitFilterShowing SYSTEM "..\Include\Command\CostingUnitFilterShowing.txt">
  <!ENTITY CostingUnitFilter SYSTEM "..\Include\Javascript\CostingUnitFilter.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="0" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ky" type="Decimal" dataFormatString="#0" allowNulls="false">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_dvcs" onDemand="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 330"/>
      <item value="11--: [ky].Label, [ky]"/>
      <item value="11--: [nam].Label, [nam]"/>
      <item value="1101: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
    </view>
  </views>

  <commands>
    &CostingUnitFilterShowing;
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cMreMhvA2v0ODxrnQK5s2vE7ksnu8AP3ggJdwGoattQYw8GK1eZIO7Pnm43VHnP6iliSUbFqfisXlYlrEeb2XVt1/Yp5yTbYNQjILRiifKK9El1iTgvoTru5mwnDm50Ng==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdBirwQHi7tkqUAOMzr9GimZ3UfO6ZOxUJ5msCIlyw4GO1SNWcJPXJSaYS9vJllPkqZoWuWI0G65RzjI3PyNWP6IZ4BTSiQ5QickB/i+jeFiwKTNCWVILp4AUxczEAWvkBYk9pkhqlZhwj1o8aUE0nBgdWz4jDgAJwwzdBFjORaOrvOSJB/KX3yNy7AyH3kGog3/I77M4T/0YRyWX8M0wn48Y6KW8kWT0ko2vwcf7f1LTV3JWiaN6pPccX1flcKnKq1uRReY5ZdOCybw6U4y6DdvMyqp+BF9YiWOPepr3fy7/fmh2U5IEX5C5sL7Vbshda/KuXyXyiYuEPex3d5Womv9BxU89EpIEplC0naso4ISDcE1fkU6v9MpCyOu7q/ihxFpUBE1AuWEC7Sha8oVieP+IzWqbozyx+yf5obAggV0HJ9VbQxZ5BIsaRy3M2zZl75FFPDU+gpp00DsDnUzqIiI=</Encrypted>]]>
      &CostingUnitFilter;
    </text>
  </script>
</dir>