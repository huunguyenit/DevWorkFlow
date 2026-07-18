<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Controller "rptSOStatusReport">
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
      <header v="Ngày đặt hàng từ" e="SO Date from"></header>
      <footer v="Ngày đặt hàng từ/đến" e="SO Date from/to"></footer>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày đặt hàng đến" e="SO Date to"></header>
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

    <field name="nh_theo" dataFormatString="1, 2, 3" clientDefault="1" align="right" categoryIndex="2">
      <header v="Nhóm theo" e="Group by"/>
      <footer v="1 - Theo số đơn hàng, 2 - Theo vật tư, 3 - Theo khách hàng" e="1 - By Sales Order No., 2 - By Item, 3 - By Customer"></footer>
      <items style="Mask"/>
    </field>

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
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
    <field name="maxLength" type="Int16" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="210">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="1101: [ngay_tu].Description, [ngay_tu], [ngay_den]"/>
      <item value="1101--1: [so_dh1].Description, [so_dh1], [so_dh2], [maxLength]"/>

      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>

      <item value="110: [ngay_giao].Label, [ngay_giao]"/>
      <item value="11000: [status].Label, [status]"/>
      <item value="111000: [nh_theo].Label, [nh_theo], [nh_theo].Description"/>

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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuy83kk4airzT8cLd6DkoBHtd/vPemTM98HPG61JBrPShVH5iJeRvUE1N/zP8ZkF8jkBVS0aaQ9B0JhnyWKHVCs7lUGsyIzLlUPl898dJriJV1Kz/PNShQ+EjGr9P7WTGhwBIv0K7eDslmsSiZiNlSEiSj09FwCP8BCMsuTGjVs8kZOBUOWZUuGZEKGKCeo3dQASAnaGAug68Wrvej8mHC63Kw+6y5Vby6APtI826PKj1Qri6mDWAiSfKJyvQaNySNQGjNbmrGi/nVOayCHDp5jqwHyn/iNMT6VLBMlNLm4F4osdfL1KMJucpY4eKqiOjWUNSdc+Dt5988R1XofcxKUyr5tBXaLatAD2j9gCkFMuCCOJdgIblpXh6oIGh/R7OKGCTEjINEddQpCmbS4Z8UhFEE58y74xxVqwKTomL4r+bgMCLZqhH/g6HIhoexvD2J3tDrqNKv7vVNWE2gMoyKojTN7XrjB0FiHHT87i6JNNx1wRJw68l7r9u48BuTt7UMnUEdIvcbJVnpB+xX0twFa8tvEGd9bCXDNRPnWMlctZLE3Efis8MiZuBwhLa7yXh3bNlcb/IiQUXuXsbvlx7zs0NqvoanKGBMjDgLZLS/sAl</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFKFyn5nqtVBL8WX4eo6H2kabgBcKsgcm4iH2SLI2Ez1+</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      &SetReportFormLimitRight;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUaG0xOv0B+TlH+OdNVwzhzuc5iFEHMRQESCcCnFdbRaZ38bLFS6sqCpfsUh9e0R/mFrfwjqMPpkVmvqDBsA43H9zrFlA2fMfgey9NJenBI51xz1E8jc1L45iF6VJfDKxqjNZth0g6h7gvQ+G+W7msXUSWpSqNiAH6UWM647Jdcm4CkDx/s3qInct8BqE55lO7pPZfUozIxOXrTHDcAGLcurGu5uevspwh2SASQ5irO5/Gpn3vvj7g/7tl1AV8zCvohY+sJanS5xPHk/v8kb4cay1snbZ9e70H+5nFASVzcjSvCGzzZDNG9wrjvNhLQwr0yY0sPCl1KvGYIabz1Xuga+bjwNBQzqvWbIVSKtMQ5farK66RX4Zshw6vvVyHYuXNuRip06bzmak7lCRVchL66U78ql5hqrBlB5Klk8IO8ru+F6ydpN+d4UZ7i8yG0iY3UI9ccO+2iSkGXxc2Q6PrOxjepe7X0P4g0AeGp1OqdRrTahwHk1veUtPtZbXPIf5Akskn5O2oXQg8ZjMrQay0hoQCPUyC5KfihqHyPcDloZZAqhehH1mhgiSA4D/XjTXvQFOS8uN5hZMWfYmBJr+iQ9vD17NpbrJ6LOuLSzEV8xnJNoWDFyGhNIKk9iUx6KDdfCr5Mbe61fRCiE31yaG0fUVsDdYJkVofd+g6xYAZIHIBMIKxRU7/vSn67SSQEVwSo4COcAa2fjjQmGvr6UXWys+I4p7aXH2SVFLiGHQge4weP032BgDPctvAhLUo4xSF9XUEqRE2OyH1JYxfYh0wWC9hNtqG7F5i0NpkgoOajxlC+5iu+Fuo5EV81IQFWXUjc9XuYh+r4e+nzi9tc1CMyfS53tturWRoucJ4eMXAiSz0qF6vcc9aB67nyRlsnYVGXpwpuo+jMz68NU+dwffDAQ==</Encrypted>]]>&SOStatusReportFilterHiddenField;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4fcq8eI+BehwL2u+Imr4tik90d1xswFoMCHWJx1C24n7yTvbEvX89fYgkGbPgKw9Ov1sUd4iJhadcP9pNNCnAeotRhNudcfpRA/uwULtYKpr2hECP52YU+PqLCFa5tRIOsYg6lJ568cya1UHM7X0sfBZ87xUv1OF4b64Q7qP9g1x1omfOjfW9HcWeb8w1YAN0bH+0aShHwykI35yWuDZzbrncZ0Y2pQJpAxFSY9HBP2ZuipBYHzDxvWAQeVf2qh7TaDfW9wIsJdNCnldmUYigkSrknUhtkYVTZ8BNF+stGZ+yWI+9mPns/3VGcLIY8pb0uMeU4M7KCI5sEFDi+lsvMfYAFm0VDMC4/2Go2acfm6GNHm4uZ3BiKsP5mxOkqYcwg==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>