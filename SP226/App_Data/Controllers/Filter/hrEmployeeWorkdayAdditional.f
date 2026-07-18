<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="vhrbscong" code="stt_rec, ngay, ma_ca, ma_ca_ct, ma_cong, gio_tu" order="stt_rec, ngay, ma_ca, ma_ca_ct, ma_cong, gio_tu" xmlns="urn:schemas-fast-com:data-dir">
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
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZY1hhyR1cCxbTpYE36KRQ1AUDTAv999bU048PxNfi0jcHmVekvhMW7BLSVkhKBs1oO4twmqoflaymjlAsXHvOvI=</encrypted>]]></clientScript>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBb2AweetwuRSjNIt/RVItfnwj8KETZUspDystuKQRyhTh86bwcTpQag/xXBgmMcjIp6PvgqEXudtm/PtmqEMpB5UC0FBX55mAmI5/ISTWc01B0xWVvmbwu85mMhNgK4SvhQySaR0V3ySrBW2ruKarJjvD/w4MALkC0q+wbG80brTy3o3kOI8daYCaBI7nShTWdVKRX4xVSIuEn27GJsWintEMaUTW0lR9IFutS7cAhgJZwaKa+dXMraiNHxurMRNYlqZC8S3TKxFq1zlTZxLekY5UQLDh3/SjY/zP3NW8AI61MGO41Tgrj3KCvjVzohW/dqSpDBWdV6RyUG2gpt6QzFwccYZ9XvPEjJjwBGsJ1srUlrG4Ps7qO10gP6+rSQJdesxiNQfzqWiXEG2JY1QK4+ewuRG+ENMm69BeQxVxPyL9t+TPOSuNb3dNWMKJaOSwhaenxtsIvS7tTOoCLUfQRxKHoH8ZhjaTMbNU7Pg64IByJ7PzUKE5/xTr4OeAOL6WcU6iLhuabs5J8nEHDyXt+22T+kqitjFp9yn/ZPbHBmMLLugKCjxjnXYtzqWKmLGO8btqqaA0H2gnWgId9e3myj8fvTJQbL8ze6ZlLLNbcvvYHnomwRUESHUkRHAdbk77y5I5vqa5Xll1fE1vni7i99OS3ySxKxybNy7t90qFy3OXrev2/UAwH3m7d2mQ4+Swwb1AB0H23yUtz07PNajC9ilbTb4eQyH9TpPD4YV0LnF6Z+5lsoqGaTMErIOg5gfdwXIZV6ncpaxd8u/VCxy1z9</encrypted>]]>
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