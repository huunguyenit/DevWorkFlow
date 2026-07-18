<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="dmcttransfer" code="ma_ct" order="i" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lọc dữ liệu" e="Filter Condition"></title>
  <fields>
    <field name="ma_phan_he" onDemand="true">
      <header v="Mã phân hệ" e="Module"></header>
      <items style="AutoComplete" controller="Module" reference="ten_phan_he%l" key="status = '1' and loai_phan_he = '1' and ma_phan_he not in ('TX', 'HR') and wedition &lt;&gt; '9'"/>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBZ6BzPonTyq1dLDhtA6QszE7aoypIsUqjgvE2qA3HdcQUn4vlTLqb7d8SDMIwsCqZVyhom7S8Ri57YICCZawDmaLJv75iaWsIH6zdqflq9pxgBMVJqFrIhszV+Z8boXBTifgJFSMm4yWLqEDWv7MEobE4ZjoDheGrTxYd/QVTWXkCwl1uV7ElUzWsdLfscfDrlq9etCP6Rg4LAk4h69mqafiyN7JgB99kMBbFZHl38GTYFNMwQOVY7F7sHGXvA1UIDa4RcEdmaynIW88Ip/vF+nIe9+7vs1G7A1Ytnb6Zldd0EaoGr5JqYnwoPHovDKjDeCWeE8H9s7BsM30/wZHkJDtbbtiT/lucfhMAgWxU1+rb0sxMzKipS5eDpeJZ//IekY+RUcEHYTmHZ/5erO5dHiqqkQVhxaA1wzEdVNSWj7ForRyWZxVF9FyapOD2ucuoN4BFaMlpDcYc1DBsoYtBbNC3lIN2DC9nVREUQ/Qffb2/Q+4oXBsDOxIwvoJL5SfoNa/qeKB8Tdx/w3gUUcM9+g6oo2nfqMHERyZe3eyJ8/NthqxuII27SqEx/9YvhsS+fPj3rOgFaSasApi/XYlVyGHk2RPGnGKV5wHoGHYzKKNg==</encrypted>]]>
    </text>
  </script>
</dir>