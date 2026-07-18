<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày từ" e="Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày đến" e="Date to"></header>
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

    <field name="sl_di_muon_tu" type="Decimal" dataFormatString="#0" clientDefault="0" categoryIndex="9">
      <header v="Số lần đi muộn từ" e="Late In Times from"></header>
      <footer v="Số lần đi muộn từ/đến" e="Late In Times from/to"></footer>
      <items style="Numeric"/>
    </field>
    <field name="sl_di_muon_den" type="Decimal" dataFormatString="#0" clientDefault="0" categoryIndex="9">
      <header v="Số lần đi muộn đến" e="Late In Times to"></header>
      <items style="Numeric"/>
    </field>
    <field name="sp_di_muon_tu" type="Decimal" dataFormatString="##0" clientDefault="0" categoryIndex="9">
      <header v="Số phút đi muộn từ" e="Late In Mins. from"></header>
      <footer v="Số phút đi muộn từ/đến" e="Late In Mins. from/to"></footer>
      <items style="Numeric"/>
    </field>
    <field name="sp_di_muon_den" type="Decimal" dataFormatString="##0" clientDefault="0" categoryIndex="9">
      <header v="Số phút đi muộn đến" e="Late In Mins. to"></header>
      <items style="Numeric"/>
    </field>

    <field name="sl_ve_som_tu" type="Decimal" dataFormatString="#0" clientDefault="0" categoryIndex="9">
      <header v="Số lần về sớm từ" e="Early Out Times from"></header>
      <footer v="Số lần về sớm từ/đến" e="Early Out Times from/to"></footer>
      <items style="Numeric"/>
    </field>
    <field name="sl_ve_som_den" type="Decimal" dataFormatString="#0" clientDefault="0" categoryIndex="9">
      <header v="Số lần về sớm đến" e="Early Out Times to"></header>
      <items style="Numeric"/>
    </field>
    <field name="sp_ve_som_tu" type="Decimal" dataFormatString="##0" clientDefault="0" categoryIndex="9">
      <header v="Số phút về sớm từ" e="Early Out Mins. from"></header>
      <footer v="Số phút về sớm từ/đến" e="Early Out Mins. from/to"></footer>
      <items style="Numeric"/>
    </field>
    <field name="sp_ve_som_den" type="Decimal" dataFormatString="##0" clientDefault="0" categoryIndex="9">
      <header v="Số phút về sớm đến" e="Early Out Mins. to"></header>
      <items style="Numeric"/>
    </field>

    <field name="t_so_lan_tu" type="Decimal" dataFormatString="##0" clientDefault="0" categoryIndex="1">
      <header v="Tổng số lần từ" e="Total Times from"></header>
      <footer v="Tổng số lần từ/đến" e="Total Times from/to"></footer>
      <items style="Numeric"/>
    </field>
    <field name="t_so_lan_den" type="Decimal" dataFormatString="##0" clientDefault="0" categoryIndex="1">
      <header v="Tổng số lần đến" e="Total Times to"></header>
      <items style="Numeric"/>
    </field>

    <field name="t_so_phut_tu" type="Decimal" dataFormatString="##0" clientDefault="0" categoryIndex="1">
      <header v="Tổng số phút từ" e="Total Minutes from"></header>
      <footer v="Tổng số phút từ/đến" e="Total Minutes from/to"></footer>
      <items style="Numeric"/>
    </field>
    <field name="t_so_phut_den" type="Decimal" dataFormatString="##0" clientDefault="0" categoryIndex="1">
      <header v="Tổng số phút đến" e="Total Minutes to"></header>
      <items style="Numeric"/>
    </field>


    <field name="loai_cong" dataFormatString="1, 2, *" clientDefault="*" align="right" categoryIndex="9">
      <header v="Tính chất loại công" e="Workday Category"></header>
      <footer v="1 - Trong giờ quy định, 2 - Tăng ca, * - Tất cả" e="1 - Regular, 2 - Overtime, * - All"></footer>
      <items style="Mask"/>
    </field>

    <field name="mau_bc" external="true" categoryIndex="1">
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
    <view id="Dir" height="137">
      <item value="120, 50, 50, 100, 100, 130, 0"/>
      <item value="1101---: [ngay_tu].Description, [ngay_tu], [ngay_den]"/>
      <item value="1101000: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="1101000: [ma_nv].Label, [ma_nv], [ten]"/>
      <item value="11011-111: [nh_bp1].Description, [nh_bp1], [nh_bp2], [nh_bp3], [ten_nh_bp1%l], [ten_nh_bp2%l], [ten_nh_bp3%l]"/>
      <item value="11011-111: [nh_nv1].Description, [nh_nv1], [nh_nv2], [nh_nv3], [ten_nh_nv1%l], [ten_nh_nv2%l], [ten_nh_nv3%l]"/>

      <item value="1101---: [sl_di_muon_tu].Description, [sl_di_muon_tu], [sl_di_muon_den]"/>
      <item value="1101---: [sp_di_muon_tu].Description, [sp_di_muon_tu], [sp_di_muon_den]"/>

      <item value="1101---: [sl_ve_som_tu].Description, [sl_ve_som_tu], [sl_ve_som_den]"/>
      <item value="1101---: [sp_ve_som_tu].Description, [sp_ve_som_tu], [sp_ve_som_den]"/>

      <item value="1101---: [t_so_lan_tu].Description, [t_so_lan_tu], [t_so_lan_den]"/>
      <item value="1101---: [t_so_phut_tu].Description, [t_so_phut_tu], [t_so_phut_den]"/>
      <item value="1110000: [loai_cong].Label, [loai_cong], [loai_cong].Description"/>

      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
      <categories>
        <category index="1" columns="120, 50, 50, 100, 100, 130, 0, 0, 0">
          <header v="Thông tin chung" e="General Information"/>
        </category>
        <category index="9" columns="120, 30, 20, 50, 100, 100, 130, 0">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcA6csiqmA6uWUbWt8Rlc5KfuKw3/5QAu0HPYzB2LsuQQqpzhQUMXi1qSW8GKigBQ6ffSvQoMX1AJCFTUlVwgzcDjx0VDz/Yl/7WgbV/uR0FjCYT5yDC55nhKSiqZPSwDkaDtaHpWPEPSgltiGUl2lupgv8wmGI3PvnNkyy9PrDzmCmy6A4cCPrQKXokJlPc7hECqwaComakvZIDF3dmKPtWLVfOLchCp/UobqE8phj4MdjcVy8uLYXYsZZvybVWB6yXQ/r5l5R0WTWDcdR1f6VZBEybJ++/n56R4r9T9aCaDx3pOx0s88eMeEozGT+EZBw==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9zpe9+n7TNZox7zQGh7IHc5Yx/nEf419Ehr4HQHe6jiI31JOw3YacifH9ggEHForHg9LwKWE01vSh373aXMbLB75f6nZiHSbc0uGRmeGDryH9NzTjRepZQNje1gsALHKLICUTJK2zaSkUHp3qEP2D2h8MIhGEyr7392UvG4agAw+5K1EEVSVyFvp+6GrCbDBG4V+ct+tgnwG7YYL7bdxxXIEQRPXmVO+QHKcsnWX6InaXMNz9e4AaBKH5+oOJNOUiZLYdjzkK6SAByXzHw49IvnObMISGnxZCD8ixUgvpGtR43WdM7v8BrWe/6Wg+sw0At4kzXV6IHz9oQjkXY8FVZyEuN0YVldF/allvtH1f4ExLaT4lQepCO+iupYIbklT9MRRZ7TogZ+/uQY084jdcDPx/yJ3ZJKyuGMo6thV6SEPtR+LftxT8YWjKvNZl4qwbkwxQRxFHExkTSdm4Y3HSfN</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>