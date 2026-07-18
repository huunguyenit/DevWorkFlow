<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterInit SYSTEM "..\Include\XML\WhenFilterInit.xml">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptFilterInit SYSTEM "..\Include\Javascript\FilterInit.txt">
  <!ENTITY TableDetail "ds2">

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;
]>

<dir table="ms2$000000" code="stt_rec" order="ngay_ct, so_ct" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Chứng từ từ ngày" e="Voucher Date from"></header>
      <footer v="Ngày chứng từ từ/đến" e="Voucher Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Chứng từ đến ngày" e="Voucher Date to"></header>
    </field>

    <field name="ma_lsx" filterSource="master" operation="10">
      <header v="Yêu cầu sản xuất" e="Work Order"></header>
      <items style="AutoComplete" controller="SFCWorkOrder" reference="ten_lsx%l" key="1 = 1&VoucherLogStatusKeyLookup;" check="1 = 1&VoucherLogStatusKeyLookup;"/>
    </field>
    <field name="ten_lsx%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_lo_trinh" filterSource="master" operation="20">
      <header v="Quy trình sản xuất" e="Routing"></header>
      <items style="AutoComplete" controller="CRRoutingCodeList" reference="ten_lo_trinh%l" key="status = '1'" check="1 = 1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb5TXLVV4clzBzODtH96JDN5PXFpof1Y6XPFqlSwvdDw8hY19tJUoM2ROtMzAgViy4I=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_lo_trinh%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_cd" categoryIndex="1" filterSource="detail" operation="10">
      <header v="Mã công đoạn" e="Operation Code"></header>
      <items style="AutoComplete" controller="SFCOperationList" reference="ten_cd%l" key="('{$%c[ma_lo_trinh]}' = '' or ma_lo_trinh = '{$%c[ma_lo_trinh]}') and status = '1'" check="'{$%c[ma_lo_trinh]}' = '' or ma_lo_trinh = '{$%c[ma_lo_trinh]}'" information="&TableDetail;"/>
    </field>
    <field name="ten_cd%l" readOnly="true" external="true" defaultValue="''">
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
    <view id="Dir" height="40">
      <item value="120, 30, 70, 100, 230, 0"/>
      <item value="1101-: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="11010: [ma_lsx].Label, [ma_lsx], [ten_lsx%l]"/>
      <item value="11010: [ma_lo_trinh].Label, [ma_lo_trinh], [ten_lo_trinh%l]"/>

      <item value="11010: [ma_cd].Label, [ma_cd], [ten_cd%l]"/>

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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtf0ePKWMx2z3mvcfODpAeD6TbO3opaqe/n04Q34AtpZ1kFiw2I6YDJ5nIJArEF00UAQPuE7LmyvOyrWFWtbBGwBC7r55swVzBho9/YvneGrqMkTXimD3xXGms2x43CV8gC2BT4Hi3zYkf6RvPwfsSs9YPk1NJGwzSTc9I2cpNXwAjEcikVwpBunO+cIcZjQHVdi6Qe6noS85X53c+EEqdWbJGxKu0FKxT7uwmxUwwh8cPkrUkxbvAwVUgibYLHG1PqrGIDsH2ondU/b3B5t7IEvxEWv8AXqzKy3HtnHhHDH0</Encrypted>]]>
    </text>
  </script>
</dir>