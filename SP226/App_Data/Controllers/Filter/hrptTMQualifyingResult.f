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
    <field name="ngay_hoc1" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày học từ" e="Training Date from"></header>
      <footer v="Ngày học từ/đến" e="Training Date from/to"></footer>
    </field>
    <field name="ngay_hoc2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày học đến" e="Training Date to"></header>
    </field>
    <field name="ma_khoa">
      <header v="Khóa học" e="Course"></header>
      <items style="AutoComplete" controller="hrTMCourseInformation" reference="ten_khoa%l" key="1=1" check="1=1"/>
    </field>
    <field name="ten_khoa%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_mh">
      <header v="Môn học" e="Subject"></header>
      <items style="AutoComplete" controller="hrTMSubjectList" reference="ten_mh%l" key="status='1'" check="1=1"/>
    </field>
    <field name="ten_mh%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvdt">
      <header v="Đơn vị đào tạo" e="Training Provider"></header>
      <items style="AutoComplete" controller="hrTMProvider" reference="ten_dvdt%l" key="status='1'" check="1=1"/>
    </field>
    <field name="ten_dvdt%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="loai_hinh_dt">
      <header v="Loại hình đào tạo" e="Training Type"></header>
      <items style="AutoComplete" controller="hrTMTypeList" reference="ten_loai%l" key="status='1'" check="1=1"/>
    </field>
    <field name="ten_loai%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_bp" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" onDemand="true">
      <header v="Nhân viên" e="Employee"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_vtr" onDemand="true">
      <header v="Vị trí công việc" e="Job Position"></header>
      <items style="AutoComplete" controller="hrPosition" reference="ten_vtr%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_vtr%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="bac_ql" onDemand="true">
      <header v="Bậc quản lý" e="Job Grade"></header>
      <items style="AutoComplete" controller="hrManagerLevel" reference="ten_bac_ql%l" key="status = '1'" check="1=1">
      </items>
    </field>
    <field name="ten_bac_ql%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit" ></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1=1"/>
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
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101: [ngay_hoc1].Description, [ngay_hoc1], [ngay_hoc2]"/>
      <item value="110100: [ma_khoa].Label, [ma_khoa], [ten_khoa%l]"/>
      <item value="110100: [ma_mh].Label, [ma_mh], [ten_mh%l]"/>
      <item value="110100: [ma_dvdt].Label, [ma_dvdt], [ten_dvdt%l]"/>
      <item value="110100: [loai_hinh_dt].Label, [loai_hinh_dt], [ten_loai%l]"/>

      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100: [ma_nv].Label, [ma_nv], [ten]"/>
      <item value="110100: [ma_vtr].Label, [ma_vtr], [ten_vtr%l]"/>
      <item value="110100: [bac_ql].Label, [bac_ql], [ten_bac_ql%l]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfx1Q8FjH/LNTDFiifeg6HXokFTex0egdQdhwr5S6VjP8LcSHMFJQeCvf+MLwVKPoSibfd6shblAOW23Xn13OpesayZYDUZxA4GQRbGRsEGZeuevJfCq9WXKrxqtMHe4TNP1Do3aULyB7PR2eydGfia86QTQLdH8MBHD53MQMkjLTAGsjUpez7Pz7LAGtVbGkqXPb0l9qzUIO1ZdGArHPJdDszRYf2nmVfB/1P8EIqxpD</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYBPjBKeM8/Qt3MheupAycbm2zTTGGEZMyjhaXuza8xtcz3ul9SFOsGjkqayHsCE2vmHkqABQ34uK1dzPJedUfakUok4ENcLiEw52J/aEimqXBHbMMDNbzK3b1Y4XqMoXiyXYfDrdbnbaJ6lEjnb8VUH9wyJouFTWn2jAj/D6/+BC4T540Y7LD0uex8LVOnjzlrF8KLqtLh65GasygQqd/tSCJvfS147b9Pc0Lh+fxLUGCbc7cbuDIuBIccpeYurplT9TYwKCgD3egnEBl9VTT6qYySylOkFLLX2fc86fWfhmeaYIooJpZSBewAnTxZO4uIp9X5QRWU4mEeCtS1FBTa2oIszdKhBJbEIcXLABAdEVN2GQknhSGycmz1TwdRjgC6+pelxRZ/Y2LJi1WYGohNxhIlZliTiSmorkplmr0vbk=</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>