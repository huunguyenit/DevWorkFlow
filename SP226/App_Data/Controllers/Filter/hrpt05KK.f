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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcOguPIieDn3C2XlBaZKLpfVD5hCB1ijWNXpwJCYn0Tbrbzur1iZUQgjfvg8qwKbYvX6UH3YL9vQbU34ccd1GnOupV0WdMqdIMDPhTz0pN6yAZzV7vlWYQrMBS1SoBynuzaYCdx6JRHIN5yLeH/Cf3wShTnQVjuME7dq/HQlUHSjo</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdGNkHV5ZGnyzuPmat1lM/R7GYbFT8gV//NRBlfK/VHvK3u61G9X2E5UhpO0CV5jS9UARBL7f6GaFA5p9IL6CTjRB8CQo8tBdkqBkeGW/FXn3WgPzBGhdhViYECsww1zwsTfmcpuhD2HBGNWY1UQYG2ijz3l61A7dPjo9j47c13GfEGQQgUu7nGjWlCitsq0Er9unGKamExMR67O338jNqqJuS5qOtVYFnnd0jenF2VRAnMlbhKfGZDnUA9dB5JZFuTKLAIMqwlOcl9SrCdqtAT1ykSJa2aYIWvl4C5CNllBJ1afwfN0krOO5xauLUiGu6Cw1VXgxHIAqi0zSZwmgReGJ8raey44eEw8ANheESnjm//9wP1ojCU6N8FdDzqvZ6C49tki96ph6QPmWXU5k6tSgxbSfXA55mEHeduuOp/rLvn7yllrYGvkFgLKfgE7DTu1l1bUMJi+Xj0baqeSax0mlIHa3wY9J1MUyBQqdykV2shmE2eg02+lss/67Ry15Ye1zi9QbWMIwe9wRRLd4K0IHaH1ktDfq25yWfDKJ9li7</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>