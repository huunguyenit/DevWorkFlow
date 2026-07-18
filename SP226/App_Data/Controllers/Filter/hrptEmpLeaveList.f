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
      <header v="Ngày nghỉ từ" e="Leave Date from"></header>
      <footer v="Ngày nghỉ từ/đến" e="Leave Date from/to"></footer>
    </field>
    <field name="ngay_nghi_den" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày nghỉ đến" e="Leave Date to"></header>
    </field>
    <field name="ngay_vao_tu" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày vào cty từ" e="Join Date from"></header>
      <footer v="Ngày vào cty từ/đến" e="Join Date from/to"></footer>
    </field>
    <field name="ngay_vao_den" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày vào cty đến" e="Join Date to"></header>
    </field>
    <field name="ma_bp" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hreDepartment" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" onDemand="true">
      <header v="Nhân viên" e="Employee"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten_nv" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten_nv" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_bp1" onDemand="true">
      <header v="Nhóm bộ phận 1" e="Department Group 1"></header>
      <footer v="Nhóm bộ phận" e="Department Group"/>
      <items style="AutoComplete" controller="hrDepartmentGroup" reference="ten_nh_bp1%l" key="status = '1' and loai_nh = 1" check="loai_nh = 1"/>
    </field>
    <field name="ten_nh_bp1%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_bp2" onDemand="true">
      <header v="Nhóm bộ phận 2" e="Department Group 2"></header>
      <items style="AutoComplete" controller="hrDepartmentGroup" reference="ten_nh_bp2%l" key="status = '1' and loai_nh = 2" check="loai_nh = 2"/>
    </field>
    <field name="ten_nh_bp2%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_bp3" onDemand="true">
      <header v="Nhóm bộ phận 3" e="Department Group 3"></header>
      <items style="AutoComplete" controller="hrDepartmentGroup" reference="ten_nh_bp3%l" key="status = '1' and loai_nh = 3" check="loai_nh = 3"/>
    </field>
    <field name="ten_nh_bp3%l" readOnly="true" external="true" defaultValue="''">
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

    <field name="gioi_tinh" dataFormatString="*, 1, 2" clientDefault="*" align="right">
      <header v="Giới tính" e="Gender"></header>
      <footer v="1 - Nam, 2 - Nữ, * - Cả hai" e="1 - Male, 2 - Female, * - Show all"></footer>
      <items style="Mask"/>
    </field>
    <field name="loai_nghi">
      <header v="Loại nghỉ" e="Leave Type"></header>
      <items style="Lookup" controller="hrLeaveType" key="status = '1' and tinh_chat = '2'" check="tinh_chat = '2'"/>
    </field>
    <field name="ma_ttnv">
      <header v="Tình trạng nhân viên" e="Employee Status"/>
      <items style="Lookup" controller="hrEmployeeStatus" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" clientDefault="10">
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
      <item value="120, 30, 20, 50, 100, 100, 130, 0, 0, 0"/>
      <item value="11001-----: [ngay_nghi_tu].Description, [ngay_nghi_tu], [ngay_nghi_den]"/>
      <item value="11001-----: [ngay_vao_tu].Description, [ngay_vao_tu], [ngay_vao_den]"/>
      <item value="1100100---: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="1100100---: [ma_nv].Label, [ma_nv], [ten_nv]"/>
      <item value="110011-111: [nh_bp1].Description, [nh_bp1], [nh_bp2], [nh_bp3], [ten_nh_bp1%l], [ten_nh_bp2%l], [ten_nh_bp3%l]"/>
      <item value="110011-111: [nh_nv1].Description, [nh_nv1], [nh_nv2], [nh_nv3], [ten_nh_nv1%l], [ten_nh_nv2%l], [ten_nh_nv3%l]"/>
      <item value="1110000---: [gioi_tinh].Label, [gioi_tinh], [gioi_tinh].Description"/>
      <item value="110000----: [loai_nghi].Label, [loai_nghi]"/>
      <item value="110000----: [ma_ttnv].Label, [ma_ttnv]"/>
      <item value="110000----: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDBaaV766j4XqVMPTsxBNLRT7jzbHWEsHdDXAQSBxsa2mLJ4FA/+0ys8qouhRletfFGhIklU1V4gD2alksMwUCi4OWigY/AAUxViML00RKU1X94Vy+ZbvT/bH4c2L+0BDgDb7b5pt8Rh1iHO/KfWGEOlSFhURPbGQQe41ICYE+zC1Gkc3kYdQ5flLzC+pSCyoY6uPNARF4MiALTK3jpLtM+7FtvZDqM6tnsCqGy2RrTGBxOm9DEOHPZHO6GPp92Av8vnFWxUAA26QyhNooQ0QuY=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdBirwQHi7tkqUAOMzr9Gima5X2h6XteOiU6fQ8aLxj0ESaWl/nD2ic7GLiHfESctVU9b5eH6TQP/LunZn2l9Ts2QdxdA34dBGSW3K6sLeRwAItzGoqkELmZFLAXO+N8sb1uaBbO/5E6ftLFvIm7r6lCh0OSZGvVHpYrBQRbA0rybh9/UjTPM7IpcQohqRRC0wqOuNWFDOr9v4Vz6lZ7kuBO87pBF9ibOCRQmPOA04Ai3NawCv5lUxfA4y0P8imwtdyxVit4vZw8N+YnPiNZJgXdZPZW4vlBQh19qsVu0KfYH6BP5iLOTGpFQ+Xbn0W4nYiqI7HIm9gO1IJtGirzfkkMxdGkmsXJqcoBIPjDj9wDSGiQWvHfSBb28YqMPr9pnsOulCeIszz5mDTyrG2IYgwTrSw61mQC+zmp2v78tdBBqPAyKnEAKBZ2a+XPc924UiUGKKGAAIP8OaU3/fKreLcOUWzien3j7moDZvS2Y0xagBkIUIwzoHxen8eF8PRYWpcswmurvhQrrbylhDl7fj93aqmWnWi2ZI9dm+H7ln7RGh/W9FrIEb6IdhEWxySHabXj9i+TocAkc+kZNqacn15c=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>