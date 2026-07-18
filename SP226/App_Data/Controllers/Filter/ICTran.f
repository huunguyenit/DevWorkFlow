<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY % InternalTransport SYSTEM "..\Include\InternalTransport.ent">
  %InternalTransport;
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
    <field name="ma_ct" allowNulls="false">
      <header v="Mã chứng từ" e="Voucher Code"></header>
      <items style="AutoComplete" controller="Voucher" reference="ten_ct%l" key="ma_ct in ('HDA', 'HD1', 'HD2', 'HD4', 'HD5', 'HD6', 'PXC', 'PXD'&InternalTransportInvoiceVoucherID;) and status = '1'" check="ma_ct in ('HDA', 'HD1', 'HD2', 'HD4', 'HD5', 'HD6', 'PXC', 'PXD'&InternalTransportInvoiceVoucherID;)"/>
    </field>
    <field name="ten_ct%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nt">
      <header v="Mã ngoại tệ" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_nt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh">
      <header v="Mã khách hàng" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" allowNulls="false">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="user_id0" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Người sử dụng" e="User"></header>
      <footer v="1 - Lọc theo người sử dụng, 0 - Không" e="1 - Filter by User, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="maxLength" type="Int16" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="39">
      <item value="120, 30, 70, 100, 230, 0"/>
      <item value="1101: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="1101-1: [so_ct1].Label, [so_ct1], [so_ct2], [maxLength]"/>
      <item value="11010: [ma_ct].Label, [ma_ct], [ten_ct%l]"/>
      <item value="11010: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="11010: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="11010: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="11100: [user_id0].Label, [user_id0], [user_id0].Description"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7KqXmkBpuRDpzC9M7PcY1gVIx5IlsdZzU6E8T2Jxjq7S/KlMQgfvdW9s6pfmUOOBxook5+Q5jEllwEIKJ5KXc16NQByFExdVv/aP4Bjvf1784bL+2l2WXUz9dY3RZAA2hs75An+MLRLrcct7gJAgJw8c=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYBPjBKeM8/Qt3MheupAycbm2zTTGGEZMyjhaXuza8xtfZ2fiUU0FBk9W73cjVPp8gyROWOvk7xSNWUKBox1Dz77DVcfdtiTYPoQTif1RrAdZ+zFaE5Pjk1az0ThrZG6ihs+fjoxz1mApy4ujGIBZ+FCsIfGpEMMXs6csAoZFNHHftXJjAOwkFLxAiEgoUs1C9BiP2i2J/QrAXeVw8rNgdZ5ffBjhPvdyMVVMJ1qAYrNkuBg2w28MjX64miCpraOnD7UG3+xhCMzkQgDDT+FYhxvSBXYLFZtdDllSJsAYFquKOhX40kyHVw1gILzccrPwCMVDoTSR957LsKaGrBMy7RHSAQWDE4X0n2Nx47QeMQWVE0Q3yZdKexVCx1dfzaZc5BJiOt4+p31f5t3gNKFUGDjDdwm2T2VhAyEF/13XmYE1gbtG25r9CHQQF4R+D7CZrykz/NBJB4/m23KesVif+BZ8M9kWljJgfVvAZiIS9bv0nFekx3BlVnKNN/imFxkFT5LfUYpPp0mqBnxrKttv4xpdK7QkhLu8GokE/4Hn+rlfvdenQc/O4ttZxyv3IApH+rb1/kAhxMHm5AqPsUc+cAB7dHuWWhhzeJO2f1RrVgT5+G1mSHkf/kc9quXamBgy3elDC8g2QpBdDTcs7mbnWew==</encrypted>]]>
    </text>
  </script>
</dir>