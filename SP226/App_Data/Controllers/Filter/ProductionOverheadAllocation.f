<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY Control ",@$control = '10000'">
  <!ENTITY CostingUnitFilterShowing SYSTEM "..\Include\Command\CostingUnitFilterShowing.txt">
  <!ENTITY CostingUnitFilter SYSTEM "..\Include\Javascript\CostingUnitFilter.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="0" type="Report" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Bút toán phân bổ chi phí sản xuất chung" e="Production Overhead Allocation Transaction"></title>
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
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1)"/>
    </field>
    <field name="ten_dvcs%l" clientDefault="Default" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 100, 130"/>
      <item value="11: [ky].Label, [ky]"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="110100: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
    </view>
  </views>

  <commands>
    &CostingUnitFilterShowing;
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4SNkElCXXnbr0ncpLBHWhsGTyIqY1GnogfkAoWl5x7mhe4SZShVbSX+aukVd5MjwQS6RT2GyatUfIbXpdtvTePg=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdGm589nGw3hgv2TNtZkkZj9PkaC1rqAwOgJ0qbuVn8iPyKfWhFeCwoQTDVk6ffPN+pgAz9INerHVIhxBvNGuFBjHVaHIaN5B3tlI83M+ElN47FooUQuLqoiWHadSkOAZlktvNGqCg1pcMM2oM9ZNCFzrzUU4bwkZPIOc30P8fO7HX221pXCJ+Zyuafs+YHULzE3C4ZDQa3q78DZkRMKdNDDpOLioikDRUgFijnZp4YQOflZJsgy1lR2Uj2/o7+ZS8zwwtZFrjH64lTU04lWSGTplJZQP3NaIV7WsIRnW+HbrW8A8kO2QOy5sDedNUU+qGRUnsHvLSe3joH0L9dPVwz49ymDJFE76SBPCOcybG6bPl0w/rehKkqiCzDn/jgqoD7B2108dlHjhubtQJHjEOpw=</Encrypted>]]>
      &CostingUnitFilter;
    </text>
  </script>
</dir>