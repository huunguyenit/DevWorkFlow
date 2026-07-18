<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterInit SYSTEM "..\Include\XML\WhenFilterInit.xml">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptFilterInit SYSTEM "..\Include\Javascript\FilterInit.txt">
  <!ENTITY TableDetail "d87">

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;
]>

<dir table="m87$000000" code="stt_rec" order="ngay_ct, so_ct" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Chứng từ từ ngày" e="Voucher Date from"></header>
      <footer v="Ngày chứng từ từ/đến" e="Voucher Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Chứng từ đến ngày" e="Voucher Date to"></header>
    </field>
    <field name="so_ct1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Số chứng từ từ/đến" e="Voucher No. from/to"></header>
      <items style="Mask"></items>
    </field>
    <field name="so_ct2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="" e=""></header>
      <items style="Mask"></items>
    </field>
    <field name="dept_id" filterSource="master" operation="10">
      <header v="Mã bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="loai_ct" readOnly="true" hidden="true" filterSource="master" operation="15">
      <header v="" e=""></header>
    </field>

    <field name="ma_kho" categoryIndex="1" filterSource="detail" operation="10">
      <header v="Mã kho" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1 = 1" information="&TableDetail;"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_vt" categoryIndex="1" filterSource="detail" operation="20">
      <header v="Mã hàng" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1" information="&TableDetail;"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_gd" filterSource="master" operation="20" categoryIndex="9">
      <header v="Mã giao dịch" e="Transaction"></header>
      <items style="AutoComplete" controller="TransactionCode" reference="ten_gd%l" key="ma_ct = 'PX0' and status = '1'" check="ma_ct = 'PX0'"/>
    </field>
    <field name="ten_gd%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="status" dataFormatString="*, 0, 1, 2, 3, 4, 5, 9&VoucherLogStatusFilter;" clientDefault="*" align="right" inactivate="true" categoryIndex="9">
      <header v="Trạng thái" e="Status"></header>
      <footer v="Ký tự &lt;span style=&quot;color:#008200;&quot;&gt;[*]&lt;/span&gt; - Hiện tất cả các trạng thái&VoucherLogStatusDescription.v;" e="&lt;span style=&quot;color:#008200;&quot;&gt;[*]&lt;/span&gt; - Show all status information&VoucherLogStatusDescription.e;"></footer>
      <items style="Mask"/>
    </field>

    <field name="ma_dvcs" categoryIndex="-1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="user_id0" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" categoryIndex="-1">
      <header v="Người sử dụng" e="User"></header>
      <footer v="1 - Lọc theo người sử dụng, 0 - Không" e="1 - Filter by User, 0 - No"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="64">
      <item value="120, 30, 70, 100, 230"/>
      <item value="1101: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="11011: [so_ct1].Label, [so_ct1], [so_ct2], [loai_ct]"/>
      <item value="11010: [dept_id].Label, [dept_id], [ten_bp%l]"/>

      <item value="11010: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="11010: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>

      <item value="11010: [ma_gd].Label, [ma_gd], [ten_gd%l]"/>
      <item value="11100: [status].Label, [status], [status].Description"/>

      <item value="11010: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="11100: [user_id0].Label, [user_id0], [user_id0].Description"/>

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
    &XMLWhenFilterInit;
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      &ScriptFilterInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtf0ePKWMx2z3mvcfODpAeD6TbO3opaqe/n04Q34AtpZ1kFiw2I6YDJ5nIJArEF00UAQPuE7LmyvOyrWFWtbBGwAB0RfHLE6bzlE1U5mQmxhZ9NY3FVlA/xJZULg1YWp01am2k1InAVkG2BGbnOW7VE77XoYc+h27oK7oXmTUfWacd8J9p/O0xRTgSG6cHA8yNmDmnyupUzPJ4LzPJ5c5Ci18Ob4iixT0gXucowgmhYF9</Encrypted>]]>
    </text>
  </script>
</dir>