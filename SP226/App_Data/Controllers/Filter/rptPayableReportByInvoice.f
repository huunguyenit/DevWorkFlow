<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY XMLWhenFilterQuerying SYSTEM "..\Include\XML\WhenFilterQuerying.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">

  <!ENTITY DynamicFieldFilterPara ", '#$query'">
]>

<dir id ="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_ht1" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày hạch toán từ" e="GL Date from"></header>
      <footer v="Ngày hạch toán từ/đến" e="GL Date from/to"></footer>
    </field>
    <field name="ngay_ht2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày hoạch toán đến" e="GL Date to"></header>
    </field>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" defaultValue="new Date()">
      <header v="Ngày hóa đơn từ" e="Invoice Date From"></header>
      <footer v="Ngày hóa đơn từ/đến" e="Invoice Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" defaultValue="new Date()">
      <header v="Ngày hóa đơn đến" e="Invoice Date to"></header>
    </field>
    <field name="ngay_tt" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Ngày thanh toán" e="Payment to Date"></header>
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
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_nh1" categoryIndex="1">
      <header v="Nhóm khách 1" e="Customer Group 1"></header>
      <items style="AutoComplete" controller="CustomerGroup" reference="ten_nh1%l" key="loai_nh = '1' and status = '1'" check="loai_nh = '1'"/>
    </field>
    <field name="ten_nh1%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_nh2" categoryIndex="1">
      <header v="Nhóm khách 2" e="Customer Group 2"></header>
      <items style="AutoComplete" controller="CustomerGroup" reference="ten_nh2%l" key="loai_nh = '2' and status = '1'" check="loai_nh = '2'"/>
    </field>
    <field name="ten_nh2%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_nh3" categoryIndex="1">
      <header v="Nhóm khách 3" e="Customer Group 3"></header>
      <items style="AutoComplete" controller="CustomerGroup" reference="ten_nh3%l" key="loai_nh = '3' and status = '1'" check="loai_nh = '3'"/>
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
    <field name="so_du" dataFormatString="0, 1" clientDefault="0" align="right" categoryIndex="1">
      <header v="Số dư hóa đơn" e="Invoice Balance"></header>
      <footer v="1 - Tất cả, 0 - Chỉ xem số dư > 0" e="1 - View All, 0 - Balance > 0"></footer>
      <items style="Mask"/>
    </field>
    <field name="in_hd" dataFormatString="0, 1" clientDefault="1" align="right" categoryIndex="1">
      <header v="Loại" e="Type"></header>
      <footer v="1 - In các hóa đã tất toán, 0 - Không in" e="1 - Print Fully Paid Invoice, 0 - Not Print"></footer>
      <items style="Mask"/>
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

    <field name="maxLength" type="Int16" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
    <field name="nhom" dataFormatString="0, 1" clientDefault="0" align="right" categoryIndex="1">
      <header v="Nhóm theo hợp đồng" e="Group by Contract"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="257">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101-: [ngay_ht1].Description, [ngay_ht1], [ngay_ht2]"/>
      <item value="1101-: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="110--: [ngay_tt].Label, [ngay_tt]"/>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDBaaV766j4XqVMPTsxBNLREYml5fVsJKdoYynEqz4L0O+pibYuU/qJtkP3KIVXp76THQ7csK6n1S0Eghi0Xbtuq+4mCe9nFbHzqWqNzz5hugA84uuKIOkH1+mQN3j1agDgfoKZ0JS4YQhdVK6D3UJq7rQOm81iu/1iYGaHrfPPXkru4CiEtimSMgMAZRjheFuNsClWfKmfRg59fyqmUCQLoN+1V113S8JJELR0RpysUp8MRHbXvuYtiYVnW8ps7FqbpiEJFteC4yZPp+4JwivI=</Encrypted>]]>&DynamicFieldFilterPara;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUP/1R22xXsb+HK8z5v0XkAtyX9qVieEAsEESD4+eOGTdnEuLY8KBjpWHevf1nvEBL8ljpiA9iwVCCpIKdYHX8ya/DAahgK0ov9/M3oRAfcRgd6tmmjDv08kWCEO6o0tOWn9HhUKr7A/rwlE2vELqPEWMCyO8AQeJGEf0+9/YHCIu/FIxwmlszSq/170ayiPDOCGOlWoCSaLF7kMlpiF4QypOZvAGCi+PsixRtHLyS3l1Yhn4HxzXuwQ3fBf/8T0RrsbriSrV3KMyb16in+yXdKJ4V12YJv4Yex/gIpdOs586/7dIz7//AbOKVAww1zjo7mrPE7Uvm9Ket58jPLIqGInybTiRZmM7df0aUMMJOEHIHJgndxq+t7tnmn4CEL+rzPbtjkHTY6ftQR17dyFuHKOp8YcPWSvW60+lWoLrvmkYfmxc4EzNyH2bHsikl1gUvYzQuc9sTsGHxU9Ewcy3UrvHZA1UOldlp0zJhzQu+ZnPTLvVlGgN7HYDd1hHz9lviBEkXYNSETqNGAA/8bEZQzxklPVf0cha6x9C9OmatV4w=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>