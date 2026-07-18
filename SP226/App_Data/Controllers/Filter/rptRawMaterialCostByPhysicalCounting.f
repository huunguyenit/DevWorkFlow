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
    <field name="ky" type="Decimal" dataFormatString="#0" allowNulls="false">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Năm" e="Year"></header>
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
    <field name="ma_vt">
      <header v="Mã vật tư" e="Item Code"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true">
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
      <item value="120, 40, 60, 200, 130"/>
      <item value="11: [ky].Label, [ky]"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="11010: [ma_sp].Label, [ma_sp], [ten_sp%l]"/>
      <item value="11010: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="11010: [so_lsx].Label, [so_lsx], [dien_giai%l]"/>
      <item value="11010: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="11010: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="1100: [ma_ytcp].Label, [ma_ytcp]"/>
      <item value="1100: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &CostingExternalFilterShowing;
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHai1NL/F43lwMSgr14iP+41Uo1idtrwSmh1DF6GuMxhV6Jhc4OHDkFBlQbLEGJsZtGsYw2xboaTOZUDyl8b6UMQY5IcIAcHmM4DclGTsoUTxtYkb2cgFFeewaB6YQx1qQMcvbRhkVW8WDl0YTCUG80k3qsk50N1HQNLNDCbX8BvvDGd9SZwCa6+FQFQJ9REriFPu/okJDr1xhIRlTeRePY=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      &CostingUnitFilterSetReadOnly;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdM3UOpvSWZBBdKWouRu5rKx5zU/IemPobMgthyfNBoZh5V0wbvlx6QAU7VrRjFpihpijoRMcEB1wWtaxqzLvbt4Cv4BKtOjpHUYA+yddw5iZ5E27KqrtDTQYsG43f9RCQjIzXTE1eBKeKnSMj8w2nSNuScZzZOKKJ50GxJvDbjjtTUsZoiYqQnw2QJ++m6jPuKmSIW5F66gDrXmgZjnYT1Ktntu2AiNWA/wvaMOVy0JWiOxbQ3W6zxmRAmVpoy+C07pIPBznyTrUQh6hxOmuamI546SfFfSXz7bj+oeCyBYQIyNXuMIC8HViYxVHism2HGC+tjwNVjHQBJ0K/lmKtTsWb3hmq1K7/d9bYRUaIIs8p/QUw6yIxhDd/+vVj+Z+qfl+0XQI1sZd719l56sz6ZqDzY5C/+9FX3QzrYQse03cMb6U11G8gOGOaoR1PNd/dzRGHa4dQnR9B4PycjV391NeHELohSMC6Zy8XmO4W6rItwyF+g8iHlDSB9pQ6feTAOie/LsQo6CNRGOQMQRqPO89G9EeWOsOglGLuTxTdMd+56HCDx/3vbUADDsHBpsgC581l1fEduAM4onrl+VZHPBEjTLdTRcgU8a5WXTRtHTawnC1U+1BSWLE1E2ez1BkGeXHJNIQMrdDsz3BNBZDQKPTmbGazy61+xF+r/MjkP0HrcwYLLcHH7KcIm9uwGVhMD/wKsGjbxE3NiqVtAkyhHw4c5yJmyNe1xC19q9f1mIeiey1jwcqe/urlLZSfvA84yK1LxwgDnmv+/o+gGjYg8OAhWEicBHEKCGwwH4ZbT5V</Encrypted>]]>
      &CostingUnitFilter;
    </text>
  </script>

  &CostingUnitFilterRespone;
  &OutlineCss;
</dir>