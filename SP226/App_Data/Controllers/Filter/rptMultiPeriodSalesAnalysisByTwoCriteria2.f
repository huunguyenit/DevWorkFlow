<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Controller "rptMultiPeriodSalesAnalysisByTwoCriteria2">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY GetReportFormStockRight SYSTEM "..\Include\Command\GetReportFormStockRight.txt">
  <!ENTITY SetReportFormStockRight SYSTEM "..\Include\Javascript\SetReportFormStockRight.txt">

  <!ENTITY Identity "&Controller;">
  <!ENTITY FilterExpression "f._filter$Expression = '&quot;' + f._filter$Pattern + '&quot;.indexOf([ma_ct]) &gt;= 0;';f.setItemValue('ds_ma_ct', f._filter$Pattern);">
  <!ENTITY GetTransactionParameter SYSTEM "..\Include\Command\GetTransactionParameter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>

  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
    </field>
    <field name="kieu_bc" dataFormatString="1, 2, 3, 4" clientDefault="1" align="right">
      <header v="Kiểu báo cáo" e="Report Type"></header>
      <footer v="1 - Tháng, 2 - Quý, 3 - Nửa năm, 4 - Năm" e="1 - Month, 2 - Quarter, 3 - Half a Year, 4 - Year"></footer>
      <items style="Mask"/>
    </field>
    <field name="ky_bc" allowNulls="false" type="Decimal" dataFormatString="##0" clientDefault="3">
      <header v="Số kỳ báo cáo" e="No. of Periods"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99AXgrOyRkAA7CN+sxR2nF+MBBXeAeMjc7VNXkmXc99VBRP9MXcCBPEXxoYGPEmWKVw==</Encrypted>]]></clientScript>
    </field>
    <field name="sKy_bc" readOnly="true" external="true" hidden="true" clientDefault="3">
      <header v="" e=""></header>
    </field>
    <field name="bc_theo" clientDefault="1">
      <header v="Báo cáo theo" e="Report by"/>
      <items style="DropDownList">
        <item value="1">
          <text v="Mã vật tư" e="Item Code"/>
        </item>
        <item value="2">
          <text v="Nhóm vật tư 1" e="Item Group 1"/>
        </item>
        <item value="3">
          <text v="Nhóm vật tư 2" e="Item Group 2"/>
        </item>
        <item value="4">
          <text v="Nhóm vật tư 3" e="Item Group 3"/>
        </item>
        <item value="5">
          <text v="Nhóm giá vật tư" e="Item Price Class"/>
        </item>
        <item value="6">
          <text v="Mã khách hàng" e="Customer ID"/>
        </item>
        <item value="7">
          <text v="Nhóm khách hàng 1" e="Customer Group 1"/>
        </item>
        <item value="8">
          <text v="Nhóm khách hàng 2" e="Customer Group 2"/>
        </item>
        <item value="9">
          <text v="Nhóm khách hàng 3" e="Customer Group 3"/>
        </item>
        <item value="10">
          <text v="Nhóm giá khách hàng" e="Customer Price Class"/>
        </item>
        <item value="11">
          <text v="Nhân viên bán hàng" e="Sales Employee"/>
        </item>
        <item value="12">
          <text v="Mã đơn vị cơ sở" e="Unit"/>
        </item>
        <item value="13">
          <text v="Mã kho" e="Site Code"/>
        </item>
        <item value="14">
          <text v="Mã bộ phận" e="Department"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="nhom_theo" clientDefault="0">
      <header v="Nhóm theo" e="Group by"/>
      <items style="DropDownList">
        <item value="0">
          <text v="Không nhóm" e="No Group"/>
        </item>
        <item value="1">
          <text v="Mã vật tư" e="Item Code"/>
        </item>
        <item value="2">
          <text v="Nhóm vật tư 1" e="Item Group 1"/>
        </item>
        <item value="3">
          <text v="Nhóm vật tư 2" e="Item Group 2"/>
        </item>
        <item value="4">
          <text v="Nhóm vật tư 3" e="Item Group 3"/>
        </item>
        <item value="5">
          <text v="Nhóm giá vật tư" e="Item Price Class"/>
        </item>
        <item value="6">
          <text v="Mã khách hàng" e="Customer ID"/>
        </item>
        <item value="7">
          <text v="Nhóm khách hàng 1" e="Customer Group 1"/>
        </item>
        <item value="8">
          <text v="Nhóm khách hàng 2" e="Customer Group 2"/>
        </item>
        <item value="9">
          <text v="Nhóm khách hàng 3" e="Customer Group 3"/>
        </item>
        <item value="10">
          <text v="Nhóm giá khách hàng" e="Customer Price Class"/>
        </item>
        <item value="11">
          <text v="Nhân viên bán hàng" e="Sales Employee"/>
        </item>
        <item value="12">
          <text v="Mã đơn vị cơ sở" e="Unit"/>
        </item>
        <item value="13">
          <text v="Mã kho" e="Site Code"/>
        </item>
        <item value="14">
          <text v="Mã bộ phận" e="Department"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="phan_loai" dataFormatString="1, 2, 3" clientDefault="2" align="right">
      <header v="Theo ds/ck" e="By Turnover/Discount"/>
      <footer v="1 - Doanh số, 2 - Doanh thu thuần, 3 - Chiết khấu" e="1 - Turnover, 2 - Net Turnover, 3 - Discount"></footer>
      <items style="Mask"/>
    </field>
    <field name="tk_dt" categoryIndex="1">
      <header v="Tài khoản doanh thu" e="Revenue Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_dt%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_tk_dt%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1 "/>
    </field>
    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"/>
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

    &ReportDataTypeField;

    <field name="ds_ma_ct" hidden ="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="110----: [tu_ngay].Label, [tu_ngay]"/>
      <item value="1110000: [kieu_bc].Label, [kieu_bc], [kieu_bc].Description"/>
      <item value="11---1-: [ky_bc].Label, [ky_bc], [sKy_bc]"/>
      <item value="11000--: [bc_theo].Label, [bc_theo]"/>
      <item value="11000--: [nhom_theo].Label, [nhom_theo]"/>
      <item value="1110000: [phan_loai].Label, [phan_loai], [phan_loai].Description"/>
      <item value="1101000: [tk_dt].Label, [tk_dt], [ten_tk_dt%l]"/>
      <item value="11000--: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000--: [mau_bc].Label, [mau_bc]"/>
      <item value="11000-1: [loai_du_lieu].Label, [loai_du_lieu], [ds_ma_ct]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvnZPRiKEfPKjxHBmJnvU1lVtlo+1Oh7odASSFZnsPBg9Zo+rjYXqzXYFeMYQpMONV0=</Encrypted>]]>
        &GetTransactionParameter;
        &GetReportFormStockRight;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcP7h2GfJqnNKET6itpAfLTdNxqpmrkHCGwTVMY4fj8gEsyRYVF0hqov+hgKGlW7Ja7GLXMZzi+c702y1hCLnj3qwELpWxuOXh27qDj0kSQ1/xWxeslmoiC51giIcH2KgL0tkqQ3PrMDrA4I/VfQIu0XbmnV48jdATC5TtdRseqtx4+mK0gCmMRTjTcUtyyfeqBDRKU0s2EJHzFHAHcGrPaxkTnU3QaneqCEJZEzRV8mmKd8kuPu8wsArYpAgZ4Woja2W+WDoKpQlXUv8JUePZk9fNQelaoujuC05bB7CH3bqjL7xfa+1FA28VgiMgqVd+JzHQimMPqrKBSyeY8zURJRmI7yF5csTIhPwM/SFuCZ3CnFur4wnULfOxgLgTawJO1Ypm6uNNFE4UWdpuKqMwUc65lJEcTrkCW5vVsplCoTL251HZpBgRHYWGxbS8bmGCU17/nCqsoNNDDTr/hzteRq5Pu1OI7SV7UDc6Yfx/4RjhAxAv36BaxJAlnul6ka5FVp9pHWjwr4OLKsVmb5uQSop59Osdt/4mN+Y14OQknOBGOVPsat6kk/OWUTQVIgzrbBbknfngVYdigosUe3n0Bj810tjuIL5pgQFqWby00J8ZPV2SrH09GJux2s0mtVGUh3HmaUenIVRd58scNAf5DhKealj2TD9ZvXhATOV4zUMZ/eVqRYZofAlSvKPL7ysK3NfRsHLYkashXlmyR9u3o3G9BUKipC5pd7aTLZRPDQIoNU6312hHMk3RId+r+XPeQ==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFKFyn5nqtVBL8WX4eo6H2kabgBcKsgcm4iH2SLI2Ez1+</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      &SetReportFormStockRight;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22RUEW0slMShueWy06PcBDyd9ktXeZZLi+u4e3uWzzfV6GS5SB8boGPPLOkjFa7K1tKdj0fBvC5r/hLzUlcbLUbZpHHrTaptgd7D0APV4xDRBt1bFOd8IdZuMuFOkt3g0n987eEgQZbKPDeFBFdcVTMc=</Encrypted>]]>&FilterExpression;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UTGvcibnq25/85h5bwDPm4QdBTiToHGpDbRp7h7xaM7mVj2Gh8IAiC8eu555WEDeovmxOJzUAoqmpDkiZH/3G/aXMOnlJj+w/pZKH/NJgMbTrXGs/hSA8UKKZ72dvEGnxFYQDYhiwG2NyKFQtQui1l8ucQkLrwMxr729dBvyWtIOXWMO1ocfN+NaXjFG9jjEUYkpPMY+1I7AY4RheugyWy0Aw9hmu0kUduONpV6a1ZhYjc4qzfQX+tBg0pTF+X5Ag25i4MBJhILNxAbiF8SqiQ/JecnyDqTYGx76B1e/yLWrILhfzV5urbpjU32lIyjNSDf1o6XoV6A6eqAEqqDdipbOBnXCRlEbmO1LeZG4IjXi/K/MoMoPp6VvBhcX6xJvbbjCEmMgQMtlleCIcODccVeQ21rKv4eADRSj5E83NJbTCCzSyPh6prT7TkQURXOwylUVwd6UPBcUjw/VYP0qrK7X271pPe0Veh1nB4R5ueAlYMHdnHyeu2uQLLkuzMtQ9SPZjemxLTUkcBdpuzG16CrdiO8pvIk6mXcdTYwBFtLox/hXLa0LMjY/Jn5W8hZCLQWMVCIFLUSnwwOgqSnC7aK0gWLdDvPAn4IKW09l2H2FkpBoYNYJsb7YZ9/48CJ7NRsBsHudsudG8GmMJymrdtsC0Bm83wORASmpsx2a68VtM9nLFR2o7yWrW7HAxlNeMUAzaeHPzemFmrdCGMDSb8wgOrX46XNoX/QhjD1RU2O9dzZeLwlgiHwZYkeZOke7a/hBNmpl+RkQEisUv5UXdeUEdfXUFXUZMDV+Rqe9YxSm+ZABTKQle4pnSrNxACzgRqOBYAQ8hLx5ogVIjrwrEQ3Eb9boBsEeMwgQeFdndL1hiGnbYxBIjOgb/l05W5RQ57sR0wzOyb13y9Cfc5BaMENjf/pBe0c9dljXnY5QtD+s6m+PW9YEeSO+Kdf/RE96YOni0t+lOiEvZX81xv54pzeBJ9vIp6LEsCeuOWcc77LgQMiAoSjaR0z38OId3VqOLLOTa7o+zEBA0+0XF/Jv10xduuuR2U81aiyAlG5GJ/SJdR5qwRxeezT25TRx8Xp6cfzAXY7XpDXWTcndRaD/Ny/uW2D2fK8Cn0g/lptUO93Z/MNJGdcFwjV14o97ueURg==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>