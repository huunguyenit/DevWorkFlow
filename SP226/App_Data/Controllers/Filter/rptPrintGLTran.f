<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY VoucherCode "PK1">
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
    <field name="so_ct1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100">
      <header v="Số chứng từ từ/đến" e="Voucher No. from/to"></header>
      <items style="Mask"></items>
    </field>
    <field name="so_ct2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100">
      <header v="" e=""></header>
      <items style="Mask"></items>
    </field>
    <field name="ma_nt">
      <header v="Mã ngoại tệ" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_nt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="tk" categoryIndex="1">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" categoryIndex="1">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true">
      <header v="Tên khách" e="Customer Description"></header>
    </field>

    <field name="ma_dvcs" categoryIndex="-1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="user_id0" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" categoryIndex="-1">
      <header v="Người sử dụng" e="User"></header>
      <footer v="1 - Lọc theo người sử dụng, 0 - Không" e="1 - Filter by User, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="status" dataFormatString="*, 0, 1, 2" clientDefault="*" align="right" inactivate="true" categoryIndex="-1">
      <header v="Trạng thái" e="Status"></header>
      <footer v="Ký tự &lt;span style=&quot;color:#008200;&quot;&gt;[*]&lt;/span&gt; - Hiện tất cả các trạng thái" e="&lt;span style=&quot;color:#008200;&quot;&gt;[*]&lt;/span&gt; - Show all status information"></footer>
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
    <view id="Dir" height="63">
      <item value="120, 30, 70, 100, 230"/>
      <item value="11011: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2], [maxLength]"/>
      <item value="11011: [so_ct1].Label, [so_ct1], [so_ct2], [keys]"/>
      <item value="11010: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>

      <item value="11010: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="11010: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>

      <item value="11010: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="11100: [user_id0].Label, [user_id0], [user_id0].Description"/>
      <item value="11100: [status].Label, [status], [status].Description"/>

      <categories>
        <category index="1" columns="120, 30, 70, 100, 230">
          <header v="Chi tiết" e="Detail"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
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
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4eUj3S8X6lTCM8ua3Cr1QK4UM54mmMx7yz4yphH7TQrlJLvEZzJLlnCJ2sxlUmL8AX7/GtxTft46UQHlcLmY3bAXYAGt5iPSbjkkjG1tanmSAFtvKZbizqtyLEZiqZjHDf554eqkmVFCL4Xy2rk08Mxso0DIqH9ZU1+8XL8qF6aM</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtf0ePKWMx2z3mvcfODpAeD6TbO3opaqe/n04Q34AtpZ1kFiw2I6YDJ5nIJArEF00UAQPuE7LmyvOyrWFWtbBGwD+FP8WM/X3iidrueDtKOrk4Bml5SkE+v3dR8ZpVhlg1spIWUvWKWV4yXoeJIuxncKHQ8PoRLj62H/+p1j5KaehLAv7NLuU55CS602YCbdwSut+G4j6/UXO4u87J1YvtBGsQ2y6t7h3dR86NbGYwo0yFCdDpt2A7WMSFVCbhH3RsoLxNS5KQswd8sKoIzGiiyVQRWVADrqhOSIuS8cqOMG7gBWD65nSpeiLXi2p9rxg5TCiPTgXt/B6AwUxoj8YoBQ/QdAcfkT3hVEjfGQ3lrC9Z7RDNOrj2ai2PPYIU+HwHfw3pE8X4S9WSlqSpF9rw4b8trff+gYS0VyRbFD5q02eYGrWP9K8E5B1lyTn+ZAGUcTObKTEyYkz3rwGNqUa/yeowW/5qwF7Rt550tCRNkvI</Encrypted>]]>
    </text>
  </script>
</dir>