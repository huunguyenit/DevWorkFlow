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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5wA4ZbpVubmb8ubN1cUpNxKzAnJmRTW3jgEr7GXl1+lVIUhSGlDAEY+93/OSpbVjHiv4zGKXAOTuRAOKUyZP5JqM46qoifLVqnuxff3KG1qzaw6auI82+kngka/rVesdJcspkl2qGTJYlCrVHW8xXBsck55acmaVbm7R/mv/oX4WsF9ha5yEw8PsuTzKUn9/0QWKejSxqvMp5oIjc2V7GeCmykpwCYsB2uANvKNqiRHfCzogbKofJAE5NqqQLO8dLVJ9WtzXDPuaan6CYCHCHlEOIAyH8xj0MHd+EMso1EvpJW1JyX6hTQfsGe9YLUKn1FWmEQkmMQgBnsZIpJkla4TVysZJwlPbCkz+W0G7d5wxGZb0WH2eLSavc242IRbCsuBPrM6f6QJNtwANWGU8HuVdPJhUl+Fsa2WldSzrY6DmUj8MdOju5ZajhwFgFDB/XZSFSQja8BAW119n2ljiroAw8Kx0qQI9ODopcj4fagk3e0fINu6T7C45S3r3NVPihD7vN/5nACcMQTP8U5aEogQgarhvBBj3twj37SgW47a1mJg5uthmRmt5UKDoGDXMO59rFX8jaAkNUmy2lDl9ijMLXidPjc7zOqcBC6iw09eXQ2bviVk+uzcig1XcyqN7F7YyxcNLMX8yksOfWs7w0k8Qhs7AJozGiBA3Z6gVB1ecq/Q0z1BVNOsIlLBH407n7qD/oypNEpMu6hDMecRCW0=</Encrypted>]]>
        &ReferenceParameters;
        &ReportMarginProcessing;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUP/1R22xXsb+HK8z5v0XkAvufLtm2qWW20iLAQ3UGk8C7vUgSALH4ahRS0BWxLovNYdkXI4aH+3yRiAFdATtnwW1NjjzBdHSqWuRFbu8sNZN44vF6m25VY1y6pZfc9FBxH1r4WAuiLGFWKemIOXrL6MziP+qbXU902d1MzE2464tss6TdnlCSN4xCGaxKuWuW8MK87ApZv5TCDu45+JeyWGs62qUcpJ8KVsoFdQPHc77DUrrKN2b+lKnWsXuGxYTZTq2dbvuzC6ONwiNNRyAvOD+ktp5Ud7w2Xq3eCE7946bGMpTlmC+v5/+3YqWEa/CZj6TO7omXsl6Lz/HD6Pt80PnCu8GlFImwy0z1HE7ueZqoguymBQ3kiDa+1pwGbNl/pyBc9/pKens8hURsaLlY07LytLGAZ95WfuQfpt6OfVlw7AKRNZFCMOKVsMelrt3Z</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>