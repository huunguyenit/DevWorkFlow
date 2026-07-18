<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="dmct" code="ma_ct" order="ma_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lọc dữ liệu" e="Voucher Information Filter"></title>
  <fields>
    <field name="ma_phan_he" onDemand="true">
      <header v="Mã phân hệ" e="Module"></header>
      <items style="AutoComplete" controller="Module" reference="ten_phan_he%l" key="status = '1' and loai_phan_he = '1' and wedition &lt;&gt; '9'"/>
    </field>
    <field name="ten_phan_he%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 330"/>
      <item value="111: [ma_phan_he].Label, [ma_phan_he], [ten_phan_he%l]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1knDQUw0B7bvwvaApV6TauN5rEPiGSIzhxTReNJ6Gc8vES9fT/jObX0w/QWzbP4aQ73nAooObm5VbXyTfBspL0=</encrypted>]]>
      </text>
    </command>
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBZ6BzPonTyq1dLDhtA6QszE7aoypIsUqjgvE2qA3HdcQUn4vlTLqb7d8SDMIwsCqZVyhom7S8Ri57YICCZawDmaLJv75iaWsIH6zdqflq9pxgBMVJqFrIhszV+Z8boXBTifgJFSMm4yWLqEDWv7MEobE4ZjoDheGrTxYd/QVTWXkCwl1uV7ElUzWsdLfscfDrlq9etCP6Rg4LAk4h69mqafiyN7JgB99kMBbFZHl38GTYFNMwQOVY7F7sHGXvA1UIDa4RcEdmaynIW88Ip/vF+nIe9+7vs1G7A1Ytnb6Zldd+K/AbrgKVevzF4nKKZqGI++d6d6puK8BSZIklNqLWVf0hUAaCdlkYtvYi6VAVxGTxGoYiPKoOPZjHUpf7HSRqxKpgISQHU7DLH0S6Fy1hJF+/oj3V3l5zZRwzY7ud6xeQ/m6Sb2okNh6ai5hemFLGaWMk++2lfdbQC5elVZUtG/U1XjqzR7t2M6hwp0Rr5+0J1KvhZ+frvWowIP5g4/1UxiiUFuT5HSLbsmgdZnToXU1U/N/QRcpBDFKIQ8sH4hUFuNBpIpTBJfJIxjex+2z2kuQZBj3jD5iTAmWJXhfDInn5t/zRPCs3onFxT3C2o4tQ==</encrypted>]]>
    </text>
  </script>
</dir>