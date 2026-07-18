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
    <field name="so_ky" type="Decimal" dataFormatString="#0" allowNulls="false" clientDefault="3">
      <header v="Số kỳ báo cáo" e="Report Periods"/>
      <items style="Numeric"></items>
    </field>
    <field name="tu_ky" type="Decimal" dataFormatString="#0" allowNulls="false" aliasName="fromPeriod" defaultValue="(new Date()).getMonth() + 1;">
      <header v="Tháng" e="Month"></header>
      <footer v="Tháng bắt đầu" e="Start Month"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="tu_nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>

    <field name="ma_bp" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hreDepartment" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_bp1" onDemand="true">
      <header v="Nhóm bộ phận 1" e="Department Group 1"></header>
      <footer v="Nhóm bộ phận" e="Department Group"/>
      <items style="AutoComplete" controller="hrDepartmentGroup" reference="ten_nh_bp1%l" key="status = '1' and loai_nh = 1" check="loai_nh = 1"/>
    </field>
    <field name="ten_nh_bp1%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_bp2" onDemand="true">
      <header v="Nhóm bộ phận 2" e="Department Group 2"></header>
      <items style="AutoComplete" controller="hrDepartmentGroup" reference="ten_nh_bp2%l" key="status = '1' and loai_nh = 2" check="loai_nh = 2"/>
    </field>
    <field name="ten_nh_bp2%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_bp3" onDemand="true">
      <header v="Nhóm bộ phận 3" e="Department Group 3"></header>
      <items style="AutoComplete" controller="hrDepartmentGroup" reference="ten_nh_bp3%l" key="status = '1' and loai_nh = 3" check="loai_nh = 3"/>
    </field>
    <field name="ten_nh_bp3%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_nv1" onDemand="true">
      <header v="Nhóm nhân viên 1" e="Employee Group 1"></header>
      <footer v="Nhóm nhân viên" e="Employee Group"/>
      <items style="AutoComplete" controller="hrEmployeeGroup" reference="ten_nh_nv1%l" key="status = '1' and loai_nh = 1" check="loai_nh = 1"/>
    </field>
    <field name="ten_nh_nv1%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_nv2" onDemand="true">
      <header v="Nhóm nhân viên 2" e="Employee Group 2"></header>
      <items style="AutoComplete" controller="hrEmployeeGroup" reference="ten_nh_nv2%l" key="status = '1' and loai_nh = 2" check="loai_nh = 2"/>
    </field>
    <field name="ten_nh_nv2%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_nv3" onDemand="true">
      <header v="Nhóm nhân viên 3" e="Employee Group 3"></header>
      <items style="AutoComplete" controller="hrEmployeeGroup" reference="ten_nh_nv3%l" key="status = '1' and loai_nh = 3" check="loai_nh = 3"/>
    </field>
    <field name="ten_nh_nv3%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_loai" onDemand="true">
      <header v="Loại phân nhóm" e="Category Type"></header>
      <items style="AutoComplete" controller="hrDeptCategoryType" reference="ten_loai%l" key="status = '1'" check="1 = 1"/>
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
    <field name="bac_bp" type="Decimal" dataFormatString="###0">
      <header v="Bậc bộ phận" e="Department Level"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_vtr" onDemand="true">
      <header v="Vị trí công việc" e="Position"></header>
      <items style="AutoComplete" controller="hrPosition" reference="ten_vtr%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vtr%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_vtr1" onDemand="true">
      <header v="Nhóm vị trí công việc 1" e="Position Group 1"></header>
      <footer v="Nhóm vị trí công việc" e="Position Group"/>
      <items style="AutoComplete" controller="hrPositionGroup" reference="ten_nh_vtr1%l" key="status = '1' and loai_nh = 1" check="loai_nh = 1"/>
    </field>
    <field name="ten_nh_vtr1%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_vtr2" onDemand="true">
      <header v="Nhóm vị trí công việc 2" e="Position Group 2"></header>
      <items style="AutoComplete" controller="hrPositionGroup" reference="ten_nh_vtr2%l" key="status = '1' and loai_nh = 2" check="loai_nh = 2"/>
    </field>
    <field name="ten_nh_vtr2%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_vtr3" onDemand="true">
      <header v="Nhóm vị trí công việc 3" e="Position Group 3"></header>
      <items style="AutoComplete" controller="hrPositionGroup" reference="ten_nh_vtr3%l" key="status = '1' and loai_nh = 3" check="loai_nh = 3"/>
    </field>
    <field name="ten_nh_vtr3%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bac" onDemand="true">
      <header v="Bậc quản lý" e="Job Grade"/>
      <items style="AutoComplete" controller="hrManagerLevel" reference="ten_bac%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bac%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="tt_nv" dataFormatString="*, 1, 2" clientDefault="*" align="right">
      <header v="Tình trạng nhân viên" e="Employee Status"/>
      <footer v="1 - Chính thức, 2 - Thử việc, * - Cả hai" e="1 - Permanent, 2 - Probationary, * - All"></footer>
      <items style="Mask"/>
    </field>

    <field name="mau_bc" external="true">
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
      <item value="120, 30, 40, 30, 100, 100, 130, 0, 0, 0"/>
      <item value="11------: [so_ky].Label, [so_ky]"/>
      <item value="111-----: [tu_ky].Description, [tu_ky], [tu_nam]"/>
      <item value="11001001: [ma_bp].Label, [ma_bp], [ten_bp%l], [ten_nh_bp1%l]"/>
      <item value="110011-1: [nh_bp1].Description, [nh_bp1], [nh_bp2], [nh_bp3], [ten_nh_bp2%l]"/>
      <item value="110011-111: [nh_nv1].Description, [nh_nv1], [nh_nv2], [nh_nv3], [ten_nh_nv1%l], [ten_nh_nv2%l], [ten_nh_nv3%l]"/>
      <item value="1100100-: [ma_loai].Label, [ma_loai], [ten_loai%l]"/>
      <item value="1100100-: [ma_pn].Label, [ma_pn], [ten_pn%l]"/>
      <item value="1100----: [bac_bp].Label, [bac_bp]"/>
      <item value="1100100: [ma_vtr].Label, [ma_vtr], [ten_vtr%l]"/>
      <item value="110011-1: [nh_vtr1].Description, [nh_vtr1], [nh_vtr2], [nh_vtr3], [ten_nh_vtr1%l]"/>
      <item value="11001001: [ma_bac].Label, [ma_bac], [ten_bac%l], [ten_nh_vtr2%l]"/>
      <item value="11100000: [tt_nv].Label, [tt_nv], [tt_nv].Description"/>
      <item value="110000-1: [mau_bc].Label, [mau_bc], [ten_nh_bp3%l]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcEtiyHT3yvaSW0MlpQVd8+FlYVtj48YEJzxcDWLnx3W4kRMghT6/RGWKuvA1EMjOELv30kIKa10zYem/SaFEHgzRITd2sENiOuN/Zcp19L0Rhghs9O6IahC9YudEvD+cO6oFpGNuqFnMrbEBIR/S4nQNsx3XjA1z2C8+7/f27QD1bl59Ql+Xk0IRYp6vNB3bJ77yUWIq6qf75qiVW2WdX04nv7KzxWEl9Luwv2wzg8hil01n5VrwAFJsEYVuQRxKsS7NAFPabm9oXLbRCtBtjEc=</Encrypted>]]>
      </text>
    </command>
    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22VJvj7NkwuBcVNTyepJpRGwmYmxjrA5StX1mF+GgawqdbE6Rq2RK1nAJfNUpcFeLXeXFVYP79YtAXzLpdGEn/qYg/yPxePFfZUKp22U8KVzzVnD/LVLolD2iJ+pDUP6LlFFRtS8FZou1ZUOqcCk740v5jC/JgsM0Q3aOFgjXz1AhOZxXiednUb0mKxhc9uJy3Ne4SA0pwKxSq5Uh3ycxjeSor80s+F5Ql/oi0cQyo2qeeKVtHHknd0ekMEbDkj+eMao3Svluxso/BOZvio78Y/05QbTqsIawz7i+tj/X7HBPXOGyjp4XtDqr4Q0C/nKSTpX5RtYFDLC19yxw5XAmjQFSRkqu8vTWK3u2un01RSkthnGalV+d1mO8a/RrspZVew==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptPivotFilter;
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdIWyhhPd92v5o6BVLyei3qhflsc9QPOqLE6KpAGkST9lOhF1Ws/FquKfxbmuRf80eXfAGjI4jCSLo3HndXbn4LvohNMZh1/yM30s+g0RYmw48672EFjodJsTvXtvHHP1dPYqt8sbfi6xPVp6mfeahDG9+2MNiU8gMopmPLyDiMOblljdf1//PcSp2IjxdWlxGNtM36sqHbJDAahIJSGH5m2l9K+LuXDy0S8+cdGcNwPDIOi2xz7ttlTWn4UEmfXSr0brgCVg+q3i3y7PDPdEXM0kx9ZQ3pOn7EBeZEjBHGlDcBnTmDMdvhykdsOUnrCZ6fNylyvmQvCmxQsnJFMkG5xqiKCyTed3cvxxkFk970GR8GdxxoYORpzaoge/7M97Oe9+Oz7qyFTZugZfDWrx/5q/X0Nc1tqEZqyVTvTlAHnn</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>