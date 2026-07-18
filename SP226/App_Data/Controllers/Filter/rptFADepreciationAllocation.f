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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHai1NL/F43lwMSgr14iP+74KXi5kE6utKDVVixC3CdK6ZBEtlDIlF7Ri7WQ4NkcxXNZ1/SNzZXjHVw7XxKxxLgPGHTscqCn4TF/FO6YLGd2CwvFxy0SvdupnmnF6at2bxP7bf5luh/Q790fHfmpmN4I+LvQcgapoz/5EHRSsHA6aKj1PRiwC/DnTktruNdoXALqMa4TMpe/5L+JgLqM/YI=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUaG0xOv0B+TlH+OdNVwzhzlom/ZibwT1RDo95di5msVF3Wo1dwH52EKbDwholXi03UJlxI12UQ6j0uiiQMGaCs5vW4HKMcPNJ+8zaR2Svn4+DNBzpjfb9oMVpOfQe56gv3xZm0JnHiFggSiKUoHsAj86YHCltVRFsfjrHilhVRtJACNpOTxLcVMCAB2OzJ4vP1icHJ9/ODXZKgfRzrWNphsFt4mrvcwZH3sPssljB/3ozoj2smkSaKnxCeULM28ql5FuJhr4x4s+CjVsm9ArGG8KuF7/YVaMs5Xp3sXNSI+JrPLWthdvBO4S5bBXWMNf8yXgp7kob7NXWfV/abNCwMOfR1+j49lfiyY7u/5dKYme/76EUeXhlUyqCfJoKBceQI2vhMvxGW4rRWMkb5ZHfpqG7G0oL+AoYzdDljOpJk8NCM1cvAy9QYtDhPJKTqj8Ix39F0VxNnslg7eWVReDprz4Zju/oX4SD2CHc0UW6kCF6BekIVvaKh15WWmgaPZBp/2MsxzcEVoX1rwt1NwjJBwdDb6GU39yOeD1zXyuvUYE=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>