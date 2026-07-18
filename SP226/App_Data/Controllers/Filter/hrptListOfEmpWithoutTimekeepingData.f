<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_bc1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày từ" e="Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
    </field>
    <field name="ngay_bc2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày đến" e="Date to"></header>
    </field>
    <field name="gio1" dataFormatString="HH:ss" align="right" clientDefault="00:00">
      <header v="Giờ từ" e="Time from"></header>
      <footer v="Giờ từ/đến" e="Time from/to"></footer>
    </field>
    <field name="gio2" dataFormatString="HH:ss" align="right" clientDefault="23:59">
      <header v="Giờ đến" e="Time to"></header>
    </field>
    <field name="ma_bp" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hreDepartment" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_nv" onDemand="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
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
      <item value="120, 30, 70, 100, 100, 130, 0, 0, 0"/>
      <item value="1101: [ngay_bc1].Description, [ngay_bc1], [ngay_bc2]"/>
      <item value="1101: [gio1].Description, [gio1], [gio2]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100: [ma_nv].Label, [ma_nv], [ten_nv]"/>
      <item value="11011-111: [nh_bp1].Description, [nh_bp1], [nh_bp2], [nh_bp3], [ten_nh_bp1%l], [ten_nh_bp2%l], [ten_nh_bp3%l]"/>
      <item value="11011-111: [nh_nv1].Description, [nh_nv1], [nh_nv2], [nh_nv3], [ten_nh_nv1%l], [ten_nh_nv2%l], [ten_nh_nv3%l]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcI//WJt6CftIj3RqiW8vViktapF9tevslJpqCJF80lDe+3ZvqofYt3c6Y+AtLmQopJMDsbOiLG15OiYi71/sNtRrbC+9ZhwAHKb18O9mAVpVLTpJhUS+XmuE6Ljtaa0G5Y0YWKAw47W9ttHGZGpsJ1Mn1oFnTM9Qxl+Abgj4ur2CZOwwyHfEaShleZvot4BA6lqqlfhizCMx/FBUGWvVAGwFRV4aJW3W/soDzpGhBKN3o5eMtSyPk/B7s+IKuqzTGw==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdGm589nGw3hgv2TNtZkkZj9PkaC1rqAwOgJ0qbuVn8iPX2X8/9MmhImP8f4/S0WB43ksiE4lUyA5++J1ayw5BI6DbEiFUmVcMba6LEvnTjdC6BxRS3imnM94IR1CQDlEcUmDwobMr/uwoHq/8v+fByrzo/OvhW6AD9pDayleyNt1vdiEG8mL7ijhG/qz2SgeuhYBw7J8WBowm/eT9msWBrURtCT7d/wLZWbzO1fWSrBrERr8E81I7GtXbG86uO6Jp/I3MSjFTCCLCjzXxie0USDQP/1qNE01MViQAv9q2ba8CdXHA99xCIwCqmjOLy+umbi7Pv/r4fn0Ejt+mGJ0vIj9tBaRMjXjQkwal8qW5z3vfs3x5hBIVgZ4z+y6cQB+HNuMO1AhUh0Nsx5PZ4hSZqhXYm1BRH2NGPHNcLnA50Jmt8ifbm0MS8zhC7wbqNlQdmtpEsbL8DQrfbS/frfyoWuzVILtCv/rr2vClpjIJIeff2DHAW/dJE/z71BmU2GDSvvCq8uFLJlc2RDPFIuc5EF3kfgwsWboi0SkPhyqDYUWzD0FG+VfbmUMpNMNRjvhJ2VkFCbw576RXA1d9ZAFt9uGsA1qfpvCVAQv0pWjpkWhwEhExFQ+ORkDvS10/E8D2d8OshbcVFExBDwtai93ThedG0BpWZ5I2NGviJohBOtDE+CBGiM6M0UxSLLek1KE2plp1cU31OaUT8uuFryo8HtH0TD2nTCNPQvmtax86uOqeghZZaXgnRQNrAcslmlPoLFBs90/7WAYHRd5XT38tp+JvkA0U3fM6jw+XYDy6NIq4PnbNgH2NlRf0dPZ5ypBjPlXj5JYkI3270CZTFhxdmsLIzI4NCNczNgrebXDVKdC</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>