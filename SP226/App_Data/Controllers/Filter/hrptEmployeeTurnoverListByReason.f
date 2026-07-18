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
    <field name="ngay_nghi_tu" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày nghỉ việc từ" e="Leaving Date from"></header>
      <footer v="Ngày nghỉ việc từ/đến" e="Leaving Date from/to"></footer>
    </field>
    <field name="ngay_nghi_den" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày nghỉ đến" e="Leaving Date to"></header>
    </field>
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
    <field name="ly_do">
      <header v="Lý do nghỉ việc" e="Reason for Leaving"/>
      <items style="AutoComplete" controller="hrResigningReason" reference="ten_ly_do%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_ly_do%l" readOnly="true" external="true">
      <header v="" e=""></header>
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
      <item value="11001-----: [ngay_nghi_tu].Description, [ngay_nghi_tu], [ngay_nghi_den]"/>
      <item value="11001-----: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="1100100---: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110011-111: [nh_bp1].Description, [nh_bp1], [nh_bp2], [nh_bp3], [ten_nh_bp1%l], [ten_nh_bp2%l], [ten_nh_bp3%l]"/>
      <item value="110011-111: [nh_nv1].Description, [nh_nv1], [nh_nv2], [nh_nv3], [ten_nh_nv1%l], [ten_nh_nv2%l], [ten_nh_nv3%l]"/>
      <item value="1100100---: [ma_vtr].Label, [ma_vtr], [ten_vtr%l]"/>
      <item value="110011-111: [nh_vtr1].Description, [nh_vtr1], [nh_vtr2], [nh_vtr3], [ten_nh_vtr1%l], [ten_nh_vtr2%l], [ten_nh_vtr3%l]"/>
      <item value="1100100---: [ma_bac].Label, [ma_bac], [ten_bac%l]"/>
      <item value="1110000---: [gioi_tinh].Label, [gioi_tinh], [gioi_tinh].Description"/>
      <item value="1110000---: [loai].Label, [loai], [loai].Description"/>
      <item value="1100100---: [ly_do].Label, [ly_do], [ten_ly_do%l]"/>
      <item value="110000----: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcB/dd3sd/AJjTbyFn+x7YmVNfvbKMD6EIpPwluwGegoaHAxBOHr127N2WAOhuCXEUCJy1yEzdnkRN45mrIvz4RmtxqUpEFR0VDi549Rx5v7Ai5v3/6pZ+1CYifit2oWk3Aqy4TpBDvHKIvJ9O/OX5Q8pGJjgHSIx7vtGBTkfffWd3k48Ogzm/FKsewq+1ySZXoRX7bqqRInw4IeJggFvPKFIZi2G5613Z3FB4daLTPSbpn5zxtyF9RKnPUO4pAi8kZR1nU0TWI6uteny+2tUNJsbpv/SahgFteUR/SrNaN7c</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdGNkHV5ZGnyzuPmat1lM/R5qJpL5KT3ldWRXNd4p8kuxoX7PpN4ClEd86pb4ADYtWookhfiT/QXyj8V+kLAlVsnhqoXmMqLfR7LbwxmocEqGPUCdA/NhD/DQhJCuu5W+8v7pJLePjYD+El0E/zT8HX7j6svIBgnGGdlcF3RfBT0n0N1R3hsezKNeIV1UbcTikVDMrdyKCWo6GwulynoC1Ncev90TBfopGuoUic69y1f8QypvOz0qs4hS9hL4ncAKVgKoaBDjo9+3QF/HcPQgfmlumB+z+g4SlAAY2PPw23ydXahSHZzAOzktD/TbWvVII9nlNsY8c4K9uy/r8HwdZBbV8LbrdaVuXQ2gS6aGV8LbVIDuPAccok0xO6ZcZ/BuiFcIB34ZNUSBVt8o/NvdNsxHIyjs7PtYdEXjNzsv0BOy0vVRkyglmU59HbomxM2ZQg3Om1kgb7q9YyPw2Pf/6mTqpnQp4eFCg9PCEY4bZCEIITwqiNMMP4IZ9xSJXmzQdF/jczhuC7lEhUcARBnE4tBWvIhpDa9fDc8e11ENGBAo</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>