<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\CostingUnitLockedProcess.txt">

  <!ENTITY Control ",@$control = '110'">
  <!ENTITY CostingUnitFilterShowing SYSTEM "..\Include\Command\CostingUnitPhysicalShowing.txt">
  <!ENTITY CostingUnitFilter SYSTEM "..\Include\Javascript\CostingUnitFilter.txt">
]>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Tính chi phí dở dang cuối kỳ theo số liệu kiểm kê" e="Calculate Period-end WIP Cost by Physical Counting"></title>
  <fields>
    <field name="ky" type="Decimal" dataFormatString="#0" allowNulls="false" align="right" aliasName="Period" defaultValue="(new Date()).getMonth() + 1">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_kho" allowNulls="false">
      <header v="Mã kho" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="(ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_access = 1)) and (not exists(select 1 from syssiterights where user_id = @@userID) or ma_kho in (select ma_kho from syssiterights where user_id = @@userID)) and status = '1'" check="(ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_access = 1)) and (not exists(select 1 from syssiterights where user_id = @@userID) or ma_kho in (select ma_kho from syssiterights where user_id = @@userID))"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_kho" allowNulls="false">
      <header v="Nhóm kho" e="Site Group"></header>
      <items style="AutoComplete" controller="SiteGroup" reference="ten_nhom_kho%l" key="ma_nh in (select ma_nh from dmkho where isnull(ma_nh, '') &lt;&gt; ''and ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1)) and status = '1'" check="ma_nh in (select ma_nh from dmkho where isnull(ma_nh, '') &lt;&gt; ''and ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1))" information="ma_nh$dmnhkho.ten_nh%l"/>
    </field>
    <field name="ten_nhom_kho%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_dvcs" onDemand="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1)"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 100, 130"/>
      <item value="11: [ky].Label, [ky]"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110100: [nhom_kho].Label, [nhom_kho], [ten_nhom_kho%l]"/>
      <item value="110100: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6Tmeun7ashL40uJzzKRRlFoWuDZMyMLDxuqpXsR3sbs1P72eroRtY0+Silk8nzJVJG+bfcpEcnFiB9FVTlrH+S9Q3if3vkHjrODJ2L4IvZw+rNDzyuMfh668DwNNi+UJdMA90TjM18OXN6jCw2cv+mmOnGQLQ9xHcpg8LSPM9PsM9ikw1pVKjWEDaDIdFk2p0Sbbms2U3pLeFxEsnb3IyqI5LCAT2EY2rdw54jQmlGvp</encrypted>]]>&Control;<![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70NDjVQjDL7DUybYiy83Umne9NgvK7hVy1Xu0CHUOALQzu+pl13zi/5/cNOoqLFJ4mDmAl8GWm4G7QtL2DMb0TIL2C/iO32cOd7rnWvEmN7V/ZIW7AeHAHrCJE3kAsjUvVeQqOou69jM2+z4u6XbDC2GFaPE1y86JhCLFMbrEHvZvN5WbLF/NtIBUX6xMBqPIC3Y1/g6d3sLPRvTw+TBSaJ9lyMsRaO/Rt/v0JNfBrjVSU7VA/pxRD3ug0LzNFbtzWynZQrE4Oez/gw3jKSwhTHtFO0SYm4ZFS7sASLfTQL3r7uWj4xBNh/fDpuu1RhyuFJpZLcaSS7HGytz/of2XQhzgaqqPoNHQP2aX9yYCJWPLREU7hXsaVdd5fQduBbuzdWcnnDB0JiNVpXSIvD4VJjteLRHgshQEWIKFW36Z9y6IGIf4LJFgZqtmfhkJzzFPtvZvNuC++ZQ6tTHno3VWrfsGYA2yq+BdocHvlMOhW2H0HBEhgG0DggjB47oPNiWETQ==</encrypted>]]>
      </text>
    </command>
    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        <![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7Kj8ZRmX/OkVarRYP4IhJO5gK4hH8aoK+9zKMMqc72q1x1b1NJN+4BqmjDfyskN70NoGulkE5Rsu0Kfi0ebboDiZzo6v8ioyJnE0KWDmpIENdI77F/DITtEcDpF5mH254+g==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &CostingUnitFilter;
    </text>
  </script>
</dir>