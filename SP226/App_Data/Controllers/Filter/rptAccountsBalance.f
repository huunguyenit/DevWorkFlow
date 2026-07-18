<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="loai_ky" dataFormatString="1, 2" clientDefault="2" align="right">
      <header v="Đầu kỳ/cuối kỳ" e="Opening/Closing"/>
      <footer v="1 - Đầu kỳ, 2 - Cuối kỳ" e="1 - Opening, 2 - Closing"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" categoryIndex="1">
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

    <field name="tk_so_cai" type="Boolean" clientDefault="1" categoryIndex="2" hidden="true" readOnly="true">
      <header v="Xem tk số cái" e="View GL Account"></header>
      <items style="CheckBox"></items>
    </field>
    <field name="tk_so_cai_1" dataFormatString="0, 1" clientDefault="0" align="right" categoryIndex="2" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <footer v="0 - Xem tất, 1 - Chỉ xem tk sổ cái" e="0 - All, 1 - GL Account"/>
      <items style="Mask"></items>
    </field>
    <field name="tk" type="Boolean" clientDefault="1" categoryIndex="2">
      <header v="Xem tài khoản" e="Account"></header>
      <items style="CheckBox"></items>
      <clientScript><![CDATA[<Encrypted>&mMIfXbnzBWLp1SyeAv8t6n9a+Subd69PNTCdbLZenTBiJq0DpC4bmv5LtQk+qsxsMU+eFCl7OD+wgrWA2ghO1w==</Encrypted>]]></clientScript>
    </field>
    <field name="tk_1" categoryIndex="2">
      <header v="" e=""></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1">
      </items>
    </field>
    <field name="ten_tk%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="tk_bac" type="Boolean" categoryIndex="2">
      <header v="Xem tk có bậc &lt;=" e="Level &lt;="></header>
      <items style="CheckBox"></items>
      <clientScript><![CDATA[<Encrypted>&mMIfXbnzBWLp1SyeAv8t6n9a+Subd69PNTCdbLZenTBiJq0DpC4bmv5LtQk+qsxsMU+eFCl7OD+wgrWA2ghO1w==</Encrypted>]]></clientScript>
    </field>
    <field name="tk_bac_1" dataFormatString="###" maxLength="3" clientDefault="99" categoryIndex="2">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="xem_tat" type="Boolean" categoryIndex="2">
      <header v="Xem tất" e="All"></header>
      <items style="CheckBox"></items>
      <clientScript><![CDATA[<Encrypted>&mMIfXbnzBWLp1SyeAv8t6n9a+Subd69PNTCdbLZenTBiJq0DpC4bmv5LtQk+qsxsMU+eFCl7OD+wgrWA2ghO1w==</Encrypted>]]></clientScript>
    </field>
    <field name="tk_chi_tiet" type="Boolean" categoryIndex="2">
      <header v="Chỉ xem tài khoản chi tiết" e="Only Detail Account"></header>
      <items style="CheckBox"></items>
      <clientScript><![CDATA[<Encrypted>&mMIfXbnzBWLp1SyeAv8t6n9a+Subd69PNTCdbLZenTBiJq0DpC4bmv5LtQk+qsxsMU+eFCl7OD+wgrWA2ghO1w==</Encrypted>]]></clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir" height="88">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110---: [ngay].Label, [ngay]"/>
      <item value="111000: [loai_ky].Label, [loai_ky], [loai_ky].Description"/>

      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>

      <item value="11001010-: [tk], [tk].Label, [tk_1], [ten_tk%l]"/>
      <item value="110010-11: [tk_bac], [tk_bac].Label, [tk_bac_1], [tk_so_cai], [tk_so_cai_1]"/>
      <item value="--111100-: [xem_tat], [xem_tat].Label, [tk_chi_tiet], [tk_chi_tiet].Label"/>

      <categories>
        <category index="1" columns="120, 20, 80, 100, 100, 130">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="20, 30, 20, 50, 20, 80, 100, 100, 130">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAPMvI3wToS9XrFl/A6NmCkYAuLuNWLaCOo2VdnnF/y/FehKBVKfRAE60ktbgXcuAIWpqGoWZwny9QnH8vF163EpWFTmk4aDI0T5wGrVzKuG709BRmEpCmh5az8u1KQYM6231suyb1tUd+imBY/x/+E+UXy9R2SXJfcHTmRMP07csMPcb8ZiNRptvjcTb5KjezxCKIjjkVmwOqxHq4iRXq4=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtYJpV44RZE9wdWrAZvF+6Is1vwTTh84UxKIodF5nQOB15XdYh5HKmBsT6sWLDyJF6TzF4IWUuhVXl0F5qxYm5KJgqLEnxV/VwxQclHBbC80Mh/6Dgid1d3rUR3TIQjKIE8EN3FRJGlN6BysrX0hSDdCgXSduKg16Yz+/QsEbzfX/p3vYoncjWucEE8NNXqVZMTOlmLtk1D69IxIDSJkMZgWe50IntWT+Fu+wpYjqvLsa7SxiunVwbRIjFkQjTXhACkEi+wDxXuHjI09KkYGXgiYePB1ZbnQyOuOrxhLP6wVSAlwHlNuvj9WaGNlAl1rFVlEssNGpawrRhryMmDaC2I01oLt0EI9X4PlX+Zokyiya14cQreNXU/uqwvvfmcemx7EsGHostPxaywmRCF9t9AD7Ep1ZBZSYpV87PuxCwLO0+VaaS5pFVqVej1rDl/tepUQ4dfXb2biz20G0k6i/C1QJD1GEsO4ulL3+ef/BwD652QGiZQ/n1FQ05IkYSdltpHcsSRIApvwWF2Biuo05hojjKC6tenn04VQS0VOztAS3TqoKwW8WuOl4B2lyHWUEw4VYJnWDePz8xMRewAgZJeZqjfDoXvN9j6vKgZHAl7axS6u1GgvwPbleAI9FhcS8A2syYVUDYHURj7pCGqpjTEkexF1q5zI15M6wkL3CNK3Uyb2S+vo1rC0KlJeN6a5Eb2FVgAvptbXgEuMJF/T+yUcdJI2sDhFcRNC1yl7kvkym8xcAfaD6CgydPUsO2me6/cZBm3FMY/Kt/YkBfC12ZcxBIp3TfANZB0c1jeKD+a+Oigmm0WvSt30DcfsFbFYhApVXvmONEHCE4v0tIQ+3WrnXdrvOkAspwR4xIuLNwS9GwOFATrMacxpIwb67xbTt6MA9NN+vXxO1jXpSeRsh4IpFEuGQZIyr9kGGFd8Yl2k3gCkawUkOdvaFXjdFtmnzzV3GTzQKXdbXuzDjaAFSdHP8WZHa0Nd2qeP/syAP1lQKAzuvFxe83dSOYyrAa9A1rBApuabW3Uh+kXMXNxnH467HyThxKzbPZV3vq38syJ0s</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;

</dir>