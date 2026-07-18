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
    <field name="ky" type="Int16" dataFormatString="#0" allowNulls="false">
      <header v ="Từ kỳ" e ="From Period"/>
      <footer v="Từ kỳ/năm" e="From Period/Year"/>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Int16" dataFormatString="###0" allowNulls="false">
      <header v="Từ năm" e ="From Year"/>
      <items style="Numeric"></items>
    </field>
    <field name="so_ky" type="Int16" dataFormatString="#0" allowNulls="false" clientDefault="6">
      <header v ="Số kỳ báo cáo" e ="No. of Periods"/>
      <items style="Numeric"></items>
    </field>
    <field name="ma_bp0" onDemand="true">
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
      <item value="111---: [ky].Description, [ky], [nam]"/>
      <item value="11----: [so_ky].Label, [so_ky]"/>
      <item value="1100100: [ma_bp0].Label, [ma_bp0], [ten_bp0%l]"/>
      <item value="1100100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="1100100: [ma_loai].Label, [ma_loai], [ten_loai%l]"/>
      <item value="1100100: [ma_pn].Label, [ma_pn], [ten_pn%l]"/>
      <item value="1100100: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="1110000: [ct_theo].Label, [ct_theo], [ct_theo].Description"/>
      <item value="110000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKMncSxMfZsjYKb/X2R7Svv5Azs9traVUOeN4OPSnBBAl757+eXvs/Pkzkbt3pBo7BD2BaSwlfsEj0nE1CjgirGScViUQFBgDzAF8lp0XmSWZjc/zoG8lb8M6gza9Y8ovZlOi3ZiuS8KNrxxH/FmqDazXKd0O9f1yEx2HiHoOnN9KgKKO4PvLtGdSDEeK3s8eCgAoAnhudr+t1V9knN8kauHs97Ce5sySApiOVfeCa6Kb275VQIFyqAMBsCicL1BQw==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptPivotFilter;
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdBirwQHi7tkqUAOMzr9GimZ3UfO6ZOxUJ5msCIlyw4GOePHITCaJJzcF6vcuE65N2yqB/lgxSbr22gsSkt1/aovR9fhC5LEWFgC2AP/Z9bfGz7Ck0vR/1ZSR1nmkmvRbX1Hjx2oJSa4kuIWdUDXIqpQgCz2Qz7CLVBSPzIeMQjEROJmgiytdFajLoGDJpqOpzIeslV7sBVX5ZMtjyrS6hbKklHRlYCpwFcyzAc/LMURzlFn0ARm8ZePCrn6+WnXsqsPFv14IoeNWRhrx4Z10ARK9sTVgVk17A+PadRDKKO9HjgQCzsDI4dqD7slf5zS0kC91OszM7gO9BV2bVO2o0Tz34hXBPyVtk42qRhqTiQbR5rwlkxfU3jxNS7u23OmKAPfz2Hw6T/zmMGakFqZWPaVJ2EQ4rMR5YOnbBrIT8nKdBGT9JJI1KR04hlTdJbFlk6EEUKVOjDqS3i1XkaWD7jzoVWcWkv7bkL5MPQVzwjKG86nykRd20rWNMrsITX4nQg0GMu0dO1QDnq5DP2BkJUjDzUiPVgx3cE7Nw+Ez06cYNtsU4zFi6nKrWROjmVxaHg==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>