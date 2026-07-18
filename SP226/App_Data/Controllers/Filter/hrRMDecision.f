<?xml version="1.0" encoding="utf-8" ?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="hrrmqdtd" code="ma_hs" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ma_dot" allowNulls="false">
      <header v="Đợt tuyển dụng" e="Period Code"></header>
      <items style="AutoComplete" controller="hrRMPeriodInfoInput" reference="ten_dot%l" key="status = '1' and (@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = hrrmdot.ma_dvcs and r.r_new=1))" check="(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = hrrmdot.ma_dvcs and r.r_new=1))"/>
    </field>
    <field name="ten_dot%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="status" dataFormatString="*, 0, 1" clientDefault="0" align="right">
      <header v="Trạng thái" e="Status"></header>
      <footer v="0 - Chưa tuyển dụng, 1 - Đã tuyển dụng, &lt;span style=&quot;color:#008200;&quot;&gt;[*]&lt;/span&gt; - Tất cả" e="0 - Unhired, 1 - Hired, &lt;span style=&quot;color:#008200;&quot;&gt;[*]&lt;/span&gt; - All"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="182">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110100: [ma_dot].Label, [ma_dot], [ten_dot%l]"/>
      <item value="111000: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBZ6BzPonTyq1dLDhtA6QszE7aoypIsUqjgvE2qA3HdcQUn4vlTLqb7d8SDMIwsCqZVyhom7S8Ri57YICCZawDmaLJv75iaWsIH6zdqflq9pxgBMVJqFrIhszV+Z8boXBTifgJFSMm4yWLqEDWv7MEobE4ZjoDheGrTxYd/QVTWXkCwl1uV7ElUzWsdLfscfDrlq9etCP6Rg4LAk4h69mqafiyN7JgB99kMBbFZHl38GTYFNMwQOVY7F7sHGXvA1UICymqFKKiJdHYRAeoxm0NQo4ct5U10ZEXRXi8+k7vr4UgpTnVE5DVB/tXDCeC3bNjHO7SJ1RdGrxR4h6BLd3kmngcxHbuoNtG9G4q4ZT4QmoipSkMYEYQijNMZfrCzjVX/MyVKG8Q37bJ5r/8vep70wc9+3VlxrweIlqWlyY49OGsYLCQJd37qU4LFLRs0NOpyXVodghoL5gKxcClQgEHDlUS5AyvLT6xOoLjVaMVXd21dh9bd00YPTYmcQHPqEaupJUxefLMSFGxHVk1vnD/CNbu9AWZuPhxxIKgRqrq49Hobv8xtWzsoKoe1BrKHaNxJPhg0ESc64oC6wjwL4W6fUlbAF56k3CusRvDJTzDbzKQ==</encrypted>]]>
    </text>
  </script>
</dir>