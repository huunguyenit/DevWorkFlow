<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ky" allowNulls="false" dataFormatString="#0" type="Decimal">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" allowNulls="false" dataFormatString="###0" type="Decimal">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_bp" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_loai" onDemand="true">
      <header v="Loại phân nhóm" e="Category Type"></header>
      <items style="AutoComplete" controller="hrDeptCategoryType" reference="ten_loai%l" key="status = '1'" check="1=1"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZdE9Eq2iM3bUhFKicqnNc2oyNCmPEZKxtQBJUiIU8nYUvnli02kqOMgjxotPvPnndg==</encrypted>]]></clientScript>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_pn" onDemand="true">
      <header v="Phân nhóm" e="Department Category"></header>
      <items style="AutoComplete" controller="hrDepartmentCategory" reference="ten_pn%l" key="ma_loai = '{$%c[ma_loai]}' and status = '1'" check="ma_loai = '{$%c[ma_loai]}'"/>
    </field>
    <field name="ten_pn%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" onDemand="true">
      <header v="Nhân viên" e="Employee"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="mau_bc" clientDefault="10" external="true">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 10, 60, 100, 100, 130"/>
      <item value="110: [ky].Label, [ky]"/>
      <item value="110: [nam].Label, [nam]"/>
      <item value="1100100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="1100100: [ma_loai].Label, [ma_loai], [ten_loai%l]"/>
      <item value="1100100: [ma_pn].Label, [ma_pn], [ten_pn%l]"/>
      <item value="1100100: [ma_nv].Label, [ma_nv], [ten]"/>
      <item value="110000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4HNKIIKcfXO5vRMv4B1YnYA9qKErNl8FRkiCupHcac6dmc+tV3537HYNGqLha2CTTfRfyCCAApuVRU/F+1ANh7UIX+jiU2QJPoQNsjHwxZakeqAfu1xMRBTGb25IpDL3X8+QjruenHYalXkxaBZm+KCGn9yHUtc+mOJA599TFu8u2Blg7adHRby8KlKRzQqpw==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYU3jg67mYTmJvr0ghQ2FoZbHIzklYnV8t/i1gFxjmm4+CrMQwd9loC6zJGaHx3fsA0p8Oy8AZZ7ADmiWmmX5w/S3yt1md5/gZUDE4bwbuTBpWW9msG7MvfJaG9kx1DLxR+9FByZFYaXeHy8qK8AZrs+NDx2uXxoaPr2BXsAC6oGed5QZoexKT7Qjd7mp2mJf9YXxiCHTLC6dHzSJvFieboraIg+WcsZrDBiwiC1ySHVCy8r0y8L55nbjQQOBnoUAkNZjMb2KAAt7SYazp/KNENTA4xXN0DOjmyfD6i9tK2SFQivu7UneKPbBvgIP+JQVU3714oR999vnV5qo3kMiM54DT9UorsZhCRO+weVriiqkG0IvcHCDUrZRvopX7OG60bgbOuxyP8LEo7RdWBfZ/9OdOFDxje1jmOdYfpSyW4wz4m3jr69B/t12NWIxmv+AdfJS2gcCSmNRBIaeSpBy2E3Qv0im1pOs4HODGlYjt9lCNxWWNNSetvKv8EdOPganBCvoWmgflJdfsRSrFC0G4mdaOn9498o+nS70wv6XBlTauMXEfP7VMtEfP4YeP+u3h</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>