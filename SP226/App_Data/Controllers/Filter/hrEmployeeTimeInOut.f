<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="vhrvaora" code="stt_rec, ngay, gio, hs_yn" order="stt_rec, ngay, gio0" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày từ" e="Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
    </field>
    <field name="ngay2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày đến" e="Date to"></header>
    </field>
    <field name="bo_phan" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZY1hhyR1cCxbTpYE36KRQ1D7VdYnyBGadUH/jjlyk42o+gMQ1TCN8SkR7fJTAV8PD0mb2siEluYNBxxoKhwn68g=</encrypted>]]></clientScript>
    </field>
    <field name="ten_bp%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" onDemand="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="vi_tri" onDemand="true">
      <header v="Vị trí công việc" e="Position"></header>
      <items style="AutoComplete" controller="hrPosition" reference="ten_vtr%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vtr%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="bac_quan_ly" onDemand="true">
      <header v="Bậc quản lý" e="Job Grade"></header>
      <items style="AutoComplete" controller="hrManagerLevel" reference="ten_bac%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bac%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="bp_ref" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="182">
      <item value="120, 30, 70, 100, 100, 130, 0, 0"/>
      <item value="1101--11: [ngay1].Description, [ngay1], [ngay2], [stt_rec], [bp_ref]"/>
      <item value="11010000: [bo_phan].Label, [bo_phan], [ten_bp%l]"/>
      <item value="11010000: [ma_nv].Label, [ma_nv], [ten]"/>
      <item value="11010000: [vi_tri].Label, [vi_tri], [ten_vtr%l]"/>
      <item value="11010000: [bac_quan_ly].Label, [bac_quan_ly], [ten_bac%l]"/>
    </view>
  </views>
  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBb2AweetwuRSjNIt/RVItfnwj8KETZUspDystuKQRyhTh86bwcTpQag/xXBgmMcjIp6PvgqEXudtm/PtmqEMpB5UC0FBX55mAmI5/ISTWc01I+/YIjsJO+tkPqrJVvggvG0toa2AB+0+4BDXwRaEckK2PT/pkDox9I+B5jMEDc7PAzc8neYPYUONuXnTbveKG5l34o1DlqVBMNfGQBGu0bhiYD+8J5zPqOmCPqKy3WXUk2r/sa4r+yoJpy5QdUHdbhkdqvXpSzuo3zzPMPc2OOnKy7N67EOXIrdR2rIk61TZGULCs3OID1FY5AXG4/LgIvqd6+YenIRY+bihVVr5ANgaoxw4R8Oh9x17GgsEqeRsevveCH/Zh1CzL8ndf8iD+Fn+0oMhP0D44j83VW7vHAG3N1J4SZhltqf5nY6MT4szwemrnXlhVsiDHLRtM8Rg71XTW5ZL5agb1SXmoRqbe5PCTOCfMk3js7Vcr2eAwxCjuy9f2czRjMdeUD1IMiAPM09olMNZaEqlv90xacdVS5lk1IQ/+JVZRRb3aKa4FCTy9LDc0VZ6awLTZ2YEyqFcjKNH+dUWsUXiPJ6ezF3fWLjgJ7GmoxCtLsQf0+exlxMp1s5EiuuHJI8Y6TPlfQeK/ye5c8x4Zap11DlhP71I+2GZcHL35YPfG0zmA4T34/gO98TLxG936cxJyxfCXtIKdM7e1+rWjyuSujMgwio3f7QVnYobQAa76da89AA6BrHbA==</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Reference">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK5AnMsH6nWz5jWh8N7/f2bQkgLsQYVSpqEemRHWTf1mhj/Zta8wLN8KCPgPSXbL9YK0BJAPffxD1MADDJJcormBMMT0yYGS4j09QGJxDSsoQg==</encrypted>]]>
      </text>
    </action>
  </response>
</dir>