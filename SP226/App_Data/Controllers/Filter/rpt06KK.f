<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportCircularTypeField SYSTEM "..\Include\XML\ReportCircularTypeField.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="nam" type="Int16" dataFormatString="###0" allowNulls="false">
      <header v="Năm" e="Year"/>
      <items style="Numeric"></items>
    </field>
    <field name="bo_sung" type="Int16" dataFormatString="#0">
      <header v="Lần bổ sung" e="Additional Times"/>
      <items style="Numeric"></items>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1=1"/>
    </field>
    &ReportCircularTypeField;
    <field name="mau_bc" clientDefault="10">
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
    <view id="Dir">
      <item value="120, 40, 60, 100, 100, 130"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="11: [bo_sung].Label, [bo_sung]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [chon_tt].Label, [chon_tt]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcOguPIieDn3C2XlBaZKLpfVD5hCB1ijWNXpwJCYn0Tbrvd1Dt/K4q4k64hsPcxPHiNtsdRK0jZS8gNHNxvv3c7rzxuRIYI8pjC+wdQ493Ea02PgB7H2vd+zEgM4XVczK4EoiupuI7nEE2P3KEi2MGII=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUP/1R22xXsb+HK8z5v0XkAiPOq5AwHj39yjkxWkVx1cxuAMrjUdSRP2fUfSWNNOYHNKxtrCTvkNw3+aM/39lC+YRrJIPk2zkQARzzofGQ9OFzukmAMeN9d+wS6zutstMYnsiHVORmjlY2jwGsIsxwj5R9jCfgRegKJDYBN/KdVpcZ/h6Ca2wHzv7XvZT5HQV/kZPHem38vv9Qhqxj9uhzopdqUF8QKodnDVIziHvDsvb6LwjFGrRoEOHEWImRxejVu84p4J0/sv4dtZotCAYMZCMsc2XPdNim/vHwB2c3LclzMrfGDCl70oNzktOyuz8N+2TFoXcIq4Dh/oXgWQYxKgzsNuyZDlTqu/DeQWppFAuwlR69xTGlDZJyiwLB9Xu09QHdzoas5072uQRBea2AZfoBW2MFvrrjE1LsJvAGEM4uKs0W0AQOLrGl3dezLf/ziZXgvzcy7a37TE/xS+QCWBmnrMMiEz5rJgDebpQxPCw=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>