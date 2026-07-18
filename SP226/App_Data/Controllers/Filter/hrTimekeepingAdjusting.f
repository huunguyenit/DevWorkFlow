<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir id="0" type="Report" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày từ" e="Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
    </field>
    <field name="ngay2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày đến" e="Date to"></header>
    </field>
    <field name="bo_phan" allowNulls="false">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZYjPMW0OGL9CzG3wgx3Vvccek2nd6jLtTbrYS8aXjs+a9+NDMsVL0vouGDAW+7D4r4d+oWl3jF/5YeFj7b5hTT0=</encrypted>]]></clientScript>
    </field>
    <field name="ten_bp%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" onDemand="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="bp_ref" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="include_yn" type="Boolean" inactivate="true">
      <header v="" e=""></header>
      <footer v="Bao gồm ngày không có chấm công" e="Include days without timekeeping"></footer>
      <items style="CheckBox"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="1101--1: [ngay1].Description, [ngay1], [ngay2], [bp_ref]"/>
      <item value="110100: [bo_phan].Label, [bo_phan], [ten_bp%l]"/>
      <item value="110100: [ma_nv].Label, [ma_nv], [ten]"/>
      <item value="-11000: [include_yn], [include_yn].Description"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7KuE5WyoJuHZbBUhnfS2MGEVfZYWd8fgS/+u2ZGbJ55yqGe+puSzOZMvP4SuzAMwo09Wxm5O76vpEfNqVQq6nNPbLwpPuJWBIvNaVtDPlo0mRufhf1UwuJaPbGq6boi6NySaJxmyBjbfy0gCVJtHd39o=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBb2AweetwuRSjNIt/RVItfnwj8KETZUspDystuKQRyhTh86bwcTpQag/xXBgmMcjIp6PvgqEXudtm/PtmqEMpB5UC0FBX55mAmI5/ISTWc01OaYo8thuThgbqnk90yWlE+DHkd2YNZPSy9ueJ2FmQsXuPVXB5KCWTA5rbP4OhF80dauxDFipIQSL5oiLLVMerSSeShR+X63zSTVpFC7rr/nPAuI9NEG2QIzRrqlmRjxnk9X7mQ6yE6S/EBHK0OwSdfWzkqhTFzPyq63o95wX5f5z9x8C7+bKzopmxDHwjbV6jWvs3TbXfuviSqoC2W4TiK/RARnGR/fbAeumQUHBOMcwhNnc2vdUheiLlbdK5+S4wkFPUVWmrMLdqkgXKsfbMvcJiH0042f+9Y5nsKUAiETl5vJ4YhEuPHL8Eg3NPBMsFN04l3cj3jJRkQ2ZG6d79+y27bzA6mroGmhnG+nHZle0ROcr4WYGy0+UtcD843MZQE4UXUbmbhD2DjmCYNET6U=</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Reference">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK5AnMsH6nWz5jWh8N7/f2bQkgLsQYVSpqEemRHWTf1mhj/Zta8wLN8KCPgPSXbL9YK0BJAPffxD1MADDJJcormBMMT0yYGS4j09QGJxDSsoQg==</encrypted>]]>
      </text>
    </action>
  </response>

</dir>