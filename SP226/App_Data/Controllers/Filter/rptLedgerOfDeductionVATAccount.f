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
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tk" allowNulls="false" aliasName="defaultARAccount">
      <header v="Tài khoản" e="Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" normal="true" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày từ" e="Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày đến" e="Date to"></header>
    </field>
    <field name="ngay3" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày mở sổ" e="Date Opened"></header>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" clientDefault="10">
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
    &ReportMarginField;
    <field name="ma_nt" width="0" hidden="true" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="1101-1: [tu_ngay].Description, [tu_ngay], [den_ngay], [ma_nt]"/>
      <item value="110---: [ngay3].Label, [ngay3]"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
      &ReportMarginView;
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4PhtDWYRR8zKDjYZlS1SzGxW5xBGU6rJmn4j+Xpie7ANDnHo3pKtQ8LByLBKUBzbVdwkOgIiklmVYvlCUHz0Yhkk4aqRUKmekfYb2zsmZb2cHbsxTLZm47gp0b+qRWJb8VmVkgqAm4zo1SMQEIG2SGe1veGkflEJdknrZwg93rn97lVazekzje4PCQ5a6ZeIHSWrLvgSGUFrPtM1SHGpM4HdK0dFnx7EWoenoxMu2os+l5mYuVQSeglFS1j/9T7ipeN+KcNRpxEJB4SSyr32z/zRBjlg0O6gloUxIfKq5z9UMu3aU3RD1ZN1oMfRgYjmUCJm1+TGRmfq28ep+wuyjI3QYqs0kkSDSeH+rsJvfZYGOHb+jYwf8/6d0bSFEqOrfOhhsvFgwOHB5Pbzq33gKc=</Encrypted>]]>&ReferenceParameters;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcJcIsYxnRxr7BkxN/g0BGshNlfdEPe3ERlHcCUu/lBt0UBQwSfFRm8fiwMlJADBlvT+dMEORrMSfKDKXL83FEuwdi9b0cGy6RayHi5jQLEb7</Encrypted>]]>
        &ReportMarginProcessing;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcU5d5UltcR8bTbfrnO2d1KzovGjX8PqAdTr/BMqZOmhD21/kcC4L+SaJqqrhB5BWWvZL9ud38/F4FoVNsFtwoIezr32qRPjDQRKQrSED5B5LRArmmpR2w3sq5UuPB9oMZneENkg7TXILsfSBC8F/Tq5xHSdIVqHm4mK6TKwSELcsWUb1MZDuAm25ImSr940b1og6/KVO5gNXmFNGJ/cltkC6j7ZbrkfXpFzr8vpGZO56KSbWPcezMZlxm2Q/KWRuepsBiNUvIlBwIqgTWvcdNV2uUABB1lGb/Nl2TrG1E0JPfhmTr/HYj8GB8t1VdDCZZzVuMQ+M7Bo8aCMQGCWCPm1XpdvfY+fTCRH05F+tdF3SxAQZMCEkAaoPmEee4OAKZtamdWfsAfgShuVqGJFZSkOoeKoS+i8bs3ivJmEaXG+Y9dB/Wxu43BaLrE3TsqPpqHb/GZ1FAiP+H1tHWLxDOOBPzzAWXXLPeEDchcZwDFmLmKRQOuwBiTbJIpyZh7AGardYP8JiCW01U82vnXWBuLYtxTQO6cGtRvzBXz7/tzsbpQwTB3nfKWkwQwQj5yY5dAbUTLXHIKfv+rr6h+sPmKLOJx0rjsyZ3ROqCKo2Bb7UdnvvFovPMsmQJwqCxI45pmHHqgv7kpEXstvq4nwvXUo6EqN6hnVpIhKNO5Dnf9kBi+rTrmRLYzfxEOdzcLbMCpdbwc5L998KTGlqlzKhxzf+R1sxo6gb78KmreKGSvhkALIELZkboA/jJoiVcvNCfrCLO67l3flpJ+zpw//C9c7g==</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu70QZzsPaDwFs+YifbSouifZ+Z8xb2vrymO7L8l1iONMshIBb8irW1YDA7cu+DB6uq+uKR3SbL3QJRD7izevqdf1czoA4Ajy7NWcvncm4nrkWZJrNGNVGf+o/1+HHbJ7FA8YcoVPZGWLwp15gLWgfxF0HGng+tWvmZfouZIT1Ahy</Encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>