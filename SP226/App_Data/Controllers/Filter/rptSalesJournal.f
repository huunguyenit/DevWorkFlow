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
      <item value="111: [ngay1].Description, [ngay1], [ngay2]"/>
      <item value="11: [ngay3].Label, [ngay3]"/>
      <item value="1100: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="1100: [mau_bc].Label, [mau_bc]"/>
      &ReportMarginViewExtend;
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5wA4ZbpVubmb8ubN1cUpNxKzAnJmRTW3jgEr7GXl1+l8wkrylj91XWbxLXsn+Mqs7R0DUzP8tnGIWHLFRPX4qRHiPI3N6/3X1BozCe46K26RpLsGyVzq7/cG4Xfc0pdsl7a64qpK1STh51mb1OJxezm+p7j9MWNZyC7zlHnsgmXjosV/KqI3ZPhWGny71vazdu6uQ/jlsSMq34txJTWFUvRYsVGC8AgHbhcVP4/1VwFEB7yvWQLzupnZSGgQOBJFUCEX+DAizbnfkEKDodEHT7mbwao/YzWqEdj1A05o+5WEfzCFP2/2D8bDgTFqO5s6qqG+weoT/78lvGiLArB4QH49MOe0777qqdF5+1gM0Tq2VhW1jPaWj9tUlmBvTtbrFvtFZxL7XjBicquznh38pl9AuG+CveFKfGJFNkW3YKLh7qDwkOO1jFhAO4L/HxTrPHJtZBjM2NWtu7/oNflrPN9K+lMDaDO1tMUUObyFBakiB0eJ/uCG9WXFfUU+ePNqjuKlvF19eVgThCP98YbmuOrG08PkCdj+bSd4RQTctSODquK3GvQh3hlrBFugj+GZCnpgnfZv+h3KB5+FFyorxSSv5Q/f8NOW+4YDlmjvxqc1F07FuFCXv6ZLbIwmaptXg==</Encrypted>]]>
        &ReferenceParameters;
        &ReportMarginProcessing;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUP/1R22xXsb+HK8z5v0XkAvufLtm2qWW20iLAQ3UGk8C7vUgSALH4ahRS0BWxLovNYdkXI4aH+3yRiAFdATtnwW1NjjzBdHSqWuRFbu8sNZN44vF6m25VY1y6pZfc9FBxH1r4WAuiLGFWKemIOXrL6MziP+qbXU902d1MzE2464tss6TdnlCSN4xCGaxKuWuW8MK87ApZv5TCDu45+JeyWGs62qUcpJ8KVsoFdQPHc77DUrrKN2b+lKnWsXuGxYTZ0+IrPncu42KLGcKmnG+a3di0kQsAcUtHGm1UYS0SfMU2uCHW6vaGrkeMR8lmxm80cMXtHc/ZneHEzxIP+CDjefh95WyDJx74usPi11SjVYvCv5wP1Gutm7+TarhOYcZNeNKCRKDKjxIVj4J8RHb/SM6RW+tAo4Q6VU2nS05bQ/mOjvd5i92ZGsNYgcQNXjoj</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>