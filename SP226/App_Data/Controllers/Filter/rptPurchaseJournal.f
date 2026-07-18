<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
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
    <field name="ngay1" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="ngay2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="ngay3" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày mở sổ" e="Date Opened"></header>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <clientScript>&OnSelectionOutline;</clientScript>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
        <item value="20">
          <text v="Mẫu ngoại tệ" e="FC Form"/>
        </item>
      </items>
    </field>
    &ReportMarginField;
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 100, 100, 130"/>
      <item value="111--: [ngay1].Description, [ngay1], [ngay2]"/>
      <item value="11---: [ngay3].Label, [ngay3]"/>
      <item value="1100-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="1100-: [mau_bc].Label, [mau_bc]"/>
      &ReportMarginViewExtend;
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5wA4ZbpVubmb8ubN1cUpNxKzAnJmRTW3jgEr7GXl1+lVIUhSGlDAEY+93/OSpbVjHiv4zGKXAOTuRAOKUyZP5KKhg31iIOUDFoqeEid4fQZBjyRLBDR3VIx3XYLifh/l+Lc/BdMPv/b1NsF/ASw6YDLV54LMwLJARIYDMkm/RzK8xWZmNbWwDs7w/VkDqMU3X/BfzaxUzQSVkX87roVD3m1YGTgf3dVMo60fLe73OE1q9SBuoat7GIKZDjdSOAIJbPtQ87WgI0x72pC3nrevsJLXbxcRfgbVWNUrWB2JR21jwApXtXeG8f119L1CVBMS1uDvbGsVxGL4IsiyrdBQfwwoS0FVB+3ZbeOTa0yC1e52hc7VcHdg0aHawPxncSiKmHJoFFgPgrG+UwKGj3k/x831pfpgKDK48lKveHb5gjoj8OGqOStAEH+AwKDhdNTf4rljZUuW1lt2btD/HTzsmo6OwkLx3sMRO+8fDEiEZQmr9HiOR/9Q4rFaXADVqjVSA/gtdz1zlAKRPhUGJrwOTWbsJDadto8f3wBhCl58TAeGgG2R2VI927BEHZrhPPo06h1svTAH/CkHmZfML12OzBJ/3/iOc/RYW6Zdx5L+7r0BkYR04bq4qK6sZtaE9Kbzg==</Encrypted>]]>
        &ReferenceParameters;
        &ReportMarginProcessing;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUP/1R22xXsb+HK8z5v0XkAvufLtm2qWW20iLAQ3UGk8C7vUgSALH4ahRS0BWxLovNYdkXI4aH+3yRiAFdATtnwW1NjjzBdHSqWuRFbu8sNZN44vF6m25VY1y6pZfc9FBxH1r4WAuiLGFWKemIOXrL6MziP+qbXU902d1MzE2464tss6TdnlCSN4xCGaxKuWuW8MK87ApZv5TCDu45+JeyWGs62qUcpJ8KVsoFdQPHc77DUrrKN2b+lKnWsXuGxYTZzKzoKWww0R9A5QJdI+9MKXKE6k0DlSL4HazXkeYdbAcOOt/GalalodBePPEVWbo5rgW61RbMrpjkX31bu+MZixABbBEVIL3DncAOG8ZTd2xZ6oDk9ofi83I6N78qL9vRoOLCxPk/k+PdcjORHeii2bpMY2cpiBuusncCVQ5Ho0dnqAkPOrAq7B5h2Me60bW8</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>