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

    <field name="ma_bp0" onDemand="true" allowNulls="false">
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
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten" readOnly="true" external="true">
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
      <item value="120, 30, 40, 30, 100, 100, 130, 0"/>
      <item value="111----: [tu_ky].Description, [tu_ky], [tu_nam]"/>
      <item value="111----: [den_ky].Description, [den_ky], [den_nam]"/>
      <item value="11001000: [ma_bp0].Label, [ma_bp0], [ten_bp0%l]"/>
      <item value="11001001: [ma_bp].Label, [ma_bp], [ten_bp%l], [ten_nh_nv2%l]"/>
      <item value="11001001: [ma_nv].Label, [ma_nv], [ten], [ten_nh_nv3%l]"/>
      <item value="110011-1: [nh_nv1].Description, [nh_nv1], [nh_nv2], [nh_nv3], [ten_nh_nv1%l]"/>
      <item value="11001000: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="110000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN7SIYRaFM4FZa1TL1HUJLnKY9kGHnio7sZ7vS+epwEvz7uJqPhxBj4jgbtNWTHHRaqo6xcF89NJAjXd2vlptr31go0TLE+IhVhE0HHW8i6PkD6MN7W1hnN9vYIiN34Zj0xJremD8ry8EonkAohE6m14GvV9F5O4qQceGo6Ec6kPEPA9b4N9y9f1I8Y4KOUQUyMbL0wedqMxD8+Ho7jMopKQSjXIQW5EzH7lnGkMNk8THNaOvyEE/+cwra+aU+lbAGxXYMPraaaEev8+hoR0rAFNyiR6pgJWnPkB9illMqjP</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptPivotFilter;
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdGNkHV5ZGnyzuPmat1lM/R6wEBNItlYepxaa3SDRtzc/qaSDkJBCDXQ9KOzvDWBBgnkHryer9q3Ua1+GPX5dYdW2Kk1otqjrQApGXYRJyyPKrGPyIIp43b65Toz2dywVhogavZQbB6S9wTkl3p2vWLUgz8amtB3H7nxV2bUmYQusNciUllz0rJT3gXXrl9yGn7jFaTwwOCV+qPdj3bTrk/MQwNvD7LsobY6c1iwjQoeKbpuZhod5P6Ots6jPzmvwdMpDX5CzkdXqx/sphLiI7iWh2/QTOa2TWj/NcDfWM+bCmJa07MtDFeHNB4y1FuY+MY3uo185BF6ZHgXt9x17UWTOSQBCNDZnabb8jh24HMYw1QTwFTLPn8D/AezvE8jgXyforHGm7k92lQZJh2reSlMDRs4lXvHdVl95dIEFPjoMExvBeTddmATjTPIVj4Rh2vxdIH6+Kv3ycuV79zWt24XW3IlqGxeTkSaEBxviJCHWdAHNUT85sFm5l7PiqMJhMh5zHGQ3En0y/OyoUldAbNT3bhPDKCRhNEpQ/+O/iqgp</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>