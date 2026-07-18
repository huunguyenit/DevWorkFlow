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

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="date_from" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày hạch toán từ" e="GL Date from"/>
      <footer v="Ngày hạch toán từ/đến" e="GL Date from/to"/>
    </field>
    <field name="date_to" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày hạch toán đến" e="GL Date to"/>
    </field>
    <field name="invdate_from" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày hóa đơn từ" e="Invoice Date from"/>
      <footer v="Ngày hóa đơn từ/đến" e="Invoice Date from/to"/>
    </field>
    <field name="invdate_to" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày hóa đơn đến" e="Invoice Date to"/>
    </field>
    <field name="date" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Được tt đến ngày" e="Receive to Date"></header>
    </field>
    <field name ="so_ct1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="invoiceNumber">
      <header v="Hóa đơn từ số" e="Invoices No. from"></header>
      <footer v="Hóa đơn từ/đến số" e="Invoices No. from/to"></footer>
      <items style="Mask"></items>
    </field>
    <field name ="so_ct2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="invoiceNumber">
      <header v="Hóa đơn đến số" e="Invoices No. to"></header>
      <items style="Mask"></items>
    </field>
    <field name="tk" categoryIndex="1">
      <header v="Tài khoản" e="Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1' and tk_cn = 1" check="tk_cn = 1"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_kh" categoryIndex="1">
      <header v="Mã khách" e="Customer"/>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1= 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="nh_kh1" categoryIndex="1">
      <header v="Nhóm khách 1" e="Customer Group 1"/>
      <items style="AutoComplete" controller="CustomerGroup" reference="ten_nh_kh1%l" key="loai_nh = 1 and status = '1'" check="loai_nh = 1"/>
    </field>
    <field name="ten_nh_kh1%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="nh_kh2" categoryIndex="1">
      <header v="Nhóm khách 2" e=" Customer Group 2"/>
      <items style="AutoComplete" controller="CustomerGroup" reference="ten_nh_kh2%l" key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
    </field>
    <field name="ten_nh_kh2%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="nh_kh3" categoryIndex="1">
      <header v="Nhóm khách 3" e="Customer Group 3"/>
      <items style="AutoComplete" controller="CustomerGroup" reference="ten_nh_kh3%l" key="loai_nh = 3 and status = '1'" check="loai_nh = 3"/>
    </field>
    <field name="ten_nh_kh3%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="invoice" dataFormatString="1, 0" clientDefault="0" align="right" categoryIndex="1">
      <header v="Số dư hóa đơn" e="Invoice Balance"></header>
      <footer v="1 - Tất cả, 0 - Chỉ xem số dư > 0" e="1 - View All, 0 - Balance > 0"></footer>
      <items style="Mask"/>
    </field>
    <field name="print" dataFormatString="1, 0" clientDefault="1" align="right" categoryIndex="1">
      <header v="Loại" e="Type"></header>
      <footer v="1 - In các hóa đã tất toán, 0 - Không in" e="1 - Print Fully Paid Invoice, 0 - Not Print"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" clientDefault="10" categoryIndex="1">
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
    <field name="maxLength" type="Int16" readOnly="true" hidden="true" maxLength="-100" categoryIndex="1">
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
      <item value="1101--: [date_from].Description, [date_from], [date_to]"/>
      <item value="1101--: [invdate_from].Description, [invdate_from], [invdate_to]"/>
      <item value="110---: [date].Label, [date]"/>
      <item value="1101--: [so_ct1].Description, [so_ct1], [so_ct2]"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [nh_kh1].Label, [nh_kh1], [ten_nh_kh1%l]"/>
      <item value="110100: [nh_kh2].Label, [nh_kh2], [ten_nh_kh2%l]"/>
      <item value="110100: [nh_kh3].Label, [nh_kh3], [ten_nh_kh3%l]"/>
      <item value="1110--: [invoice].Label, [invoice], [invoice].Description"/>
      <item value="111000: [print].Label, [print], [print].Description"/>
      <item value="11100: [nhom].Label, [nhom], [nhom].Description"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110001: [mau_bc].Label, [mau_bc], [maxLength]"/>

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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKK1BRPJgsUqzblUsPyGwOfExZ33TM/SCIg1uNlHGL9Bdz+aiKWIHMABs/k5FchJHeGBsh54C75WA+v9KIGosDbSSypGvdI4tK3jc9lRDZOGHR1imbModoLIxy/I4Zjx6VtQ4BAVWf/TZ02S2AhqyKfjIWqPo6cJeNjwNCnYBh/O48OojXdTthyeEJiQuS2lxUkg2aH+qvsz5Se05gBWcLlTaDvZVzf/0/znliAlJFOjuYKH0c24hwlrj2PS23H+gw==</Encrypted>]]>&DynamicFieldFilterPara;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUP/1R22xXsb+HK8z5v0XkAsxodt4i3T1nCjZSColJpwBJy1ohojHO92WLpZubqQM+4hkV9lwZhwUW+NVFh7iV1V8hOJ3fHY+30alutestMHwSyZPEGl+iPGvUsXakjMSYXjginHkHdKZym98qGp018AQ/1+YHAPrb6MkWDlmOLWBiFHuXEaiTPxY4CHa05HbdhvlQfkdxolVSblYI00w9jdQ+4131P8xNoiD65GIZ4/PQPK43/P1vD7+JgiJTTyej24ZnWZK9wsCdd+5Mj5mGrJWncH7HeEEoqxgTEdsEBqt46N80oJ15AfidtCEtzPQEyMng4mbC3/4Zcrd0kve8GreIw/CmRXxBHXh34v4PXK2zt+SztBioIEM9u8mZeAFZBsM65F5D+LTDyrdSNsuMHOY6Ju619vszy/wYYn7Az2nxOQd4QPK0QL9OOFRiuwY1Cd52HBSimW2aYjmuZqC+y+1QvjgSXtSl1tAn8l3goy8NmZLcwwTDrsri3V2fTuDTIdjNuV1pLj0SZKkkVzfUx7aGXSvwEnYtaMcyNEtMp9M=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>