<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">

  <!ENTITY % InternalTransport SYSTEM "..\Include\InternalTransport.ent">
  %InternalTransport;
]>

<dir id="0" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày hóa đơn từ" e="Invoice Date from"></header>
      <footer v="Ngày hóa đơn từ/đến" e="Invoice Date from/to"></footer>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày hóa đơn đến" e="Invoice Date to"></header>
    </field>
    <field name="so_hd_tu" dataFormatString="@upperCaseFormat" align="right" maxLength="-100">
      <header v="Hóa đơn từ số" e="Invoice No. from"></header>
      <footer v="Hóa đơn từ/đến số" e="Invoice No. from/to"></footer>
      <items style="Mask"></items>
    </field>
    <field name="so_hd_den" dataFormatString="@upperCaseFormat" align="right" maxLength="-100">
      <header v="Hóa đơn đến số" e="Invoice No. to"></header>
      <items style="Mask"></items>
    </field>
    <field name="ma_ct" allowNulls="false">
      <header v="Mã chứng từ" e="Voucher Code"></header>
      <items style="AutoComplete" controller="Voucher" reference="ten_ct%l" key="ma_ct in ('HDA', 'HD1', 'HD2', 'HD4', 'HD5', 'PXC', 'PXD'&InternalTransportInvoiceVoucherID;) and status = '1'" check="ma_ct in ('HDA', 'HD1', 'HD2', 'HD4', 'HD5', 'PXC', 'PXD'&InternalTransportInvoiceVoucherID;)"/>
    </field>
    <field name="ten_ct%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh">
      <header v="Khách hàng" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_nt">
      <header v="Ngoại tệ" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_nt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="status" dataFormatString="*, 0, 1" clientDefault="1" align="right" inactivate="true" categoryIndex="9">
      <header v="Tình trạng" e="Status"></header>
      <footer v="* - Tất cả, 0 - Chưa in, 1 - Đã in" e="* - All, 0 - Unprinted, 1 - Printed"></footer>
      <items style="Mask"/>
    </field>
    <field name="maxLength" type="Int16" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="39">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101--: [ngay_tu].Description, [ngay_tu], [ngay_den]"/>
      <item value="1101-1: [so_hd_tu].Description, [so_hd_tu], [so_hd_den], [maxLength]"/>
      <item value="110100: [ma_ct].Label, [ma_ct], [ten_ct%l]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="111000: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7Kg0tld9+EvPfw9ugQWN9Ws3RBtUx2TZ+lnSONCoCvMnJl8lUWbjAYg/I4CzW6u5q/vva8pve0kZSGz+RM9V+Gkp0XLwA3TtidaJ9nP5H29FP71misqy8FnAcXquWTLSKxAox3OZfKQ7NEumwjExLkBpNm0cYiZZFKZIP1anxEzM7</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYBPjBKeM8/Qt3MheupAycbm2zTTGGEZMyjhaXuza8xtfZ2fiUU0FBk9W73cjVPp8gyROWOvk7xSNWUKBox1Dz7/m4CZfDmInl2Koi1XLotnc6ZHZLC607rNf0UFLOmwBFvdcGu5IeDGC/nYFsTH0ghIDapTZtKL7C1GopOXxnX8V6riJlRizHtNJdg7cOAJUdKHmnLH9njgJbQ+Vsm4MAYwbLKxmyPgaauv8MLEld/KI0HlbNz66GbHuex5GnOP2GE/vC+V6DixtJMv+Ly9686TRYxnuQ9j9+esBSHkObt1UAyf8fwEcmD52RLa2vuta5GrxkXt04tNE9CrZ94DhmehHVNSbOjaKJRo99lIeeBPCK5zJ4/ty6YgU8at5vfUYeQXhqghOW2Qqm2E8Fyjry0Sf9ZQB6D75qBsS3qp7PS+/En9WzX70dJ36FI8roFFQK2xhEktZYka+TKOmHW53/T4agjQOaBb2ik6PQRw8GmuLHJS5OttAiRVfwckuC2YDiupjX63QPvgZAqHBykIcVIXlFh8GZLwD9eaHX6N0Jw7IqwkAFdjcYL65FHePn5zcM</encrypted>]]>
    </text>
  </script>
</dir>