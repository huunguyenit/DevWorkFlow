<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterInit SYSTEM "..\Include\XML\WhenFilterInit.xml">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptFilterInit SYSTEM "..\Include\Javascript\FilterInit.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY TableDetail "ds2">

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;
]>

<dir table="ms2$000000" code="stt_rec" order="ngay_ct, so_ct" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Thời gian lập từ ngày" e="Created Time from"></header>
      <footer v="Thời gian lập từ/đến" e="Created Time from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Thời gian lập đến ngày" e="Created Time to"></header>
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
      <items style="AutoComplete" controller="SFCOperationList" reference="ten_cd%l" key="ma_lo_trinh = '{$%c[ma_lo_trinh]}' and status = '1'" check="ma_lo_trinh = '{$%c[ma_lo_trinh]}'" information="&TableDetail;"/>
    </field>
    <field name="ten_cd%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_dvcs" categoryIndex="-1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="user_id0" dataFormatString="0, 1" clientDefault="0" align="right" inactivate="true" categoryIndex="-1">
      <header v="Người sử dụng" e="User"></header>
      <footer v="1 - Lọc theo người sử dụng, 0 - Không" e="1 - Filter by User, 0 - No"></footer>
      <items style="Mask"/>
    </field>

    <field name="status" dataFormatString="1, 2" clientDefault="1" align="right" categoryIndex="-1">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Chờ duyệt, 2 - Đã duyệt" e="1 - Open, 2 - Approve"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="39">
      <item value="120, 30, 70, 100, 230"/>
      <item value="1101-: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="11010: [ma_lsx].Label, [ma_lsx], [ten_lsx%l]"/>
      <item value="11010: [ma_lo_trinh].Label, [ma_lo_trinh], [ten_lo_trinh%l]"/>
      <item value="11010: [ma_cd].Label, [ma_cd], [ten_cd%l]"/>
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
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      &ScriptFilterInit;
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdIWyhhPd92v5o6BVLyei3qhflsc9QPOqLE6KpAGkST9lKIl5K7WT+NvHb+KbrrCdpA9roLSRQbm3EEsG12bXiUM/KJ0vL7tYkL99BviTwHunE3BC5ibffqPP/FxhYineMnuz4nHYN9iLFWvBXSMuiWpBXlWsWP59+GMT+9bvGk1y5DACIr6SxpsR4I6qn5ERoNXmkGrvQgDOQlvRKsnGzJusYqjFFX5Ro3KItqP+c+zmHvt9ghGDp927lDiUtm+8vd6a5MGE40RD+p9AZDSIdoCQkO0S83aOfOiT2tCwONip</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>