<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir id="0" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày vào cty từ" e="Date in from"></header>
      <footer v="Ngày vào cty từ/đến" e="Date in from/to"></footer>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" align="left" aliasName="toDate">
      <header v="Ngày vào cty đến" e="Date in to"></header>
    </field>
    <field name="ma_bp" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hreDepartment" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="nh_bp1" onDemand="true" categoryIndex="1">
      <header v="Nhóm bộ phận 1" e="Department Group 1"></header>
      <footer v="Nhóm bộ phận" e="Department Group"/>
      <items style="AutoComplete" controller="hrDepartmentGroup" reference="ten_nh_bp1%l" key="status = '1' and loai_nh = 1" check="loai_nh = 1"/>
    </field>
    <field name="ten_nh_bp1%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nh_bp2" onDemand="true" categoryIndex="1">
      <header v="Nhóm bộ phận 2" e="Department Group 2"></header>
      <items style="AutoComplete" controller="hrDepartmentGroup" reference="ten_nh_bp2%l" key="status = '1' and loai_nh = 2" check="loai_nh = 2"/>
    </field>
    <field name="ten_nh_bp2%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nh_bp3" onDemand="true" categoryIndex="1">
      <header v="Nhóm bộ phận 3" e="Department Group 3"></header>
      <items style="AutoComplete" controller="hrDepartmentGroup" reference="ten_nh_bp3%l" key="status = '1' and loai_nh = 3" check="loai_nh = 3"/>
    </field>
    <field name="ten_nh_bp3%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>

    <field name="nh_nv1" onDemand="true" categoryIndex="1">
      <header v="Nhóm nhân viên 1" e="Employee Group 1"></header>
      <footer v="Nhóm nhân viên" e="Employee Group"/>
      <items style="AutoComplete" controller="hrEmployeeGroup" reference="ten_nh_nv1%l" key="status = '1' and loai_nh = 1" check="loai_nh = 1"/>
    </field>
    <field name="ten_nh_nv1%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nh_nv2" onDemand="true" categoryIndex="1">
      <header v="Nhóm nhân viên 2" e="Employee Group 2"></header>
      <items style="AutoComplete" controller="hrEmployeeGroup" reference="ten_nh_nv2%l" key="status = '1' and loai_nh = 2" check="loai_nh = 2"/>
    </field>
    <field name="ten_nh_nv2%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nh_nv3" onDemand="true" categoryIndex="1">
      <header v="Nhóm nhân viên 3" e="Employee Group 3"></header>
      <items style="AutoComplete" controller="hrEmployeeGroup" reference="ten_nh_nv3%l" key="status = '1' and loai_nh = 3" check="loai_nh = 3"/>
    </field>
    <field name="ten_nh_nv3%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>

    <field name="ma_vtr" onDemand="true" categoryIndex="1">
      <header v="Vị trí công việc" e="Position"></header>
      <items style="AutoComplete" controller="hrPosition" reference="ten_vtr%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vtr%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nh_vtr1" onDemand="true" categoryIndex="1">
      <header v="Nhóm vị trí công việc 1" e="Position Group 1"></header>
      <footer v="Nhóm vị trí công việc" e="Position Group"/>
      <items style="AutoComplete" controller="hrPositionGroup" reference="ten_nh_vtr1%l" key="status = '1' and loai_nh = 1" check="loai_nh = 1"/>
    </field>
    <field name="ten_nh_vtr1%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nh_vtr2" onDemand="true" categoryIndex="1">
      <header v="Nhóm vị trí công việc 2" e="Position Group 2"></header>
      <items style="AutoComplete" controller="hrPositionGroup" reference="ten_nh_vtr2%l" key="status = '1' and loai_nh = 2" check="loai_nh = 2"/>
    </field>
    <field name="ten_nh_vtr2%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nh_vtr3" onDemand="true" categoryIndex="1">
      <header v="Nhóm vị trí công việc 3" e="Position Group 3"></header>
      <items style="AutoComplete" controller="hrPositionGroup" reference="ten_nh_vtr3%l" key="status = '1' and loai_nh = 3" check="loai_nh = 3"/>
    </field>
    <field name="ten_nh_vtr3%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_bac" onDemand="true" categoryIndex="1">
      <header v="Bậc quản lý" e="Job Grade"></header>
      <items style="AutoComplete" controller="hrManagerLevel" reference="ten_bac%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bac%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_ttnv" categoryIndex="1">
      <header v="Tình trạng nhân viên" e="Employee Status"/>
      <items style="Lookup" controller="hrEmployeeStatus" key="status = '1'" check="1 = 1"/>
    </field>

    <field name="ma_qh" onDemand="true" categoryIndex="9">
      <header v="Mối quan hệ" e="Relationship"></header>
      <items style="Lookup" controller="hrPIFamily" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ngay_sinh1" type="Decimal" dataFormatString="#0" align="right" categoryIndex="9">
      <header v="Ngày sinh người thân từ" e="Date of Birth from"></header>
      <footer v="Ngày sinh từ/đến" e="Date of Birth from/to"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="ngay_sinh2" type="Decimal" dataFormatString="#0" align="right" categoryIndex="9">
      <header v="Ngày sinh người thân đến" e="Date of Birth to"></header>
      <items style="Numeric"></items>
    </field>
    <field name="thang_sinh1" type="Decimal" dataFormatString="#0" align="right" categoryIndex="9">
      <header v="Tháng sinh người thân từ" e="Month of Birth from"></header>
      <footer v="Tháng sinh từ/đến" e="Month of Birth from/to"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="thang_sinh2" type="Decimal" dataFormatString="#0" align="right" categoryIndex="9">
      <header v="Ngày sinh người thân đến" e="Month of Birth to"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam_sinh1" type="Decimal" dataFormatString="###0" align="right" categoryIndex="9">
      <header v="Năm sinh người thân từ" e="Year of Birth from"></header>
      <footer v="Năm sinh từ/đến" e="Year of Birth from/to"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="nam_sinh2" type="Decimal" dataFormatString="###0" align="right" aliasName="Year" defaultValue="(new Date()).getFullYear()" categoryIndex="9">
      <header v="Năm sinh người thân đến" e="Year of Birth to"></header>
      <items style="Numeric"></items>
    </field>

    <field name="mau_bc" categoryIndex="1">
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
    <view id="Dir" height="186">
      <item value="120, 30, 10, 30, 10, 20, 100, 100, 170"/>
      <item value="1100001-----: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="110000100---: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>

      <item value="11000011-111: [nh_bp1].Description, [nh_bp1], [nh_bp2], [nh_bp3], [ten_nh_bp1%l], [ten_nh_bp2%l], [ten_nh_bp3%l]"/>
      <item value="11000011-111: [nh_nv1].Description, [nh_nv1], [nh_nv2], [nh_nv3], [ten_nh_nv1%l], [ten_nh_nv2%l], [ten_nh_nv3%l]"/>
      <item value="110000100---: [ma_vtr].Label, [ma_vtr], [ten_vtr%l]"/>
      <item value="11000011-111: [nh_vtr1].Description, [nh_vtr1], [nh_vtr2], [nh_vtr3], [ten_nh_vtr1%l], [ten_nh_vtr2%l], [ten_nh_vtr3%l]"/>
      <item value="110000100---: [ma_bac].Label, [ma_bac], [ten_bac%l]"/>
      <item value="11000000----: [ma_ttnv].Label, [ma_ttnv]"/>

      <item value="11000000----: [ma_qh].Label, [ma_qh]"/>
      <item value="11010-------: [ngay_sinh1].Description, [ngay_sinh1], [ngay_sinh2]"/>
      <item value="11010-------: [thang_sinh1].Description, [thang_sinh1], [thang_sinh2]"/>
      <item value="11010-------: [nam_sinh1].Description, [nam_sinh1], [nam_sinh2]"/>
      <item value="11000000----: [mau_bc].Label, [mau_bc]"/>

      <categories>
        <category index="1" columns="120, 30, 10, 30, 10, 20, 100, 100, 170, 0, 0, 0">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="9" columns="120, 30, 10, 30, 10, 20, 100, 100, 170">
          <header v="Thông tin người thân" e="Family Members"/>
        </category>
      </categories>

    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V2G8GGtitDXv3Qwxh3+R5IpdteaGoXa43wgspzUA0qOmRLrrSBMGOE9XaWD6d+QXyBjSJ9S0tb9K34T7q2dCaNg0TgUKhj5C1fPkUPnoCELT/vkJ2iEutJNdyAfkhbC9rU7+i66181BzFnFXoq4IS3huuYdqfJ7CG30++DhNFO6QOZxe1sXUwofOm3nje+fEPez1v/oZVVeEcUyiXXnthu7gMEaZBlTREqoepx207D2AwpIdz55bWitNWP2iV+GNg==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdGNkHV5ZGnyzuPmat1lM/R5qJpL5KT3ldWRXNd4p8kuxoX7PpN4ClEd86pb4ADYtWnfhn+1HBhrfY3FVYEfLZdCDNi5Xyf7gvTKslgLqILuCpXNBo1RHkCzI3xhH/66/h7q6MT1IHvvT88ldeaybxBrCZzEzeWDKZttAl8RUYiglzePuPW3IsmvavjqS3dRamK5hcw0YCdK2T6UHTuY6DlTP0flxI5daS8UA50J+oAtVgKLI7x0vbmIZmpbIx8UOKzlHgrREqoQRLECxvWPZZ8ij7d7wgkeAyQwQEUFVlieJoDjFARopGAL9+D1zMwTXJw+HJDb6n361nYQZ9wv7OtX459+12ZOkoAtNPqmTGtOvM/yb0PGH3hPLQj/A4cwrmHnIm602GMq7wyurQ2HoqPDXnR2VgfqvRWc/NBpo5jkDn3xUHOYGRJLg9nAMXT/YiwY2rjFS9PWt1surUZBxotEHwevK4bMLkG2Ods5sdoIQ3xmmTTnwHWN22mCwMFwlgpy/B+s/8n1fA3ApKEqbYRvzTL6abunhZgEAiOwlkA8wwNQ+TmiR5CQuH59/D6I70g==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>