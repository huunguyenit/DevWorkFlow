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
    <field name="ky" type="Decimal" dataFormatString="#0" align="right" allowNulls="false" aliasName="Period" defaultValue="(new Date()).getMonth()+1">
      <header v="Đến tháng" e="Month to"></header>
      <footer v="Đến tháng/năm" e="Month/Year to"></footer>
      <items style="Numeric"/>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" align="right" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Đến năm" e="Year to"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_bp" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
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
  
    <field name="tinh_trang" dataFormatString="*, 1, 2" clientDefault="*" align="right">
      <header v="Tình trạng nhân viên" e="Employee Status"></header>
      <footer v="1 - Đang làm việc, 2 - Nghỉ việc, * - Cả hai" e="1 - Working, 2 - Has Resigned, * - Show all"></footer>
      <items style="Mask"/>
    </field>
    <field name="mau_bc" clientDefault="10">
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
      <item value="120, 30, 40, 30, 100, 100, 130, 0"/>
      <item value="111----1: [ky].Description, [ky], [nam], [ten_nh_bp1%l]"/>
      <item value="11001001: [ma_bp].Label, [ma_bp], [ten_bp%l], [ten_nh_bp2%l]"/>
      <item value="110011-1: [nh_bp1].Description, [nh_bp1], [nh_bp2], [nh_bp3], [ten_nh_bp3%l]"/>
			<item value="11100000: [tinh_trang].Label, [tinh_trang], [tinh_trang].Description"/>
      <item value="110000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf39nSrfBHsPoOuhVJTMKhPuUp324+7TZl2PX2ojbqLWO/oOgKCJemmLi/dFWPhfumhF5F3cXu3O7qRnEGPmJFDCkUIFnPU/YZM6X/HpHxPi1rid5eo7cXguQ8lNnWSpMYqLukmBBTEivx1A3PVk+YwAHCK4hvrOKddzijR2jtTIjSSJtcRMezwLce2U0teLf92JvS2sDYi5tQV8YvwCIX9UUl6KgQDN8FpjSqmuSpffw</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBb2AweetwuRSjNIt/RVItfnwj8KETZUspDystuKQRyhTh86bwcTpQag/xXBgmMcjIp6PvgqEXudtm/PtmqEMpB5UC0FBX55mAmI5/ISTWc01OaYo8thuThgbqnk90yWlE+DHkd2YNZPSy9ueJ2FmQsXuPVXB5KCWTA5rbP4OhF80equxn5UWkFrTtkzUfymIFrmxp3tK1/qIi/4qgR+x2+UCCnvEY4IfTQq8NPGOSCNXly/J2/XKsHB/ZF7w4h9NgBBdaClJRhJy7rz7CjksEIX/cB/OIt1bWrnfu7HIW3B7EEoUSW4Jt8IU3a2tfUP4V+dU142Iwa892/TURZuoN/jg9J2kbszlQ/yxEW5Y9sSN6A7rDAiahaxiVCLi5tvo58CPmMuVcFGahKR37lcVtsZi77CWlp2uNXalNJVhZk4Tg==</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>