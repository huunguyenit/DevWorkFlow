<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="vhrrmkqpv" code="stt_rec" order="stt_rec" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ma_dot" allowNulls="false" onDemand="true">
      <header v="Đợt tuyển dụng" e="Recruitment Period"></header>
      <items style="AutoComplete" controller="hrRMPeriodInfoInput" reference="ten_dot%l" key="(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = hrrmdot.ma_dvcs and r.r_access = 1)) and status = '1'" check="(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = hrrmdot.ma_dvcs and r.r_access =1 ))"/>
    </field>
    <field name="ten_dot%l" external="true" defaultValue="''" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 100, 130"/>
      <item value="110100: [ma_dot].Label, [ma_dot], [ten_dot%l]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfysEz0KvRMQqepvz7Xl99jZxdMjZqmSu3m2Y1f8HxlRAmXcN5AbbuFa3I0I4A9ynhUsfYfq9ow1tEAtopr01NBq3A5fop9a25zctX+HEPVKQIYuapbYmrIDL55MxyfHWbMJR3KqlWz0Gbt4BCR0Ql8q1gcGNlv9+KLd3ofReN4L4IXi8pgFjekBP/9fvpR7kRZKWB6C2d9X7VYrkCmQgMMa/x8d7uzlgRFJHvx7yXUATNbQ8YJ9WOVdD9Si5+UCK9vxjQ9h4MnqMC/mj8ewSlLQ=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBZ6BzPonTyq1dLDhtA6QszE7aoypIsUqjgvE2qA3HdcQUn4vlTLqb7d8SDMIwsCqZVyhom7S8Ri57YICCZawDmaLJv75iaWsIH6zdqflq9pxgBMVJqFrIhszV+Z8boXBTifgJFSMm4yWLqEDWv7MEobE4ZjoDheGrTxYd/QVTWXkCwl1uV7ElUzWsdLfscfDrlq9etCP6Rg4LAk4h69mqafiyN7JgB99kMBbFZHl38GTfvoZ+nZU6LcUtKrLY0TmSUZhB61hcDJ6tnYyHDBcXSsCebJVbtXlcgOk05DWjeH4I5u7BUqRF60Txr/UKQN7Z/8ZB/G2eXmCLqI/y4i/DXPfG3oTkW+wm4b3BgjIywdoX5WttAHpcW10atmSeRS5bskf9xBgLY3EcU4uZYvO+W84X7nnS5Tvb383bM1FgYVY48U54JfZ9mwaO2scMI336sd2tYlMAbQ48Mo8+MqGn+geZ1BGwBi9z18dvvrNGrdnvFdQU0RZl0uWXOaM424Tz/G4f8jRZJzGCj5MbVpfd5ZoiE5UGgtkv+8a0b0WwKE3OOtKUMGd7M0u6ipneQBguA=</encrypted>]]>
    </text>
  </script>
</dir>