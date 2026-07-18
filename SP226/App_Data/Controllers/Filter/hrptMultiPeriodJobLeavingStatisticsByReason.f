<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptPivotFilter SYSTEM "..\Include\Javascript\PivotFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="kieu_bc" dataFormatString="1, 2, 3, 4, 5" clientDefault="3" align="right">
      <header v="Kiểu báo cáo" e="Report Type"></header>
      <footer v="1 - Tuần, 2 - Tháng, 3 - Quý, 4 - Nửa năm, 5 - Năm" e="1 - Week, 2 - Month, 3 - Quarter, 4 - Half a Year, 5 - Year"></footer>
      <items style="Mask"/>
    </field>
    <field name="ky_bc" allowNulls="false" type="Decimal" dataFormatString="##0" clientDefault="4">
      <header v="Số kỳ báo cáo" e="No. of Periods"></header>
      <items style="Numeric"/>
    </field>
    <field name="ngay_bd" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày bắt đầu" e="Begin Date"></header>
    </field>

    <field name="ma_bp" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hreDepartment" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
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
    <field name="ma_vtr" onDemand="true">
      <header v="Vị trí công việc" e="Position"></header>
      <items style="AutoComplete" controller="hrPosition" reference="ten_vtr%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vtr%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_vtr1" onDemand="true">
      <header v="Nhóm vị trí công việc 1" e="Position Group 1"></header>
      <footer v="Nhóm vị trí công việc" e="Position Group"/>
      <items style="AutoComplete" controller="hrPositionGroup" reference="ten_nh_vtr1%l" key="status = '1' and loai_nh = 1" check="loai_nh = 1"/>
    </field>
    <field name="ten_nh_vtr1%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_vtr2" onDemand="true">
      <header v="Nhóm vị trí công việc 2" e="Position Group 2"></header>
      <items style="AutoComplete" controller="hrPositionGroup" reference="ten_nh_vtr2%l" key="status = '1' and loai_nh = 2" check="loai_nh = 2"/>
    </field>
    <field name="ten_nh_vtr2%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_vtr3" onDemand="true">
      <header v="Nhóm vị trí công việc 3" e="Position Group 3"></header>
      <items style="AutoComplete" controller="hrPositionGroup" reference="ten_nh_vtr3%l" key="status = '1' and loai_nh = 3" check="loai_nh = 3"/>
    </field>
    <field name="ten_nh_vtr3%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_bac" onDemand="true">
      <header v="Bậc quản lý" e="Job Grade"/>
      <items style="AutoComplete" controller="hrManagerLevel" reference="ten_bac%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bac%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="tt_nv" dataFormatString="*, 1, 2" clientDefault="*" align="right">
      <header v="Tình trạng nhân viên" e="Employee Status"/>
      <footer v="1 - Chính thức, 2 - Thử việc, * - Cả hai" e="1 - Permanent, 2 - Probationary, * - All"></footer>
      <items style="Mask"/>
    </field>

    <field name="mau_bc">
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
      <item value="120, 30, 20, 20, 30, 100, 100, 130, 0, 0, 0"/>
      <item value="11100000: [kieu_bc].Label, [kieu_bc], [kieu_bc].Description"/>
      <item value="11------: [ky_bc].Label, [ky_bc]"/>
      <item value="11000---: [ngay_bd].Label, [ngay_bd]"/>
      <item value="11000100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="1100011-111: [nh_bp1].Description, [nh_bp1], [nh_bp2], [nh_bp3], [ten_nh_bp1%l], [ten_nh_bp2%l], [ten_nh_bp3%l]"/>
      <item value="1100011-111: [nh_nv1].Description, [nh_nv1], [nh_nv2], [nh_nv3], [ten_nh_nv1%l], [ten_nh_nv2%l], [ten_nh_nv3%l]"/>
      <item value="11000100: [ma_vtr].Label, [ma_vtr], [ten_vtr%l]"/>
      <item value="1100011-111: [nh_vtr1].Description, [nh_vtr1], [nh_vtr2], [nh_vtr3], [ten_nh_vtr1%l], [ten_nh_vtr2%l], [ten_nh_vtr3%l]"/>
      <item value="11000100: [ma_bac].Label, [ma_bac], [ten_bac%l]"/>
      <item value="11100000: [tt_nv].Label, [tt_nv], [tt_nv].Description"/>
      <item value="1100000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3h+ONqX/0rQciyJt8hl+Tt2R/u61+HqI/50A6+s8G5FgwDSaNm1fqMQLO8CbE2sOncI6p5chiT1VM/gOB5sSARiUtNvbCJoG/XZIs8mKX36CcK0/6RElh1nwgXWp0An+KdlE3R7b/svM+EdTK6qiuxEttMNGujJlEpxrJIDeZ7H5Z/X7IvbfGFDeu49GUuWP1232K2EJfh42Vapi7ptGMohvYXsVHLh5Nf+QDSq+iIFUs/hKTW7JyEEN1O3uQjMpBQ9GYC7q2t8BOgR5xk38OAR3LdoxODLLHjlP2IJrk7DoVxeY+05pY6+1PMiNLY9E0IZJJfeO2W3tVfWm1V/0tevnEGfWQVDvf0e9EEpJsRlF+fETnUvO00e/F9TmRgfCkZOKO+Z9QQquQ7I4WraLPM=</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3UUu57XBBEiC/ktUcE0wn062lxgpdpXFtmH+hgmZnLBUkHcO609XwIcZi24dw1NgCgeMD972UhJzfuHHajDXnIehR0pRWy8KKTk1U4bafR8kUjgNt0ABGPpfsq4Q1DEksjN39v6ODUFcQ6bPmd+54pukaAiL9gjX/If0tWeKmYprdq8i3AZ3oBokfIvqktP6FltRB69kc/ApZBGN2v6HZuHuql/Z0QVyxiKL3jXFMb7h4b59rUgVE3wF28AT3WUWINnKoRqgJ2ucQmYHSf9wjYO/jdt1CPmhNvTrqkuU8gGHhvKipzUrXyXSYa/tS2osYlL3/uw5QO1XjkUWHTh383EB16GXZbPZEwXnxf3PmORPog+Sn0FY2bwCG4BfxQu2sOlY94H1iDqncRMkQFvqM/KTbff6VGDAFI6XHjTzyVUESpTTH7+N7mlHKVgTSBwplMaPbNMXkaWmSuwpWTZHLV2RcYI6rx0ewLIIe/e6pTz51BaEnh0B59n1ln7iEEayyUKE0LYtljfVKgTG3tvdCLUpoZRKPPLXlFxpEB8L2EJboi+qV4RDx2aMyLWd97f54obRBgOoG//+6YuFUirWt/fxyOJyFTcDchI6KbsQh/yZjNto/DYqrT/fHDfSUBvC7Fe/XzJkOScZ/0MNAAypiuHnVGTFvGNMTuLNhCz1JQph65zrvfkUDOPexrU4Fo0XJbmbLz320xuPhOyVZrmfJJC9jIDoc4AmfXvRsHYdqirlS22+79vPnwpsyAYnyC2aA==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptPivotFilter;
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdGm589nGw3hgv2TNtZkkZj9PkaC1rqAwOgJ0qbuVn8iPpPKadFpG6MDOSONunC4FdSJ2KRYKP3/6Ym3INaw8Lg1dnCBTU8Os/2mk1opcCHAqpsYbA924TrtRa5iR26CTDVVyrUDkiwBHmNWHkULwRGXl3f+IIDogWmNuDIVbGLGdDizQLEvpA7jOpYzFmQ94Jd1G3HVsrUH/w5ZZ9j4wpqFf/MhdOwK6DgM5tr9ORmPQykBHlc+MkPVXNzEuhNvsc4OFQZgHeyiqDcb2mhisc6R0zrz0dXzb858hEe9UKVjWW1lFNYDTdqZlXQIatd6/HVgJdOTqiCxbobImOXeMaujnA7N9qpzvrWyaF3ti/LAEkqaDJ2n5fi1tfO3gLUVH919LNuf76Bvqx9mjQPwbLMk/aUv3CxC64MOssrQ6NLnlAJxt07mtM0RClJx1s5OwMCNZTHjMmCi8KG0OF4ROZnVoKkOAUJBV0BK7CvTlhIUXN42/Ws01UlBFLaoF8osXH8pf2I35/M3a1hgIXw6PDvTSIePYROqWU9EVRhcNOZ0TG5awDKlokJ2u/0V5cUxf/JFRxzeMj9IN2265HU7xz5k=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>