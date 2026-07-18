<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày lập từ" e="Invoice Date from"></header>
      <footer v="Ngày lập từ/đến" e="Invoice Date from/to"></footer>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày lập đến" e="Date to"></header>
    </field>
    <field name="ngay_yc_tu" type="DateTime" dataFormatString="@datetimeFormat" defaultValue="new Date()">
      <header v="Ngày yêu cầu từ" e="PR Date from"></header>
      <footer v="Ngày yêu cầu từ/đến" e="PR Date from/to"></footer>
    </field>
    <field name="ngay_yc_den" type="DateTime" dataFormatString="@datetimeFormat" defaultValue="new Date()">
      <header v="Ngày yêu cầu đến" e="PR Date to"></header>
    </field>
    <field name="ma_bp">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status ='1'"  check="1 = 1"></items>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_vt">
      <header v="Mã hàng" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status ='1'" check="1 = 1"></items>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true">
      <header v="" e=""></header>
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
          <text v="Theo bộ phận" e="By Department"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 20, 40, 40, 100, 100, 130"/>
      <item value="11001--: [ngay_tu].Description, [ngay_tu], [ngay_den]"/>
      <item value="11001--: [ngay_yc_tu].Description, [ngay_yc_tu], [ngay_yc_den]"/>
      <item value="1100100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="1100100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="110000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDBaaV766j4XqVMPTsxBNLQTkrMbhmDd1bdnSzWA45DRIm45dznU0EMZflx7heSDgk1o5uyJ3xIt6rksqFgAQzlrCRwrOME3AdILL7+CYn2xgFCzwhW8wi9uGa6J7xnnLxmciawsv/2c2ak501dC5uWCx+N8slERxG0Emlgw4cYDVjslmvNE+rtmjrq3eaLLTNaHsLm65jfH+X6Fy/BPeWE=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUpTGGv1w+iiyPFOfxifCL8hdA7B08xnvwG/eJYId7vX6Q/UtDtbKAcuBmWbDHDOsNcdrJCyoT787vbFPUtXnsIFz0/BlNTtfw5PMp63/XpHozXb/i4u5a9S8uAq5d3LJ3uwkwby17wPutWh+oitLfjrlYt3yuW7/ZYcHVePnMxQ9+WORY1K4X3x/Kr3/U3Aq5OsIl86hTFOpjsEoy/rs0Ic7xfpxCw0CdziRw278itDwfQ34B3zI/NhRQnyxulxtvFa9rh50h3Kqe5zKqkdIj7UHYDHxtCGEWrPkRYmszh2OwUEZmvnaLtKHlS9MgTGRJu8FysLjxBQmkr/QZnsyhEm9DRBUj5i4iWp/F9e0RW/ndFDQhO86DQVMIjFFzxPnCHY2dyLDNdzxAWf+LDhztOoRnI+mGJA7bkV2bBRIAofw=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>