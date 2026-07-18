<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="vdmgia" code="stt_rec" order="ma_vt, ngay_ct2 desc, ma_kh" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lọc số liệu" e="Filter Data"></title>
  <fields>
    <field name="ma_vt" dataFormatString="@upperCaseFormat" clientDefault="Default">
      <header v="Mã hàng" e="Item Code"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" normal="true" key="status = '1'" check="1 = 1" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" >
      <header v="" e=""></header>
    </field>
    <field name="loai_vt">
      <header v="Loại vật tư" e="Item Type"></header>
      <items style="AutoComplete" controller="ItemType" reference="ten_loai_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_loai_vt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="nh_vt1">
      <header v="Nhóm hàng hóa - vt 1" e="Item Group 1"/>
      <items style="AutoComplete" controller="ItemGroup" reference="ten_nh_vt1%l" key="loai_nh = 1 and status = '1'" check="loai_nh = 1"/>
    </field>
    <field name="ten_nh_vt1%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_vt2">
      <header v="Nhóm hàng hóa - vt 2" e="Item Group 2"/>
      <items style="AutoComplete" controller="ItemGroup" reference="ten_nh_vt2%l" key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
    </field>
    <field name="ten_nh_vt2%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_vt3">
      <header v="Nhóm hàng hóa - vt 3" e="Item Group 3"/>
      <items style="AutoComplete" controller="ItemGroup" reference="ten_nh_vt3%l" key="loai_nh = 3 and status = '1'" check="loai_nh = 3"/>
    </field>
    <field name="ten_nh_vt3%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="ngay_ban" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" external="true" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày bắt đầu hiệu lực" e="Effective from"></header>
    </field>
    <field name="ngay_hl" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" external="true" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày kết thúc hiệu lực" e="Effective to"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 330"/>
      <item value="111: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="111: [loai_vt].Label, [loai_vt], [ten_loai_vt%l]"/>
      <item value="111: [nh_vt1].Label, [nh_vt1], [ten_nh_vt1%l]"/>
      <item value="111: [nh_vt2].Label, [nh_vt2], [ten_nh_vt2%l]"/>
      <item value="111: [nh_vt3].Label, [nh_vt3], [ten_nh_vt3%l]"/>
      <item value="11-: [ngay_ban].Label, [ngay_ban]"/>
      <item value="11-: [ngay_hl].Label, [ngay_hl]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBZ6BzPonTyq1dLDhtA6QszE7aoypIsUqjgvE2qA3HdcQUn4vlTLqb7d8SDMIwsCqZVyhom7S8Ri57YICCZawDmaLJv75iaWsIH6zdqflq9pxr/AipYQPotRTCbOLAS5wqPi903XdUEfPEGvV8KxF3KFurT/NE+CZriSGtDCxxdpk2fxMpLPFJbssSzBItBbIfoGwjtTNLc4u+jGj1ZMnscSSDMucZOodeqH6gNL38mtIbqo/igX1DC/7Y0HqP3eB9szu7HLtlGvCV7W4RJxFSI67R6FaUPXBRiM1Z364wrL/k1L6qDVWO4WRfRljYlN1GRLt9WPYB1MFRmH6TANhavWfSPsRxxYazcoAk62qMV04UgD5eJfAyYYyI5G1wIC9NdJHu7+zgQ8pY74/pH1YJlgDuVfL6OTbuM+HQOcx7U/E5kYytislzx8ddez+ksx3jPC/ByUcYTw3fl42nZkaHMDp8ueyoNiiDFXdBEjLRI/vK5mejvcGVb9KrJz+WnoqcYtH/sl0e++4YGIy8bk51ueVH3lNfwebRjlTnGbYqov1armZ2UULcEzJrYGzx9QmmlCZ60clWUF1+PQFGY9sO3P4+dVMwjFMR00Fat4YYi0OExlbIq5wWR4xT7xs7TDRubtE4bedKXeQyVWDnXYz7wFYLgwZsmO6zMt+yB6pezmV7LWnlut7tVOhvy+4YWPNRhU3p7Zg5kWNzN83MkJKvpa/hPTPPUkgR6i93q2F+fUQrL6hBYOs1tIcS2sKOw4whNK79gtfPHTCh24SxrY7bprt+5GlDnq1Wi8gf5w6lQ8iYJf6d8GH1AGsy03YqS24oA=</encrypted>]]>
    </text>
  </script>

</dir>