<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày từ" e="Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày đến" e="Date to"></header>
    </field>
    <field name="ma_bp" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" onDemand="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="nh_bp1" onDemand="true">
      <header v="Nhóm bộ phận 1" e="Department Group 1"></header>
      <footer v="Nhóm bộ phận" e="Department Group"/>
      <items style="AutoComplete" controller="hrDepartmentGroup" reference="ten_nh_bp1%l" key="status = '1' and loai_nh = 1" check="loai_nh = 1"/>
    </field>
    <field name="ten_nh_bp1%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_bp2" onDemand="true">
      <header v="Nhóm bộ phận 2" e="Department Group 2"></header>
      <items style="AutoComplete" controller="hrDepartmentGroup" reference="ten_nh_bp2%l" key="status = '1' and loai_nh = 2" check="loai_nh = 2"/>
    </field>
    <field name="ten_nh_bp2%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_bp3" onDemand="true">
      <header v="Nhóm bộ phận 3" e="Department Group 3"></header>
      <items style="AutoComplete" controller="hrDepartmentGroup" reference="ten_nh_bp3%l" key="status = '1' and loai_nh = 3" check="loai_nh = 3"/>
    </field>
    <field name="ten_nh_bp3%l" readOnly="true" external="true">
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
    <field name="nh_nv1" onDemand="true">
      <header v="Nhóm nhân viên 1" e="Employee Group 1"></header>
      <footer v="Nhóm nhân viên" e="Employee Group"/>
      <items style="AutoComplete" controller="hrEmployeeGroup" reference="ten_nh_nv1%l" key="status = '1' and loai_nh = 1" check="loai_nh = 1"/>
    </field>
    <field name="ten_nh_nv1%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_nv2" onDemand="true">
      <header v="Nhóm nhân viên 2" e="Employee Group 2"></header>
      <items style="AutoComplete" controller="hrEmployeeGroup" reference="ten_nh_nv2%l" key="status = '1' and loai_nh = 2" check="loai_nh = 2"/>
    </field>
    <field name="ten_nh_nv2%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_nv3" onDemand="true">
      <header v="Nhóm nhân viên 3" e="Employee Group 3"></header>
      <items style="AutoComplete" controller="hrEmployeeGroup" reference="ten_nh_nv3%l" key="status = '1' and loai_nh = 3" check="loai_nh = 3"/>
    </field>
    <field name="ten_nh_nv3%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_cong">
      <header v="Mã công" e="Workday"></header>
      <items style="Lookup" controller="hrWorkday" key="status = '1'" check="1 = 1" information="ma_cong$hrdmcong.ten_cong%l"/>
    </field>
    <field name="mau_bc" external="true">
      <header v="Mẫu báo cáo" e="Report Form"/>
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
      <item value="120, 30, 20, 50, 100, 100, 130, 0, 0, 0"/>
      <item value="11001--1: [ngay_tu].Description, [ngay_tu], [ngay_den], [ten_nh_bp3%l]"/>
      <item value="11001001: [ma_bp].Label, [ma_bp], [ten_bp%l], [ten_nh_bp2%l]"/>
      <item value="11001000: [ma_nv].Label, [ma_nv], [ten]"/>
      <item value="110011-1: [nh_bp1].Description, [nh_bp1], [nh_bp2], [nh_bp3], [ten_nh_bp1%l]"/>
      <item value="1100100: [ma_loai].Label, [ma_loai], [ten_loai%l]"/>
      <item value="1100100: [ma_pn].Label, [ma_pn], [ten_pn%l]"/>
      <item value="110011-111: [nh_nv1].Description, [nh_nv1], [nh_nv2], [nh_nv3], [ten_nh_nv1%l], [ten_nh_nv2%l], [ten_nh_nv3%l]"/>
      <item value="110000--: [ma_cong].Label, [ma_cong]"/>
      <item value="110000--: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4WCsoVLAB1BbZJJ2Q3hfXpRcGqDFcYJxaFr0aua9hI+nva9vI34GT8Ct2C5/lFMg0l2dAyjkDkm6muQAQOgN8wdlUwZyObmE6TgPo24J1qKzcg5r+H0jOLBL5Zp3VLpsTxf1XmCT6YHbRNfcjlVUzwnEpvDguhrQkH0he2NJf4d/mDz4BhGPjDyjr5Kv0swwfCOHEUXHVOb8ubzUC+9GLc=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYU3jg67mYTmJvr0ghQ2FoZbHIzklYnV8t/i1gFxjmm4+SpeCuq5ic4WMUrthGm0QpThSNFSvc0G/EVTuH9q1hyk9sHrmpatckqpluadC7VFlG9BdeJXSMbDKdqFAet30+i8oD5uAX/+0aQ218iKSujy3DQv0MFaoGOdL36haLx3y6nQWFm9U0TollhvJCxDy/55wFx0McZZghXqx2P001ofj7M1ZqZ1R01cXYAVtXWPy0atTR+1zr0knGCerisqNyw/Fkz3657V+jKUp/bweSf+aJ1xIyG0cageZYM0MJfQNLy8Ehutr9VhDAMmER9LLMx+gsvz668J4RGqwGycRdfst0o5Hz+hUZsfQ8CXdB1RdkVLaJXLfq6ECv3+k6QmIVRpM3H3YcUEwHTYfElC6Pj7n0JLK42dWiQk6VLr8MpPPwCmcWI8/X54vywOhhcaxn8FRF/DgGyvBEV7OJubsi+YpEdtZYS0uyqPf6qvPfBEdam8gt1odd9bdF7STmILW6</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>