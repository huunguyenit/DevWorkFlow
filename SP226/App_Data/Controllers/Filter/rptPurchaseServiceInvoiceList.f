<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">

  <!ENTITY Identity "rptPurchaseServiceInvoiceList">
  <!ENTITY XMLWhenFilterQuerying SYSTEM "..\Include\XML\WhenFilterQuerying.xml">
  <!ENTITY DynamicFieldFilterPara ", '#$query'">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="date_from" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày chứng từ từ" e="Voucher Date from"/>
      <footer v="Ngày chứng từ từ/đến" e="Voucher Date from/to"/>
    </field>
    <field name="date_to" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày chứng từ đến" e="Voucher Date to"/>
    </field>
    <field name="voucher_from" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Chứng từ từ số" e="Voucher No. from"></header>
      <footer v="Chứng từ từ/đến số" e="Voucher No. from/to"></footer>
      <items style="Mask"></items>
    </field>
    <field name="voucher_to" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Chứng từ đến số" e="Voucher No. to"></header>
      <items style="Mask"></items>
    </field>

    <field name="ma_kh" categoryIndex="1">
      <header v="Nhà cung cấp" e="Supplier"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and (cc_yn = 1 or nv_yn = 1)" check="cc_yn = 1 or nv_yn = 1"/>
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
    <view id="Dir" height="209">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101: [date_from].Description, [date_from], [date_to]"/>
      <item value="1101: [voucher_from].Description, [voucher_from], [voucher_to]"/>

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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuzC2e1t9/sd9qn3dLkStO2zf6j6jEVPCsgvG1oRN35Wgexo0wYSrwj/bjRwWX4oeJVdmBlmLswVe4oy9ABHcaVgFtCTjph7EJnoCTTHIS5zkpWMiJaVohSwaWOPtsjNGLDvOgD02P+dnUtjHTcaJghvnyMPlMZZWao7KZ+cRuOFZ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&Yg5kCMHpRxVk0phZxDQR7w/HUYeu03kidMDCBXjmPVZ6S3Z1ZeXsGKNPrnkMpsWBJcajLkz3tyUOcjc7Of4BI4Otd1mkaD9MX0E/klMg7UIGxWFTm7fKZ09L8J9tZmugJ7T1W1eLpG/jgKDUl9/dmgNQd0gwnvKwfiWW7KkqJeP4LKk/vKc4C4Xce+tHgrjvMJTBAOIo+6nK1JbmXyGAoI/MTWqk0zjMntUnE8CGj5Q=</Encrypted>]]>&DynamicFieldFilterPara;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUi30Q+BpO/bP+zPvgBi3cRJqg4+jVkuOKO3ttBzQ7r05/LdoTPQqQSJ9ixHsRaX4KhQfpIR3yZiB7SXGzTg+XerA9xsfLjgJzuPGd5Tm0ERSbkv+wmC6CDMK/RV26c2hLgt9WvQTQqRVYTQ/alM6v5qCw6m53FRrIUA/Ok2okGPpNZoTvt9pLiucpA+aHBCsNgMkpayiU8GB/sh1Wjl0ed//cyElCAsxMzySzF0Kcax/fDYwTwz/hlObi0q5erNGBFQo5b/ak48P7TZfksH1Y54NdjYLMwgF9KS182GnoiiBmb45OrK21ljLZsAPX5AmAbJdhhRFCIc6zMZlR682uwPd9465peJKKaSH+/n6D8x2CSyTTtXab6w1EjrOdx2T2rMf/Mzktvl7l86KHRTCE1L6+yrcsHSioqo3FNRn+1Zsrh7E/pvLJOFbm9Lbvr4SllFRwtfRPKx7u+guLpS912w==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>