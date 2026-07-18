<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">

  <!ENTITY % CompactMode SYSTEM "..\Include\CompactMode.ent">
  %CompactMode;
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay1" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="ngay2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" categoryIndex="1">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="001">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
        <item value="002">
          <text v="Mẫu ngoại tệ" e="FC Form"/>
        </item>
        &ReportFormAccumulationFields;
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="tk_so_cai" type="Boolean" clientDefault="1" categoryIndex="2" hidden="true" readOnly="true">
      <header v="Xem tk số cái" e="View GL Account"></header>
      <items style="CheckBox"></items>
      <clientScript><![CDATA[<Encrypted>&mMIfXbnzBWLp1SyeAv8t6n9a+Subd69PNTCdbLZenTBiJq0DpC4bmv5LtQk+qsxsMU+eFCl7OD+wgrWA2ghO1w==</Encrypted>]]></clientScript>
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
      <item value="120, 20, 80, 100, 100, 130, 0"/>
      <item value="1101---: [ngay1].Description, [ngay1], [ngay2]"/>

      <item value="11000--: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000--: [mau_bc].Label, [mau_bc]"/>

      <item value="110010100: [tk], [tk].Label, [tk_1], [ten_tk%l]"/>
      <item value="110010-11: [tk_bac], [tk_bac].Label, [tk_bac_1], [tk_so_cai], [tk_so_cai_1]"/>
      <item value="--111100-: [xem_tat], [xem_tat].Label, [tk_chi_tiet], [tk_chi_tiet].Label"/>

      <categories>
        <category index="1" columns="120, 20, 80, 100, 100, 130, 0">
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuzde2kthMF590dkc+XNNEu2Zh8Tpl2RiE9tET/qz6KCNgUqLrukNulleWWt6MjwxWVl0732BLUC7PMnA0xSGgOPzJRVGz78r+Z/DvPW6iMzwrqr+JTgq5HExE6bHropbATB0GE6p9LcsfLfNfD5O2eS83NfLVewbrk8Ikrioj8ywTH1hoWlrPFo9zWtpeu/hWqepsgWEZFdtTr4ubJvFKdyjHa0xvdiJARy4b5VuWT7xH6ondVn9Pxd6ZFTj9t1x56UnJbu0caJSAJpGnXUOI8W6vaVaOyQsfxXoOGSyJaIWhaAeqQK17LPAFS562gB1RenhBpkcMmfqXkke+fr3NCqtJ7rPAkghJH+y0+UZDu37gsLglb1/B/s1V6YPz2lpGYRaUgKKHRXrxxcPo6rIkku7N3rMC5feKAyc8A7+JzDYeLCktNopA+oFkRhD7AoHVWC01gnviQ+WdJZnII00/2FhYCv2RBKS/W0L5WRKfs4g3g7ldSXz/am0GVmZ7hrkKTOYtFqnbP4bUV8rrdnNDux2fz4HIq8n2hoJ7jPwYqsX9sWAcspR8JxAmnLZAX1+px6zGlhi0B7D3TOOnf7em8oPGINROKTT/wkBudWmdC3cfOXzBt8TET+G5JYJa56fhQ==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtYJpV44RZE9wdWrAZvF+6Is1vwTTh84UxKIodF5nQOB15XdYh5HKmBsT6sWLDyJF6TzF4IWUuhVXl0F5qxYm5KJgqLEnxV/VwxQclHBbC80Mh/6Dgid1d3rUR3TIQjKIE8EN3FRJGlN6BysrX0hSDdCgXSduKg16Yz+/QsEbzfX/p3vYoncjWucEE8NNXqVZMTOlmLtk1D69IxIDSJkMZgWe50IntWT+Fu+wpYjqvLsa7SxiunVwbRIjFkQjTXhACkEi+wDxXuHjI09KkYGXgiYePB1ZbnQyOuOrxhLP6wVSAlwHlNuvj9WaGNlAl1rFVlEssNGpawrRhryMmDaC2I01oLt0EI9X4PlX+Zokyiya14cQreNXU/uqwvvfmcemx7EsGHostPxaywmRCF9t9AD7Ep1ZBZSYpV87PuxCwLO0c3itcjHqi5VzV9M+ZTPRhV3uhOo5ZyAwd+Ch8MnNs2I3nSMQpNJ9kbuyPwzqzKg3KWPcpf9TlNaI2dVysa6vvTvpEPYT3HZcZe/gkGd2Pffcnt6jEqcTOycQzLVsLhs9lXeo41ZCo/sxE8PA0DYGIVoa3WwOYb/hhc1gSjpvRHoI2tIn4EBHNjUpPI5HS89UkilCJRC2GHRPchfhz/18gp1eisJfLN6oYc15mH4Q6FU5y+6ucwFdxzNMhxuDH5uqW8FgldWGolYl5RGsAl5hDgBdTgQ/ZlVX4YYEBGfeygpoINzMqBM1u/6QbPmeYapSgD+l62PiYTjVafIFBqcJVD4P2s6KVNcpvezc4ztRLHaYkJx5OpJ7cLCil9e6020rT+NEg4oP7rkU0Yq487aH7P8tWIzxnAnQP+yRcSVk8m/cM1gUO6zx3v/DlKtzKs7kNolOT1bzk6wGtg4LdS4ATsOWFxv0X/kNx/TnEVLB7p2Fv8yqphAQ0TkTynmP+d+tbLSp/1j/CrjJIcZeaO1fmrH6n3CUqeYuFIgMIenwTHosKgNZuuL34jfgx685ntjwwghOUrBInWSk7pmeIVg5GAmbRcMTGiJy8bQ0/IgLO25OtxP2WNZY9iGCsm7XuvI6WoSuPxJFHxOwB1Du7yXZwDPgKXV07Lsr0erL7wN3FncX9C/Dk01qLQRb1HKL3FhXy95R3ZjzXnLEP3lJkGF0m4533om22mTUMIn2xeiMOujTbTieSVoo0EmjWy9Vy5MiXzezi9d3zEmLfOjC0P29NUXgyxQrgSpDizIW59er4qmvhsAHGcmQWt6bsXZO+VWFEJiVuGDbeJvcmYyKTBjVwxRzL41+8ABh9FRZENHeBqTHofqDBzLj7MS9GkkSmazhgQx2MwONUfUeaTcSll5H3duA9U+fT3OA4ESngR4ZVBH6Mc2nldWyh6WBxiL1gR2kV9VNujv+wm0muvHfWqzIrX4BICSy/Jn6NFistpZXVCI=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>