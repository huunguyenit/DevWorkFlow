<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
]>

<dir table="hrdktangca" code="ma_ca" order="ma_ca" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Đăng ký cho bộ phận" e="Register for Department"></title>

  <fields>
    <field name="ngay_tu" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày từ" e="Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày đến" e="Date to"></header>
    </field>
    <field name="ma_ca" isPrimaryKey="true" allowNulls="false">
      <header v="Mã ca" e="Shift Code"></header>
      <items style="AutoComplete" controller="hrWorkingShift" reference="ten_ca%l" key="status = '1'" check="1 = 1" information="ma_ca$hrdmca.ten_ca%l"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZa6HnbLzREePAdqt+bspksH49PzMktN4s8lMAV1XA0su15jlAASBiXKmEBZvyccR1A==</encrypted>]]></clientScript>
    </field>
    <field name="ten_ca%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_ca_ct" isPrimaryKey="true" onDemand="true">
      <header v="Chi tiết ca" e="Detailed Shift"></header>
      <items style="AutoComplete" controller="hrOvertimeShiftDetail" reference="ten_ca_ct" key="ma_ca = '{$%c[ma_ca]}'" check="ma_ca = '{$%c[ma_ca]}'" information="ma_ca_ct$hrdmctca.dien_giai"/>
    </field>
    <field name="ten_ca_ct" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="so_phut_tt" type="Decimal" dataFormatString="#00.00">
      <header v="Số phút tối thiểu" e="Minimum Minutes"></header>
      <items style="Numeric"/>
    </field>
    <field name="so_gio_td" type="Decimal" dataFormatString="#00.00">
      <header v="Số giờ tối đa" e="Maximum Hours"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_ly_do">
      <header v="Lý do tăng ca" e="Overtime Reason"></header>
      <items style="AutoComplete" controller="hrOvertimeReason" reference="ten_ly_do%l" key="status = '1'" check="1 = 1" information="ma_ly_do$hrdmldtca.ten_ly_do%l"/>
    </field>
    <field name="ten_ly_do%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="bo_phan" allowNulls="false">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZY1hhyR1cCxbTpYE36KRQ1CiGxOKBYyZPYouUqaMcywRUSLJJGRFZGFuH+ng/HSsU79XDHz7lJEnmBpazNYxCcg=</encrypted>]]></clientScript>
    </field>
    <field name="ten_bp%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="Lookup" controller="hrEmployee" key="bp_ref like case when '{$%c[bp_ref]}' = '' then '' else '{$%c[bp_ref]}%' end and status = '1'" check="bp_ref like case when '{$%c[bp_ref]}' = '' then '' else '{$%c[bp_ref]}%' end"/>
    </field>
    <field name="bp_ref" inactivate="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 10, 60, 100, 230, 0"/>
      <item value="11001--: [ngay_tu].Description, [ngay_tu], [ngay_den]"/>
      <item value="1100101: [ma_ca].Label, [ma_ca], [ten_ca%l], [bp_ref]"/>
      <item value="110010-: [ma_ca_ct].Label, [ma_ca_ct], [ten_ca_ct]"/>
      <item value="1100---: [so_phut_tt].Label, [so_phut_tt]"/>
      <item value="1100---: [so_gio_td].Label, [so_gio_td]"/>
      <item value="110010-: [ma_ly_do].Label, [ma_ly_do], [ten_ly_do%l]"/>
      <item value="110010-: [bo_phan].Label, [bo_phan], [ten_bp%l]"/>
      <item value="110000-: [ma_nv].Label, [ma_nv]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1knDQUw0B7bvwvaApV6Tas1XEVzLxAavGsEXJZPLEQ16NoHUQgEYDPTa5IxLIj9a2228eUAOCu4n5F+ALbVISzoxyA1ZLtr4JDApzw57zoR</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfxiWn1XwMbwyyITpd53qAFwzXNtxhijTRk15LHeZ3SFq6FBpoeR7CstCW3Y2hEQqMLDaXgbiG3RhdzoX6COERabZJjy6SH6Ap2oz305irKI9</encrypted>]]>
      </text>
    </command>

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+I7U0B82VB3sJS0p0rTa8Z3N8RjL4RFK83v0F3tWkQSQoEdDnZFNAHiFRZMo1BZrvZzQtWWa2Eyprm7rQD5Q6PHVni7Dr5yRpl+UccXAwxhlBDOumRoIRtta6IJEHDLUsZ2r13vAdNrCEGWFc50PSzERrNVo8G98m1Cja2QSsxa+ZKuLQ+Ax3GjmT/Ouy13rOc5SaqBiipUBkgwq6AbzbOiXhCFeRAMy2sxGeA0HcEs99yar33wQmOxLrcpASv0mNpj2QSJIyuFnCuhrruee7dBkWhFmTO7uPZyx3/F8rpJ6L+ardB16Lx+IlEJ4nQid9jXNsCbdWDHZG1Za7N1KmGP5oXjbe8HW0Xd4xIzVouTG/Ix8+fbQ+nXPXgjDMGIoR68VrDTCHrHJdyG/jFTu8xDN4IXBZupb5YiJ4YV46Lg9sdKLhedQJBEepRz0Jlq+3QzEX4j/Ovi9jHHsP3K+W8+1jkwCyFCW2DEQo5Qy8yb0T1cLx3kFVc4tFvEVZ3wZdHZ1Tj4qPOet3vAYE4juy67cvJQkodyHbjQtlErISMl/YYMrpQveSvfwlmpXnnyzkFgvN3z0RHYTQP/uRZbpxo26UtJ3C61X0zeHN2BmC56EFb1I8fUBcrUXrb2zM14ODyNL29gZWyzygXUBMD1i3EeUImuJ6lVJ7+uscqOtLeUi1o+MVZDJHUV8Avzhewmt3yxx3ENVt8GJwKM75bsg5Px4U/M5IeJCcpFh5WdgnZpaBRi89XJ/8rC1uQ1R348lCdETiEjkTSiqtNwC1U0j6JsueE1qx4KJq9OQWONwlfPiC3Sxr2Oi2yYN1VLUzF5TPWgGrD9r0qQSZKYbpihA9f4dl1Ggb5DuyeDHs3bN4tKxT1/8LpIIXZZGW8s8twxlA==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBabhh/QPbQoNQpbsgyDg8om/x4e+AB5IucDOQpAblRZTE5kDrWbQ8c4JH38svv1GbnAxSt9XSIYlT8sg+LxpKYAmEW+2KPyn2vh7GVosFiSBRO4BuZSllMhf95nwD6bjGCprBliOM6K+lalJhMAVA4xuSk3sjSmGjzZ2U6xiCStB9wjPCFs7AyjlBWpjPDVBXMTBzEypAyFN7HFAtfkOiI4KQCaSDMYMQe9toyW1JqGoCmXC58mFpZwrFKk5jSpbv/4IQbrgVv8dsLh+BpK9DFyZ67d5VuxUFbiHACSHmwFrMq9rVhbal1kNh9igxPZrqhWyOb2zmAkfu0zLCSsWn8idc9pJD1luCMPebxdSpwfs7nyH+Kbovw/FF0q72xe8TkW2evdBiKVDvNWjIegyVGkMepqjs0nK6DyZZvMCpUOl7hxj6ktO/NgzZHMx3ykHEfycvE4E51Bpk6RqUxR3JxnlId/veCo/4ak9tjpqrDEUHlPisi6C8KZZkezfUJ2PxrL3P5ZPlhHgHzwZlbp9C2pjqYVQe++OgjRTlw6v6d1kGb4d+Nq4FXfJQ4jdip/LZVk1WcmCOmD1u0QM3Awqy5pg3U+nXy+4wR/squN58PDJ4NtuMWaAcBjZhcJw9PN9Fj3mHhmkw9FbTTOUnBB8dI9dnhtzSr7BGvhSePyd128QnW4MUtrjklB45Qd56TaHSfwB0ThkJddaLi1OCVo7hQie6KOogK/StU9jQWiPLPQlTOgBYlkNlb8YWQ/3ZOgQbIUgMVQ3S17QWXlMlgrjn7rkk0dC3jlfzBqksg54n54K6Xq/ZrqhGny1X0bHCUEux4Xi/MxfvyPNkm4JPPz+/NhB6ue3ArhZsk/D/EyKrbJ9VhvroqPjNuth5rArEVRjIIWfcbTRcAxiOtcT5GuTr2hCY35wpKIJTcNsgdkQG0grXQTKWVcvzV1p0M9a/1QjDw=</encrypted>]]>
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