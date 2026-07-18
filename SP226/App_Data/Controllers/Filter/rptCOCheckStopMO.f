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
    <field name="ky" type="Int32" dataFormatString="#0" allowNulls="false">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Int32" dataFormatString="###0" allowNulls="false">
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
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cMreMhvA2v0ODxrnQK5s2sZ9WZLNcJ7ybxb0gYBY7//TL0yKHpfknGOEFO/YXrlLeH4Jzrnb9L/8cjnqdTG9IsA6mBxdrFqgCi54WT2rNgh</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdBirwQHi7tkqUAOMzr9GimZ3UfO6ZOxUJ5msCIlyw4GO1SNWcJPXJSaYS9vJllPkqZoWuWI0G65RzjI3PyNWP6IZ4BTSiQ5QickB/i+jeFiwKTNCWVILp4AUxczEAWvkBYk9pkhqlZhwj1o8aUE0nBgdWz4jDgAJwwzdBFjORaOrgsgnAZHpEjTFZGudh6zXsa51miREMd9iO2ntuQ/CVCaP4jUJFodAQwnXBpwW67i7RKRhLWfqGLHUEjsJNoHh/ISx6A9bos1XahKnW+V28Da3szoH5Hu2ms7OWh3UFafnSfhEWiaVhDO/jDDttFQJ4sgS2wr6QnqRTgmRG7q+XZnXNlCS1ZsVkDAHZ0PkG79VpIO0hXiyGHpgH6DOHqDUIuPqzfE5JJrpq7u6LANmtF57S/kOVMPVN4WO2nDF+yoKDgNq6zc4WNCEEuXC+Sj6R5mWfBt/vUSDDjOgTIKBeV0=</Encrypted>]]>
      &CostingUnitFilter;
    </text>
  </script>
</dir>