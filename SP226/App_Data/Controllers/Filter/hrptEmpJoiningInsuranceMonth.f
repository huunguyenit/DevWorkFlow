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
    <field name="thang" type="Int16" dataFormatString="#0" allowNulls="false">
      <header v="Tháng" e="Month"/>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Int16" dataFormatString="###0" allowNulls="false">
      <header v="Năm" e="Year"/>
      <items style="Numeric"></items>
    </field>
    <field name="ma_bp" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="vtr_cv" onDemand="true">
      <header v="Vị trí công việc" e="Position"></header>
      <items style="AutoComplete" controller="hrPosition" reference="ten_vtr_cv%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vtr_cv%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="bac_ql" onDemand="true">
      <header v="Bậc quản lý" e="Job Grade"></header>
      <items style="AutoComplete" controller="hrManagerLevel" reference="ten_bac_ql%l" key="status = '1'" check="1 = 1">
      </items>
    </field>
    <field name="ten_bac_ql%l" readOnly="true" external="true">
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
    <view id="Dir">
      <item value="120, 40, 60, 100, 100, 130"/>
      <item value="11: [thang].Label, [thang]"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100: [vtr_cv].Label, [vtr_cv], [ten_vtr_cv%l]"/>
      <item value="110100: [bac_ql].Label, [bac_ql], [ten_bac_ql%l]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3jSn0d/7XyoxWbR6coY+NcGu9YLhpQ+Xm33iVluBoQWISWvqRmzIFpXr0C+yHLvlTUb1y+TSKVqF8GUH/+PbipApzrksVxeL+f/wKOfrDoq0ZGlOIaXRnycPnGO3kWpS6nPVhHvnkzpIHXrs4ooaIAEJkazNyJAZrjq/+NuMbp93yKURU/d4vN44KNzC+ySlnQnsMOPbPkqlvSYjHG+yImtxaPbUr4zSbkR6hbSqX5D</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYU3jg67mYTmJvr0ghQ2FoZbHIzklYnV8t/i1gFxjmm49AyBoITp8xe623qt/1huiZFlk1tx5ZV01XcySnjV5umP5bSNoinMfjsaURtj9F0L7smVdkd15l9Z8gpoOEZpUFeIbuQSYcWnl3oTz1lsvsJCXGEVdHDzHYuvJzt/lrHQ7Ke1ZgEIjRH4KvNR7UiDBZpc4LAf2bBMGL+RoEo271H4yJ6s+Mwuv0649fHL7PfJG5DZKL//5svR3qaCJtSMW918P6dTl4aTL0zIq5EOAKHJp/ZFbjA1D3IlgtOOY8TBAvlfwe+OB7MkA8RtOJA1U+Py1CW3L3AWxiQ8Qwd5yUQ6lQBRryoefoJJHhKJP3p5AZAVVGheM6ENGYEyqpgI9+7m4tcKMPobrQVqAvrj17T5qGqaEN9VOJfBS9f+k5JBfNZHNLVDn8uYfCiATO+36Rhqvj6R4STwnM1hgxYVpjqg==</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>