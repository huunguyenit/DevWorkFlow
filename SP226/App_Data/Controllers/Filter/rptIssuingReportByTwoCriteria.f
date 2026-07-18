<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Controller "rptIssuingReportByTwoCriteria">
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

  <!ENTITY XMLWhenFilterQuerying SYSTEM "..\Include\XML\WhenFilterQuerying.xml">
  <!ENTITY DynamicFieldFilterQueryLoading SYSTEM "..\Include\Command\DynamicFieldFilterQueryLoading.txt">
  <!ENTITY DynamicFieldFilterQueryString SYSTEM "..\Include\Javascript\DynamicFieldFilterQueryString.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày chứng từ từ" e="Voucher Date from"></header>
      <footer v="Ngày chứng từ từ/đến" e="Voucher Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày chứng từ đến" e="Voucher Date to"></header>
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
    <field name="nh_theo" clientDefault="2">
      <header v="Nhóm theo" e="Group by"/>
      <items style="DropDownList">
        <item value="0">
          <text v="Theo bộ phận" e="By Department"/>
        </item>
        <item value="1">
          <text v="Theo tài khoản đối ứng" e="By Reference Account"/>
        </item>
        <item value="2">
          <text v="Theo khách hàng" e="By Customer"/>
        </item>
        <item value="3">
          <text v="Theo dạng nhập xuất" e="By Reason"/>
        </item>
        <item value="4">
          <text v="Theo mặt hàng" e="By Item"/>
        </item>
        <item value="5">
          <text v="Theo vụ việc" e="By Job"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="ct_theo" clientDefault="4">
      <header v="Chi tiết theo" e="Detail by"/>
      <items style="DropDownList">
        <item value="0">
          <text v="Theo bộ phận" e="By Department"/>
        </item>
        <item value="1">
          <text v="Theo tài khoản đối ứng" e="By Reference Account"/>
        </item>
        <item value="2">
          <text v="Theo khách hàng" e="By Customer"/>
        </item>
        <item value="3">
          <text v="Theo dạng nhập xuất" e="By Reason"/>
        </item>
        <item value="4">
          <text v="Theo mặt hàng" e="By Item"/>
        </item>
        <item value="5">
          <text v="Theo vụ việc" e="By Job"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="ma_kh" categoryIndex="1">
      <header v="Khách hàng" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and (kh_yn = '1' or cc_yn = '1' or nv_yn = '1')" check="kh_yn = '1' or cc_yn = '1' or nv_yn = '1'"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nh_kh1" categoryIndex="1">
      <header v="Nhóm khách" e="Customer Group"></header>
      <items style="AutoComplete" controller="CustomerGroup" key="status = '1' and loai_nh=1" check="loai_nh=1"/>
    </field>
    <field name="nh_kh2" categoryIndex="1">
      <header v="" e=""></header>
      <items style="AutoComplete" controller="CustomerGroup" key="status = '1' and loai_nh=2" check="loai_nh=2"/>
    </field>
    <field name="nh_kh3" categoryIndex="1">
      <header v="" e=""></header>
      <items style="AutoComplete" controller="CustomerGroup" key="status = '1' and loai_nh=3" check="loai_nh=3"/>
    </field>
    <field name="ma_kho" categoryIndex="1">
      <header v="Kho hàng" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_vt" categoryIndex="1">
      <header v="Vật tư" e="Item Code"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1=1"/>
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
    <field name="ma_loai_vt" categoryIndex="1">
      <header v="Loại vật tư" e="Item Type"></header>
      <items style="AutoComplete" controller="ItemType" reference="ten_loai_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_loai_vt%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nh_vt1" categoryIndex="1">
      <header v="Nhóm vật tư" e="Item Group"/>
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

    <field name="mau_bc" categoryIndex="1" clientDefault="20">
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

    <field name="maxLength" readOnly="true" hidden="true" maxLength="-100" categoryIndex="1">
      <header v="" e=""></header>
    </field>

    <field name="transactionGrid" external="true" clientDefault="0" defaultValue="0" rows="200" categoryIndex="5">
      <header v="" e=""></header>
      <label v="" e=""></label >
      <items style="Grid" controller="TransactionFilter" row="1"/>
    </field>
    <field name="transactionList" readOnly="true" categoryIndex="5">
      <header v="" e=""></header>
    </field>


    &ReportDataTypeField;

    <field name="tinh_ps" clientDefault="1" categoryIndex="2">
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
    <field name="ds_ma_ct" hidden="true" readOnly="true" clientDefault="" categoryIndex="2">
      <header v="" e=""/>
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
      <header v="Mã bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="ma_hd" categoryIndex="9">
      <header v="Mã hợp đồng" e="Contract"></header>
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_hd%l" readOnly="true" external="true" categoryIndex="9">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="260" anchor="6">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="1101: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="11011: [so_ct1].Description, [so_ct1], [so_ct2], [maxLength]"/>
      <item value="11000: [nh_theo].Label, [nh_theo]"/>
      <item value="11000: [ct_theo].Label, [ct_theo]"/>

      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="11011: [nh_kh1].Label, [nh_kh1], [nh_kh2], [nh_kh3]"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="110100: [tk_vt].Label, [tk_vt], [ten_tk_vt%l]"/>
      <item value="110100: [ma_loai_vt].Label, [ma_loai_vt], [ten_loai_vt%l]"/>
      <item value="11011: [nh_vt1].Label, [nh_vt1], [nh_vt2], [nh_vt3]"/>

      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
      <item value="11000: [loai_du_lieu].Label, [loai_du_lieu]"/>

      <item value="11: [transactionGrid], [transactionList]"/>

      <item value="110000: [tinh_ps].Label, [tinh_ps]"/>
      <item value="1: [ds_ma_ct]"/>

      <item value="11100: [ma_nx].Label, [ma_nx], [ten_nx%l]"/>
      <item value="11100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="11100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="11100: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>

      <categories>
        <category index="1" columns="120, 30, 70, 100, 100, 130"  anchor="6">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="120, 25, 25, 25, 125, 100, 130, 0">
          <header v="Lựa chọn" e="Option"/>
        </category>
        <category index="5" columns="569, 0" anchor="1">
          <header v="Giao dịch" e="Transaction"/>
        </category>
        <category index="9" columns="120, 100, 100, 100, 130" anchor="4">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvnZPRiKEfPKjxHBmJnvU1lVtlo+1Oh7odASSFZnsPBg9Zo+rjYXqzXYFeMYQpMONV0=</Encrypted>]]>&GetReportFormLimitRight;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>&DynamicFieldFilterQueryLoading;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcM0GUti1kCp50u/Joaj4mLrRFBFrkg61EVyh0XGpA19zx05m0tH1OgdPSKya+jhQB92mZjn9Ot4aMXMuRM9wUx/xclTHT0ytQP5YzsDNDeJ2</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterClosing;
    &XMLGetParameter;
    &XMLWhenFilterQuerying;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1h4xrvw7Ublpokj09ZSq60hEdEdm3OSpHWLa6UmUpvFnA3s2Q7V/GuypxGAfR4up7lYH7jAK4Qd5unpU/Yo1kUJ5u7s6T6jL1jaf3stSoO3jYMc1ZH+b/dVIy8nwzjitUIYlT5krvmEF6lqUuTn24FBNQsM2WIjfR79SaewpQzRozjbAn8WUfPAjfC69ny7amA+1rNRPv7lENJFF8K5Ha69//dVO+xGaAoitDwYnc4WlZV6/hQMowEqUPQfU2eJ6PiuPgVQIQfLFFWtPALPTuAJoAmNTklpqPWGAMRi7CduknKVnzrDvDOQSMzPGCYGtdP6ZJl3HlrtH8zaoeT2MzYFKSTyohWl7iYHwaHlJnTX75rUv72QezWA4jaN8WIy/+dlxLAmle9rGcE5brOKXnqBEQQAlyD4wZFk/ZyqVMbK6rERtOQtJWEma71dxdYRNX1edP+YypJUA3kBlo2GnI0=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFKFyn5nqtVBL8WX4eo6H2kaM07Xa6/jgsfBLWGL2sfcnf/qpxGsTLB620BgwplLOpA==</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2Eas5AOj3BMluOxZoC8msUkCVo8bt463B6p135qdy7W2pmIA6f+Ge+qllO5r9kv+hJhXTeAlCokFiek9wyLpBkGHxWbN4Vw7pSXC6nI6B9VIOCv0wgza5OdTnJUTNld1nTbsfEuB9zAVoBVePpjYxv7MlSYQucqtuXwHfVOtZ1jBSqtamsetv1KD9/RkmdkmVCu/20QacPnA7suExYD8ySXGo+5V0Eh09fB7G/2ipvTOv9c4YkAK8L0TgUVPmp0D1jHWPfZ2Ptp8cKKeMNCQjpVJaQif21+yoEaZQk8nj9POzbOJyjpbUT5tUMXCxcmAViKgATaf3ISoC/X8mG9HvrWBlI0DJ2f2LuR4hwO0X2e1L</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      &ScriptQueryFilterString;
      &SetReportFormLimitRight;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtf0ePKWMx2z3mvcfODpAeD6TbO3opaqe/n04Q34AtpZ1kFiw2I6YDJ5nIJArEF00UAQPuE7LmyvOyrWFWtbBGwBgyL6KHd5WuNQ76CzdLuN+PK7okUWVEicO7rlu4i+8pt9teT9NKu7lAJjzujmUh7Rs5i5+yYJEEvMAVa0UBLvv2kadT8kq9Smf+TcebPKCnYavTEb1EViw9ofwI1wqO52VJqtf1gPJs9xvGo9+Eo0+Aex46lKH4hNe/J1RMM/H5BWE9Bc7E/KMy2igdDh0yYtlV6a75jzMuZJJYAgjPjm7KiioWEpRyJpgvryjDDlgNBjg7Sugvu2iAwkVRsrfID/h0PRQvWdYBzZRAm3S4GR4</Encrypted>]]>&FilterExpression;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WS5KX+Q+BeiR6pPmL5zKVo3DbFsvcoq3D47ubR9Ztg1uI+bSyloZvb2OphmC+RidPARQcvh2OflEYz/2vOQTCO/XJ/C9CU06W2m2+cArXP/m7Q8/FNga+WIK7ll4O1Rr1WmMntMqdxjQL2OpBFOhV6UTbm7MpDfgvjaTDA7DJY2F21wtYIorNRZadVMmP5Eo8ePNkfDLK7pWspSiOdk44cunxrZnQ9cMW3Zwcx+etAfAWOdOS/tZ94l0u7SK/wV1MGYtSpFWQ+0jcjH9NnLZIFz82AFBVJ9xo13Rqo801E/ljStNyhLfQun7DLcFyU3yfh/qwLueHzX8Wfnbw0m569CeHv3uztPGY7RKtwYNbLNGIBsWyYXwEEK6qL9THsOG7PxxIvMD6ibZwdO45RWU78WknIViV3bJsVe2ZvF32BnrKWDbzAwNluVKX5JGLpdDDkQtdOCdxz3V5eX7VbIZ7UhFm8Xeg7lMeiBz0KsKbS+kb6eX1GF5wcAqtvRYLTHkMSpRFvlsxItFPDg7czMWe+Xs2y/CPFUoXAsQUVz0Kzll/fewjybro1ZttQkI5q47kCOHlhllqUmXo3u9chPiO/ds1X+NVqWO9wxx5f01Ulfv6AsLj79TQoDAWumXRar21QRJzcqCxtR/pozS9FZvwcwf5bawYxL689T49TCyYavk+FIBa3Kx0hdz0mHK/oQTW4l4NUMcatqQIQG1SiHsLFi7rsmhBBISSaOjFQ1AcOlDpq2Erpls7061lA3p3UZRlfjHnvqzGaSAZOboKRN81nqxvjZa8NXlwRwaXFld9RkClRhA1k0vW489CunalenI+2Dz7DMgm5Nzo9eNoab1Vr7ctqxRSgm77L/fZTfpShKe0fX+pC2S11avdPiv7ibqQsCWMwt98tZBp+pwBgt66mfK/zn2fDjHJpr9id5g2Wk+6MWzPl6xDT1otd08h2nMg3b0FpAen0lNurxINjjEHdlbTP8csVxHGDJloHcTPC9MjAoUs0NmzuZLroDRZ/3RJ/gegz/Qnbu3DqzuzP4/kQ=</Encrypted>]]>&DynamicFieldFilterQueryString;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cfXzjS38uezLSIfGVrlckrGuu0YTcjH+qld+KLUxSonsG86bxVFfRVCzTimjlSxT1zZriEVIY/vkI6YBJHrcaTc9E8pumrsMpXy6Yg+LYOJngKRf6ECxB51/Kp+SEFF/fLfmOtC/8rmFJp5NWj8/HlEIalXW6T8j+GFb/uhSXPM</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>