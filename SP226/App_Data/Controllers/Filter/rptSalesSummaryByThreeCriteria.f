<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Controller "rptSalesSummaryByThreeCriteria">
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
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="bc_theo">
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
    <field name="nhom_theo">
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
    <field name="xoay_theo" clientDefault="6">
      <header v="Xoay theo" e="Pivot by"/>
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

    <field name="ds_ma_ct" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="1101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="11000-: [bc_theo].Label, [bc_theo]"/>
      <item value="11000-: [nhom_theo].Label, [nhom_theo]"/>
      <item value="11000-: [xoay_theo].Label, [xoay_theo]"/>
      <item value="111000: [phan_loai].Label, [phan_loai], [phan_loai].Description"/>
      <item value="110100: [tk_dt].Label, [tk_dt], [ten_tk_dt%l]"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcJGG5+aZVwtCSDuPBEwiIbAp3eQ9EOuGtAu2FfxuBzLTZvi0mzKi/bZROIAH5gZpw+eE0zJJ7AAV6/2FJRM8g8r1OJ1YlzX7cEMenNJZ1maIkF0j8Uz/Ec8898FDoZjD/nQldBKVrLW1GdeKDpm+sh/xLLLrNbvx1zo4kaNZFw8vuOHwkKeFyvknTPM5aoIm8FsWVYd+dbX5kbRH+bvnoJTNoT/x3faup2X6c/OQpdig79hx0cpzW8oHvOqfouqn6AdynijrjW8+XrxkzGJ+BbPZwMT1LDcRmIdTHZySvlFadSutdCS4jMfYujKHPKNNv6eBF/nK0OXyarbRWRRiHf5FrcrONDygTAKPME0WndOJ53AWMJNA6a+8VbrCKhOcX8rBjexm2YTuw/mzUXbzoNqAF+sJ1RSBnudUnSD0td/rW74BNdyeYbEKpNnmX1KA4t+xsOT9MMSg+XU8p1XTVUp1EeBz2PYjVNHRns4IAzIk/o4ajvrUDFz13jNWMwtqf1TmTa1XQo8DOqBwnYs5O+ObNs216uOJOqclgbfRroMwqRneuHNtn/zqrY7FXWVMMSRiHN5mc+rLTHfFi2dQnbtxwYUdwlE9c1/a1YIt1wLHoRfocJZyk/U9RRMyhOAREA==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFKFyn5nqtVBL8WX4eo6H2kabgBcKsgcm4iH2SLI2Ez1+</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptPivotFilter;
      &OutlineEntry;
      &ScriptQueryFilterString;
      &SetReportFormStockRight;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22RUEW0slMShueWy06PcBDyd9ktXeZZLi+u4e3uWzzfV6UBkjyLCJvaQKhV1r6qPPTglkHqnaRjYR8qCTAKvDrzcgRxuQh6keovaXhyE65GTPgkOM0eWwUraig0e8BYgyjzR//KVJUv0WKd0nqXxnJTI=</Encrypted>]]>&FilterExpression;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WS5KX+Q+BeiR6pPmL5zKVo3DbFsvcoq3D47ubR9Ztg1uI+bSyloZvb2OphmC+RidPARQcvh2OflEYz/2vOQTCO/XJ/C9CU06W2m2+cArXP/fGbia0CUJ+5+HEAvLcBbPALwAd4PD4AjUVN0HGkNJGidWGIo7OnpuAcJ1kOhXGTBGzve7gciIw95b3mtq5O8IzwSyfv4wmgfz8kLZMHLqm+kuzUIjfqK6v0pTNLL/RK0z3pjZjXflEbcvDKn4V2IDvzonTDXuCGsY9kvQuAKSd+tVNaOgRmAnXELP1R1gw2ZG7ocY+MgF1Af3wLQfqmOWTLZNebmhRhjJjOotjIMkLX3t7eNSmgSnjdJYJtL3OKPOhWorANTRzInx7UDg9EzmvYnZ5EZmJxO4Pk6qS4/EVW6nN44tDxrPvo0tFHnsHOkccolt90pRCP1Hqcs76yap4JrNGXx+lEMnIY9o9vLrLhl2FKuIJYiRtVNwRLnxMwwMC5jmNA7SIM+BpoRQQLq5cjPNxCeygGLqHBNc6fAyuCOLuxkR1RtggL3NM6d8fWVb5M6UpRXl7GEVABzrghL7p3Pf228jO2QCCbJsW+TJVw=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>