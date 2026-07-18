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
    <field name="ky" type="Decimal" dataFormatString="#0" allowNulls="false">
      <header v ="Từ kỳ" e ="From Period"/>
      <footer v="Từ kỳ/năm" e="From Period/Year"/>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Từ năm" e ="From Year"/>
      <items style="Numeric"></items>
    </field>
    <field name="so_ky" type="Decimal" dataFormatString="#0" allowNulls="false" clientDefault="6">
      <header v ="Số kỳ báo cáo" e ="No. of Periods"/>
      <items style="Numeric"></items>
    </field>
    <field name="ma_bp" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_loai" onDemand="true">
      <header v="Loại phân nhóm" e="Category Type"></header>
      <items style="AutoComplete" controller="hrDeptCategoryType" reference="ten_loai%l" key="status = '1'" check="1=1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PTzxBBVvUyvoGhZosf1w9Zrik5qNNm9lOOYGrFCPvBbdWdZyxxTsfeMEIxRiZjMzQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_pn" onDemand="true">
      <header v="Phân nhóm" e="Department Category"></header>
      <items style="AutoComplete" controller="hrDepartmentCategory" reference="ten_pn%l" key="ma_loai = '{$%c[ma_loai]}' and status = '1'" check="ma_loai = '{$%c[ma_loai]}'"/>
    </field>
    <field name="ten_pn%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ds_loai_luong" allowNulls="false">
      <header v="Danh sách loại lương" e="Pay Types"></header>
      <items style="Lookup" controller="hrPayType" key="status = '1'" check="1=1"/>
    </field>
    <field name="ma_nt">
      <header v="Mã ngoại tệ" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_nt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ct_theo" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Chi tiết theo" e="Detailed by"></header>
      <footer v="1 - Nhân viên, 0 - Không" e="1 - Employee, 0 - No"></footer>
      <items style="Mask"/>
    </field>

    <field name="mau_bc">
      <header v="Mẫu báo cáo" e="Report Form"/>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
        <item value="20">
          <text v="Mẫu ngoại tệ" e="FC Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 40, 30, 100, 100, 130"/>
      <item value="111: [ky].Description, [ky], [nam]"/>
      <item value="11: [so_ky].Label, [so_ky]"/>
      <item value="1100100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="1100100: [ma_loai].Label, [ma_loai], [ten_loai%l]"/>
      <item value="1100100: [ma_pn].Label, [ma_pn], [ten_pn%l]"/>
      <item value="110000: [ds_loai_luong].Label, [ds_loai_luong]"/>
      <item value="1100100: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="1110000: [ct_theo].Label, [ct_theo], [ct_theo].Description"/>
      <item value="110000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKMncSxMfZsjYKb/X2R7Svv5Azs9traVUOeN4OPSnBBAl757+eXvs/Pkzkbt3pBo7BD2BaSwlfsEj0nE1CjgirGScViUQFBgDzAF8lp0XmSWZjc/zoG8lb8M6gza9Y8ovfI3sAgiUzWHlz6WwdWICZaYutXpcDLnZCpdZAsrLX9jU9IkZaZ1ZKEVFgPxU7u0UY6GZJZNM39HMhjisL3isSscVM04+OQsYeSo5zZZ1k2ZEM8ypKkcT6hxpe0M7juoW84mkVrmSNH00uI9r8q4k+Q=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptPivotFilter;
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdBirwQHi7tkqUAOMzr9GimZ3UfO6ZOxUJ5msCIlyw4GOePHITCaJJzcF6vcuE65N2yqB/lgxSbr22gsSkt1/aovR9fhC5LEWFgC2AP/Z9bfGeLAv1tkWZqodKCtsqNDG0gSa2I/IHCS1fl74w/1bqsvep8uLbfUzT7sCb3toRSXr6XVHUoGJZO961FMonNzxR8hYr4iz2uYRFlkJkjBYulnun7nfUdC+IlBMdgfvL4NZXcwoV2i/4bFaueSAcMeFNMTjT44xo1+eC63euwqCLxyz05tfSecIjpC953PrqNFGUO1HojgdTz1GeKs08jH2+xlXE5VxdC0zK/5CnSS/NhIEEd45MkIU25auhxwN7TRW0l4zfLAsfEGMm2aHaSSiN3DXkxlPAMFNIQVTyqKvlpuPHIqa1XWLFk8Dzfxgnj6RveE6Pp4k4VmmLgh+bFHom0lRZBUisQhvfHaLYNA0hCHarAd+i5u2vtqZiznxkDXfKwe768yF8Zem4moLym7zfSmf27CSbRV2v2Jq4Hq4DHc+/hq+j2p5OUWrH/IKDjWF0/DA/aFsHbgAfq/ZnJl69X283BEPUYy/D5BXCplihxidlgih9lq9jMVGPdSoRaKR</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>