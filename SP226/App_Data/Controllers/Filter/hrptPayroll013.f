<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="0" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_bc" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Ngày báo cáo" e="Report Date"/>
    </field>
    <field name="type" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Loại" e="Type"></header>
      <footer v="1 - Thông tin lương, 2 - Thông tin phụ cấp" e="1 - Salary, 2 - Allowances"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99DxomfUy1O0z/5I3DBzBd4XMPNLhhhB5qfAJGra7L/im</Encrypted>]]></clientScript>
    </field>
    <field name="ma_pc">
      <header v="Mã phụ cấp" e="Allowance"></header>
      <items style="Lookup" controller="hrAllowance" reference="ten_pc%l" key="status = '1'" check="1=1" information="ma_pc$hrdmpc.ten_pc%l"/>
      <handle key="[type] == 2" field ="type" source="" reference=""/>
    </field>
    <field name="ten_pc%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" onDemand="true">
      <header v="Nhân viên" e="Employee"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten_nv" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten_nv" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_vtr" onDemand="true">
      <header v="Vị trí công việc" e="Position"></header>
      <items style="AutoComplete" controller="hrPosition" reference="ten_vtr%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vtr%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_bac" onDemand="true">
      <header v="Bậc quản lý" e="Job Grade"></header>
      <items style="AutoComplete" controller="hrManagerLevel" reference="ten_bac%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bac%l" readOnly="true" external="true" defaultValue="''">
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
    <view id="Dir" height="282">
      <item value="120, 30, 10, 60, 100, 100, 130, 0, 0, 0"/>
      <item value="1100------: [ngay_bc].Label, [ngay_bc]"/>
      <item value="11100000--: [type].Label, [type], [type].Description"/>
      <item value="110000----: [ma_pc].Label, [ma_pc]"/>
      <item value="11001000--: [ma_nv].Label, [ma_nv], [ten_nv]"/>
      <item value="11001000--: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="11001000--: [ma_vtr].Label, [ma_vtr], [ten_vtr%l]"/>
      <item value="11001000--: [ma_bac].Label, [ma_bac], [ten_bac%l]"/>
      <item value="110000----: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&Er6kBCOukK5FxLFOw1tnByAgCrIJB2WbtqNoIE0MMuXH5JuKA5D77/aHa1PQ4P1O7grp/QYS+HT29Eb2GH9pL6v1ol5VELouhCfnX9OVA5PqWodCE9OtrnghujKipKo5uodNsCeZFNbTiUJlHe913CyUA4U/k79UbB9JsYG/f5o=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdJRNu5zlk9LulV4hGWKSokzX5WETh1OKvMXtm7vnvibsIkUUINrtKPIcJOUhVOwBQUcf1RYB/cVaaENyPHLaoJ3RTm9n7NHFL6I9jsDtWRdlAWo1OZky5wJrsTU12c6H3pIg9c4VP9DApSWaFQs2zR0VT0RstAlKWvUCPt6VRxjgLV5q4NTPRaf2noEn90vB65u+O1AEBbBRhWMANQ7fBY8hOU6/GzNwCTXu625ei2sSD8ZpUmYVARGp61bNFlbMeF4QKOWpAkSnyOEghJAhF+YWWVb2V8auUc5Tq1gh1XwA/Uz5Dzum5wFbOqrNLnFrK6GQdl742vdUJGTKKzMF/sevy7CWadaBiMdWttuhvv5ZrNl9mh+eco26xJ+ZIvi6/u7SOOlcdh3IN8ETrQ643hhKBQdWFImmoyztSD9L9JXf7FRtHQcujio/yRvFdgeNATPQL43uR16pKiGV1QtdB/9ZIYq0XTtlbRXAejFsr62cLeCD/tKBGW5fA4Iq29NjJTpfgk9gGNLHiBxR0CVZOJAUDSJp+BmPS6aQMAXhQkRXvIKF54RMagEjoe31ZDlAu/nMyvkbEIHWmffV5aguZp5rglAQMaGLFrB8nagGLenbdkfr6txC1zI31I1oWn/wSC+7di323t0iPuEN79Qpw9qJkizUR3i1g2zySZY4/YPoLezNIue1aTAfAjOcX64njSEHQF5wNwMbJWDwQsfTG8hSshO9GdSmx580yX+IYs9LYRtQa/2HTIxQ4pq0MLvkDzpBz+n4eWMmHHr/NXzSkx0XMort//Nzbs/oTxSMlQyRSWkio58qkukzkgMIxg+zvyadKzrXB87y+NRk+vFY9E5MuATKndKpfCmexRh3ntu4CqbCisZlE7F/MY6WWypeygwrV31WqkA/PzYike+c+QbVCtWbRWviRTSp7HlywfhHEKSlBUji3Bb8+Jnv1M4+aD6K+vHyiJj+bNLc21rGi2k6+6InN+IRbADHgCRc6cOAYXL5KCAhi3spyZ4M9y8rto8sZfure+lrNtGR12lsTgK1WOGpRHcvaxjRIX5JlkspUfWIqkPXJfTbJZH0G/R798HEbKJXayjn3tbiAiNWYVjjCm/qAdZpm7zh20HH0Vqvm64XC/bYMMAzO4V0XBg/CnMmWQkzql6KVR7UTcIalmTqDpK90vSSpwoz2DyZtQVk</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>