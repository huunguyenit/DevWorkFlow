<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tu_ky" type="Decimal" dataFormatString="#0" allowNulls="false" aliasName="fromPeriod" defaultValue="(new Date()).getMonth() + 1;">
      <header v="Từ kỳ" e="From Period"></header>
      <footer v="Từ kỳ/năm" e="From Period/Year"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="den_ky" type="Decimal" dataFormatString="#0" allowNulls="false" aliasName="toPeriod" defaultValue="(new Date()).getMonth() + 1;">
      <header v="Đến kỳ" e="To Period"></header>
      <footer v="Đến kỳ/năm" e="To Period/Year"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="tu_nam" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Từ năm" e="From Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="den_nam" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Đến năm" e="To Year"></header>
      <items style="Numeric"></items>
    </field>

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
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
      <item value="111---: [tu_ky].Description, [tu_ky], [tu_nam]"/>
      <item value="111---: [den_ky].Description, [den_ky], [den_nam]"/>
      <item value="110000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHai1NL/F43lwMSgr14iP+74KXi5kE6utKDVVixC3CdK6ZBEtlDIlF7Ri7WQ4NkcxXNZ1/SNzZXjHVw7XxKxxLj3VdtLj6cJoiOWVDk3BsnW9DYb1n0ozRbhV9fwJWAwjsO/Zc4mina803klPw3qWEGLGaen6FHq8pz1+joA9FuoqgzwOctnuZbalpBKR/qYwQBDXUceBZw+23FwITtzQMM=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUaG0xOv0B+TlH+OdNVwzhzlom/ZibwT1RDo95di5msVHCyPErcrNMbewXznlm6nanMXTap1mWWJVHVnpwfjnBq/7x/vM4w7gmA70hksb9IpkmqNE9FUNBegZVhoV/Qa/E0Y47HZdLrzphzSjwkHImL+jiqeQt9TjRWFGeUHG+OP4c2Ljay3YQfJeOB9Bsgzke6OKh36j8xcP1xzG62wUIty/LpFjFDyfFMD5xJ5jEyv4PdCwgDCPOa302OUs0q2abv/AD3uqF+bnwur8s04lzqLXwJw2Eo+Jr8pzAEPsUsNW4wEXRqgxK7wmKg5mSHtA9B67mR4yfT+uVmxqF2aWBYs0WxAFMamQQ+2boYX1AtPytsVBPIjXlMX6FzK6GntZkiZJLpGKEmJydJTrVPnmr9zZo0eAUZXo4O6r1JFrzuY/3PBzO7g7fPp3gGmsFPcSReFNK9SZk3Ni/lSEDFCUlHD7pQmjkQdY1TS+hnz3oW8RDFm0TMV7l2y9NZ1SnxQRyyO7MP6W129i/L28/sMUxhQ==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>