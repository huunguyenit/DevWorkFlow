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
    <field name="nam" type="Int16" dataFormatString="###0" allowNulls="false">
      <header v ="Năm" e ="Year"/>
      <items style="Numeric"></items>
    </field>
    <field name="bo_sung" type="Decimal" dataFormatString="#0">
      <header v ="Lần bổ sung" e ="Additional Times"/>
      <items style="Numeric"></items>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1 "/>
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
      <item value="110----: [nam].Label, [nam]"/>
      <item value="110----: [bo_sung].Label, [bo_sung]"/>
      <item value="110000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110000-: [chon_tt].Label, [chon_tt]"/>
      <item value="110000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcOguPIieDn3C2XlBaZKLpfVD5hCB1ijWNXpwJCYn0TbryrCvkjejxaMS+IhS4Xxucm4A3TSZDm4o6fb9iGdacAOlxwfaz70Z6jUphZab5IwVv+uQVsGn2WLxkL8bhJ1EevVhPyxLkQ0Eigmj1P5S57o=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUP/1R22xXsb+HK8z5v0XkAiPOq5AwHj39yjkxWkVx1cxuAMrjUdSRP2fUfSWNNOYHNKxtrCTvkNw3+aM/39lC+YRrJIPk2zkQARzzofGQ9OFzukmAMeN9d+wS6zutstMYnsiHVORmjlY2jwGsIsxwjzwUixdJjrd8YZV9bViDX5MsUXCm6Rs4VUKbmfmSbwRJNWzG6e7pyjYCkSV8Fppc6f9oS/pIZ8+aNrCrSpzzuqzdqtf13p2Hw6VAvIZUs9cY4oDPhVnwOjxKwnBter/+eUc0nLu4UpQNcAiuEK1JnPkL3JvkuCiZxd7N+e/ku0p84O1YE8w7uTzXHRkqtv74ZI160GbDDMjbsba1GPopzQ25xNBLO4QB2CY2fdDjZbuK8GUh+yPhs3JW3gHW3MWgCeM8CHSc56+hCOYBG6EH8i3zf0HjPtlFMdpoA7eOHFMbBHhtxEb6BPpzNZbEH48/vnQKfo6BP+TfJrGA2umTG6Ob2PShN0ENADW2RgPwY3i6</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>