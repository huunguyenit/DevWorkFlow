<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY Control ",@$control = '1000'">
  <!ENTITY CostingUnitFilterShowing SYSTEM "..\Include\Command\CostingUnitFilterShowing.txt">
  <!ENTITY CostingUnitFilter SYSTEM "..\Include\Javascript\CostingUnitFilter.txt">
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
    <field name="ten_sp%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="so_lsx">
      <header v="Số lệnh sản xuất" e="Manufacturing Order"></header>
      <items style="AutoComplete" controller="MO" reference="dien_giai%l"/>
    </field>
    <field name="dien_giai%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_vt">
      <header v="Mã vật tư" e="Item Code"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vt%l" external="true" readOnly="true">
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
    <field name="ten_yt%l" external="true" readOnly="true">
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
    &CostingUnitFilterShowing;
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHai1NL/F43lwMSgr14iP+41Uo1idtrwSmh1DF6GuMxhV6Jhc4OHDkFBlQbLEGJsZtGsYw2xboaTOZUDyl8b6UMwss120VjMqvf798Gne5FSqfo/9fwU/dp8JHhXO0rQVww5xXOTPEK7y56GDWz4wU6z76G/edlk02UXrnOoZpKehQkaUZrgOsmOUdqqX2+CBqPCM1yi5a3X4kkhrh3MFG0=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdM3UOpvSWZBBdKWouRu5rKx5zU/IemPobMgthyfNBoZh5V0wbvlx6QAU7VrRjFpihpijoRMcEB1wWtaxqzLvbt4Cv4BKtOjpHUYA+yddw5iZCKTGH6lhxxZWerpznuEGHoxNlayh29csIptv7EzSoHHdD7IlvE6eDv1LZtW1YC4kip4XQB6h+aXolQIS0Yzsda0IgryIpo7e+Kq/84R7t5l9KW/wj6q4ljIyyCWLmTTO3loeLxjrW7ka9m+BMlcQxvRBgIoJSLUaneLLIw/uj3dlJSAxV8XpCQ47zvqeTpA9ATaXOLo4IojbWVP55rar82xUVYw8sbSPkxlmmaxxxnh7/TNr0qEEfzVqptYCnPOl3aCyneFa1mOWCpS0kb09My3+cnG8wlaF2dA1ut1uUGIguo1Hsk8UYV6sNi/fRFqPHwbR2V2xhMu/CIcfDIdPuD/nYRjEv2n8QM/caXyJ5+Z85clVkS0EO1M44z2mP5ht3ZZK+RA98R28IRiMLXMrlqQ4S3nU/zgubdbO4NBOdiCVi2u00ep4RPjanPNxr2F5ug9Jw6Z+uloOlrXuJSVkfgyJaFqj+IZpjPchC6oxf/txDiYr3N3gI6s62VIzcFyVNmJ7ROT3TabTzjEJd6NOUw==</Encrypted>]]>
      &CostingUnitFilter;
    </text>
  </script>

  &OutlineCss;
</dir>