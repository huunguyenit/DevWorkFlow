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
    <field name="ngay_bc" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" align="left">
      <header v="Ngày báo cáo" e="Report Date"></header>
    </field>
    <field name="ma_bp" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="loai_cc">
      <header v="Loại công cụ" e="Tool &#38; Supply Type"></header>
      <items style="AutoComplete" controller="hrTSTypeList" reference="ten_loai%l" key="status = '1'" check="1 = 1" />
    </field>
    <field name="ten_loai%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_cc">
      <header v="Mã công cụ" e="Tool &#38; Supply Code"></header>
      <items style="AutoComplete" controller="hrTSList" reference="ten_cc%l" key="status = '1'" check="1 = 1" />
    </field>
    <field name="ten_cc%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" onDemand="true">
      <header v="Nhân viên" e="Employee"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten" readOnly="true" external="true">
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
    <field name="kieu_loc" dataFormatString="1, 2, 3, *" clientDefault="*" align="right">
      <header v="Kiểu lọc" e="Filter by"></header>
      <footer v="1 - Chênh lệch thiếu, 2 - Thừa, 3 - Cả hai, * - Tất cả" e="1 - Insufficient, 2 - Excessive, 3 - Both, * - All"></footer>
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
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110: [ngay_bc].Label, [ngay_bc]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100: [loai_cc].Label, [loai_cc], [ten_loai%l]"/>
      <item value="110100: [ma_cc].Label, [ma_cc], [ten_cc%l]"/>
      <item value="110100: [ma_nv].Label, [ma_nv], [ten]"/>
      <item value="110100: [vtr_cv].Label, [vtr_cv], [ten_vtr_cv%l]"/>
      <item value="110100: [bac_ql].Label, [bac_ql], [ten_bac_ql%l]"/>
      <item value="111000: [kieu_loc].Label, [kieu_loc], [kieu_loc].Description"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4oK4vNsIHGGSlKfsdiNxhf7cakhpXnd40nDnRWl5Wq2bCK5lhQ9Hqlwso/e/S7T/8YVyEZgUfJ9f/Eu6fOxfQtLuaXvcZQNllrTIRqs9mWP3ndJqLIlblEN6T9hYXaKlWKFUifqpR0Jfx4A5iSmAo7ZcWoIeWa0nXeTk84ehpN3yBCF5XREeXijqMsBmhCmZz+oFp0UPEgMD+Kj13Wwv0Y=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYU3jg67mYTmJvr0ghQ2FoZbHIzklYnV8t/i1gFxjmm4+CrMQwd9loC6zJGaHx3fsAXrdWrswZuJEqLNbe9UrgfxCbD90ox7yjQ5XlP8mSQVS1IbAELV0lgUhH/II1gJ7he/Rge3ouXLcdCysODPmzcw0knK1iIPY9jGKDpH9XjJupIPa3VTNdBBTK1W1YDOgKxTQir2Bix1nUMFlVKMK006DTJ7DY/05sJ8NwaEKX/wL7DouZBdp9K+TkQHP7nJrp/jXIWglnASQEM4SumX1YmcxvYIJAnt7pWxWnrH2eV5X8kl8yeKX33M8M3DP4Ngc8sTDMo6w0/svURj9WOuCoo/JH7gKWDP7s2h0wLbXkOQxLQn5TGje500sZsPCPrkfB+PBZM8gBqda0yK8B8UgZ+g==</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>