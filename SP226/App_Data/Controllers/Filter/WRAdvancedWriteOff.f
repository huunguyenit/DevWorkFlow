<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
]>

<dir table="0" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Hóa đơn từ ngày" e="Date From"></header>
      <footer v="Ngày hóa đơn từ/đến" e="Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="hóa đơn đến ngày" e="Date to"></header>
    </field>
    <field name="so_ct1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100">
      <header v="Số hóa đơn từ/đến" e="Voucher No. from/to"></header>
      <items style="Mask"></items>
    </field>
    <field name="so_ct2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100">
      <header v="" e=""></header>
      <items style="Mask"></items>
    </field>

    <field name="tien_cl1" type="Decimal" dataFormatString="### ### ### ### ##0" align="right">
      <header v="Còn phải thu từ/đến" e="Receivable from/to"></header>
      <items style="Numeric"></items>
    </field>
    <field name="tien_cl2" type="Decimal" dataFormatString="### ### ### ### ##0" align="right">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>

    <field name="tk">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_kh1">
      <header v="Nhóm khách" e="Customer Group"></header>
      <items style="AutoComplete" controller="CustomerGroup" key="status = '1' and loai_nh=1" check="loai_nh=1"/>
    </field>
    <field name="nh_kh2">
      <header v="" e=""></header>
      <items style="AutoComplete" controller="CustomerGroup" key="status = '1' and loai_nh=2" check="loai_nh=2"/>
    </field>
    <field name="nh_kh3">
      <header v="" e=""></header>
      <items style="AutoComplete" controller="CustomerGroup" key="status = '1' and loai_nh=3" check="loai_nh=3"/>
    </field>

    <field name="loai_hd" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Loại hóa đơn" e="Invoice Type"></header>
      <footer v="1 - Chưa tất toán, 2 - Hóa đơn thu vượt" e="1 - Not yet, 2 - Overpayments"></footer>
      <items style="Mask"/>
    </field>

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="maxLength" type="Int16" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="1101--1: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2], [maxLength]"/>
      <item value="1101---: [so_ct1].Label, [so_ct1], [so_ct2]"/>
      <item value="1101---: [tien_cl1].Label, [tien_cl1], [tien_cl2]"/>
      <item value="110100-: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="110100-: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="11011--: [nh_kh1].Label, [nh_kh1], [nh_kh2], [nh_kh3]"/>
      <item value="111000-: [loai_hd].Label, [loai_hd], [loai_hd].Description"/>
      <item value="11000--: [ma_dvcs].Label, [ma_dvcs]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Uh/hlRe7JTCe5qoAJ/88QviIx2/tgRymWDwebyvIQ7YXSE3lAkFZBh7XknUOupYutS8CqgUEDT9pyf6aovbDhaea5k+BXG5SxkvK5tyDHDQtWYK1hMFN/XL2su06AUt6Z+spmfme5ozVU59U0CRSUBioRUiWmDZWNztfwukVzJWrX7bWNFK4BpL0pESmFQBcQ==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcU5d5UltcR8bTbfrnO2d1Kzii3p6ehknKjvfgm+r4/7v1XRkAvKFtXYzDayytSRCUOK9Bbng5Qb7HvljPsV0n9uqFXSP/B3KFIvlHs9M5borAyi/1Z4l+wBeWuih0rddZju5wRni5m1u0yUZE1r/a8MhvMF303aXbqTKd9Y33hUXt/G7oLzmhzO7QYPgeKwUuz9+w+sacuzvnsA4RrW+bWdQk2xz1lXVUIAHLwO+QECJjKLXTJEUxzUwlF2107i7SOgw27BW/ruKcxdGcp/jGC0tEZAXYCRvKGnZoCmLbeEeMsbmoZRiGfct0UW6dp+47ZKjhDAghapZ3fN5plXXiXa1ds5nT5XDK+KEy9LKe4Tnk=</Encrypted>]]>
    </text>
  </script>
</dir>