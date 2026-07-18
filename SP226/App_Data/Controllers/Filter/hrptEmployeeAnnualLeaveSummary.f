<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_bc" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" defaultValue="new Date()">
      <header v="Ngày báo cáo" e="Report Date"></header>
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

    <field name="mau_bc">
      <header v="Mẫu báo cáo" e="Report Form"/>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
        <item value="20">
          <text v="Tính đến ngày báo cáo" e="Year to Date Calculation"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir" height="282">
      <item value="120, 40, 60, 100, 100, 130, 0, 0, 0"/>
      <item value="110---1: [ngay_bc].Label, [ngay_bc], [ten_nh_bp1%l]"/>
      <item value="1101001: [ma_bp].Label, [ma_bp], [ten_bp%l], [ten_nh_bp2%l]"/>
      <item value="1101000: [ma_nv].Label, [ma_nv], [ten]"/>
      <item value="11011-1: [nh_bp1].Description, [nh_bp1], [nh_bp2], [nh_bp3], [ten_nh_bp3%l]"/>
      <item value="11011-111: [nh_nv1].Description, [nh_nv1], [nh_nv2], [nh_nv3], [ten_nh_nv1%l], [ten_nh_nv2%l], [ten_nh_nv3%l]"/>
      <item value="11000--: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3UUu57XBBEiC/ktUcE0wn2NrIlGluCOPinGkS1RBdzPW45qjj1RaQyLgvT53skjyfiQMALTVlpfjoAzfZUrP6Q6BFgo8rQG+EDDJynSwg6+O0z/Pb98eUYWTyrY+GzQ+EQFDvr/vdmTxUxCS0CvFojxzR12DW7ejcjleExCAweMRO9GNrfFoYJcuam4ZJ9NyltPAKpEt2iB04zsJEBEwUx1DmRTvLf8O9xETJsbdIhbkeMxMzP4uizaTsxZ9ggr7slT79AXkSp5yY8Bcis/AUzGTl81VrCVMrDB3XcyuA28mfCl56xJ3zqVCmtTz5oldQUWGHB9FXMMdlot7ifq9x5EAgw4HVk+mLQKQh2wPRwqS+7ZdnYGVuiMxnfjsubKuIztjDRet7/DzZOFOq3pDRMUSDSoUX6m7nGFPI6scJZf7GBZlQkXCw6xGfS86wnd1A==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdGNkHV5ZGnyzuPmat1lM/R6oVqgI+1J5dAPNfBxh9Xe9bz2DGQj65H0UYlz57mw8KdMDWMJZfy9XtmrorDxhe0JVczLFDbhfJ6IWa6weGdN89YLYMU+0gvWy/ynwhgrIuLLQ0whD+0hlQhstXkxpYampHdFo1r1otvr216irk8ptiEp10zKt5JefPkP9RoeA/bGGWkNsp0zodrUqyMCbCWPALNrOWAB3FA8hUU200vH2XJw/OZJhScf+ogBmdOt3aLSmi/rxrA5GQvU68S8NyzHeI0nCM2Zc5AmxKzp9xEoC7DXHIylnppLy1PNapoczfZ1yhZaPcYO41Kks3RorIJBKJGk+TbANUYzM/swuumpg+EXdqVwkVcy6f90/3zagqDSPsFLL5shzLLn8kBSIq0nztkNsvFPiIL6wlP3KOIAYPeQssBz/eTgxZekMbAYs8gtG7ndw8njq7BvpHeBIURWsJVN4wZ8rAFIGfceoW5+3VCn5qb1/Hvr5C1ErfHk9p88LHhFAvCG1Is3uVferkyBth06/Dt+eggAzDjznAptg/gjpZAlgV5DDOP0Bj6u77oy/oxTPtiMGdyjho1ENL0m+PbgEQ4hq+hntijkXJNrZ</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>