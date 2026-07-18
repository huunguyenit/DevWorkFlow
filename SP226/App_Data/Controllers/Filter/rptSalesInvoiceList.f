<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Controller "rptSalesInvoiceList">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY XMLWhenFilterQuerying SYSTEM "..\Include\XML\WhenFilterQuerying.xml">
  <!ENTITY ReportDataTypeFieldUOM SYSTEM "..\Include\XML\ReportDataTypeFieldUOM.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY Identity "&Controller;">
  <!ENTITY FilterExpression "f._filter$Expression = '&quot;' + f._filter$Pattern + '&quot;.indexOf([ma_ct]) &gt;= 0;';">
  <!ENTITY XMLGetParameter SYSTEM "..\Include\XML\GetTransactionParameter.xml">

  <!ENTITY GetReportFormLimitRight SYSTEM "..\Include\Command\GetReportFormLimitRight.txt">
  <!ENTITY SetReportFormLimitRight SYSTEM "..\Include\Javascript\SetReportFormLimitRight.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
  <!ENTITY % ReferenceNumber SYSTEM "..\Include\ReferenceNumber.ent">
  %ReferenceNumber;
]>

<dir type="Report" id="1" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày chứng từ từ" e="Voucher Date from"></header>
      <footer v="Ngày chứng từ từ/đến" e="Voucher Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
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

    <field name="ma_nvbh" categoryIndex="1">
      <header v="Nhân viên bán hàng" e="Sales Employee"></header>
      <items style="AutoComplete" controller="SalesEmployee" reference="ten_nvbh%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_nvbh%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" categoryIndex="1">
      <header v="Khách hàng" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and (kh_yn=1 or nv_yn=1)" check="kh_yn=1 or nv_yn=1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_kho" categoryIndex="1">
      <header v="Kho hàng" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_vt" categoryIndex="1">
      <header v="Mã hàng" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>

    <field name="tk_dt" categoryIndex="1">
      <header v="Tài khoản doanh thu" e="Revenue Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_dt%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_tk_dt%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="tk_vt" categoryIndex="1">
      <header v="Tài khoản vật tư" e="Item Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_vt%l" key="status = '1'" check="1=1"/>
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
      <items style="Lookup" controller="Unit" key="status = '1'" check="1=1"/>
    </field>
    <field name="mau_bc" clientDefault="20" categoryIndex="1">
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

    <field name="transactionGrid" external="true" clientDefault="0" defaultValue="0" rows="198" categoryIndex="5">
      <header v="" e=""></header>
      <label v="" e=""></label >
      <items style="Grid" controller="TransactionFilter" row="1"/>
    </field>
    <field name="transactionList" readOnly="true" categoryIndex="5">
      <header v="" e=""></header>
    </field>

    &ReportDataTypeFieldUOM;

    <field name="kieu_loc" dataFormatString="1, 2" clientDefault="1" align="right" categoryIndex="2">
      <header v="Kiểu lọc" e="Filter Type"></header>
      <footer v="1 - Tất cả các vật tư trong phiếu, 2 - Chỉ các vật tư theo mã trên" e="1 - All of Items in Invoice, 2 - Only Item Above"></footer>
      <items style="Mask"/>
    </field>
    <field name="ds_ma_gd" categoryIndex="2">
      <header v="Ds mã giao dịch" e="Transaction Code List"/>
    </field>
    <field name="maxLength" readOnly="true" hidden="true" maxLength="-100">
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
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_vv%l" readOnly="true" external="true" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" categoryIndex="9">
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1=1"/>
      <header v="Mã bộ phận" e="Department"></header>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="ma_hd" categoryIndex="9">
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status = '1'" check="1=1"/>
      <header v="Mã hợp đồng" e="Contract"></header>
    </field>
    <field name="ten_hd%l" readOnly="true" external="true" categoryIndex="9">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="258" anchor="5">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="1101: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="11011: [so_ct1].Description, [so_ct1], [so_ct2], [maxLength]"/>

      <item value="110100: [ma_nvbh].Label, [ma_nvbh], [ten_nvbh%l]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>

      <item value="110100: [tk_dt].Label, [tk_dt], [ten_tk_dt%l]"/>
      <item value="110100: [tk_vt].Label, [tk_vt], [ten_tk_vt%l]"/>

      <item value="11011: [nh_vt1].Label, [nh_vt1], [nh_vt2], [nh_vt3]"/>

      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
      <item value="11000: [loai_du_lieu].Label, [loai_du_lieu]"/>

      <item value="11: [transactionGrid], [transactionList]"/>

      <item value="111000: [kieu_loc].Label, [kieu_loc], [kieu_loc].Description"/>
      <item value="11000: [ds_ma_gd].Label, [ds_ma_gd]"/>

      <item value="110100: [ma_nx].Label, [ma_nx], [ten_nx%l]"/>
      <item value="110100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>

      <categories>
        <category index="1" columns="120, 20, 80, 100, 100, 130" anchor="6">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="120, 20, 80, 100, 100, 130">
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
    &XMLWhenFilterQuerying;
    &XMLGetParameter;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4XC7q3/4/UmmtZWkeKS7hP7hp9dtVKP2i41C9h19f+E6v3uHYLtMy+ijUomMg6okHM1i+08CZTUFTJVSyFroAaP9b2xqxPkHLa5V7d1kCVQ0+KGy/MCD3VnXUEdrAqjwRQuNnRRGnnqXcGYpVQm+6g=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&Yg5kCMHpRxVk0phZxDQR71SgY80gXUWSnYVR5OzQ0vJwiUhojKoeht1cCKuYsVnyq/UFjwX7DOSlvyuclEMYolcXsxELqoyeV+pYRj5YRinUPJvsXcg2FJ2256SPBtE4garRpK8hquGzZupwKuM6Ap9DojSPms3hc62Z5vtdrO+DbVmISeBf95XMcgb81v28qcEPHtoQ4mg/+XCA1A8jC1CelfRPalCT+D3W+RVRMESEW3YfyiM/4FGbkB6ejyr3eOH5w1EAL7Lnv+NpaiUDBjdXCJaiLMl9oD9e8dGrzU9smNijulXntMToDtOCrXL6+t2nxOslpJLjcCkjbw7xNfZMiOUfTZvMWd0ZmeRbFmI=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFKFyn5nqtVBL8WX4eo6H2kaM07Xa6/jgsfBLWGL2sfcnf/qpxGsTLB620BgwplLOpA==</Encrypted>]]>
        &ReferenceParameters;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      &SetReportFormLimitRight;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22RUEW0slMShueWy06PcBDyd9ktXeZZLi+u4e3uWzzfV6UBkjyLCJvaQKhV1r6qPPTglkHqnaRjYR8qCTAKvDrzeS2HA8/ZNt2AxtdMgmLBHBPQ0o7/VV7dnRYHScjqViXg6b+HRvUVkLcF7LqbzDLnR84f2HXFhtPyOOsI+AJyr2ciFwtkeVnBwTjxCySNqDHaP4kWJ9HiOgMwnwt+K1mLoHMNFmddXvYsP2RiJX8LhET1KRBfrcoQ8FAR02FXlw9g==</Encrypted>]]>&FilterExpression;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WS5KX+Q+BeiR6pPmL5zKVo3DbFsvcoq3D47ubR9Ztg1uI+bSyloZvb2OphmC+RidPARQcvh2OflEYz/2vOQTCO/XJ/C9CU06W2m2+cArXP/m7Q8/FNga+WIK7ll4O1Rr1WmMntMqdxjQL2OpBFOhV7TNXjFhp3LJTICT32Zw8JXrKDtjXIGLcrIplCD7iR9qFTjMpEQwDs5oYD36TtKHxc6k0ZC3Hg3J266gmXxTXa0jWqPyMbwDgJYW9UyZfs25SHVdKCyI25RgOagCQoLGbOGsra2LRU7q6wu9uGHns9Yi7hk9INJlia6y7NACrK7bQQvVYoy07z2jeigPHi0lYUm/Vpvx40MN4mmeZyPT6XH64v8eNcZ/uFHSJbnduv4o32v0/kaEXKWjFQMVii7yqGufRenIdjdK/KMM49d4q1Yu+GPp92Brf9VXSfYugLgRC/LVODjJIBvxPSDQbFSuArzIRfjO9JQNQJJmvcqTb0CduhwekqBX92Pjt0toGH9Og1/uH/SO7cTN9XSqYS2kmEr0UEYbDv1hS5Ip6e0/kjHU+W0AxLQfLpp34EN7xMRd2D+DotdttvxeBoeyO4edcK8UgVCpLKPA21OtSqOyA2Yp3eRIJBgJXPC3De2YsfE9X/eP85hj7jQREKAK/t3LujiUX+f/anbG7PXglWKgzV/92IJktkjBmzWdAX/m004SNo7PdDRVfnPiNhZm89iUbWHNoCba0c82QixNIwZps3cK5YTXuB8se67LgzglZTUFw==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>