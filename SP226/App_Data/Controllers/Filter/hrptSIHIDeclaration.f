<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir id="0" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="date_from" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày vào cty từ" e="Join Date from"></header>
      <footer v="Ngày vào cty từ/đến" e="Join Date from/to"></footer>
    </field>
    <field name="date_to" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày vào cty đến" e="Join Date to"></header>
    </field>
    <field name="si_date_from" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày tham gia BHXH từ" e="SI Joining Date from"></header>
      <footer v="Ngày tham gia BHXH" e="SI Joining Date from/to"></footer>
    </field>
    <field name="si_date_to" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày tham gia BHXH đến" e="SI Joining Date to"></header>
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
    <field name="report_date" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Ngày báo cáo" e="Report Date"></header>
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
    <field name="keys" hidden="true" readOnly="true" filterSource="Infinite">
      <header v="" e=""></header>
    </field>
    <field name="empty" type="Boolean" defaultValue="0">
      <header v="Chỉ hiện những nhân viên chưa có mã số BHXH" e="Only employees have not received SI codes"></header>
      <items style="CheckBox"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="1101---: [date_from].Description, [date_from], [date_to]"/>
      <item value="1101---: [si_date_from].Description, [si_date_from], [si_date_to]"/>
      <item value="1101000: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="1101000: [ma_nv].Label, [ma_nv], [ten]"/>
      <item value="1101000: [vtr_cv].Label, [vtr_cv], [ten_vtr_cv%l]"/>
      <item value="1101000: [bac_ql].Label, [bac_ql], [ten_bac_ql%l]"/>
      <item value="110----: [report_date].Label, [report_date]"/>
      <item value="11000-1: [mau_bc].Label, [mau_bc], [keys]"/>
      <item value="-110000: [empty], [empty].Label"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ckI0x1oGNV/N+WsKvEVIN5j7PRUam2RqSmFB7tDVums/5Jsv2IRx3lnOWmqZ7Qm3w2vVGvfhx1BbWDfCJSSlTLmr7CGWB37fiveVp4LtDT5iEaHtSnhs2sflggj/lDOUNvRtB5FEUmLMmcnGyO/TrPyXVcSyP0jI0n5Daf7HaRXs0o0Za0+1oDXkVJnWGJfyw==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdBirwQHi7tkqUAOMzr9Gimapnlu/u2AVtDgSw+RL4/PEm5/fgFNwXPqrlUyerRX4lZ8+o2XRYDtOQSiQMpTNEHgBcuaIHaLhpNIu7zphWP1mnNardpXmdMjPnqLEZ4Sg5kRim3ERqzKaoSJOsviUgBIzXD3J5hrnFtcIu8WVhcpl4jwlk5jFRTK5Q0c1e4apfVROV55fAXlBqxFzVuTTj2fG8XCfNNHWEBSmnD/nQNEcCeoVCtNGEdLL4lqhtEMGmtUvO98GiqX9MnJvYAzCv02sD0wvXf4diNhkC/ygbcp4MusziSzHzLoOT8QsKpXjxlvpo1LLac/AJda0hTO0Fto=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>