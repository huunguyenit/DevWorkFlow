<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterInit SYSTEM "..\Include\XML\WhenFilterInit.xml">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptFilterInit SYSTEM "..\Include\Javascript\FilterInit.txt">
  <!ENTITY TableDetail "hrccctcp">
]>

<dir table="hrcccp" code="stt_rec" order="ngay_ct, so_ct" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày lập từ" e="Date From"></header>
      <footer v="Ngày lập từ/đến" e="Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày lập đến" e="Date to"></header>
    </field>
    <field name="so_ct1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Số phiếu từ/đến" e="Voucher No. from/to"></header>
      <items style="Mask"></items>
    </field>
    <field name="so_ct2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="" e=""></header>
      <items style="Mask"></items>
    </field>

    <field name="ma_nv" categoryIndex="1" external="true" onDemand="true">
      <header v="Mã nhân viên" e="Employee"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten_nv" key="status = '1'" check="1=1" information="&TableDetail;"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZT01AmUDFqrsygO57wHrcR9QMDrepg/toJJFieFCnRFFyjUXcL9gpk/bHx/jznzr0CilpS+QieP2SckHV2rTDio=</encrypted>]]></clientScript>
    </field>
    <field name="ten_nv" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_nv" categoryIndex="1" filterSource="detail" operation="10" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_cc" categoryIndex="1" filterSource="detail" operation="20">
      <header v="Mã công cụ" e="Tool &#38; Supply"></header>
      <items style="AutoComplete" controller="hrTSList" reference="ten_cc%l" key="status = '1'" check="1 = 1" information="&TableDetail;"/>
    </field>
    <field name="ten_cc%l" readOnly="true" external="true" inactivate="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" categoryIndex="-1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="user_id0" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" categoryIndex="-1">
      <header v="Người sử dụng" e="User"></header>
      <footer v="1 - Lọc theo người sử dụng, 0 - Không" e="1 - Filter by User, 0 - No"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="62">
      <item value="120, 30, 70, 100, 230, 0"/>
      <item value="1101: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="1101-: [so_ct1].Label, [so_ct1], [so_ct2]"/>
      <item value="110101: [ma_nv].Label, [ma_nv], [ten_nv], [stt_rec_nv]"/>
      <item value="110100: [ma_cc].Label, [ma_cc], [ten_cc%l]"/>
      <item value="11010: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="11100: [user_id0].Label, [user_id0], [user_id0].Description"/>
      <categories>
        <category index="1" columns="120, 30, 70, 100, 230">
          <header v="Chi tiết" e="Detail"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1knDQUw0B7bvwvaApV6TauN5rEPiGSIzhxTReNJ6Gc8vES9fT/jObX0w/QWzbP4aQ73nAooObm5VbXyTfBspL0=</encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterInit;

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfxiWn1XwMbwyyITpd53qAFwifb0L8T9g2Sn5IBXqhxWc9wL5Ud1tDx+GBHIquoTP3l8zQ6+dMcF8m1HDCJ/Jn90=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptFilterInit;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYU3jg67mYTmJvr0ghQ2FoZcyBnTTb3YHlen8XX79WTwTUKcVrOnuFFgRSXLbnifE00m0S5O9kfI5LDqnx0IT6yJ1WexoKLdJPKDxJmu7+f73gwEIE8abIiwAoMtnKR8GtdN/r5L7aOFn9+jEM4pjpfApRQVyuq3HV8xL/5LpO3tUJDyrWfU/blJ+L8SYp1CzNhOhPHLhPBHcu9LreCeOWlMO4v4og+8cO/JrsiaO4wMS75/9FsyvZU6c5Lujvs+W5jnWuAYtQt6evCdcDRVfiKpCS0pFZOIcvEXUWQXQG+sFPp5D0PqrJqTe9Z7UIMA8/fQ3NBZnQAUMWLUDvU2rG876P610a+7LELFSBn5bBAKjZMEcI58U9lGJmHRCfJGiiKnXe8G7IoTIA95cOzJiJr4K1hJ7DXR50scSlpIGPKsZwkUfawLTokxT7n8SAeQRHE1nG5KyXebTVwDTiCRHQZw==</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="EmployeeID">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK6Wdyk9aPi/fGimY6rlT0N8nVAGzan76LcTwu5Z5TgGNe1NWZAFthZQVFXCS3ORqLbPILfY5lclrzI1lzkCB9izQcDmPERv+f/FcKknTu+wPw==</encrypted>]]>
      </text>
    </action>
  </response>
</dir>