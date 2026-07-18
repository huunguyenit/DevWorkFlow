<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportCircularTypeField SYSTEM "..\Include\XML\Circular\A0592\ReportCircularTypeField.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>

  <fields>
    <field name="thang" type="Int16" dataFormatString="#0">
      <header v ="Tháng" e ="Month"/>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PdsIcPP2rG4l3ZaCtXNtL8+Q9Q4sfazKIbKVREcNP7wNjZJEBsGcMebog9WGkcF+Q==</Encrypted>]]></clientScript>
    </field>
    <field name="quy" dataFormatString="0, 1, 2, 3, 4" clientDefault="Default" defaultValue="0" align="right" maxLength="1">
      <header v="Quý" e="Quarter"></header>
      <items style="Mask"></items>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PdsIcPP2rG4l3ZaCtXNtL8+Q9Q4sfazKIbKVREcNP7wNjZJEBsGcMebog9WGkcF+Q==</Encrypted>]]></clientScript>
    </field>
    <field name="nam" type="Int16" dataFormatString="###0" allowNulls="false">
      <header v ="Năm" e ="Year"/>
      <items style="Numeric"></items>
    </field>
    <field name="bo_sung" type="Decimal" dataFormatString="#0">
      <header v ="Lần bổ sung" e ="Additional Times"/>
      <items style="Numeric"></items>
    </field>
    <field name="ma_bp" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
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
    &ReportCircularTypeField;
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 10, 60, 100, 100, 130"/>
      <item value="110----: [thang].Label, [thang]"/>
      <item value="110----: [quy].Label, [quy]"/>
      <item value="110----: [nam].Label, [nam]"/>
      <item value="110----: [bo_sung].Label, [bo_sung]"/>
      <item value="1100100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110000-: [chon_tt].Label, [chon_tt]"/>
      <item value="110000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuwjXXrHxQs0xmoQxEepoyvv9Uk20zNrr/QvoGdQtxljcaY1K0kxV9GWqW1t3L4PSG+Bv79zUJyUebEmcJkurm7lgbqcDpXdEVWxdoFaM3ySimYMb25Q1mvfsjqdY8pe5W+HUpJbvs0WMZNAeHtb0MN8ys0peV8Juyid4KzD8f68Hi4NQ0MoKAj4vawk61+ZCTehz4d7wMuQs1O0kodF1tvIlIAXBhjF9kLaN2OTOTY8PB3WYHuQ6EtkaDXRlm6C7T9wfJugtSdQZpbKEdFGVDpDffvoqM/EUXbUMYfCeEask</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2Eas5AOj3BMluOxZoC8msUkDov1cHj5PI6sEEw0XuZcC/587zZrg4TgM5lFxW5FHe8QnWHLYg2Bqj0kEQZKAVsQssyEeLvGBV0XpgPUm2BpMLXuti4oUfZrYsSzPlRw8jHEnE4X57XoG3Nj3JeoM91oobB61J1rVWZTk0s/ynb+RHRv/m2v121UgtEHqwB9hhh5qlodTub0ywwytqRWkXjRHbYIuPQ58syMJyviROud5NWze7703YvvtX6Ir1fwE4FTUYOlOgdTAJmHMrz9sULa7dL/kN9xynOkb8x665IRHgqJp05Koumbl+IDDTGYxQcw/HzI8t3gwjLExHEeZ6pM9ahcUFEeEUMMDlDAQskh5Q</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdM3UOpvSWZBBdKWouRu5rKyrIQTMT7Slu0ZC6B9TlF6yVciIbdAaw+M/G0iTBt8u1k53cwpOImEDGAWvns1KVzZHHisFFyr/HKoN+NuqflbDEiPmsrZ68SvvFjcqf34+2KvwlGukEZzUyndBCrp8H4Y27VgL5IaS/XsJOOjkxixqd+nAL0HJREqD8IX4fwWmEAZiuaikW8SgFpXrmvhduHcELY5auzb7y4pTR2oYGQYuLYgvRzRpfHL3pKZqusl4QIjJatVDjdFoT6GuqYxoavi6m7Du3X49ZAFCg9fweIycnGuwOB70SlFTKxevcs2uvR9tm6tq11qJsO9uxC6xjlSaWFEYRLIKvudxSrEN66gLKMZa/QQbtB2XqA4F21+RkdhMVqZot45EMu28uQWt7PQZ/kuhMiDeaBXslnzvC+9sUhAMx5UvM9Wy0EkLG7rCVqWydlkeg0I38Lxhf6oqgG7U2B7iXe5ROvpZn+uwJ4tk6UoVOJnCHU1hgxuUO5JTkIJg/Q+nC/d/ZoGADGRr/5uHqBD7vExfK63JdZmdcP4fQ09bo6/RSjyLSSyvRpdWZsgJu6FScSoZziszFtVHbtsmyb/iVled2rg/efGZOi6VD3xhuQUl2uRso9fVM2RjcqtqhrzjWNqlTCDFc2/tyEuvQMn00Cmm8iTOUdIlOuYJCM/dN5+koj0e/Ql3Hi7tDmy3fdXTDX0m+XF8ez+D34W6nRcetpbvWOkUchpwE9DRT18tGzKW5INDm92NaYqiPA==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>