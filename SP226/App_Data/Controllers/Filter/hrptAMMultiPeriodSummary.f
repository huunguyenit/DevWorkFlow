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
    <field name="tu_ky" type="Decimal" dataFormatString="#0" allowNulls="false">
      <header v="Từ kỳ" e="From Period"></header>
      <footer v="Từ kỳ/năm" e="From Period/Year"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="den_ky" type="Decimal" dataFormatString="#0" allowNulls="false">
      <header v="Đến kỳ" e="To Period"></header>
      <footer v="Đến kỳ/năm" e="To Period/Year"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="tu_nam" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Từ năm" e="From Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="den_nam" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Đến năm" e="To Year"></header>
      <items style="Numeric"></items>
    </field>

    <field name="ma_bp" allowNulls="false">
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
    <field name="loai_dg" dataFormatString="1, 2" clientDefault="2" align="right">
      <header v="Loại đánh giá" e="Appraisal Type"></header>
      <footer v="1 - Nhân viên đánh giá, 2 - Quản lý đánh giá" e="1 - Self-appraisal, 2 - Manager Appraisal"></footer>
      <items style="Mask"/>
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
      <item value="120, 30, 40, 30, 100, 100, 130"/>
      <item value="111: [tu_ky].Description, [tu_ky], [tu_nam]"/>
      <item value="111: [den_ky].Description, [den_ky], [den_nam]"/>
      <item value="1100100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="1100100: [ma_nv].Label, [ma_nv], [ten]"/>
      <item value="1110000: [loai_dg].Label, [loai_dg], [loai_dg].Description"/>
      <item value="110000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3dgL9/kGDVnaOTscqWPBRMgJLaU2CM5OFCWiQTnfwngUJ3gonP8UYXdYa9BXr2mZ2kudTgmNd4BlJScmJmOUoBkm1xiArXY4U/ymFxNmIzk6+ZaG1ynfn+gYEYFasB2Nr894ltdm/20T+4XqUnT9zvGbk3BphscMNxqPrfV5VAK0j+OvfmJGDK1kKiyabyCxz/5FbXvUHO557sO2WWvdX1JllyaNu+4GoytoonXscuUUKczM72jBU8/fXZKMRcBMGYVDIv+8GvFzy+VDlpEL3vUu0QPogy7TB/oMAqnigxGJigTOxout9CBjVO0YkU/Ug==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYBPjBKeM8/Qt3MheupAycbm2zTTGGEZMyjhaXuza8xteyPF0h92PjacbhRzveO3bP3wfF5BUKYGYNcOqJkkxMhMCBg7/kXKXtzdXVk9xX7yNK4C7Vi+aFJAe/tEKu8PY/fzRfl1X79i9ZSng5VL24KZPjIN0Oa/GHID0F9/EOODWBCmD5UdhXZrCzfFayUmKMBeuMyMECMANKEL7M/PyjTvUont/GwROVe8/uHpyyE21Y2xs5DQI2uzpM2hIQ1wRbyy7iBvT2kak99sOFtiEqH90AtS1J3N2VMiomLqOtb456xjFEHwJeG55Q3Fdc8PMIOdMbSvVmDah6j9CA2HkshEkyn/5ETHxQ8fa/AgW5VUTRqlTpRbicHrMpVHTDfZPotzb9WH7bqUcExJgC5i87C+MCSPKPDjOJvuIy0i6hatQQIJ8Zol93DYew6am0DwS/2vMO/56RF/NEBQKyDRDH3lxBMZTOYudrjA2Jb1PeP7mOzA7DdSgo1GPuB1Na/ze1LzeDl6FH871qBsqYwo5lPHu1+0n9tzrrNgezYvokzHY=</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>