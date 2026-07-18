<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Controller "rptPurchaseExpenseSummary">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY Identity "&Controller;">
  <!ENTITY FilterExpression "f._filter$Expression = '&quot;' + f._filter$Pattern + '&quot;.indexOf([ma_ct]) &gt;= 0;';f.setItemValue('ds_ma_ct', f._filter$Pattern);">
  <!ENTITY XMLGetParameter SYSTEM "..\Include\XML\GetTransactionParameter.xml">

  <!ENTITY GetReportFormLimitRight SYSTEM "..\Include\Command\GetReportFormLimitRight.txt">
  <!ENTITY SetReportFormLimitRight SYSTEM "..\Include\Javascript\SetReportFormLimitRight.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">

  <!ENTITY XMLWhenFilterQuerying SYSTEM "..\Include\XML\WhenFilterQuerying.xml">
  <!ENTITY DynamicReportFields ",'&Controller;', '#$query', '@@sysDatabaseName'">
]>

<dir type="Report" id="1" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày chứng từ từ ngày" e="Voucher Date from"></header>
      <footer v="Ngày chứng từ từ/đến" e="Voucher Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Chứng từ đến ngày" e="Voucher Date to"></header>
    </field>
    <field name="so_ct1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Chứng từ từ số" e="Voucher No. from"></header>
      <footer v="Chứng từ từ/đến số" e="Voucher No. from/to"></footer>
      <items style="Mask"></items>
    </field>
    <field name="so_ct2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Chứng từ đến số" e="Voucher No. to"></header>
      <items style="Mask"></items>
    </field>

    <field name="ma_kh" categoryIndex="1">
      <header v="Nhà cung cấp" e="Supplier"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and (cc_yn=1 or nv_yn=1)" check="cc_yn=1 or nv_yn=1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_kho" categoryIndex="1">
      <header v="Kho hàng" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_vt" categoryIndex="1">
      <header v="Mã hàng" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>

    <field name="tk_vt" categoryIndex="1">
      <header v="Tài khoản vật tư" e="Item Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk_vt%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nh_vt1" categoryIndex="1">
      <header v="Nhóm hàng hóa - vt" e="Item Group"/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 1 and status = '1'" check="loai_nh = 1"/>
    </field>
    <field name="nh_vt2" categoryIndex="1">
      <header v="" e=""/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
    </field>
    <field name="nh_vt3" categoryIndex="1">
      <header v="" e=""/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 3 and status = '1'" check="loai_nh = 3"/>
    </field>

    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" categoryIndex="1">
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

    <field name="transactionGrid" external="true" clientDefault="0" defaultValue="0" rows="126" categoryIndex="5">
      <header v="" e=""></header>
      <label v="" e=""></label >
      <items style="Grid" controller="TransactionFilter" row="1"/>
    </field>
    <field name="transactionList" readOnly="true" categoryIndex="5">
      <header v="" e=""></header>
    </field>

    &ReportDataTypeField;

    <field name="loai_bc" dataFormatString="1, 2" clientDefault="1" align="right" categoryIndex="2">
      <header v="Loại báo cáo" e="Report Type"></header>
      <footer v="1 - Mẫu thường, 2 - Mẫu nhập mua" e="1 - Common, 2 - Purchase"></footer>
      <items style="Mask"/>
    </field>
    <field name="nh_theo" clientDefault="" categoryIndex="2">
      <header v="Nhóm theo" e="Group by"/>
      <items style="DropDownList">
        <item value="">
          <text v="Không phân nhóm" e="No Group"/>
        </item>
        <item value="0">
          <text v="Loại vật tư" e="Item Type"/>
        </item>
        <item value="1">
          <text v="Nhóm vật tư" e="Item Group"/>
        </item>
      </items>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99I+KMgPNz07pZCHEPUE4q3LC4ORZ26bVTqIX9ZeyvpFUwIaGGVRGNDIw6ffwxRDdZw==</Encrypted>]]>&OnSelectionOutline;</clientScript>
    </field>
    <field name="tinh_ps" clientDefault="1" categoryIndex="2" hidden="true" readOnly="true" disabled="true">
      <header v="Tính ps điều chuyển" e="Include Transfers"/>
      <items style="DropDownList">
        <item value="0">
          <text v="Không tính phát sinh điều chuyển kho" e="Not Include Transfers"/>
        </item>
        <item value="1">
          <text v="Tính phát sinh điều chuyển kho" e="Include Transfers"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="tt_sx1" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right" categoryIndex="2">
      <header v="Thứ tự sắp xếp nhóm" e="Group Order Type"/>
      <items style="Mask"/>
    </field>
    <field name="tt_sx2" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right" categoryIndex="2">
      <items style="Mask"/>
    </field>
    <field name="tt_sx3" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right" categoryIndex="2">
      <items style="Mask"/>
    </field>
    <field name="ds_ma_gd" clientDefault="" categoryIndex="2">
      <header v="Ds mã giao dịch" e="Transaction Code List"/>
    </field>
    <field name="maxLength" readOnly="true" hidden="true" maxLength="-100" categoryIndex="1">
      <header v="" e=""></header>
    </field>

    <field name="ma_nx" categoryIndex="9">
      <header v="Mã nhập xuất" e="Reason"></header>
      <items style="AutoComplete" controller="Reason" reference="ten_nx%l"/>
    </field>
    <field name="ten_nx%l" readOnly="true" external="true" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="ma_vv" categoryIndex="9">
      <header v="Mã vụ việc" e="Job"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vv%l" readOnly="true" external="true" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" categoryIndex="9">
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
      <header v="Mã bộ phận" e="Department"></header>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="ma_hd" categoryIndex="9">
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status = '1'" check="1 = 1"/>
      <header v="Mã hợp đồng" e="Contract"></header>
    </field>
    <field name="ten_hd%l" readOnly="true" external="true" categoryIndex="9">
      <header v="" e=""></header>
    </field>

    <field name="ds_ma_ct" hidden="true" readOnly="true" categoryIndex="2">
      <header v="" e=""/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="186" anchor="6">
      <item value="120, 20, 80, 100, 100, 130, 0"/>
      <item value="1101: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="11011: [so_ct1].Description, [so_ct1], [so_ct2], [maxLength]"/>

      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>

      <item value="110100: [tk_vt].Label, [tk_vt], [ten_tk_vt%l]"/>
      <item value="11011: [nh_vt1].Label, [nh_vt1], [nh_vt2], [nh_vt3]"/>

      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-1: [mau_bc].Label, [mau_bc], [loai_du_lieu]"/>

      <item value="11: [transactionGrid], [transactionList]"/>

      <item value="1110000: [loai_bc].Label, [loai_bc], [loai_bc].Description"/>
      <item value="110000: [nh_theo].Label, [nh_theo]"/>
      <item value="11111: [tt_sx1].Label, [tt_sx1], [tt_sx2], [tt_sx3], [tinh_ps]"/>
      <item value="110000-1: [ds_ma_gd].Label, [ds_ma_gd], [ds_ma_ct]"/>

      <item value="110100: [ma_nx].Label, [ma_nx], [ten_nx%l]"/>
      <item value="110100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>

      <categories>
        <category index="1" columns="120, 20, 80, 100, 100, 130" anchor="6">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="120, 25, 25, 25, 125, 100, 130, 0">
          <header v="Lựa chọn" e="Option"/>
        </category>
        <category index="5" columns="569, 0" anchor="1">
          <header v="Giao dịch" e="Transaction"/>
        </category>
        <category index="9" columns="120, 20, 80, 100, 100, 130" anchor="4">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvnZPRiKEfPKjxHBmJnvU1lVtlo+1Oh7odASSFZnsPBg9Zo+rjYXqzXYFeMYQpMONV0=</Encrypted>]]>&GetReportFormLimitRight;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcM0GUti1kCp50u/Joaj4mLrRFBFrkg61EVyh0XGpA19zx05m0tH1OgdPSKya+jhQB92mZjn9Ot4aMXMuRM9wUx/xclTHT0ytQP5YzsDNDeJ2</Encrypted>]]>
      </text>
    </command>
    &XMLWhenFilterClosing;
    &XMLGetParameter;
    &XMLWhenFilterQuerying;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcEvC5Li76QzcIK1E+4eDrjq6i79Ay/7EvmOQ2uSzvWy317HMgJYS8Rk/D+1RJ2dZFq2KTgOG6w1BjYXkXMWRktB0pk139eakqm1210T9JDfzu2E80Lj4gmqYXsjQ6ipnpDIKwB+38GaXoNXctapXHPgH1Q3gqqRVoxQu6LkFcrrrvOq0vxUOYLO27lHnLy18jElVyIxJtktB5rkDtesa06LqNyy2BcqLmtKBABaiGuQFhY3qTSE/3phgA7Vxi10vAfS+HwzE0gQYSBmTk5X43Gwxy9MMoHNV1EMOlLRq6ZDVpDJ6xwAEHj5r6hgvgmjKKYeOOE6iV+FW3KYLyVfXWn2iqdrb9PuZQswCifv5TEvHYLKm3tBQM8JqisOuJDtEEyUWpmFupKEDCHWktfkXwg6hDGSW6MxnWp9KImoDUSFwC1dvwH8Oyljn2uN85ICWywrFo2vxQkhegtKxTuxSttZH893g/GAUnNLM1iKRySWJEGZeX20JA+UdYFmm/0wD1zBIB2Yh8dnf5/qlAud2cMA8OCzU48ewvDn5qJMVJXQ8AJ0EfNUOESD89ukFDbim2w==</Encrypted>]]>&DynamicReportFields;
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2EeKL7qb/04iuraroARBQeYbTAeKU1SRCWUXisbykImIgmfvDMeiPPvRi7OZBLduVfMkCzbtHvEV3w8EILJnY6mVMSJZw7eKUuD1qIDl42p+kUjvfxwjhbZnmrdVzITPFhwD5RdEQrFdyLIRlzeAXwyxnydUFv72d8MC27c4+bIxDbgxyFxstAUOSeO77A35tLZo5e1Jrawc1uuf2sRjPoM3EujBGt4+d4lHBg8pNS1PLiVNW/owjB6tedu6R1o0R2YtE+5dr8DF0hphhxKB2tgfccSSqPssDHeK4QOLDtZQumUeXoWq04xa/kEpbCXiCFtvljx1quJq6VOXCdlx8hPQ=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      &ScriptQueryFilterString;
      &SetReportFormLimitRight;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtf0ePKWMx2z3mvcfODpAeD6TbO3opaqe/n04Q34AtpZ1kFiw2I6YDJ5nIJArEF00UAQPuE7LmyvOyrWFWtbBGwAhUMuxT0V598JVIhTEuT2ckLGj8TPitnp/CchLHTR4Sna15e5zW0BSwfVl1BN5h6EE+4dXujEvjmOdL7UEqYiYQbwInBEc3edUhHQleyp7gCRaEeGV9TLpEUKT/9Di7jRTN3gI/SmdmZhpuefWEZQnNkiC0fJgEOk870GGpR/OtZkjB5XDpjNAS6z5/k4zLolCDFE1TfBDmoIzFqhDqSVo7s9luIZfb502UZhYIp5YviA9EkZT5hSlS99jEAHcUUBWCM+frOko8nXRr18hB3FzlC8ijUveX5OPQlZ9CPJTuw==</Encrypted>]]>&FilterExpression;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WS5KX+Q+BeiR6pPmL5zKVo3DbFsvcoq3D47ubR9Ztg1uI+bSyloZvb2OphmC+RidPARQcvh2OflEYz/2vOQTCO/XJ/C9CU06W2m2+cArXP/m7Q8/FNga+WIK7ll4O1Rr1WmMntMqdxjQL2OpBFOhV4jjhWr56yM/RilFOOoyPy8onncSuojcmkwfsJUr5Ow0pu2Q+4UbXoNNykelp1WYnKEsEGJbxOnUTfpg8wPV4wO+3z/ILashCMi30YEVVCUhpvsYVz1HLCloXtOhu25MV7Udy9p5dddVUkf+WkJMaJ8TGRWhL3dRGTTtQAouc76KIUTNGaygSdZa57tfIXhvNG2OMmyyHEXVVDNxDRgBv/Wv197zix1AuLuzZ/HoHYxa4znByPV5rB6FJB04YbKAgVya99CpidYsZ1z2pxQoPjAegf7WsoS3vby4yXRo8zntiiqsV6WEhjrMu/ezjEb98twEcCbisg7mt9v9cKivH9vbwfBO3iIruIy8UR+rrExRxhvPFSLQL7x2lUI/UCv83G81FDH0ViMM7AgzWhAak69Qs3Zmp1AJqBE/WCZ7+fUzjxpgmvnC0Hf+LV1gvmhT/gOJE8VPIcCHI180dcwKfeLB8BoQxSF1O+eU+E00ntyKjzMvckg+DaZTkgjlU1va2OxK2uG01C04cpcHyvnfjLixak7sU39iM0AhQ+RrGhixgZ9eL5/PdUcbjFcDI4o376C6uu74AHYvP4XjCdYysw5QqjiKHYesGSEVpan5CSe1MzAHu5O4sx1OLDmv2AG2vXojvhN/XWLVe3oeg27/F/BuMkssMymqgCA62XOdpyxSfDS1kRWH2H/RlSC38z9tQ7aJukx5DfsIu9EweCswEQvlhXGjwFSZozEuHcgrInEadiU4HSnIxYiqjDFBbWlCMTz0vUbJ5wQQQu+4Ow4HGWCTn5wtP1O/neF5iCSPWX8BX1LwrPxjgzPBvb9O6hbovwkQVf9ju0vnoilFAGjNPagbGgp9Yb0VYj8ghOh3x3kYQEc+bWkWRiJnaViImu5vFAQcTGtf5KrVha4xECfTreV</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>