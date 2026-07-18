<?xml version="1.0" encoding="utf-8"?>

<dir table="vhrcttp" code="stt_rec, ngay, loai" order="stt_rec, ngay" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>

  <fields>
    <field name="tu_ngay" type="DateTime" allowNulls="false" dataFormatString="@datetimeFormat" align="left" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
    </field>
    <field name="den_ngay" type="DateTime" allowNulls="false" dataFormatString="@datetimeFormat" align="left" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="ma_bp" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZS/oOgkAh9HdzZPMH0sQrsvaQ+fkRv21HUz6wE7aV+7+f0c1jLPhhoJ+8hXdXahJozOOkZpEOBU0/0pk5Qnq/p8=</encrypted>]]></clientScript>
    </field>
    <field name="ten_bp%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" onDemand="true">
      <header v="Nhân viên" e="Employee"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten_nv" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))"/>
    </field>
    <field name="ten_nv" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="loai">
      <header v="Loại" e="Type"></header>
      <items style="AutoComplete" controller="hrAwardPenaltyReasonList" reference="ten_loai%l" key="status = '1'" check="1=1" information="ma_loai$hrdmloaitp.ten_loai%l"/>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="bp_ref" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 230"/>
      <item value="110: [tu_ngay].Label, [tu_ngay]"/>
      <item value="110-1: [den_ngay].Label, [den_ngay], [bp_ref]"/>
      <item value="11010: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="11010: [ma_nv].Label, [ma_nv], [ten_nv]"/>
      <item value="11010: [loai].Label, [loai], [ten_loai%l]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf0mb4WrhgaB8qrXLtaYUE4MXzFt+VvfRoFjBDOXQcQT74uq2gpgXekXaHL6W8hMRTqFh4g7ZhrnVxPQOnz8MExblSAw9eUSCspNIL+eMGnvu</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf7Bbvcu9NMJJ69NSEFLz4euV3sgNOMgKCri1bhYanOsNSqkAICdx4X3gk6Hbj+GEg8kEC7LojV/khEwGWVKNoKC4AUXID4GMdRGs6kJv5kpq</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70ApdFkqajK05i9SUWmzDG8zlXaZX0sEmBcJwJiu0M1ZVX0xd12yFWZhTCVWb7Bh/nol8hmGi1ZoQOdmivsC0rm3yy2HzgjUz73ZZkSCkpXKIM0VgIQH/vuvHajke+Wfw3NbA1ve11TwvY6BlUIBHWyJAsSytrOr42kKG/wSw90M/3rw33ptp9eNISJoTMdgBhocQG402dX8uvWRKTBPCJBzIhcXs9adK88oNOqRDmBTyg13FyKqApfNENhr8ioDo8xd2eitA8BNjZD9oeFCeoBkJBPsRymqQ1UZpQYzTEE9tV9CTbtmsMf3uLzbTLt9iXjl+TNA9wU8jOiAzzG8Q0PbJcBIf2sIuMGkQOz3Csi7Rp+2D28RTOWy22fUuJMbNDNR8i0OQMBUwm+EMxhIrc8q0d+LuDbWrywAXOVb5OkInm36bqjgtmCPoynK8Xd4QXGzcLQGWjpem1Yef04UgadQB2C0fp2qky/rcJE3K0XcFl9M0XsW4JxEIwPMeHQEyivUgsUt1Ftc3Qa03fX6gYKzliID3d/dZPZr05k+nSoI5ujb7vdCwATUO/STIwJqYRsZZ5zo8VF94iq8wBUyqH3poyiqxaKfCGGq1E+S0Bcu95CdfvQtflX4iG6djeA4zJyJhTCZIkaXzwF71DZvgY7UscmhQKrI2crZObl5NsM5hqH8JTEdqTitfexN9Cs3dF3rdUXL2V+gKqugpIUJy9FQ=</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Reference">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6RvkanJ8hkyOGyGRkPgHEvyFtcJCp+0PrKgvTE7w6QvKECUowinoHqh+NUOEJMcVJyCQ2WF9ZkQ06w0aln9BLucVhrivSK69UILS+LUWfXRJ1UgJinZPwwgVFAKSVqtnI/mlZg4+Va3dpfnTBuQLPf8=</encrypted>]]>
      </text>
    </action>
  </response>
</dir>