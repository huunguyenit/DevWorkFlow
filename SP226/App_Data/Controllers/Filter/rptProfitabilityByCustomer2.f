<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Controller "rptProfitabilityByCustomer2">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY XMLWhenFilterQuerying SYSTEM "..\Include\XML\WhenFilterQuerying.xml">
  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY Identity "&Controller;">
  <!ENTITY FilterExpression "f._filter$Expression = '&quot;' + f._filter$Pattern + '&quot;.indexOf([ma_ct]) &gt;= 0;';">
  <!ENTITY GetTransactionParameter SYSTEM "..\Include\Command\GetTransactionParameter.txt">

  <!ENTITY GetReportFormStockRight SYSTEM "..\Include\Command\GetReportFormStockRight.txt">
  <!ENTITY SetReportFormStockRight SYSTEM "..\Include\Javascript\SetReportFormStockRight.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="date_from" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày chứng từ từ" e="Voucher Date from"/>
      <footer v="Ngày chứng từ từ/đến" e="Voucher Date from/to"/>
    </field>
    <field name="date_to" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày chứng từ đến" e="Voucher Date to"/>
    </field>
    <field name="ma_nvbh">
      <header v="Nhân viên bán hàng" e="Sales Employee"></header>
      <items style="AutoComplete" controller="SalesEmployee" reference="ten_nvbh%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_nvbh%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh">
      <header v="Khách hàng" e="Customer"/>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="nh_kh1">
      <header v="Nhóm khách hàng" e="Customer Group"/>
      <items style="AutoComplete" controller="CustomerGroup" key="loai_nh = 1 and status = '1'" check="loai_nh = 1"/>
    </field>
    <field name="nh_kh2">
      <header v="" e=""/>
      <items style="AutoComplete" controller="CustomerGroup" key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
    </field>
    <field name="nh_kh3">
      <header v="" e=""/>
      <items style="AutoComplete" controller="CustomerGroup" key="loai_nh = 3 and status = '1'" check="loai_nh = 3"/>
    </field>

    <field name="ma_kho" categoryIndex="1">
      <header v="Kho hàng" e="Site"/>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1= 1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>

    <field name="ma_vt" categoryIndex="1">
      <header v="Mã hàng" e="Item"/>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1= 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_tkdt" categoryIndex="1">
      <header v="Tài khoản doanh thu" e="Revenue Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tkdt%l" key="status = '1'" check="1= 1"/>
    </field>
    <field name="ten_tkdt%l" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_tkvt" categoryIndex="1">
      <header v="Tài khoản vật tư" e="Item Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tkvt%l" key="status = '1'" check="1= 1"/>
    </field>
    <field name="ten_tkvt%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="nh_vt1" categoryIndex="1">
      <header v="Nhóm hàng hóa-vật tư" e="Item Group"/>
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

    <field name="transactionGrid" external="true" clientDefault="0" defaultValue="0" rows="150" categoryIndex="5">
      <header v="" e=""></header>
      <label v="" e=""></label >
      <items style="Grid" controller="TransactionFilter" row="1"/>
    </field>
    <field name="transactionList" readOnly="true" categoryIndex="5">
      <header v="" e=""></header>
    </field>

    &ReportDataTypeField;

    <field name="nh_theo" clientDefault="" categoryIndex="2">
      <header v="Nhóm theo" e="Group by"/>
      <items style="DropDownList">
        <item value="">
          <text v="Không phân nhóm" e="No Group"/>
        </item>
        <item value="1">
          <text v="Nhóm khách hàng" e="Custommer Group"/>
        </item>
      </items>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99I+KMgPNz07pZCHEPUE4q3LC4ORZ26bVTqIX9ZeyvpFUwIaGGVRGNDIw6ffwxRDdZw==</Encrypted>]]>&OnSelectionOutline;</clientScript>
    </field>
    <field name="tinh_ps" clientDefault="0" categoryIndex="2">
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
    <field name="ma_gd" clientDefault="" categoryIndex="2">
      <header	v="Ds mã giao dịch" e="Transaction Code List"/>
    </field>

    <field name="ma_nx" categoryIndex="9">
      <header v="Mã nhập xuất" e="Reason"/>
      <items style="AutoComplete" controller="Reason" reference="ten_nx%l" key="1=1" check="1 = 1"/>
    </field>
    <field name="ten_nx%l" readOnly="true" external="true" categoryIndex="9">
      <header v="" e=""/>
    </field>
    <field name="ma_vv" categoryIndex="9">
      <header v="Mã vụ việc" e="Job"/>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vv%l" readOnly="true" external="true" categoryIndex="9">
      <header v="" e=""/>
    </field>
    <field name="ma_bp" categoryIndex="9">
      <header v="Mã bộ phận" e="Department"/>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" categoryIndex="9">
      <header v="" e=""/>
    </field>
    <field name="ma_hd" categoryIndex="9">
      <header v="Mã hợp đồng" e="Contract"/>
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_hd%l" readOnly="true" external="true" categoryIndex="9">
      <header v="" e=""/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="210" anchor="6">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101: [date_from].Description, [date_from], [date_to]"/>
      <item value="110100: [ma_nvbh].Label, [ma_nvbh], [ten_nvbh%l]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="11011: [nh_kh1].Label, [nh_kh1], [nh_kh2], [nh_kh3]"/>

      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>

      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="110100: [ma_tkdt].Label, [ma_tkdt], [ten_tkdt%l]"/>
      <item value="110100: [ma_tkvt].Label, [ma_tkvt], [ten_tkvt%l]"/>
      <item value="11011: [nh_vt1].Label, [nh_vt1], [nh_vt2], [nh_vt3]"/>

      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
      <item value="11000: [loai_du_lieu].Label, [loai_du_lieu]"/>

      <item value="11: [transactionGrid], [transactionList]"/>

      <item value="110000: [nh_theo].Label, [nh_theo]"/>
      <item value="110000: [tinh_ps].Label, [tinh_ps]"/>
      <item value="1111: [tt_sx1].Label, [tt_sx1], [tt_sx2], [tt_sx3]"/>
      <item value="110000: [ma_gd].Label, [ma_gd]"/>

      <item value="110100: [ma_nx].Label, [ma_nx], [ten_nx%l]"/>
      <item value="110100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>

      <categories>
        <category index="1" columns="120, 30, 70, 100, 100, 130" anchor="6">
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
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvnZPRiKEfPKjxHBmJnvU1lVtlo+1Oh7odASSFZnsPBg9Zo+rjYXqzXYFeMYQpMONV0=</Encrypted>]]>
        &GetTransactionParameter;
        &GetReportFormStockRight;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterQuerying;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9Ge+QSms2Uij978RkGV9TnfSrWh2RRHN+FFd7hHWPzPax6oVVQQPI1rLcZfJr1cd4UpXafLnmDBmrIinOhwrkhAOCqSi4j5ib6GBOCYGm2Rwx15yuYi5I5eOgCg1qybyOpN775j5incFXoyu75PDOOnw4jzCCB2dPi8J6AnOwaUqmWxaaKY58a8MxwmU4L11BzzzWP9eIBMcgpxYxdR1yInc19kWInmfv6JFYR/UQ2ywOUl5TrUTieuF07XcY86XqaT9NAfEVnJU3vOIIir0VZ+qKeTcIOSBNJ6gnzo5E+rOW+81vfys5vmz9+9f1oW8BYmbio0MNEzFNrX6+2D3jqZxwbmnsCbWOOJMr81VrWplmuM/ZppEa8YmzgJqqA/httojXMSPH1jhZdYmZBl+to=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&Yg5kCMHpRxVk0phZxDQR761CGjBXBbOeyKgO4R/VIBCE1kxODN7xEA9N73X462xjbm77Q/U/PuQSi/fYmlvO/EZpVinYkBP/6xQnzkYVWwQ14/qYYZLOjiyzQVLm5yRouejw7bCFH1xh75qcC45D+J2LP4NkJWEu3peOVAFlm/QWchnVREAfXTHSh+4TScrs5BH28uFHCl6vqB5yJ0/uqGJ6Oqnl20u82S41AtruTiMv+z0rfBtaDF4uXSC/MXZ/YO1rhypu8LZITjTZprR+L6D/bTHb5yuHNI6TI546v3BuVL1JIyWY4JLN5k3+GHkq</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFKFyn5nqtVBL8WX4eo6H2kaM07Xa6/jgsfBLWGL2sfcnf/qpxGsTLB620BgwplLOpA==</Encrypted>]]>
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
      &OutlineEntry;
      &SetReportFormStockRight;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtf0ePKWMx2z3mvcfODpAeD6TbO3opaqe/n04Q34AtpZ1kFiw2I6YDJ5nIJArEF00UAQPuE7LmyvOyrWFWtbBGwCHQt4y2S/1bu2xVdxMUrhyLVUd/J2ksxUnw6Msv0VR0uPNrVTb7W8YPnU8E4T1pGonRF1I+8qWafkduVMcTSxoRAnx0DlGzc2Uq3//Dp7z+tJQwc+N9H8W+5tH756uNKBTZSfDLMaA5q69VeH+sU4tIDFV/0lSNmB7Al09VB7alvzaNBJM1FsP5rY5qwCxekWPtJwWyz3aZQdczB1YJKs0zJBOcRDpvkfavcg6CDvJ9VzCDCiIclMOZMDqeaLnnxU=</Encrypted>]]>&FilterExpression;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WS5KX+Q+BeiR6pPmL5zKVo3DbFsvcoq3D47ubR9Ztg1uI+bSyloZvb2OphmC+RidPARQcvh2OflEYz/2vOQTCO/XJ/C9CU06W2m2+cArXP/m7Q8/FNga+WIK7ll4O1Rr1WmMntMqdxjQL2OpBFOhV4enuNYqYjhJP0cnLzQk5L16L1AzlIfs8gsZ+y+R58/VXOEMCvkeBOSh7n40Q5SmhmwFD2ldIFi5tOswLcOKTB6BF+AKzdEUqd70MvPdEWtQjLa2CC/o+XWNd9VlOJlTdAE3u6fLRodIBgthf5v6F4ll7DcPtJBFwfbTN/G24rM5wo9Wj5ZmkgRW4PG1Qxg3fcqR1FiZTO+hZcmVtaJyHB+7Qv7Vf53JjfkyDi69jO8zWSZ39oD1t2htGtOsQ2o+Ti/WVX2IJ8HEkzNlMuT0J8P3h5DJLiClDUCZYtun8yA4HkU+iwCcQ6Jj7eBjcqa9rXW7XLuU1zIZwNEkebzQ8F4bGQZ3RAoK70dwLXtjHcrtrlfD4dkB/s8pxmi9ORsOQ/DSSoTw9MEF5cXRB5QbvDKWtA8vcTRcSrzJ/kByK0T0vxkrBKQ6tpmTRpsQHHHSPf4ntu9Y6I0526qcLztU3ltZbSlFDZ//E5PzYf5r+X8FFbsiMkRtAPfwZiH4xnaXaLMgmK0/wwpxr/m0tFCE8YX/WrRwKk3lNT3idU6nQ1JsE6kNrZBQeGx9CAhF2+EddzvAu947B/Dbby3s1cbknrgLHDCJY3jiLbDjHdKJ5xM9iarD10p/kjMX4nV83NsqF4=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>