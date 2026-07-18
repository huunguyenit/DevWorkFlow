<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="vhrdktangca" code="ma_tang_ca, stt_rec, ngay_tu" order="ma_tang_ca, stt_rec, ngay_tu" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
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
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZY1hhyR1cCxbTpYE36KRQ1Bbo3VXo7cRHfYhyJgxx5nKeOtJ7AZEIuijMPXHHCQahMVOZl+QQxgK/LNX5Wz9Iw8=</encrypted>]]></clientScript>
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
    <field name="ma_ly_do" onDemand="true">
      <header v="Lý do tăng ca" e="Overtime Reason"></header>
      <items style="AutoComplete" controller="hrOvertimeReason" reference="ten_ly_do%l" key="status = '1'" check="1 = 1" information="ma_ly_do$hrdmldtca.ten_ly_do%l"/>
    </field>
    <field name="ten_ly_do%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="bp_ref" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="182">
      <item value="120, 30, 70, 100, 100, 130, 0, 0"/>
      <item value="1101-11: [ngay1].Description, [ngay1], [ngay2], [stt_rec], [bp_ref]"/>
      <item value="1101000: [bo_phan].Label, [bo_phan], [ten_bp%l]"/>
      <item value="1101000: [ma_nv].Label, [ma_nv], [ten]"/>
      <item value="1101000: [vi_tri].Label, [vi_tri], [ten_vtr%l]"/>
      <item value="1101000: [bac_quan_ly].Label, [bac_quan_ly], [ten_bac%l]"/>
      <item value="1101000: [ma_ly_do].Label, [ma_ly_do], [ten_ly_do%l]"/>
    </view>
  </views>
  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBb2AweetwuRSjNIt/RVItfnwj8KETZUspDystuKQRyhTh86bwcTpQag/xXBgmMcjIp6PvgqEXudtm/PtmqEMpB5UC0FBX55mAmI5/ISTWc01KSrd/GbP+qhbjhpAMk3tI2AScSgF+m0AV6NioAYIb/y6R3uPmX9p3WAvVrntJ/81XfFpTUy8dH8ELvTJnLJGFryjP1BeYEHmRFAh7pZJF23UnMvUFjmy/1OGYXQqxvkwBFtSYQMK1k1F2xsAmu4X8SBwSTkFbhXvGsptY4CPHrbiAFkk3ZjuoVGngJ3ox2zBZRM26q1cSalXY1hr2fvBnCdZg4BeWRG93k11s4SjeoFGeQzeKW7yREMX51gpch6DbC+PxwEKYOG8N42cujqkPoRmR3crtr50gDZYMNG3kOIeMoyWxvbgipZaf4+sMQwMh2e7BzJyFY0GNJdvvGyLCsRcW9gD/9m12KojvYLd6S/KFX2/4vIu7wDJQK6PAVh9IIHkaYic7jH+dPWCHCNkl9eB+rCEY67+WiK7yP1HC1Y4PriW+A7T1SsErc+fDVqM7OlqbncHPtoc3cadEiQSLDsD2yxCddSCeZDCUF+Lo40U5HrRka0Fbkn5kTjw+pnK3u9JU6/Y8bWjvZ7o0ADDzCOvn+F0tzu+oCmi2VttYADV60FpnbGg6pjO/GnhOJyYfGxW4LE5hSNsJjsH/ruB9/kiy7sLItyDK9LZhmysZBDEx8ppJGvsUOfkSyCYrqfCePJAotKC+SiQFoWUV6hXHYf4VGNP/y5RGobQ5xGsGNlmWnFXSXpGocXhTsirUxK36e4aRWRXP5eB861lmIbTmOBZiHXcOUqGDnHFe0F0BPI2XKoslqaJy/DZTHYF6P2lJ9p+hySAHxXnat69W4Pban6XTMOWFGml3xZMSH0aN+M</encrypted>]]>
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