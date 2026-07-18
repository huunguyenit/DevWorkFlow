<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">

  <!ENTITY XMLWhenFilterQuerying SYSTEM "..\Include\XML\WhenFilterQuerying.xml">
  <!ENTITY % ReferenceNumber SYSTEM "..\Include\ReferenceNumber.ent">
  %ReferenceNumber;
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"/>
      <footer v="Từ/đến ngày" e="Date from/to"/>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"/>
    </field>
    <field name ="so_ct1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Chừng từ từ số" e="Voucher No. from"></header>
      <footer v="Chừng từ từ/đến số" e="Voucher No. from/to"></footer>
      <items style="Mask"></items>
    </field>
    <field name ="so_ct2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Chừng từ đến số" e="Voucher No. to"></header>
      <items style="Mask"></items>
    </field>

    <field name="tk" categoryIndex="1">
      <header v="Danh sách tài khoản" e="Account List"></header>
      <items style="Lookup" controller="Account" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ghi_no_co" dataFormatString="1, 2, *" clientDefault="*" align="right" categoryIndex="1">
      <header v="Ghi nợ/có" e="Debit/Credit"></header>
      <footer v="1 - Nợ, 2 - Có, * - Tất cả" e="1 - Debit, 2 - Credit, * - All"></footer>
      <items style="Mask"/>
    </field>
    <field name="tk_du" categoryIndex="1">
      <header v="Danh sách tk đối ứng" e="Ref. Account List"></header>
      <items style="Lookup" controller="Account" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ma_hd" categoryIndex="1">
      <header v="Mã hợp đồng" e="Contract Code"></header>
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_hd%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_hd1" categoryIndex="1">
      <header v="Nhóm hợp đồng 1" e="Contract Group 1"/>
      <items style="AutoComplete" controller="ContractGroup" reference="ten_nh_1%l" key="loai_nh = 1 and status = '1'" check="loai_nh = 1"/>
    </field>
    <field name="ten_nh_1%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nh_hd2" categoryIndex="1">
      <header v="Nhóm hợp đồng 2" e="Contract Group 2"/>
      <items style="AutoComplete" controller="ContractGroup" reference="ten_nh_2%l" key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
    </field>
    <field name="ten_nh_2%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nh_hd3" categoryIndex="1">
      <header v="Nhóm hợp đồng 3" e="Contract Group 3"/>
      <items style="AutoComplete" controller="ContractGroup" reference="ten_nh_3%l" key="loai_nh = 3 and status = '1'" check="loai_nh = 3"/>
    </field>
    <field name="ten_nh_3%l" readOnly="true" external="true" categoryIndex="1">
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

    <field name="ma_kh" categoryIndex="3">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" categoryIndex="3">
      <header v="" e=""></header>
    </field>
    <field name="ma_vv" categoryIndex="3">
      <header v="Mã vụ việc" e="Job"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vv%l" readOnly="true" external="true" categoryIndex="3">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" categoryIndex="3">
      <header v="Mã bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" categoryIndex="3">
      <header v="" e=""></header>
    </field>

    <field name="ma_ct" categoryIndex="2">
      <header v="Mã chứng từ" e="Voucher Code"></header>
      <items style="AutoComplete" controller="Voucher" reference="ten_ct%l" key="wedition &lt;&gt; '9' and status = '1'" check="wedition &lt;&gt; '9'"/>
    </field>
    <field name="ten_ct%l" readOnly="true" external="true" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="ma_nt" categoryIndex="2">
      <header v="Ngoại tệ" e="Foreign Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_nt%l" readOnly="true" external="true" categoryIndex="2">
      <header v="" e=""></header>
    </field>

    <field name="maxLength" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="233">
      <item value="120, 25, 75, 100, 100, 130"/>
      <item value="1101: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="11011: [so_ct1].Description, [so_ct1], [so_ct2], [maxLength]"/>

      <item value="11000: [tk].Label, [tk]"/>
      <item value="111000: [ghi_no_co].Label, [ghi_no_co], [ghi_no_co].Description"/>
      <item value="11000: [tk_du].Label, [tk_du]"/>

      <item value="110100: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>
      <item value="110100: [nh_hd1].Label, [nh_hd1], [ten_nh_1%l]"/>
      <item value="110100: [nh_hd2].Label, [nh_hd2], [ten_nh_2%l]"/>
      <item value="110100: [nh_hd3].Label, [nh_hd3], [ten_nh_3%l]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>

      <item value="110100: [ma_ct].Label, [ma_ct], [ten_ct%l]"/>
      <item value="110100: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>

      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>

      <categories>
        <category index="1" columns="120, 25, 75, 100, 100, 130">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="120, 30, 70, 100, 100, 130">
          <header v="Lựa chọn" e="Option"/>
        </category>
        <category index="3" columns="120, 30, 70, 100, 100, 130">
          <header v="Khác" e="Other"/>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHXojy5noBgKx3Sg2+EUbM3n/SN4SW19wrMqzniEJQHDExcSy2vcjQ2ohy0jf7JE8f3iZXZ+OI0SK52lv1/8TrcpiaGMfnB9UUdJ+zWNz1/mgmMftt/yNTMUy5bh3PDTtX1fyIerec5HfZmFPdbQJr7OjFzg+6LtIAHw8eGxKtWOx607er8LR1qopiy5xI8Ki/RJFl96Dg1xlIG5QD7Tgz/hg6MUDP/YS4+8z3S/d0zJcuWk4Wo6772MCmVCX+Bf9ZcS62TSrv8tbFuJDGDmF5Q=</Encrypted>]]>
        &ReferenceParameters;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdJz4tVezh/v2g++gkBwyO+U842/oijbpwGPVMXqJGiJyrR6PdEUCd9mvrnxdf02JKkj8IY4kkxnpH/vfOg67QTMNv+2mUE/pFm1dh78ddd4zQ0ZzSVjry0hxtf8w2UeaND2v34d0+66u0LZWiEzyTZA+oJwMTg0lOdZ2HMWQJZh6ilxMGAwwU3UG/Pf61FSI9ScB/iQgy5yuIBpB7a961ON50Ua09DvfLLrl0z+aSwhY1/pUWybk215sb7lv4kRFwb++cXCwBj3yCEi7IXJEh7jmpjB0x7BSlv+6yUYwV47fRGY+D7zso6XR4F46k8EfJtA1B2gjkC9wzc2553wOOVl9hbaVxQtKS6ztkgDILBYg1umlA7c8w8U2DKHJi57i8DOvxoY0+XVph6++w6DiLAfuTHP35qLpiS1fsZDDGyOOxKKe4aasxeJDbHTJ8NDYyl/5jL1CoYthY3y0YY95S5NcLtZR1mu5C5WPyd1Nl3VxjjKS45/JjKC12FWbDzgwgW8wzDNaNjaWpAzXTutuoIFFIRewR262ooQ0MqJbiVklB4+ICMtBekwp9/Xd1Uv+WcUzYIDbij5PJf8SQs7KId9p2beSQ8Cy38Ghjr/DcuHR</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>