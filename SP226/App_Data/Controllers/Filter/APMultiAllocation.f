<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir id="0" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Chứng từ từ ngày" e="Date From"></header>
      <footer v="Ngày chứng từ từ/đến" e="Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Chứng từ đến ngày" e="Date to"></header>
    </field>
    <field name="so_ct1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Số chứng từ từ/đến" e="Voucher No. from/to"></header>
      <items style="Mask"></items>
    </field>
    <field name="so_ct2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="" e=""></header>
      <items style="Mask"></items>
    </field>

    <field name="tk">
      <header v="Tài khoản" e="Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1" />
    </field>
    <field name="ten_tk%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nt" filterSource="detail" allowNulls="false">
      <header v="Mã ngoại tệ" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_nt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="isbalance" dataFormatString="0, 1, *" clientDefault="*" align="right">
      <header v="Tính số dư" e="Balance"/>
      <footer v="0 - Chưa phân bổ hết, 1 - Đã phân bổ hết, * - Tất cả" e="0 - Unallocated, 1 - Allocated, * - All"></footer>
      <items style="Mask"/>
    </field>

    <field name="kieu_pb" dataFormatString="0, 1" clientDefault="1" align="right">
      <header v="Kiểu phân bổ" e="Type"/>
      <footer v="0 - Hạn thanh toán, 1 - Ngày hóa đơn" e="0 - Due Date, 1 - Invoice Date"></footer>
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
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101--: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="1101-1: [so_ct1].Label, [so_ct1], [so_ct2], [maxLength]"/>

      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="1110000-: [isbalance].Label, [isbalance], [isbalance].Description"/>
      <item value="1110000-: [kieu_pb].Label, [kieu_pb], [kieu_pb].Description"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
    </view>
  </views>

  <commands>

    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6Q4ap7R7fX4vevZ9s0IFRrasQ+f5txqRTBoG/6BCalSxSuy4ks2TjBHOPj4VycCF1K7qRXstsxFl8CDQW+Tn+wXqlAui7YhAL9ewEY5q+aC/qvVol0qTZ5VHZC0c25bQRRkUQUv5WYm2dDUUz7dnrbkmK27kY3Y423l8wReZJlQek1c/rDcKK18bkgIdd3Zf7F9LYifDfjhm/ZQSLa1GsgfEniHUbIJ+SesSVxTiZUICFJ46fNVZVqneUvb1wZ6A2kp7wk2eEnx5SRLw1p8yu3EqLJ5xDkQE1RzzO9FE3BYRoq1nlirESYYkNGXQXxnNG+dclIJUOrR+tqYgF4Miolu2gWK7OskEms6JxrhrOoK7LflzF0GHtHXhBdl4czRnwrRgyG5jvjBGKUj5Nf2/kK0=</encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7KqJ33QmFpe3n2HN8evrR/ZjjmAl9wHq5i2ZVoTvHTiAzW+QNnpXzt7MaiW2uHJdeAB+EPnBK96bC+kqyGiO+Hv4MWOFMAqpjACvErxN/upUaLncAkXfEpXCk6w0vRUO5iScOqvvqz8vY+pjWCSQGDmBmQ9SmCC8HuxCT2aWH9DOj</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYU3jg67mYTmJvr0ghQ2FoZbHIzklYnV8t/i1gFxjmm483dLYLoMNHd2GlBBCYXZZ7FyLwr7k7cibtaU8YOtzC0H7vu2XlS5X+JraFaQ1VJF6tN8cNrymKlOZR1OVFeo8p8qkQG6ri6MBlYUsb4Lfare/BA0VRXBTUgy/TMtRLwimCvJQGGtrgjb7tTZkCVq7ejaPxv5xE9wavIpmXsq6eS0YGXyxju1QR3vUQZrcM4fFYx26e5MF6NGaHECc2hEx9/9bGQjVdafBnPu7Z/cB4DmSvYTqkSsHRhdiv8fbSbkjhNubWbUETOsIVkewQaD3hf40a6vwKLicOedRl7n6Ck7K28VaEWp2Y3BtYHUDG2vUQZNf1firInM8SkYw83RvNQaMAziDyZMzY15CLeQU5hVuV48/n30bXugSo7poaAw71/I1VKZNSQCq9+BFFxDtxsoQZP4dis8eX5Q+GQTgJs5WOI9VZJPqsysn3pC77aWMM+G6aAoEPlNcw90UOQ1xJriGptn0PKRcCm12aWUAv7uSoZbp/AspKNJZVhMIHuEUMpsZFoBDS7rP3+uNfu/VP</encrypted>]]>
    </text>
  </script>

</dir>