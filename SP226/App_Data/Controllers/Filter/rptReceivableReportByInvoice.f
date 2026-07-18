<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">

  <!ENTITY XMLWhenFilterQuerying SYSTEM "..\Include\XML\WhenFilterQuerying.xml">
  <!ENTITY DynamicFieldFilterPara ", '#$query'">
  <!ENTITY % ReferenceNumber SYSTEM "..\Include\ReferenceNumber.ent">
  %ReferenceNumber;
]>

<dir id ="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_ht1" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày hạch toán từ" e="GL Date from"></header>
      <footer v="Ngày hạch toán từ/đến" e="GL Date from/to"></footer>
    </field>
    <field name="ngay_ht2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày hạch toán đến" e="GL Date to"></header>
    </field>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" defaultValue="new Date()">
      <header v="Ngày hóa đơn từ" e="Invoice Date from"></header>
      <footer v="Ngày hóa đơn từ/đến" e="Invoice Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" defaultValue="new Date()">
      <header v="Ngày hóa đơn đến" e="Invoice Date to"></header>
    </field>
    <field name="ngay_tt" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Ngày thanh toán" e="Date to"></header>
      <footer v="Được tt đến ngày" e="Date to"></footer>
    </field>
    <field name="so_ct1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Hóa đơn từ số" e="Invoices No. from"></header>
      <footer v="Hóa đơn từ/đến số" e="Invoices No. from/to"></footer>
      <items style="Mask"></items>
    </field>
    <field name="so_ct2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Hóa đơn đến số" e="Invoices No. to"></header>
      <items style="Mask"></items>
    </field>

    <field name="ma_kh" categoryIndex="1">
      <header v="Khách hàng" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="(kh_yn = '1' or nv_yn = '1') and status = '1'" check="kh_yn = '1' or nv_yn = '1'"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_nh1" categoryIndex="1">
      <header v="Nhóm khách 1" e="Cust. Group 1"></header>
      <items style="AutoComplete" controller="CustomerGroup" reference="ten_nh1%l" key="loai_nh = 1 and status = '1'" check="loai_nh = 1"/>
    </field>
    <field name="ten_nh1%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_nh2" categoryIndex="1">
      <header v="Nhóm khách 2" e="Cust. Group 2"></header>
      <items style="AutoComplete" controller="CustomerGroup" reference="ten_nh2%l" key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
    </field>
    <field name="ten_nh2%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_nh3" categoryIndex="1">
      <header v="Nhóm khách 3" e="Cust. Group 3"></header>
      <items style="AutoComplete" controller="CustomerGroup" reference="ten_nh3%l" key="loai_nh = 3 and status = '1'" check="loai_nh = 3"/>
    </field>
    <field name="ten_nh3%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>

    <field name="tk" categoryIndex="1">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1' and tk_cn = 1" check="tk_cn = 1"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>

    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit" ></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1" />
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

    <field name="so_du" dataFormatString="0, 1" clientDefault="0" align="right" categoryIndex="1">
      <header v="Số dư hóa đơn" e="Invoice Balance"></header>
      <footer v="1 - Tất cả, 0 - Lớn hơn 0" e="1 - All, 0 - Greater than 0"></footer>
      <items style="Mask"/>
    </field>
    <field name="in_hd" dataFormatString="0, 1" clientDefault="1" align="right" categoryIndex="1">
      <header v="Loại" e="Type"></header>
      <footer v="1 - In các hóa đơn đã tất toán, 0 - Không in" e="1 - Print Fully Paid Invoice, 0 - Not Print"></footer>
      <items style="Mask"/>
    </field>
    <field name="nhom" dataFormatString="0, 1" clientDefault="0" align="right" categoryIndex="1">
      <header v="Nhóm theo hợp đồng" e="Group by Contract"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>

    <field name="maxLength" type="Int16" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>



  </fields>

  <views>
    <view id="Dir" height="257">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101-: [ngay_ht1].Description, [ngay_ht1], [ngay_ht2]"/>
      <item value="1101-: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>

      <item value="110--: [ngay_tt].Description, [ngay_tt]"/>
      <item value="11011: [so_ct1].Description, [so_ct1], [so_ct2], [maxLength]"/>

      <item value="11010: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="11010: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="11010: [ma_nh1].Label, [ma_nh1], [ten_nh1%l]"/>
      <item value="11010: [ma_nh2].Label, [ma_nh2], [ten_nh2%l]"/>
      <item value="11010: [ma_nh3].Label, [ma_nh3], [ten_nh3%l]"/>

      <item value="11100: [so_du].Label, [so_du], [so_du].Description"/>
      <item value="11100: [in_hd].Label, [in_hd], [in_hd].Description"/>
      <item value="11100: [nhom].Label, [nhom], [nhom].Description"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>

      <categories>
        <category index="1" columns="120, 30, 70, 100, 100, 130">
          <header v="Thông tin chung" e="General"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    &XMLWhenFilterQuerying;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDBaaV766j4XqVMPTsxBNLREYml5fVsJKdoYynEqz4L0O+pibYuU/qJtkP3KIVXp7/r5XvdNr+P7tlqjcqVVPXMon1eQtUejA1FP44zUfIVM5jUuZCwwsCFUsrXzs/viRl540mkb0FWtwNbZMBZeqZBTRigIbD60hmGHcNp/HyvYI4H4jYEmhdabbOjVY/j3YpGaA5WKgCDcgZ2rjanmxK+5FDpQek57hyImjQA55zzhQ0jIpPQ5MaJz9xYahmuUWA==</Encrypted>]]>&DynamicFieldFilterPara;&ReferenceParameters;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUP/1R22xXsb+HK8z5v0XkAtyX9qVieEAsEESD4+eOGTdnEuLY8KBjpWHevf1nvEBL8ljpiA9iwVCCpIKdYHX8ya/DAahgK0ov9/M3oRAfcRgd6tmmjDv08kWCEO6o0tOWn9HhUKr7A/rwlE2vELqPEerPKYdMwidnj/zXNU7/Quv1AMOheHFPsVd+/e2fJFIbiUDhwRg3xqmieR5gmFesidj6HNN8MwfhizZnPtWTup8eQMWcgWrZ7KaIemEKx+KMOhiwcIi2C41mlniXhaUsrr6tvo2mqfftG4Bu2aL4LdPkAQuu+E34EOWANZUswTQNXfDj7uJzwSw2/x+q4xkJzJqgV3sgFDrs2Nuz1ciW7qGa9OvB+tUEK1d8kl0ZpDuSxm4D3mDWSrxqvcOrU3XiiJ23ji1I2weO/g7kF5uY4elK9sHT7AyObb+pOhllGNH4CtfqtmZLJxo0qTYOGDj6cprJEy5iCp4Bf9d86YdW4n3OAXv6873PjRva7rxyaHdzNVVF+wabykFlpkBGjGgBi/llYKP/bOhAorFpXxWvrfE=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>