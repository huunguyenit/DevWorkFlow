<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY CostingUnitFilterSetReadOnly SYSTEM "..\Include\Javascript\CostingUnitFilterSetReadOnly.txt">

  <!ENTITY Control ",@$control = '1110'">
  <!ENTITY CostingExternalFilterShowing SYSTEM "..\Include\Command\CostingExternalFilterShowing.txt">
  <!ENTITY CostingUnitFilter SYSTEM "..\Include\Javascript\CostingUnitFilter.txt">
  <!ENTITY CostingUnitFilterRespone SYSTEM "..\Include\Command\CostingUnitFilterRespone.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tu_ky" type="Decimal" dataFormatString="#0" allowNulls="false">
      <header v="Từ kỳ/Năm" e="From Period/Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="den_ky" type="Decimal" dataFormatString="#0" allowNulls="false">
      <header v="Đến kỳ/Năm" e="To Period/Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam2" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_sp">
      <header v="Mã sản phẩm" e="Product Code"></header>
      <items style="AutoComplete" controller="Product" reference="ten_sp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_sp%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="so_lsx">
      <header v="Số lệnh sản xuất" e="Manufacturing Order"></header>
      <items style="AutoComplete" controller="MO" reference="dien_giai%l"/>
    </field>
    <field name="dien_giai%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" allowNulls="false">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" reference="ten_dvcs%l" controller="Unit" key="status = '1'" check="1=1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99N4yWuA8PwW2/G+8trXTBewoq4ZepEz9GQlkRc3ImV7yk3WGrFja3KaEVGK8a94ZYA==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_dvcs%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_ytcp">
      <header v="Mã yếu tố" e="Factor Code"></header>
      <items style="Lookup" controller="Factor" reference="ten_yt%l" key="((ma_dvcs = '{$%c[ma_dvcs]}') or (exists(select 1 from options where name = 'm_gt_dvcs' and rtrim(ltrim(val)) = '0'))) and status = '1'" check="((ma_dvcs = '{$%c[ma_dvcs]}') or (exists(select 1 from options where name = 'm_gt_dvcs' and rtrim(ltrim(val)) = '0')))"/>
    </field>
    <field name="ten_yt%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="mau_bc">
      <header v="Mẫu báo cáo" e="Report Form"></header>
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
      <item value="111: [tu_ky].Label, [tu_ky], [nam]"/>
      <item value="111: [den_ky].Label, [den_ky], [nam2]"/>
      <item value="1100100: [ma_sp].Label, [ma_sp], [ten_sp%l]"/>
      <item value="1100100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="1100100: [so_lsx].Label, [so_lsx], [dien_giai%l]"/>
      <item value="1100100: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="110000-: [ma_ytcp].Label, [ma_ytcp]"/>
      <item value="110000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &CostingExternalFilterShowing;
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHai1NL/F43lwMSgr14iP+74KXi5kE6utKDVVixC3CdK+vki0J1Lp5rAu2iaOiveOoWfiTU27KftFQozHWR+Hw1ACYGQjtHtq+9H/+h1muag5SYNJ72RgdTGhJPSvJ/DAfV45z3+fFEHTn10SvNScNi8opexM+9CoaKY/m6JbC24/zGVNW5NjBQ47u63FS3JpHHANbAWZ0k75UCL/+DMXu3YQEOQnpa3jsaPTG3NuqwTFyWuaZyvQi2X7KSo9fydbg==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      &CostingUnitFilterSetReadOnly;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdM3UOpvSWZBBdKWouRu5rKx5zU/IemPobMgthyfNBoZh5V0wbvlx6QAU7VrRjFpihjaTtbhXFxw3OF0vCZNVi3K5RmvRr5npSZvrcKewO3U9wxAr/ijV5lwjqZYE4PwSmoY2l092o7P0Eivt2SkcDqceMct7kpXW9SDubiME1hmuJASmH1xo/6mJzCdX4zq0ryzI9CJ6d8KOXhtD/clmRTxXBhgRkjlAl8O7Jgn2On5vcFjxdBDqnE4ue+jGdYDHbQX2rYvZvcafThYwun/Ts+2TbxBZN3EpOl8C2KYO7EKbdLBgsi2/M1qKIUkZeQKDRzcZndaZ6IfSJ3qvj3MzTNZXbf2S4ILo9F2mrS+uC38gJEqlEy0GtnrTyF8J1FUKhuPI+d70Zcyx+aeizxPzU1S913g5Y+momF4HSD6vwKfWkACGnie79FAJRvvUz6acLcdGwd/ZkIwGHNnGj+CL2RtRHLb+BUuWjGwdKT9rBDQRfmqeDjnLo+2+5i+WkuRIPUS7KIuZ0oT7Ewercj9SNqixn/ZFak4g5f11AuhY0BfMfKkFR6H6OPOVYV5y8GGmUMySfen5r3mi37F49Q/8R0E2+iB5P/WlkCCk9P2c+OWzlN0XgeGrSQ0xE3dNbIdWFfqOXIc2qR8aKxN+xU4kupO+PRAwQnWtj3CMrvnLUgQyp0CoOnZFUKILVlvk9F16Qg+6v0jevtkhJLXBjkI5GHg91t6JqDksWGBGDG1Hito/9El9ml3iacuYsflGxv2peNDSTebudgQoe7ajrn0SWU5vQczYFFknKUDBqBqU2Cw3+0gQrz8chm+ztFd2WD1hk77x9lrmm1uaN18DdinLBAJdvIehjUF8xW8bIdAyDoYg+kN615imFVPWgBrhIvHPuw==</Encrypted>]]>
      &CostingUnitFilter;
    </text>
  </script>

  &CostingUnitFilterRespone;
  &OutlineCss;
</dir>