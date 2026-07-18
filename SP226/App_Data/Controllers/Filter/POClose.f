<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterInit SYSTEM "..\Include\XML\WhenFilterInit.xml">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptFilterInit SYSTEM "..\Include\Javascript\FilterInit.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY TableDetail "d94">
]>

<dir table="m94$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="so_ct1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Số đơn hàng từ/đến" e="PO Number from/to"></header>
      <items style="Mask"></items>
    </field>
    <field name="so_ct2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="" e=""></header>
      <items style="Mask"></items>
    </field>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày lập từ" e="PO Date from"></header>
      <footer v="Ngày lập từ/đến" e="PO Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày lập đến" e="PO Date to"></header>
    </field>
    <field name="vc_type" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Loại đơn hàng" e="Purchase Order"></header>
      <footer v="1 - Đơn hàng mua trong nước, 2 - Đơn hàng nhập khẩu" e="1 - Domestic Purchase Order, 2 - Import Purchase Order"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_gd" filterSource="master" operation="10">
      <header v="Mã giao dịch" e="Transaction"></header>
      <items style="AutoComplete" controller="TransactionCode" reference="ten_gd%l" key="ma_ct = 'PO2' and status = '1'" check="ma_ct = 'PO2'"/>
    </field>
    <field name="ten_gd%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="loai_ct" hidden="true" filterSource="master" operation="15">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" filterSource="master" operation="20">
      <header v="Mã nhà cung cấp" e="Supplier"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_vt" categoryIndex="1" filterSource="detail" operation="10">
      <header v="Mã hàng" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1" information="&TableDetail;"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_nt" filterSource="master" operation="30" categoryIndex="9">
      <header v="Mã ngoại tệ" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_nt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="0" align="right" categoryIndex="9">
      <header v="Trạng thái" e="Status"></header>
      <footer v="0 - Chưa đóng, 1 - Đã đóng" e="0 - Open, 1 - Close"></footer>
      <items style="Mask"/>
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
  </fields>

  <views>
    <view id="Dir" height="64">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="1101---: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="1101---: [so_ct1].Label, [so_ct1], [so_ct2]"/>
      <item value="1110000: [vc_type].Label, [vc_type], [vc_type].Description"/>
      <item value="1101001: [ma_gd].Label, [ma_gd], [ten_gd%l], [loai_ct]"/>
      <item value="110100-: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>

      <item value="110100-: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>

      <item value="1101000: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="1110000: [status].Label, [status], [status].Description"/>

      <item value="110100-: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="111000-: [user_id0].Label, [user_id0], [user_id0].Description"/>

      <categories>
        <category index="1" columns="120, 30, 70, 100, 100, 130, 0">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="9" columns="120, 30, 70, 100, 100, 130, 0">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    &XMLWhenFilterInit;
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22d2Yfo4+KApF/QNiuOloUdM=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptFilterInit;
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtf0ePKWMx2z3mvcfODpAeD6TbO3opaqe/n04Q34AtpZ1kFiw2I6YDJ5nIJArEF00UAQPuE7LmyvOyrWFWtbBGwAnwS0C6KUu04VQ8JCGLa2XBEtQlvwb0GjjQIkdR4pt4vXypYGQtRWG88/fXRXxy9L8LaBVFh4q/GQSZqoUY1momFqY9yoXhfraobiuNmDW4rQUdcJFXrbtgA33Df8SDPPjTJfHkmguIiSZpqLZANXiDdOGDS2iy16EMtelrBy0ml0jTHjQPi+az/B3H4yViAQSkK07jwTZvAxKV+a/69b3VnWO9Bz/0cDxfMhk4vt1dsY+8bIyhN1qXvPAcWeAquqD2FbTKRquUiEObmgw6E2QWm10V3OwMvW3KSV2UlEhXk0luN8PGNkT2swuKljsGwW69Z3mTQwSAQZrEVkj7hp0Zuhh3/SkEwWgA4mbuVKtpkHfoYEBotgm86CSWHWh8ps=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>