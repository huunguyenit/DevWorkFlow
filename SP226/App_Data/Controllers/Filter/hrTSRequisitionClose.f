<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterInit SYSTEM "..\Include\XML\WhenFilterInit.xml">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptFilterInit SYSTEM "..\Include\Javascript\FilterInit.txt">
  <!ENTITY TableDetail "hrccctyccp">
]>

<dir table="hrccyccp" code="stt_rec" order="ngay_ct, so_ct" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Yêu cầu từ ngày" e="Date from"></header>
      <footer v="Ngày lập từ/đến" e="Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Yêu cầu đến ngày" e="Date to"></header>
    </field>
    <field name="so_ct1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Số phiếu từ/đến" e="Requisition No. from/to"></header>
      <items style="Mask"></items>
    </field>
    <field name="so_ct2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="" e=""></header>
      <items style="Mask"></items>
    </field>
    <field name="ma_bp" filterSource="master" operation="10">
      <header v="Mã bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hreDepartment" reference="ten_bp%l" key="status = '1'" check="1 = 1" information="ma_bp$hrbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>

    <field name="ma_nv" categoryIndex="1" external="true" onDemand="true">
      <header v="Mã nhân viên" e="Employee"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten_nv" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)" information="&TableDetail;"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PKCszOjj/H8rduNfibr9hOC5ktlKu5W2e2P8r20ph+dfhidd6IGm8P5Fhy2XjeObGvRPl6IWHuVyUXEVnmudu8=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_nv" readOnly="true" external="true">
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

    <field name="status" dataFormatString="0, 1" clientDefault="0" align="right" inactivate="true" categoryIndex="2">
      <header v="Trạng thái" e="Status"></header>
      <footer v="0 - Chưa đóng, 1 - Đã đóng" e="0 - Open, 1 - Close"></footer>
      <items style="Mask"/>
    </field>

    <field name="ma_dvcs" categoryIndex="-1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="user_id0" dataFormatString="0, 1" clientDefault="0" align="right" inactivate="true" categoryIndex="-1">
      <header v="Người sử dụng" e="User"></header>
      <footer v="1 - Lọc theo người sử dụng, 0 - Không" e="1 - Filter by User, 0 - No"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="62">
      <item value="120, 30, 70, 100, 230, 0"/>
      <item value="1101-: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="1101-: [so_ct1].Label, [so_ct1], [so_ct2]"/>
      <item value="11010: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110101: [ma_nv].Label, [ma_nv], [ten_nv], [stt_rec_nv]"/>
      <item value="110100: [ma_cc].Label, [ma_cc], [ten_cc%l]"/>

      <item value="11100: [status].Label, [status], [status].Description"/>

      <item value="11010: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="11100: [user_id0].Label, [user_id0], [user_id0].Description"/>

      <categories>
        <category index="1" columns="120, 30, 70, 100, 230">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="2" columns="120, 30, 70, 100, 230">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFSesqNXIl+kdAsZroBdqAzZPfcbzh+su4dGDO0HdcXrGSkq5tBUCX1O6Jh3ClRlJiA8cUy7wsVF5Gb4Yp6t3Wk=</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterInit;

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFSxUTjSdwpeFyDkTvWrtBBVQ5yIuCyzd6YnS4nHcYZjlcbrro+3Z7PUsR63mxUmt7AygOUPM0feCkgYexLywm0=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptFilterInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtf0ePKWMx2z3mvcfODpAeD6TbO3opaqe/n04Q34AtpZ1kFiw2I6YDJ5nIJArEF00UAQPuE7LmyvOyrWFWtbBGwBxs/39EHgTMy4kheFEi8AWqOhaU95/cUFLjXC/eyaEFctWULe9Z1xuTvfb0clUl327yHcnWN96jDuduW5BIpSIdWqggR46Y8dUeWRWBqW8rSka1tYCdCLzNyxKRZxKGSeFTucO4xYK5U6/kCUq8N2t055Habnuk22nMmzoUgF9qnavgBjD+GScRW0+AGgUCiG+XyO1bANVjAEkpVY5MPHCjV19ckndH9iN3yvBLRLPmLalqNVBfBh57jg+l8wLhJ9+y411kl+0a3sdgwgcN+pvSvBAWhxWozf3z48OgGT/AKt5U/46yM/bTjnAJXvpTH7r89Sp5NZ8GGB8Jnzk62AesMJpRvB/AGBUbjf7jrL2LzodaGt8TpGNc6Vx/Pl8tfiqRAweYQc9JCnQokn2h8UzpFWVFdFXWaAaLfbLI0rdCr0KjS1bo93AZGOP5pBTh35R98uJABwAptDK9mgXEldj+2QqezmNdHPdhJT4qySYtWslmtVNztxc7h01clXaS50=</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="EmployeeID">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5p1ONhnQ/dVeNDqmQY5tBTf9gniI5ZdZXG2dYHCvwCWNRE7oibOz15UAauBnUtmvG2plJ0n8VduM9zqgaRb4YlgHc2QW3PV5HfWGJB4RT7LQ==</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>