<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir table="0" type="Report" xmlns="urn:schemas-fast-com:data-dir">
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

    <field name="typeInvoice" allowNulls="false">
      <header v="Chứng từ" e="Voucher"></header>
      <items style="DropDownList">
        <item value="1">
          <text v="Hóa đơn bán hàng" e="Sales Invoice"/>
        </item>
        <item value="2">
          <text v="Hóa đơn dịch vụ" e="Service Invoice"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="ma_kh">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk_dt">
      <header v="Tk doanh thu" e="Sales Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk_dt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk_dt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="user_id0" dataFormatString="0, 1" clientDefault="0" align="right" inactivate="true">
      <header v="Người sử dụng" e="User"></header>
      <footer v="1 - Lọc theo người sử dụng, 0 - Không" e="1 - Filter by User, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="status" dataFormatString="*, 0, 1, 2" clientDefault="2" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="Ký tự &lt;span style=&quot;color:#008200;&quot;&gt;[*]&lt;/span&gt; - Hiện tất cả các trạng thái" e="&lt;span style=&quot;color:#008200;&quot;&gt;[*]&lt;/span&gt; - Show all status information"></footer>
      <items style="Mask"/>
    </field>

    <field name="maxLength" type="Int16" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230, 0"/>
      <item value="1101-1: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2], [maxLength]"/>
      <item value="1101: [so_ct1].Label, [so_ct1], [so_ct2]"/>
      <item value="1100: [typeInvoice].Label, [typeInvoice]"/>
      <item value="11010: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="11010: [tk_dt].Label, [tk_dt], [ten_tk_dt%l]"/>
      <item value="11100: [user_id0].Label, [user_id0], [user_id0].Description"/>
      <item value="11100: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7KqoCXw/TH7ntE7j4ACVIxZ5Oti5W5OEH9dUiZEDPQusxTQbmFro4WZ7sS9xt/2zD5/+fPU68SAvEXvb+wec6ksxCaydmVWiwM7Jt+cL9WHd/vOPv9d3US0ioMQZV7LBjeTI5uwnoidSMbLtMcjSp9cIAZc3U4wG9K73TrB6q/F7Z45Va1YwM40pTaEMRxD46dA==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYBPjBKeM8/Qt3MheupAycbm2zTTGGEZMyjhaXuza8xtfZ2fiUU0FBk9W73cjVPp8gyROWOvk7xSNWUKBox1Dz750oR5Px7MJ26s+RA13F5sqIXy/S7aZ0EwvYNvWdXz5Kb5AuUmpQ3aF4SuQbRdHTf6G0nFUNB1re5xe8f8mCrZBOt48byvzvYbAufRGqCkKajAS9ktQoKu6l51cjCIp1bzdRUYL1wQzCUjptJkUHMcKpnMlnUMbhGP9kzCeW7zpKFiNSiTzsdXDnWBg/SZJgXkoDiMjBQt97Hbc/bSK7dbIG3+lsoXbuvwwBYLywH9LEm4SJARp3aWoLx7UobzQ6eDv4bJTOSwTNpOpV/+QtK5GkgBHBUsPm5Ir3hl6ZBBvljwNhPtnl7EK4kE9PEyXK1aOpuQrmDkgpE1OMNEQH7Z4MAUyz9IYPtBIBq+DRO5ny5US0FXicUBKz1Pc4dbVHHK9IUN8uRZA+98cpvSjvqPTvPmdU3+Q8G/UM6SPoiEUnRbuTzPNk4DdkGDQxyeDExbHdQiR+Rzu2jRP8wv+77SOJftdXI0UHvpvailHHg0tH</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>