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
    <field name="ngay_tn_tu" type="DateTime" dataFormatString="@datetimeFormat" align="left" >
      <header v="Ngày tai nạn từ" e="Accident Date from"></header>
      <footer v="Ngày tai nạn từ/đến" e="Accident Date from/to"></footer>
    </field>
    <field name="ngay_tn_den" type="DateTime" dataFormatString="@datetimeFormat" align="left" defaultValue="new Date()">
      <header v="Ngày tai nạn đến" e="Accident Date to"></header>
    </field>
    <field name="ngay_vao_tu" type="DateTime" dataFormatString="@datetimeFormat" align="left" >
      <header v="Ngày vào cty từ" e="Date in from"></header>
      <footer v="Ngày vào cty từ/đến" e="Date in from/to"></footer>
    </field>
    <field name="ngay_vao_den" type="DateTime" dataFormatString="@datetimeFormat" align="left" defaultValue="new Date()">
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
    <field name="ten_bac%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="gioi_tinh" dataFormatString="*, 1, 2" clientDefault="*" align="right">
      <header v="Giới tính" e="Gender"></header>
      <footer v="1 - Nam, 2 - Nữ, * - Cả hai" e="1 - Male, 2 - Female, * - Show all"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_tn">
      <header v="Loại tai nạn" e="Accident Type"></header>
      <items style="AutoComplete" controller="hrAccidentInjury" reference="ten_tn%l" key="status ='1'"/>
    </field>
    <field name="ten_tn%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="tt_nv" onDemand="true">
      <header v="Tình trạng nhân viên" e="Employee Status"></header>
      <items style="Lookup" controller="hrEmployeeStatus" key="status='1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" clientDefault="10" external="true">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <clientScript>&OnSelectionOutline;</clientScript>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
      </items>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130, 0, 0, 0"/>
      <item value="1101-----: [ngay_tn_tu].Description, [ngay_tn_tu], [ngay_tn_den]"/>
      <item value="1101-----: [ngay_vao_tu].Description, [ngay_vao_tu], [ngay_vao_den]"/>
      <item value="1101001--: [ma_bp].Label, [ma_bp], [ten_bp%l], [ten_nh_bp1%l]"/>
      <item value="11011-1--: [nh_bp1].Description, [nh_bp1], [nh_bp2], [nh_bp3], [ten_nh_bp2%l]"/>
      <item value="11011-111: [nh_nv1].Description, [nh_nv1], [nh_nv2], [nh_nv3], [ten_nh_nv1%l], [ten_nh_nv2%l], [ten_nh_nv3%l]"/>

      <item value="1101001--: [ma_vtr].Label, [ma_vtr], [ten_vtr%l], [ten_nh_bp3%l]"/>
      <item value="11011-1--: [nh_vtr1].Description, [nh_vtr1], [nh_vtr2], [nh_vtr3], [ten_nh_vtr1%l]"/>
      <item value="1101001--: [ma_bac].Label, [ma_bac], [ten_bac%l], [ten_nh_vtr2%l]"/>
      <item value="1110001--: [gioi_tinh].Label, [gioi_tinh], [gioi_tinh].Description, [ten_nh_vtr3%l]"/>
      <item value="110100---: [ma_tn].Label, [ma_tn], [ten_tn%l]"/>
      <item value="11000----: [tt_nv].Label, [tt_nv]"/>
      <item value="11000----: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDBaaV766j4XqVMPTsxBNLQn6rnExSyhf4GWeZJgoqUxMjUb+SrxMf+ThInYttL5+qsEflvGq955ZCLI6CIFf7D1cp41MNBddjCCussCBEiykCgIBWh7I4O3EeXpc0mufqKeJSf1seyKL1Hvt9pcSo6O/RFZHkh5DiD50OMbdB9S71U11oPccjSA08ztm8+dtXhLi2U/mWhrW5sc3ByfBPZbL3tchhbz1y9EJWAGZ7Gmn0sG1LhY/SHjei809XxCLr1YYJtK/KrOk20e+U6zV2ajJ9mS3DJLnMCd7WlXkB9c</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdBirwQHi7tkqUAOMzr9Gima5X2h6XteOiU6fQ8aLxj0EuXlFqi9uWfm7Br6TJkZxDLC1AuL20lanJy7Z2ItJjIpPTgh2iaGqF1uhv0twkkQbnL0mwTNgRBZ/wfI1wpdQBpHxcZP+klKA9MM3X2JSzMoHYLVuymI8mD5I1DixDmLBCe1xXTfAtLrJOaCz8d75kKpWbb5gRy4PLQSajpTp/wGUemAlTXYBFP7F47/hfv8Wh2MPNnZN+FVzY5h9bHgZiDuGvqkC2pzqFRTuRqfq0DUv7dXYSIvrxIBeUbzD5GckqgLj5Iq0YTiUxpW+gFCMwTAvyUJMkphjmgpofF4JL2Ui45H7+k544qdwRsUr2sLlH08YxEKPZbSJw+kzS4qXjoc9PcTMKrAzEMYCM2XwkUkQBs1ez7SmMSWLGgoXqbO3LrYOtlvZbOWjQWBMEGW+vv4UQ1xqaKza88GgJo+/SyBnOhk2nuBccowNR6vpGURc1eC4NDtBgwLf3eXblo+Na4NuHRznPMyld4U4c4w+TCaiexLAivo0Bry/lwwufsyk</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>