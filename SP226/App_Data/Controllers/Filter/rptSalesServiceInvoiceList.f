<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">

  <!ENTITY Identity "rptSalesServiceInvoiceList">
  <!ENTITY XMLWhenFilterQuerying SYSTEM "..\Include\XML\WhenFilterQuerying.xml">
  <!ENTITY DynamicFieldFilterPara ", '#$query'">
  <!ENTITY % ReferenceNumber SYSTEM "..\Include\ReferenceNumber.ent">
  %ReferenceNumber;
]>

<dir type="Report" id="1" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="date_from" type="DateTime" dataFormatString="@datetimeFormat" aliasName="fromDate" defaultValue="new Date()" allowNulls="false">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="date_to" type="DateTime" dataFormatString="@datetimeFormat" aliasName="toDate" defaultValue="new Date()" allowNulls="false">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name ="voucher_from" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Chừng từ từ số" e="Voucher No. from"></header>
      <footer v="Chừng từ từ/đến số" e="Voucher No. from/to"></footer>
      <items style="Mask"></items>
    </field>
    <field name ="voucher_to" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Chừng từ đến số" e="Voucher No. to"></header>
      <items style="Mask"></items>
    </field>

    <field name="ma_nvbh" categoryIndex="1">
      <header v="Nhân viên bán hàng" e="Sales Employee"/>
      <items style="AutoComplete" controller="SalesEmployee" reference="ten_nvbh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_nvbh%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_kh" categoryIndex="1">
      <header v="Khách hàng" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and (kh_yn = 1 or nv_yn = 1)" check="kh_yn = 1 or nv_yn = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="tk" categoryIndex="1">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
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

    <field name="ma_ct" categoryIndex="1">
      <header v="Danh sách chứng từ" e="Voucher List"></header>
      <items style="Lookup" controller="Voucher" key="wedition &lt;&gt; '9' and status = '1' and dbo.ff_Inlist(ma_ct, (select rtrim(parameter) from @@sysDatabaseName..wcommand where sysid = '&Identity;')) = 1" check="wedition &lt;&gt; '9' and dbo.ff_Inlist(ma_ct, (select rtrim(parameter) from @@sysDatabaseName..wcommand where sysid = '&Identity;')) = 1"/>
    </field>

    <field name="ma_vv" categoryIndex="1">
      <header v="Mã vụ việc" e="Job"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vv%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" categoryIndex="1">
      <header v="Mã bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_hd" categoryIndex="1">
      <header v="Mã hợp đồng" e="Contract"></header>
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_hd%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>

    <field name="maxLength" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="233">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101: [date_from].Description, [date_from], [date_to]"/>
      <item value="1101: [voucher_from].Description, [voucher_from], [voucher_to]"/>

      <item value="110100: [ma_nvbh].Label, [ma_nvbh], [ten_nvbh%l]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110001: [mau_bc].Label, [mau_bc], [maxLength]"/>

      <item value="11000: [ma_ct].Label, [ma_ct]"/>

      <item value="110100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>

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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuzC2e1t9/sd9qn3dLkStO2zf6j6jEVPCsgvG1oRN35WgIoCthYCLDfaLsRF9S7wd6Su8v2UWMGIUAkdeRuLcpuOI00sP1HJ5VsrTehdHJUuUDWGeIKWBhsom2iJhYcUjdy9+qrOCLxuS/3jUVZjpD7I=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&Yg5kCMHpRxVk0phZxDQR761CGjBXBbOeyKgO4R/VIBBqujkCc/fEnYaiKG47ud9GQui4RSU1QUupPPg/D/WaoIArzEIIdbIqA7bMwG5nViYyDKQJAejARtlzE2WI+qi/WvmPWNGuRJW4Zltn7Y742+ZmWQnM7koEMwzsawox10/f1c3n7nGXWuSMSlD5/iGLN9fXCLBF+087I0reGaWLxPT6DYDlch8kC9VQRSSAk1kcZrAKXP9gP5l/DfMs0yqy</Encrypted>]]>&DynamicFieldFilterPara;&ReferenceParameters;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUi30Q+BpO/bP+zPvgBi3cRJqg4+jVkuOKO3ttBzQ7r05/LdoTPQqQSJ9ixHsRaX4KhQfpIR3yZiB7SXGzTg+XerA9xsfLjgJzuPGd5Tm0ERSbkv+wmC6CDMK/RV26c2hLgt9WvQTQqRVYTQ/alM6v5qCw6m53FRrIUA/Ok2okGPpNZoTvt9pLiucpA+aHBCsNgMkpayiU8GB/sh1Wjl0ed//cyElCAsxMzySzF0Kcax/BrUHvkxW7peridSRjVuklcwnrf5LvL8EtX1nlsXOJUONtGLqgFSF7KeInIlVkMbmJKhJhyKwjd6Dq6boLSCKJzzaC2J+GDYRO6LpEPmvIZBhFgZq3Sjs9JS/gxnNQcjMa+BvZwpesgeeaWOsJ+qULp3kU3nt40nevz8qkip4kTvbPe4lW8bLgX3CyZfGI7JzLnH0Q+aLWnQbhPI9ipjXdu+Kdxw73uiDP3i0OZAwcCg==</Encrypted>]]>
    </text>
  </script>
  &OutlineCss;
</dir>