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
      <header v="Ngày chứng từ từ" e="Voucher Date from"></header>
      <footer v="Ngày chứng từ từ/đến" e="Voucher Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Chứng từ đến ngày" e="Voucher Date to"></header>
    </field>
    <field name="so_ct1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100">
      <header v="Số chứng từ từ/đến" e="Number from/to"></header>
      <items style="Mask"></items>
    </field>
    <field name="so_ct2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100">
      <header v="" e=""></header>
      <items style="Mask"></items>
    </field>

    <field name="ma_gd">
      <header v="Mã giao dịch" e="Transaction Code"></header>
      <items style="AutoComplete" controller="TransactionCode" reference="ten_gd%l" key="ma_ct = 'SX1' and status = '1'" check="ma_ct = 'SX1'"/>
    </field>
    <field name="ten_gd%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_sp">
      <header v="Mã sản phẩm" e="Product"></header>
      <items style="AutoComplete" controller="Product" reference="ten_sp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_sp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_dvcs" categoryIndex="-1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="user_id0" dataFormatString="0, 1" clientDefault="0" align="right" inactivate="true" categoryIndex="-1">
      <header v="Người sử dụng" e="User"></header>
      <footer v="1 - Lọc theo người sử dụng, 0 - Không" e="1 - Filter by User, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="status" dataFormatString="*, 1, 2, 3, 4" clientDefault="*" align="right" inactivate="true" categoryIndex="-1">
      <header v="Trạng thái" e="Status"></header>
      <footer v="Ký tự &lt;span style=&quot;color:#008200;&quot;&gt;[*]&lt;/span&gt; - Hiện tất cả các trạng thái" e="&lt;span style=&quot;color:#008200;&quot;&gt;[*]&lt;/span&gt; - Show all status information"></footer>
      <items style="Mask"/>
    </field>
    <field name="maxLength" type="Int16" readOnly="true" hidden="true" inactivate="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="1101-1: [so_ct1].Label, [so_ct1], [so_ct2], [maxLength]"/>
      <item value="110100: [ma_gd].Label, [ma_gd], [ten_gd%l]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>

      <item value="110100: [ma_sp].Label, [ma_sp], [ten_sp%l]"/>

      <item value="110100: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="111000: [user_id0].Label, [user_id0], [user_id0].Description"/>
      <item value="111000: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&Er6kBCOukK5FxLFOw1tnB3hDqMZl08wzg2EzX+5zedJCcM3it4F3IAS7dD8+qo5O+DYQYbaEGwrZGJ8bM9ImF6w8WHphfR/8kTLWora1kghuvhpoaHgS1kpby+sKyEpuX0Prull3WL0xwBS85KgwHjrAumn/J/vKM56zZtSrDOvA7sWxdv/d1lugMPTyIxHK</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdM3UOpvSWZBBdKWouRu5rKwcL4fHJYjbClncl285aR1NeKQrGRuiCmEKXhD6Tkzn2HXn2xsJsRPxRAKP1+2oMWlsxExuYpxyL4ido4TsbcV0eS5yd2wl6yP0eUvHhtfzkusOzZaIlSpDjeZFwTBtCb3HqMh2gUCEAOP5pfmkB5XEDJ8rfmNUHeRaRXDLNA1wazH9k4iX8BAvOG4RArph8GfPdRGZp3VNt9iXv5NA5+3ZXYkB3vQeZmHhAlnlfJobzwvZvJhp0P/ELEA3Kp9Auq5XfTEBRWJBLZzpFGhBZZkAS0Qgqa0nA2QoO9HIM9HLnCb0GiIti76wCJuAgrl7iaA=</Encrypted>]]>
    </text>
  </script>
</dir>