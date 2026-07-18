<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Controller "rptSalesOrderComparison">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY GetReportFormLimitRight SYSTEM "..\Include\Command\GetReportFormLimitRight.txt">
  <!ENTITY SetReportFormLimitRight SYSTEM "..\Include\Javascript\SetReportFormLimitRight.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">

  <!ENTITY % SOApproval SYSTEM "..\Include\SOApproval.ent">
  %SOApproval;
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày đơn hàng từ" e="SO Date from"></header>
      <footer v="Ngày đơn hàng từ/đến" e="SO Date from/to"></footer>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày đơn hàng đến" e="SO Date to"></header>
    </field>
    <field name="so_dh1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100">
      <header v="Đơn hàng từ số" e="SO No. from"></header>
      <footer v="Đơn hàng từ/đến số" e="SO No. from/to"></footer>
      <items style="Mask"></items>
    </field>
    <field name="so_dh2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100">
      <header v="Đơn hàng đến số" e="SO No. to"></header>
      <items style="Mask"></items>
    </field>
    <field name="ngay_tu2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Phát sinh xuất từ" e="Issuing Date from"></header>
      <footer v="Phát sinh xuất từ/đến" e="Issuing Date from/to"></footer>
    </field>
    <field name="ngay_den2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Phát sinh xuất đến" e="Issuing Date to"></header>
    </field>
    <field name="giam_tru_yn" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Tính giảm trừ" e="Calculate Deduction"/>
      <footer v="0 - Không, 1 - Có" e="0 - No, 1 - Yes"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_kh">
      <header v="Khách hàng" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and (kh_yn=1 or nv_yn=1)" check="kh_yn=1 or nv_yn=1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_vt">
      <header v="Mặt hàng" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kho">
      <header v="Kho xuất" e="Issuing Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="ngay_giao" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Hạn giao hàng" e="Due Date"></header>
    </field>

    &SOFilterStatusField;

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc">
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
  </fields>

  <views>
    <view id="Dir" height="210">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="1101: [ngay_tu].Description, [ngay_tu], [ngay_den]"/>
      <item value="1101--1: [so_dh1].Description, [so_dh1], [so_dh2], [maxLength]"/>

      <item value="1101: [ngay_tu2].Description, [ngay_tu2], [ngay_den2]"/>
      <item value="111000: [giam_tru_yn].Label, [giam_tru_yn], [giam_tru_yn].Description"/>

      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>

      <item value="110: [ngay_giao].Label, [ngay_giao]"/>
      <item value="11000: [status].Label, [status]"/>

      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvnZPRiKEfPKjxHBmJnvU1lVtlo+1Oh7odASSFZnsPBg9Zo+rjYXqzXYFeMYQpMONV0=</Encrypted>]]>&GetReportFormLimitRight;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcM0GUti1kCp50u/Joaj4mLrRFBFrkg61EVyh0XGpA19zx05m0tH1OgdPSKya+jhQB92mZjn9Ot4aMXMuRM9wUx/xclTHT0ytQP5YzsDNDeJ2</Encrypted>]]>
      </text>
    </command>
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuy83kk4airzT8cLd6DkoBHtd/vPemTM98HPG61JBrPShVH5iJeRvUE1N/zP8ZkF8jrnzmxUsxm56t6Dgi8PYJHYNEYywwAF3S89gAaPczCuNWd6RvpnLs8dWu6b29w6hWAkl0fi8Y3IKzxDclNCFK9yPlflMbCdDk6vPsKsNgZqAa1NBW/TcfECwWL0b9rOji/BAQWCK4RcWa+h2rhO8Pkr1cRg8GMQXSn/0BlCVbRr5nWgf7HDAy1Cfra6J6N4wVYVP0gHAdPKX2DI1gDE7NJ8EAUZX5tt22/9O+S+TUMQZftmeuZBRCYfZjDPOa//7arRq+Tg8yq6QU76jpMdi1o3dwZloDKVMMku06LmvHMYmU0uhzMCWU+5+4kahdVxPiwK2XXbxtPQMqtSNEwh0+V0mDZa7gfL8d+S1rm/qqReZUwBSO+q+h1FyzBU+mMqllWJaLm3prtoCxVw7EOdSphB3e+RRc0y5iQF6c6RmvqOEDZ7pMyo53Ev1/pKu0OmMXqJC5IrtuAP3mPTbm4orR49eNUwrZpM4MOnnT6Uv2furRX2UC3Mnuve/z5EkTW8t/j/dpnA+9C6uT1RdT96VAMYgalgyE5ZtCpaNnjGrpPL5clSwoIA9U9tEMjBIm9KA8w==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFKFyn5nqtVBL8WX4eo6H2kabgBcKsgcm4iH2SLI2Ez1+</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      &SetReportFormLimitRight;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUaG0xOv0B+TlH+OdNVwzhzuc5iFEHMRQESCcCnFdbRaZ38bLFS6sqCpfsUh9e0R/mFrfwjqMPpkVmvqDBsA43H9zrFlA2fMfgey9NJenBI51xz1E8jc1L45iF6VJfDKxqjNZth0g6h7gvQ+G+W7msXUSWpSqNiAH6UWM647Jdcm7BW7KOEZf7Q1irz7mZ+vlcc810mImkS5DutjZgQOMjxph/opUKJ+1nkoUruLJDbfSvpO5+xU/NFbSw+AqiUAPkcDYTvH+bYIfM7TbOmjFhiQSWCSI3odLHJtF7iqkdwwoh5HbS/G0WJZe3rFaqA5tX8xM0yBmcwfBOojZKkyOIiMyheF/I37fuf4F6epozqR9odHWl+aHfIAw/x4xHSza/Fu25pwzCxyBr5QkTjlxaIhDFd/xYIAyYjJmYzCtyNjW42kJ/8nf2oSyJP3EPoUU/oSCn590TlrUGudvb5C/xfTXhuKGaNy+DitTAkceoLH+j9rZPesYYB5WuwuRFCtP7dHxYGbDcYWiD7vm7wFwsBtDJeiDRIfnR0Y3H0DrRD/AKQbOkjegWGkxZJ/mdX/SXsXoSGNQWzLiZNxDy1ZKQVzvxX+vInFW3KEZ9ma5xQ1FFmLACG4HsSZJHY96ZDlz58ME9mUG+i44C+a0Snbyizm5hh82G5vHOrtT6l+LLcbNJGtRYARRgHJovo/Wgb0TFPKOlTLfxip5p9ZRWM+AzARnis0ZimTlr3LOZ5XOMm1vlSW8PJvswEX4Alq2Hq+3AptHUUf7bGXr1kbRKbuqz2FPBWFg/HmqY3Oaomz33OcIGD0sP5gyVpFuVO+1f4gEsT50zGmXrGFdhwtGsnscobQ==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>