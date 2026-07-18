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
    <field name="tu_ky" allowNulls="false" type="Decimal" dataFormatString="#0">
      <header v="Từ kỳ" e="From Period"></header>
      <footer v="Từ kỳ/năm" e="From Period/Year"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="tu_nam" allowNulls="false" type="Decimal" dataFormatString="###0">
      <header v="Từ năm" e="From Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="den_ky" allowNulls="false" type="Decimal" dataFormatString="#0">
      <header v="Đến kỳ" e="To Period"></header>
      <footer v="Đến kỳ/năm" e="To Period/Year"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="den_nam" allowNulls="false" type="Decimal" dataFormatString="###0">
      <header v="Đến năm" e="To Year"></header>
      <items style="Numeric"></items>
    </field>

    <field name="ma_bp0" onDemand="true">
      <header v="Bộ phận quản lý" e="Admin Dept"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp0%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten_bp0%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" onDemand="true">
      <header v="Bộ phận tính lương" e="Payment Dept"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" onDemand="true">
      <header v="Nhân viên" e="Employee"></header>
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
    <field name="ma_nt">
      <header v="Mã ngoại tệ" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_nt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <clientScript>&OnSelectionOutline;</clientScript>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
        <item value="20">
          <text v="Mẫu ngoại tệ" e="FC Form"/>
        </item>
      </items>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 40, 30, 100, 100, 130, 0, 0, 0"/>
      <item value="111-------: [tu_ky].Description, [tu_ky], [tu_nam]"/>
      <item value="111-------: [den_ky].Description, [den_ky], [den_nam]"/>
      <item value="1100100---: [ma_bp0].Label, [ma_bp0], [ten_bp0%l]"/>
      <item value="11001001--: [ma_bp].Label, [ma_bp], [ten_bp%l], [ten_nh_bp1%l]"/>
      <item value="11001000--: [ma_nv].Label, [ma_nv], [ten]"/>
      <item value="110011-1--: [nh_bp1].Description, [nh_bp1], [nh_bp2], [nh_bp3], [ten_nh_bp2%l]"/>
      <item value="110011-111: [nh_nv1].Description, [nh_nv1], [nh_nv2], [nh_nv3], [ten_nh_nv1%l], [ten_nh_nv2%l], [ten_nh_nv3%l]"/>
      <item value="1100100---: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="110000-1--: [mau_bc].Label, [mau_bc], [ten_nh_bp3%l]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN7SIYRaFM4FZa1TL1HUJLnKY9kGHnio7sZ7vS+epwEv95vstQpGxo1Hq9EGUAdD9nUUMcu1UE9c3lqeWxhKR3RTAzP3k8mVG5lNuliSWn2qYJZr84cUvHSwGh+B7r1qS04eA9MYK4fZ/+TAmwLUsJVDL/xqNd1zp18KhtGBFdiIBdmKB5CRKQ+/CJnyFqfiX8+xfuMpVKzyz+PqTEA7RHAC0BPiKftNphtrC33Lz0Za</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdGNkHV5ZGnyzuPmat1lM/R6wEBNItlYepxaa3SDRtzc/qaSDkJBCDXQ9KOzvDWBBgnkHryer9q3Ua1+GPX5dYdW2Kk1otqjrQApGXYRJyyPKrGPyIIp43b65Toz2dywVhhD6xHB21ZetUyUkqZqtvWp+FsmAQvAljw4poxPu+TUPkYZYRZIX2LGqOAYj6RklOcYD7E1aLjbDBMBk3CPW93gu0aHjz2hzQv7AEOUYNhPJtLL4G2w9GgK/5KuvEEEGOAk/BQDA1EIsKZb4p2feiqI8lmeAAkLjdUm/rupPpP/KdhGloi10ibRG99dAckmnlqM/4gXiYTSzh0WBdy/yTEBTOYWceBHl4G91PCFXWG2nSGRzzuXPJ8AaV528iCaSNiGGlJKJwun3XqNX67hPRSylUIc1g6D60CDMbt7xRhFSXGAzbhvZkzoO3dG6tTOP4fnH25liCr/Dw0DOqKED8Pho9Dp3wRNZItZMSkqg+E0yjsgMhnY+WKI834LcE1nv8WNYSdlehA++dl61vUKmBvmFQOeIdgfawAQaL3hEoFbzcLmXZwAreed8cy42XiL1fA==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>