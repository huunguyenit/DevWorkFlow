<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportCircularTypeField SYSTEM "..\Include\XML\Circular\A08200\ReportCircularTypeField.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
  <!ENTITY % ReferenceNumber SYSTEM "..\Include\ReferenceNumber.ent">
  %ReferenceNumber;
  <!ENTITY % ReportMargin SYSTEM "..\Include\ReportMargin.ent">
  %ReportMargin;
  <!ENTITY ReportMarginViewValue "1100">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tk" aliasName="defaultGLAccount" allowNulls="false">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" normal="true" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="date_from" type="DateTime" dataFormatString="@datetimeFormat" aliasName="fromDate" defaultValue="new Date()" allowNulls="false">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="date_to" type="DateTime" dataFormatString="@datetimeFormat" aliasName="toDate" defaultValue="new Date()" allowNulls="false">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="date_open" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày mở sổ" e="Date Opened"></header>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" check="status = '1'" key="1 = 1"/>
    </field>

    &ReportCircularTypeField;
    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <clientScript>&OnSelectionOutline;</clientScript>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standar Form"/>
        </item>
        <item value="20">
          <text v="Mẫu ngoại tệ" e="FC Form"/>
        </item>
      </items>
    </field>
    &ReportMarginField;
  </fields>

  <views>
    <view id="Dir" height="64">
      <item value="120, 100, 100, 100, 130"/>
      <item value="11100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="111: [date_from].Description, [date_from], [date_to]"/>
      <item value="11: [date_open].Label, [date_open]"/>
      <item value="1100: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="1100: [chon_tt].Label, [chon_tt]"/>
      <item value="1100: [mau_bc].Label, [mau_bc]"/>
      &ReportMarginViewExtend;
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3ypD6wIWsxei97UUI0egwICDoXVdjNnZW6O5WtuqwUnP+hhLvSRatBqDm1XdKLJUE577ualOfzH43CpOY4We+qTYoT4FPPSTWo6Rx1evJvalzbPgJCjJovLX2OGxnRZpgG17vULDT/33/p4zE8IieIlnbgPvbHZe+apSzwAUMIU7fzZk26foYZprdzs+vIa5Yr2vgyJhrkCURFCy39hoFYQC0wch/xl2DvT9g8wBSKOP1G2hSYRG/zdOQovAd/5lk4HSlIuW6Y5VI4FUdwTSBuYRTwWY6sUdHGqu5LiWomNQZJ6eQ2IYrTS/mLsgCBZPfHf188shwiSx7hqZu3x8DXTkobDJwShnr/VbZ9k8MjcvKEfgIMUCZRe4k7FuRUw5g9k+uTkWLfyVO3LtGcTASokwqGNasR977K76DkfjwXdmB+1DxtIjYCLh9Q+fzVdKKEX7VMGGXoBTl+g2KbUx9M=</Encrypted>]]>
        &ReferenceParameters;
        &ReportMarginProcessing;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdDqS2nZpjMFZD+ajcJqY6S0MraksmenqXt2vjKyhYADTAN8k603T01iM8FyPlNPl1WMI6kgjgjRD/FW1Q3ikp74hXDc5AYeEHfFIXqLn/6rgbi8xt8OFiXh8ydQqiVMp+eSaF1Bf8inkTIgj+nDejuIH9rdF75a9f25K/XIDYB4x8u02Jr0IiHn8b+MOIoQyBSGCT6wiaNY+7Ki4lvKCmEnBsEH164tD16/yHnwaTPTvkNSLW2e3RB1tDBAJOSKvKYgNOokLwqcjixd1lKUeVo2tlon62WK/zKC9t/QlIFPFTLHX4uMohCq81Gi4q08lizApshg/+VAayg5V2DTtN1HnNAlzK4wXZN8XFBKEbujv6sI3hi53ih9aybH3Q1axmmrkXsCCfR4a6HiymD3lP6IqZXc21FVvbmiZdMaJs5WmdwfphRc8DKfoylzGh/WyMr6UWZSMuVs2fF/EIBPt1kq8Gof0PGyrriTHDBb1SGjaaMMjRxHTsR6aiKhbPLe2uCgveg175iEmtylFHIr/S9sQ0pa5Hn1N47oHvxbyIO9Unmog6NNiAofFxpMggr87veYU+lRYFDoUmOZMaYZaBd2yeR6WTppp+ipnok0cCOwWCH0c8RiI2FMVf3b1h50dBKJ/8RECRPTKODE4uEh+tH98Ah8PG2m8rjGRrOYr1q1D++y3Nwn0JdmwnX9mACYApdg+6DUi3rPGaIr6bR+bd6ekEyRsOvjxrEPzPvItu7N9sPZR2DQKGKTnnCdGexIXGOBhO6Rdgq+wBqvFtKiHa/X+o2m6Nsq1UJOkBOyzrZVXRDTR/i13tmSaiattAUWnLrpjQmkOyjBkQg30T8/jOSCURPoPW+uvmqMV6r8ebHwD</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu70QZzsPaDwFs+YifbSouifiyQBkdvDG95EJTEdIt66OvFJinP2Kyzj3jT0QRsptEMoOdMYZ4n2xjB4ZTbHxrFOJ7E2YHZzAwWwiv1Vm+oEYmFMRfmjwsOch1YJG7ACq9tpqQFgz5u6/kAWqF93OoaE=</Encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>