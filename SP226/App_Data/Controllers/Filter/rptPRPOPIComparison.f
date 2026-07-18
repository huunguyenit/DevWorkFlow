<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Controller "rptPRPOPIComparison">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY GetReportFormLimitRight SYSTEM "..\Include\Command\GetReportFormLimitRight.txt">
  <!ENTITY SetReportFormLimitRight SYSTEM "..\Include\Javascript\SetReportFormLimitRight.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="0" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày yêu cầu từ" e="PR Date from"></header>
      <footer v="Ngày yêu cầu từ/đến" e="PR Date from/to"></footer>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày yêu cầu đến" e="PR Date to"></header>
    </field>
    <field name="po_ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày đơn hàng từ" e="PO Date from"></header>
      <footer v="Ngày đơn hàng từ/đến" e="PO Date from/to"></footer>
    </field>
    <field name="po_ngay_den" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày đơn hàng đến" e="PO Date to"></header>
    </field>
    <field name="so_nc1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Nhu cầu từ số" e="PR No. from"></header>
      <footer v="Số nhu cầu từ/đến" e="PR No. from/to"></footer>
      <items style="Mask"></items>
    </field>
    <field name="so_nc2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Nhu cầu đến số" e="PR No. to"></header>
      <items style="Mask"></items>
    </field>
    <field name="ma_bp">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_vt">
      <header v="Mã hàng" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="status" clientDefault="*">
      <header v="Trạng thái nhu cầu" e="PR Status"/>
      <items style="DropDownList">
        <item value="*">
          <text v="Tất cả" e="All"/>
        </item>
        <item value="0">
          <text v="Lập chứng từ" e="No Action"/>
        </item>
        <item value="1">
          <text v="Chờ duyệt" e="Open"/>
        </item>
        <item value="2">
          <text v="Đã duyệt" e="Approved"/>
        </item>
        <item value="3">
          <text v="Đã đặt hàng" e="Ordered"/>
        </item>
        <item value="4">
          <text v="Hoàn thành" e="Completed"/>
        </item>
        <item value="5">
          <text v="Đóng" e="Closed"/>
        </item>
        <item value="9">
          <text v="Đang duyệt" e="Pending"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" clientDefault="20">
      <header v="Mẫu báo cáo" e="Report Form"/>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu in chỉ có số lượng" e="Quantity Form"/>
        </item>
        <item value="20">
          <text v="Mẫu in số lượng và giá trị" e="Quantity and Values Form"/>
        </item>
        <item value="30">
          <text v="Mẫu in số lượng và giá trị ngoại tệ" e="Quantity and FC Values Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="maxLength" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
    <field name="ma_gd">
      <header	v="Ds mã giao dịch" e="Transaction Code List"/>
    </field>
    <field name="ds_ma_ct" hidden="true" readOnly="true" clientDefault="PR1">
      <header v="" e=""/>
    </field>

  </fields>

  <views>
    <view id="Dir" height="210">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="1101: [ngay_tu].Description, [ngay_tu], [ngay_den]"/>
      <item value="1101: [po_ngay_tu].Description, [po_ngay_tu], [po_ngay_den]"/>
      <item value="1101--1: [so_nc1].Description, [so_nc1], [so_nc2], [maxLength]"/>

      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>

      <item value="11000: [status].Label, [status]"/>
      <item value="11000-1: [ma_gd].Label, [ma_gd], [ds_ma_ct]"/>

      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvnZPRiKEfPKjxHBmJnvU1lVtlo+1Oh7odASSFZnsPBg9Zo+rjYXqzXYFeMYQpMONV0=</Encrypted>]]>&GetReportFormLimitRight;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcM0GUti1kCp50u/Joaj4mLrRFBFrkg61EVyh0XGpA19zx05m0tH1OgdPSKya+jhQB92mZjn9Ot4aMXMuRM9wUx/xclTHT0ytQP5YzsDNDeJ2</Encrypted>]]>
      </text>
    </command>
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuy83kk4airzT8cLd6DkoBHtxpkio3Km+gBGcXj28Z+ONYnXT6h2mi7eVK+uWGO4i7lPLrQY4mOjf6CeESG+OEy2zaFDbcogB151WuzUquJFwBEYZX6YpFxm4x4kIRgAtYj5KhoPBEi49fCgQ6w9VQyZfLhwVkOnoUxBfdY6vesW6se5aZeR69Vxdtqi4uTsKMD03D0bDEGZcsIpEFPsJqkdbNN7P+WySpq2KMyHDC0T8ZkyAf/ddh5tBEth2KyG8TCR9D1xxTEeJi1DEdo+aYes=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFKFyn5nqtVBL8WX4eo6H2kabgBcKsgcm4iH2SLI2Ez1+</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      &SetReportFormLimitRight;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcU5d5UltcR8bTbfrnO2d1Kzii3p6ehknKjvfgm+r4/7v1XRkAvKFtXYzDayytSRCUOK9Bbng5Qb7HvljPsV0n9uqFXSP/B3KFIvlHs9M5borANgDtMIqFSpKSN9YI+FCdLX0TzVjkmJv9cwsS+0u+mBws25bwDkkhxD9shRO164WfbZUojNbNDgVhSNXZAt4h2pVAXWaETouuoEbN9EdEjZRLQHCCeb4tfRICaxcKssTuCQm4vUmwTM/PwicV1E3eDsXIG3mITmttvzAnhiLbBa+81xA6TFoeGe0Ks+VzubnTdkFMRSYkeXUzrGmLtwO1/dWGGpeRMEiwKo/7cXvv8qmuzDb/8y7tOQ2NWVVbNhztaj9lFDl5TxA9K9dHduE9U3S8Uqg5YDNV4Np0G7SSe9kGPlQNXfQJRIMAvuDD9ej5j0xz6/hNycDvZhTs59Q9vCLTV7gmYKUN3lcXYKd0zdQ==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>