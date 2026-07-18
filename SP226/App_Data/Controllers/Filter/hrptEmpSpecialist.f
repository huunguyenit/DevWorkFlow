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
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày vào cty đến" e="Date in to"></header>
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
      <header v="Bậc quản lý" e="Job Grade"></header>
      <items style="AutoComplete" controller="hrManagerLevel" reference="ten_bac%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bac%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="gioi_tinh" dataFormatString="*, 1, 2" clientDefault="*" align="right">
      <header v="Giới tính" e="Gender"></header>
      <footer v="1 - Nam, 2 - Nữ, * - Cả hai" e="1 - Male, 2 - Female, * - Show all"></footer>
      <items style="Mask"/>
    </field>
    <field name="loai" dataFormatString="*, 1, 2" clientDefault="*" align="right">
      <header v="Loại" e="Type"></header>
      <footer v="1 - Chính thức, 2 - Thử việc, * - Cả hai" e="1 - Permanent, 2 - Probationary, * - All"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_cm">
      <header v="Chuyên môn" e="Speciality"></header>
      <items style="AutoComplete" controller="hrSpecialist" reference="ten_cm%l" key="status='1'" check="1 = 1"/>
    </field>
    <field name="ten_cm%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_bac2">
      <header v="Bậc chuyên môn" e="Speciality Level"></header>
      <items style="AutoComplete" controller="hrSpecialistLevel" reference="ten_bac2%l" key="status='1'" check="1 = 1"/>
    </field>
    <field name="ten_bac2%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_ttnv">
      <header v="Tình trạng nhân viên" e="Employee Status"/>
      <items style="Lookup" controller="hrEmployeeStatus" key="status = '1'" check="1 = 1"/>
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
    <view id="Dir" height="282">
      <item value="120, 30, 20, 50, 100, 100, 130, 0, 0, 0"/>
      <item value="11001-----: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="1100100---: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110011-111: [nh_bp1].Description, [nh_bp1], [nh_bp2], [nh_bp3], [ten_nh_bp1%l], [ten_nh_bp2%l], [ten_nh_bp3%l]"/>
      <item value="110011-111: [nh_nv1].Description, [nh_nv1], [nh_nv2], [nh_nv3], [ten_nh_nv1%l], [ten_nh_nv2%l], [ten_nh_nv3%l]"/>
      <item value="1100100---: [ma_vtr].Label, [ma_vtr], [ten_vtr%l]"/>
      <item value="110011-111: [nh_vtr1].Description, [nh_vtr1], [nh_vtr2], [nh_vtr3], [ten_nh_vtr1%l], [ten_nh_vtr2%l], [ten_nh_vtr3%l]"/>
      <item value="1100100---: [ma_bac].Label, [ma_bac], [ten_bac%l]"/>
      <item value="1110000---: [gioi_tinh].Label, [gioi_tinh], [gioi_tinh].Description"/>
      <item value="1110000---: [loai].Label, [loai], [loai].Description"/>
      <item value="1100100---: [ma_cm].Label, [ma_cm], [ten_cm%l]"/>
      <item value="1100100---: [ma_bac2].Label, [ma_bac2], [ten_bac2%l]"/>
      <item value="110000----: [ma_ttnv].Label, [ma_ttnv]"/>
      <item value="110000----: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Qb5Ii6/Bxg/Z7iyiqT1/mCfHniBynEjwy/DPzOusjlKS363AMQ2H+s69r5jJ/HxmDhuM5LvMoGyAbrl1reTVIuo98xQh6KFRcVNk2Bf9rSqrPlFBk4mfmS0RKs6dnQMU8G8+kCmLUZ9YK/Zaw0yt1g+Cn4C1VRRzTs+Y92xHD/DMgC1CcWZle8vcwuWnF9krBrHrBTyWpj/byrbanAHy3GLHg6FJRDxa7jbwOLCUH/X</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdGNkHV5ZGnyzuPmat1lM/R5qJpL5KT3ldWRXNd4p8kuxoX7PpN4ClEd86pb4ADYtWnfhn+1HBhrfY3FVYEfLZdCDNi5Xyf7gvTKslgLqILuC5KeE0h/dBdKqHpebTbkxyKvKkIF+euKqS5mC/k5bq2rjKLA48ET5M/Xr2ALoM2OZoPP18OvvaGqn/WoDCLAnqOkni2oPPMBHebzwS/IHCRrrdYH0buq0uklh+yIvBOtlHb9doL9NQHsaZu5WF8z+X5J2GiFtSOYP2pMa7xIY4n4tcfXKVmR4mgXmwFg/jCCRTomL1c7LG+T2BT3GRaD6XNoE8TS9lvxOrazHoo0aBA+r4UxQC1Qyq7+E3k4mquV+3u6dccA/Fz5zN1dUa9J/Jwfy14M3UWeByBIkbGUNF6OyQXw4IcKCjdQHcDx3Ds2mMiyw1hyGcOHonZVZe14q+KuT+3Z8MSmxVY7McBgKZ5FGWHUebU/r4vDVPzNKRjhjglizxOZfJAOZmF6g3qUjpxJZpj2knMGca6Am0s8krdleXIyVWHdHqV9LmhnJFYPkFpb8uNxnE9fKAf9Y67JWOQ==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>