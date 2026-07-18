<?xml version="1.0" encoding="utf-8" ?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="vhrrmlichct" code="ma_dot, stt_rec0" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ma_dot" allowNulls="false">
      <header v="Đợt tuyển dụng" e="Recruitment Period"></header>
      <items style="AutoComplete" controller="hrRMPeriodInfoInput" reference="ten_dot%l" key="status = '1' and (@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = hrrmdot.ma_dvcs and r.r_access=1))" check="(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = hrrmdot.ma_dvcs and r.r_access=1))"/>
    </field>
    <field name="ten_dot%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="182">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110100: [ma_dot].Label, [ma_dot], [ten_dot%l]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBZ6BzPonTyq1dLDhtA6QszE7aoypIsUqjgvE2qA3HdcQUn4vlTLqb7d8SDMIwsCqZVyhom7S8Ri57YICCZawDmaLJv75iaWsIH6zdqflq9pxgBMVJqFrIhszV+Z8boXBTifgJFSMm4yWLqEDWv7MEobE4ZjoDheGrTxYd/QVTWXkCwl1uV7ElUzWsdLfscfDrlq9etCP6Rg4LAk4h69mqafiyN7JgB99kMBbFZHl38GTYFNMwQOVY7F7sHGXvA1UICymqFKKiJdHYRAeoxm0NQo4ct5U10ZEXRXi8+k7vr4UgpTnVE5DVB/tXDCeC3bNjE/XBppfwmQxyDNTW81lxyPVxU4FMlROu0DCH3j/ffNmlhypckY+e/maxFbGeGDHu0lSztkMczMJ3JmpjR9xfLIoJFIW3tyfw8/g0gCKZipp47K2h7yWoWsFnrcOgb916xosLzwFOTuvtwmsHhl8rAGj7RzxGUz210qWsXJ2smCNC+yN7c/xdNwHSC8dJhHZS3bayzUCRP0ZDmO9NUP4XMT23d+lWtlRML/Fne8HKaNvw==</encrypted>]]>
    </text>
  </script>
</dir>