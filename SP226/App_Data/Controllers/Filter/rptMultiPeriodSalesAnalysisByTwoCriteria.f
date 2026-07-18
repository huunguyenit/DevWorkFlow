<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Controller "rptMultiPeriodSalesAnalysisByTwoCriteria">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptPivotFilter SYSTEM "..\Include\Javascript\PivotFilter.txt">
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
    <field name="phan_loai" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Theo ds/ck" e="By Turnover/Discount"/>
      <footer v="1 - Doanh số, 2 - Chiết khấu" e="1 - Turnover, 2 - Discount"></footer>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcP7h2GfJqnNKET6itpAfLTdNxqpmrkHCGwTVMY4fj8gEsyRYVF0hqov+hgKGlW7Ja7GLXMZzi+c702y1hCLnj3qwELpWxuOXh27qDj0kSQ1/xWxeslmoiC51giIcH2KgL0tkqQ3PrMDrA4I/VfQIu0XbmnV48jdATC5TtdRseqtx4+mK0gCmMRTjTcUtyyfeqBDRKU0s2EJHzFHAHcGrPaxkTnU3QaneqCEJZEzRV8mmKd8kuPu8wsArYpAgZ4Woja2W+WDoKpQlXUv8JUePZk9fNQelaoujuC05bB7CH3bqjL7xfa+1FA28VgiMgqVd+JzHQimMPqrKBSyeY8zURJRmI7yF5csTIhPwM/SFuCZ3CnFur4wnULfOxgLgTawJO1Ypm6uNNFE4UWdpuKqMwUc65lJEcTrkCW5vVsplCoTL251HZpBgRHYWGxbS8bmGCU17/nCqsoNNDDTr/hzteRq5Pu1OI7SV7UDc6Yfx/4RjhAxAv36BaxJAlnul6ka5FVp9pHWjwr4OLKsVmb5uQSop59Osdt/4mN+Y14OQknOBGOVPsat6kk/OWUTQVIgzrbBbknfngVYdigosUe3n0Bj810tjuIL5pgQFqWby00J82cID7skoAuhdZ+y71MysWGSJzGm5zf0BO/6MY/zo/ehNQQKewtSi1+MnRWfzQoPLQ7JTP7W0gRJWze6S3KNIa8BmmlhJqh4R4MtkZlocPhgAmIS6B3wyAD9k6WfjaP8UVgBZHtVoSP/eBasIa/SYBA==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFKFyn5nqtVBL8WX4eo6H2kabgBcKsgcm4iH2SLI2Ez1+</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptPivotFilter;
      &OutlineEntry;
      &ScriptQueryFilterString;
      &SetReportFormStockRight;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22RUEW0slMShueWy06PcBDyd9ktXeZZLi+u4e3uWzzfV6UBkjyLCJvaQKhV1r6qPPTglkHqnaRjYR8qCTAKvDrzcgRxuQh6keovaXhyE65GTPgkOM0eWwUraig0e8BYgyjzR//KVJUv0WKd0nqXxnJTI=</Encrypted>]]>&FilterExpression;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Yiks0TMah8qi7VieX6+SmsbHxZB4ED7JLOudwE5uX+Dr/uehc05EXr0sZ3KDch8mM0lPoY+/lVDi+qJb3+e9frOQteHwm2/ToaH3FMsyzSXLEVE1gdnBaOel4ltPbCAHhViLpKmJy4h5UsmBsQOLYJ8mguh/VET0cIpEnevVhuY31a+nMgbBNbO9z1PLCU6GuZRuFjS4CPFRYPnGzqsAZfD34HjhMV3VdBZTtszSockxXS6cO3eVm/u1savlgXJDp9/KSkxa0jSLsUjuTXPpRU0jzK11bYcP9JOlUXdF+LzH44MSvsewBz64kNMqCY/WofLKrIgIirp/QjB+PWiesxYLylFAbwJmfgXnDW8iLIBrlE8AfILWAIZIsRWFU+Ca77RI1M1A3gR3Y+zEx0NyL9fBd4QuvAMILJV6i1LRKAD2XU4Bw0/3xMfBkyGTA8pSJoS4jnmnmIWpL4JkzTO/Q55ugEDXgPf5F2Y2NJbHa8vf/3aJVHd35Hguhi+RaXXUO10orzHRYDSzk9JrfJuyDUv1XLimL23ifoXze+1knp5LmcVdlkr3dreJ+7qIHf4n5ItMWk3LXHeHpchw9ydZN6Le8cbhB+FdNeUx7yeuywXsqd3GQkWKsi2urzwiEC7EwsrvBZ/rfu87/Xj1e5+MakLJfKaA+pPxEDA0JmFnoxAbTHH1WReeuiVMANCwMVfEkb0JaoUC7f1gZxp731Ayq9gSkgiWMhIkdYN8+zryc61suIqXZwUOeDgca/TMgxyPqa4gJAxrS1k7fO0j1CcBn5kBPLSwrrN1wWeR1b4Md1JNcp8NQC+Mh7gSeptobUA/Y3zF0IFOx4M35cNLiYNVw4xGCA1LFTc3RfziEhfUGZWIFGSqP1sTPq+DX9MaM4VSSbHGHkPNYZCsWWvd5W7J9+8TteJa5G0pQ8gXJ/i5q1I</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>