<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="tpbdc" code="stt_rec" order="ngay_ct, so_ct, ma_dc, stt_rec" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lọc số liệu" e="Indicator Filter"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" aliasName="fromDate" defaultValue="new Date()">
      <header v="Chứng từ từ ngày" e="Voucher Date From"></header>
      <footer v="Ngày chứng từ" e="Voucher Date"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" aliasName="toDate" defaultValue="new Date()">
      <header v="Chứng từ đến ngày" e="Voucher Date to"></header>
    </field>
    <field name="ngay_pb1" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Thôi phân bổ từ ngày" e="Abandonment Date From"></header>
      <footer v="Ngày thôi phân bổ" e="Abandonment Date"></footer>
    </field>
    <field name="ngay_pb2" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Thôi phân bổ đến ngày" e="Abandonment Date to"></header>
    </field>
    <field name="ma_dc">
      <header v="Công cụ dụng cụ" e="Tool &amp; Supply"></header>
      <items style="AutoComplete" controller="TS2Tran" reference="ten_dc%l" key="status='1'" check="1=1"/>
    </field>
    <field name="ten_dc%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230"/>
      <item value="1101: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="1101: [ngay_pb1].Description, [ngay_pb1], [ngay_pb2]"/>
      <item value="11010: [ma_dc].Label, [ma_dc], [ten_dc%l]"/>
      <item value="11010: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBZ6BzPonTyq1dLDhtA6QszE7aoypIsUqjgvE2qA3HdcQUn4vlTLqb7d8SDMIwsCqZVyhom7S8Ri57YICCZawDmaLJv75iaWsIH6zdqflq9pxgBMVJqFrIhszV+Z8boXBTifgJFSMm4yWLqEDWv7MEobE4ZjoDheGrTxYd/QVTWXkCwl1uV7ElUzWsdLfscfDrlq9etCP6Rg4LAk4h69mqafiyN7JgB99kMBbFZHl38GTYFNMwQOVY7F7sHGXvA1UIBWCIt5ki8ZSZVmqt8XFBmWyHfh1dCaixcNW+Zo1/43ZPAbFpGimP/NABMn3/ZnyQiUysZKSd70y5Y/7PCB+iZ08BERaH/tJgKXGZAuw1IzSxCSejagdl47fCuYyeCCEv2pNkw0eTVKjBhzh7jjdoNedxWoTYH5F2jgCUL4uIkuNEMIxmLiGOkeN2AAZBTDnYRE/NVbnlFkt4iSTNrKHI4kw0LqEnXhPKkzXL3tnWrtJ7tkplePWJtUXkZ0/Lo6TYhVfGJwbcqPGCLBaV9szuC+i9dhFv+ZcLpsUzVBagj4rQwWDPK5drsK+AOeHm8eDlg=</encrypted>]]>
    </text>
  </script>
</dir>