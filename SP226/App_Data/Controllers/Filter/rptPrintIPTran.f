<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY GetReportFormStockRight SYSTEM "..\Include\Command\GetReportFormStockRight.txt">
  <!ENTITY SetReportFormStockRight SYSTEM "..\Include\Javascript\SetReportFormStockRight.txt">

  <!ENTITY VoucherCode "PNF">
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

    <field name="ma_kho" filterSource="master" operation="10">
      <header v="Kho nhập" e="Destination Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1=1" information="ma_kho$dmkho.ten_kho%l"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_khox" filterSource="master" operation="20">
      <header v="Kho xuất" e="Source Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_khox%l" key="status = '1'" check="1=1" information="ma_kho$dmkho.ten_kho%l"/>
    </field>
    <field name="ten_khox%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>

    <field name="ma_gd" filterSource="master" operation="30" categoryIndex="9">
      <header v="Mã giao dịch" e="Transaction Code"></header>
      <items style="AutoComplete" controller="TransactionCode" reference="ten_gd%l" key="ma_ct = 'PNF' and status = '1' " check="ma_ct = 'PNF'" />
    </field>
    <field name="ten_gd%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nt" filterSource="master" operation="40" categoryIndex="9">
      <header v="Mã ngoại tệ" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_nt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_vt" categoryIndex="1" filterSource="detail" operation="10">
      <header v="Mã vật tư" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="tk_vt" categoryIndex="1" filterSource="detail" operation="20">
      <header v="Tk nợ" e="Debit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk_vt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nx" categoryIndex="1" filterSource="detail" operation="30">
      <header v="Mã nhập xuất" e="Reason Code"></header>
      <items style="AutoComplete" controller="Reason" reference="ten_nx%l" key="" check="1 = 1"/>
    </field>
    <field name="ten_nx%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="status" dataFormatString="*, 0, 1, 2, 3" clientDefault="*" align="right" inactivate="true" categoryIndex="9">
      <header v="Trạng thái" e="Status"></header>
      <footer v="Ký tự &lt;span style=&quot;color:#008200;&quot;&gt;[*]&lt;/span&gt; - Hiện tất cả các trạng thái" e="&lt;span style=&quot;color:#008200;&quot;&gt;[*]&lt;/span&gt; - Show all status information"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_dvcs" categoryIndex="-1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = '1'" check="1=1" />
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="loai_du_lieu" clientDefault="2" categoryIndex="-1">
      <header v="Loại dữ liệu" e="Data Type"/>
      <items style="DropDownList">
        <item value="1">
          <text v="Số liệu thực tế" e="Physics"/>
        </item>
        <item value="2">
          <text v="Theo hóa đơn" e="Book"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="user_id0" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" categoryIndex="-1">
      <header v="Người sử dụng" e="User"></header>
      <footer v="1 - Lọc theo người sử dụng, 0 - Không" e="1 - Filter by user, 0 - No"></footer>
      <items style="Mask"/>
    </field>

    <field name="keys" hidden="true" readOnly="true" filterSource="Infinite">
      <header v="" e=""></header>
    </field>
    <field name="maxLength" type="Int16" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="86">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="11011: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2], [maxLength]"/>
      <item value="11011: [so_ct1].Label, [so_ct1], [so_ct2], [keys]"/>

      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110100: [ma_khox].Label, [ma_khox], [ten_khox%l]"/>

      <item value="11010: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="11010: [tk_vt].Label, [tk_vt], [ten_tk_vt%l]"/>
      <item value="11010: [ma_nx].Label, [ma_nx], [ten_nx%l]"/>

      <item value="110100: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="111000: [user_id0].Label, [user_id0], [user_id0].Description"/>
      <item value="11000: [loai_du_lieu].Label, [loai_du_lieu]"/>

      <item value="11010: [ma_gd].Label, [ma_gd], [ten_gd%l]"/>
      <item value="11010: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="11100: [status].Label, [status], [status].Description"/>

      <categories>
        <category index="1" columns="120, 30, 70, 100, 230">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="9" columns="120, 30, 70, 100, 230">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvnZPRiKEfPKjxHBmJnvU1lVtlo+1Oh7odASSFZnsPBg9Zo+rjYXqzXYFeMYQpMONV0=</Encrypted>]]>&GetReportFormStockRight;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4b0rGa8vBKURt7mg7V/CooiWP0ZzBFY2mk3bo8zw+rrMuehRQDPOxS3Skw6eSVuBmTRnviqu3aECY0+N/QSAB1NE9ez0W250dN8eT82UfpU0vGoSHmdwJ7qzKxIFEpgMso1pEVePQb06ReAN5HRFzx6TPCvY1gfJ3RpWcX24BDmwbthYHFhGsXyB22ERmu0kovlhYL7TGT8mpKGsWtKxlnattmIWqfC5dS0UQzOEUR0w==</Encrypted>]]>
      </text>
    </command>

    <command event="Initialize">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu0mxYSmU5httxEGamltBbf5D8y7rUdfC35L7ZEPARtrZ0FX0WIC+RflhpL9wSOUkXgBkdAoOxZkeNEFcEuBxS885MTouO/Vp7A5bmca+wokZphe/3+MgKXvJwyNY68UycQ==</Encrypted>]]>&VoucherCode;<![CDATA[<Encrypted>&Yg5kCMHpRxVk0phZxDQR79cso+TWv8DxvyfmCnIM3UvgQAaOHUzHqKPq5+kozZa4z5+LSDoQYozB6SmIJawB1mL+zhCyS9+jg0nlxxmVkih/wc/rD0ChaFqWvx87fsRaK4qY6k3aQy/u6avABqZzpGIiR/DaMIWbznXLG6doVN3AnG0NQzNvVpH+04OKzO/yQbsd8w7X2o0LcyrmwAbIR0BOoHXWY7wUcIh2N0K3+HQ=</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFSesqNXIl+kdAsZroBdqAzZPfcbzh+su4dGDO0HdcXrGSkq5tBUCX1O6Jh3ClRlJiA8cUy7wsVF5Gb4Yp6t3Wk=</Encrypted>]]>
      </text>
    </command>
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TBQq/jU2va1SeNiKjcuW+u4O4+G/HKaf6FD7WpVL6U5DxmdKMJ4Bj/n/33+0fnpdK7CPmVWYxjTJcZ+u3N7KiobchZZRod+jWTdp5iRV6a+N18D7pFwZFeNSokJ8Rk+9ct0zDcWnOnXJjADYjRQcG/60Qs3+45R90bCizHtGewnpyp/lrPbOn9gdHRdokVmqA==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &SetReportFormStockRight;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtf0ePKWMx2z3mvcfODpAeD6TbO3opaqe/n04Q34AtpZ1kFiw2I6YDJ5nIJArEF00UAQPuE7LmyvOyrWFWtbBGwBw6FW11cQkc2Nx1l7SCXXUi9HutmMX3q1bvL7LKlKCM36tQ5eDMGRCzqSEW02cC6NL1dAbKukAyI1NF2D22dCh1EX5dn0q4U9Gn7GeNZoiR1ArIOZkq7uCW7eOuJjCnO9Z8bBnxj8PPZ9i8MOdwaOQODu0ct0MewCEl65zYnwAAxoBu26H/IwsOINWRd2X2s+mO+WKHwQFG88sZ3lKkw8cFHVUT057vV+dpWtMp1PKecF/JMT1x5eC20ReSXYAMdisUJSW1MQewN5AWRTZI7EeC1ybwQB0O0KK4b6sLtZnZEh/jDdEwojC6jkgu6LN8eB0x4yJ5l3ylnQZy4Inb4epwRfmepFaoeO3//v82bArwWhLauIiFurQSQi2tactzWrVUNpHCQYSLwsFYKHNVxHgx2GMnaXE4Gfn8ew8zf4q+dO4tJLvKS1ch0zXz6At64Y=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>