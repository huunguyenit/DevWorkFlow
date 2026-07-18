<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY VoucherCode "HDA">
]>

<dir id="0" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Hóa đơn từ ngày" e="Invoice Date from"></header>
      <footer v="Ngày hóa đơn từ/đến" e="Invoice Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Hóa đơn đến ngày" e="Invoice Date to"></header>
    </field>
    <field name="so_ct1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Số hóa đơn từ/đến" e="Invoice No. from/to"></header>
      <items style="Mask"></items>
    </field>
    <field name="so_ct2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="" e=""></header>
      <items style="Mask"></items>
    </field>
    <field name="ma_dvcs" categoryIndex="-1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" filterSource="master" operation="10">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="loai_ct" readOnly="true" hidden="true" filterSource="master" operation="15">
      <header v="" e=""></header>
    </field>
    <field name="ma_nt" categoryIndex="9" filterSource="master" operation="20">
      <header v="Mã ngoại tệ" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_nt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_kho" categoryIndex="1" filterSource="detail" operation="10">
      <header v="Mã kho" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_vt" categoryIndex="1" filterSource="detail" operation="20">
      <header v="Mã hàng" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="tk_vt" categoryIndex="1" filterSource="detail" operation="30">
      <header v="Tk vật tư" e="Inventory Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk_vt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="tk_gv" categoryIndex="1" filterSource="detail" operation="40">
      <header v="Tk giá vốn" e="COGS Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_gv%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk_gv%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="tk_dt" categoryIndex="1" filterSource="detail" operation="50">
      <header v="Tk doanh thu" e="Sales Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_dt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk_dt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="user_id0" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" categoryIndex="-1">
      <header v="Người sử dụng" e="User"></header>
      <footer v="1 - Lọc theo người sử dụng, 0 - Không" e="1 - Filter by User, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="status" dataFormatString="*, 0, 2" clientDefault="*" align="right" inactivate="true" categoryIndex="9">
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
    <view id="Dir" height="136">
      <item value="120, 30, 70, 100, 200, 30"/>
      <item value="11011-: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2], [maxLength]"/>
      <item value="11011-: [so_ct1].Label, [so_ct1], [so_ct2], [loai_ct]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="110100: [tk_vt].Label, [tk_vt], [ten_tk_vt%l]"/>
      <item value="110100: [tk_gv].Label, [tk_gv], [ten_tk_gv%l]"/>
      <item value="110100: [tk_dt].Label, [tk_dt], [ten_tk_dt%l]"/>

      <item value="110100: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="111000: [status].Label, [status], [status].Description"/>

      <item value="110100: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="111001: [user_id0].Label, [user_id0], [user_id0].Description, [keys]"/>

      <categories>
        <category index="1" columns="120, 30, 70, 100, 200, 30">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="9" columns="120, 30, 70, 100, 200, 30">
          <header v="Khác" e="Other"/>
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
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QK9soTik+gkSjeRhqXeB09b5yVnKpe73iPR+zDCnm3uoregaqK8mFyDCoSmInUZWtzDZbtlQDWPaPDNdQWYbxZYFNJ+p/IFIGtw+vEyw8YfXzT+M3k6qAjMtAhbw1dYGoMGjg4lZaCh27leM4Ze20DVslJboYunncCJJD57iFk1siqDeeSWzJx9LySC4JocPA==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtf0ePKWMx2z3mvcfODpAeD6TbO3opaqe/n04Q34AtpZ1kFiw2I6YDJ5nIJArEF00UAQPuE7LmyvOyrWFWtbBGwD+FP8WM/X3iidrueDtKOrk4Bml5SkE+v3dR8ZpVhlg1spIWUvWKWV4yXoeJIuxncKy5Y3EZ2OMKIKf/l3ahVcj/U6DrECXCij9nsBZbaP8zI5ra7VK6KHF8TRsBla9U4XPamzagw1MPyHhVPmk01QHDS3nBFd4/OrdQpr3fmRrp/39Wj1SgSJaalH1a57R1JkGLzt/l1IoSrocGiNwUtQ02Xg9y3utT0vAtiR2YTT3iThOV6XGDJhS9ufjGTjewMPSGY7So3AgyCJZCCWwriiaRALO8C4gwdMmrc/pgBaFExKif2kvMIG9b7HjuVk1zhXAdO3QUBpfpygtjT1jIc6PgRqKFxW56X3n8OuwAsQXBnz5CeLm7H1QPCOH31stKN8EVgnpgaAUDB+KWOvVrRwuCy6LSAC8wBx1CAXbOxm1SHO9T6MbcgIOqLg8deJMWNI=</Encrypted>]]>
    </text>
  </script>
</dir>