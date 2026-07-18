<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir id="0" type="Report" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Bút toán kết chuyển lương" e="Salary Transaction"></title>
  <fields>
    <field name="ky" type="Decimal" dataFormatString="#0" allowNulls="false" align="right" aliasName="Period" defaultValue="(new Date()).getMonth()+1">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_dvcs" onDemand="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="((@@admin = 1) or (ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and (r_new = 1 or r_edit = 1 or r_del = 1 or r_access = 1)))) and status = '1'" check="((@@admin = 1) or (ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and (r_new = 1 or r_edit = 1 or r_del = 1 or r_access = 1))))"/>
    </field>

  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 100, 130"/>
      <item value="11: [ky].Label, [ky]"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Sa6Q13p1EYF4EO21YazdOpQWPDBQG+Q5sJw8Vpj4+XXifS1jt5wvgWwuhY6AQlAl4aMI3Sz2dhthgppiLCAgi0=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdGm589nGw3hgv2TNtZkkZj9PkaC1rqAwOgJ0qbuVn8iPyKfWhFeCwoQTDVk6ffPN+pgAz9INerHVIhxBvNGuFBjHVaHIaN5B3tlI83M+ElN47FooUQuLqoiWHadSkOAZlktvNGqCg1pcMM2oM9ZNCFzrzUU4bwkZPIOc30P8fO7HX221pXCJ+Zyuafs+YHULzE3C4ZDQa3q78DZkRMKdNDDpOLioikDRUgFijnZp4YQOflZJsgy1lR2Uj2/o7+ZS8zwwtZFrjH64lTU04lWSGTokq4pMc7lw9OHsjkC/LT033RRopA4yfXRs6tGx8UDKEFLOhui7hk8mM1WUXYwP3PXfeKNAvb8QvBFuaa6r7mdb</Encrypted>]]>
    </text>
  </script>
</dir>