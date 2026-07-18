<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY Control ",@$control = '10001'">
  <!ENTITY CostingUnitFilterShowing SYSTEM "..\Include\Command\CostingUnitFilterShowing.txt">
  <!ENTITY CostingUnitFilter SYSTEM "..\Include\Javascript\CostingUnitFilter.txt">
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\CostingUnitLockedProcess.txt">
]>

<dir table="vxcthspbx" code="nam, ky, ma_dvcs, ma_yt, ma_sp, ma_bp, so_lsx" order="nam, ky, ma_dvcs, ma_yt, ma_sp, ma_bp, so_lsx" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lọc số liệu" e="Data Filter"></title>
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
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = '1' and (@@admin = 1 or ma_dvcs in (select ma_dvcs from sysunitrights r where r.user_id = @@userID and r.r_access=1))" check="@@admin = 1 or ma_dvcs in (select ma_dvcs from sysunitrights r where r.user_id = @@userID and r.r_access=1)"/>
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
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf21s0RqkLRL/Gff2E4FsevyedsQIwB+V0LEbxP2riQaQ</encrypted>]]>&CommandCheckLockedDate;<![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7KnojAVBwh/R/UldKXrhGXWmMzvcfiWSCDCwDUcGqaIGrdzKgfWoT2b+rDDZDU67CxYyE4FGDdsFtxwlhNmtE0VuLYwn35ZGkAF6xB55a1AM2HpgTDDYj6To0+pU5qEZTwpSeoaAKIYQQ+Nl6PulW3UgXKj/sNDumF8HrVXm41M3wuNZQrE/a99xs4svYuODA5WaVBdxvGqQVzSG4Kv1ferXvz6p9b90ktFkqvoWSOTLg</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBZ6BzPonTyq1dLDhtA6QszE7aoypIsUqjgvE2qA3HdcQUn4vlTLqb7d8SDMIwsCqZVyhom7S8Ri57YICCZawDmaLJv75iaWsIH6zdqflq9pxgBMVJqFrIhszV+Z8boXBTifgJFSMm4yWLqEDWv7MEobE4ZjoDheGrTxYd/QVTWXkCwl1uV7ElUzWsdLfscfDrlq9etCP6Rg4LAk4h69mqafiyN7JgB99kMBbFZHl38GTYFNMwQOVY7F7sHGXvA1UIAHqKIPjsqYzH7vD+idkFBPNeOK3i4mnkBLc63wsB6h86q/rjE4gGG5YTUzX4WarmA0FAOFbd1/zOgCUcsk+z03B57j+fUG6dtUITyOh7gvreS9Ji53m61THz2f+St2zAB8IshWbbx6bOdsuaFRRTZgxBt1JG62Yl3u1hxaAcLzBOIEWzOMMAqYRhUW4kgYIAYe2Ry8741nCYUMmC6unKcC5tI64skKrvBG9oCgIkydumbHcoHxXRCq8B/sMLxEXk9KXgWV+stvJQ6fqP1iIwRyA5jVKSwc1AvIFHS2Tkutd6HNUTb+kF4XjPO/DM0sk+tQzZVm/0g7/ZbPTPk2d6glA/UPtVVXRbsrdsk1FUmU4NKay/5rcpNzwUDpWQrFtLeEhpSseFLWwk2GOuSRLuxqZn0qe/a+owNvyI1KuEMivOm+MRwMypYBOakp74gd9oM=</encrypted>]]>
      &CostingUnitFilter;
    </text>
  </script>
</dir>