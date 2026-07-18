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
    <field name="date_from" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày vào cty từ" e="Join Date from"></header>
      <footer v="Ngày vào cty từ/đến" e="Join Date from/to"></footer>
    </field>
    <field name="date_to" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày vào cty đến" e="Date in to"></header>
    </field>
    <field name="report_date" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Ngày báo cáo" e="Report Date"></header>
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
    <field name="mau_bc" clientDefault="10">
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
      <item value="120, 30, 70, 100, 100, 0, 0, 130"/>
      <item value="1101----: [date_from].Description, [date_from], [date_to]"/>
      <item value="110-----: [report_date].Label, [report_date]"/>
      <item value="11010000: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="11010000: [vtr_cv].Label, [vtr_cv], [ten_vtr_cv%l]"/>
      <item value="11010000: [bac_ql].Label, [bac_ql], [ten_bac_ql%l]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzj/zcZPELZCCkB+H5CwIjeqfRf4ljmB8B4dx474+ma1lCLz8XoVeJoq86DkM6WuJ8KrSQyMmqILh1spKqJY2EldeiTQBhck1J0sYyGDism5s+Vn4SIhcFYhOHoJH1hDj0HQf5KnyedlnVv1vPTdYsv5MCUYWYKqZrhPiL2km+DZvJvRhXpvq2gaIP3g1LeuSGim7XUR8NqiJpT/TflNlZA=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYBPjBKeM8/Qt3MheupAycbm2zTTGGEZMyjhaXuza8xteyPF0h92PjacbhRzveO3bP9Fz4fa/7rnF4dzSzUrfbe4RqIoz2fdCC7WfdxSNDyDuJVrkuFRzXynTIj5zuScku4QfqOy/t2YP358pHpApjr3WSnIpdJlcRfGNi8vhkAPwcRC7Pc8JGvo7mHm+lyTEm5wjkrQn8H+CzKLdLPV341agLC83LPVyOX1WglDuJc5wkn7pMHC8Coyjy245rNCT4MhwH9sG1UpSBegMp1+ET8CItRXSx5a0xQHlSxMcN0BWQ1VtC4ZXpzdISqANHMLLJDS3bHN8qIcmcmUPqcNDOImxUhDVaSbZPnPO5TuAjSFlFsElUDfGz1D7/AaJmSK0ZSb92hOrdS+1qIJ33DqBsgH1E3Bi8ikFPnkk//a7Hwx4=</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>