<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\ProcessLockedDate.txt">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
]>

<dir table="ctcddc" code="ma_dc, ma_bp_dc, ky, nam" order="ma_dc, ma_bp_dc, ky, nam" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lọc số liệu" e="Filter Data"></title>
  <fields>
    <field name="ky" type="Decimal" dataFormatString="#0" allowNulls="false" align="right" aliasName="Period" defaultValue="(new Date()).getMonth() + 1">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_dc">
      <header v="Công cụ dụng cụ" e="Tool &amp; Supply"></header>
      <items style="AutoComplete" controller="TS2Tran" reference="ten_dc%l" key="status='1'" check="1=1"/>
    </field>
    <field name="ten_dc%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_bp_dc">
      <header v="Bộ phận sử dụng" e="Using Department"></header>
      <items style="AutoComplete" controller="TSDepartment" reference="ten_bp%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="loai_dc">
      <header v="Loại" e="Type"></header>
      <items style="AutoComplete" controller="TSType" reference="ten_loai%l" key="status = '1'" information="ma_loai$dmldc.ten_loai%l"/>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_dc1">
      <header v="Nhóm 1/2/3" e="Group 1/2/3"/>
      <items style="AutoComplete" controller="TSGroup" reference="ten_nh_1%l" key="loai_nh = 1 and status = '1'" information="ma_nh$dmpndc.ten_nh%l"/>
    </field>
    <field name="nh_dc2">
      <header v="" e=""/>
      <items style="AutoComplete" controller="TSGroup" reference="ten_nh_2%l" key="loai_nh = 2 and status = '1'" information="ma_nh$dmpndc.ten_nh%l"/>
    </field>
    <field name="nh_dc3">
      <header v="" e=""/>
      <items style="AutoComplete" controller="TSGroup" reference="ten_nh_3%l" key="loai_nh = 3 and status = '1'" information="ma_nh$dmpndc.ten_nh%l"/>
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
      <item value="120, 40, 60, 100, 100, 130"/>
      <item value="11----: [ky].Label, [ky]"/>
      <item value="11----: [nam].Label, [nam]"/>
      <item value="110100: [ma_dc].Label, [ma_dc], [ten_dc%l]"/>
      <item value="110100: [ma_bp_dc].Label, [ma_bp_dc], [ten_bp%l]"/>
      <item value="110100: [loai_dc].Label, [loai_dc], [ten_loai%l]"/>
      <item value="11011-: [nh_dc1].Label, [nh_dc1], [nh_dc2], [nh_dc3]"/>
      <item value="110100: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBZ6BzPonTyq1dLDhtA6QszE7aoypIsUqjgvE2qA3HdcQUn4vlTLqb7d8SDMIwsCqZVyhom7S8Ri57YICCZawDmaLJv75iaWsIH6zdqflq9pxgBMVJqFrIhszV+Z8boXBTifgJFSMm4yWLqEDWv7MEobE4ZjoDheGrTxYd/QVTWXkCwl1uV7ElUzWsdLfscfDrlq9etCP6Rg4LAk4h69mqafiyN7JgB99kMBbFZHl38GTYFNMwQOVY7F7sHGXvA1UIAA7VcBePLMsMhBjkKlkHOfvzgEwAo0YyJOKgJ1piK69lu9gXrz3r2mUyPCbXrTu5u8RM8+cqmQNR8i7VH0emDKLr0C5JyDEwXybFqVy2d3NrlwwWwLwptz+XbrL6JPkffbleFWr9y8TvQwBzMHqdUoimkndW7DafbOlG4MjfAqZaUWN4pbnFJx+mYC85LsWvNzhQ5VPa7be8891DQ3RM/idNfeYEso4lCKs12mRmPaENVDaoiZ5yczStRp3WobnjS2tZqfgIqBnY1pjF278c/pjjwCZTaGY12IV0dEf7zQRQEd0dGqsaA5uwjViBFbGzKkD2/YndBe3+Pc8URJy2rNVNpV0WLOhAkGBuJE/dR6hHtP/ueTmft1iqsNlOOD50Dfy56mwtXrQm5nQGso7uGbk43hADWYkA8CUk1YJw6mcBG4rVYJ0LE/mpZBfRgLGVd9P/YDbk1DRG5Vbt9PkJzxNHSvxz6TJZHvnnGy1TGukqx/fIWDTm3fPTjRIJN2A1GWWG0yJI54qDJjHOgNPjnN</encrypted>]]>
    </text>
  </script>

</dir>