<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir id="0" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_kt1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Kiểm tra từ" e="Checking from"></header>
      <footer v="Kiểm tra từ/đến" e="Checking from/to"></footer>
    </field>
    <field name="ngay_kt2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Kiểm tra đến" e="Checking to"></header>
    </field>
    <field name="ngay_ph1" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Phát hành từ" e="Issuing from"></header>
      <footer v="Phát hành từ/đến" e="Issuing from/to"></footer>
    </field>
    <field name="ngay_ph2" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Phát hành đến" e="Issuing to"></header>
    </field>
    <field name="ngay_tu1" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Hiệu lực từ từ" e="Effective from from"></header>
      <footer v="Hiệu lực từ từ/đến" e="Effective from from/to"></footer>
    </field>
    <field name="ngay_tu2" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Hiệu lực từ đến" e="Effective from to"></header>
    </field>
    <field name="ngay_den1" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Hiệu lực đến từ" e="Effective to from"></header>
      <footer v="Hiệu lực đến từ/đến" e="Effective to from/to"></footer>
    </field>
    <field name="ngay_den2" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Hiệu lực đến đến" e="Effective to to"></header>
    </field>
    <field name="ma_nk">
      <header v="Quyển chứng từ" e="Voucher Book"></header>
      <items style="Lookup" controller="VoucherBook" key="status = 1" check="1=1"></items>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1=1"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 100, 130"/>
      <item value="1101: [ngay_kt1].Description, [ngay_kt1], [ngay_kt2]"/>
      <item value="1101: [ngay_ph1].Description, [ngay_ph1], [ngay_ph2]"/>
      <item value="1101: [ngay_tu1].Description, [ngay_tu1], [ngay_tu2]"/>
      <item value="1101: [ngay_den1].Description, [ngay_den1], [ngay_den2]"/>
      <item value="11000: [ma_nk].Label, [ma_nk]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4eSkRfWxRQYrC7igEtMPr7iuAqYIf7otDedtjofGM2nFqUIq3ZJLVVUleRWtnbZdLjFc6J6MH0QAQK9GPNETQzmsA5EG7R+iWnUfaCxFxyqtt9eSuTlaf/a2p23BDknfmSSNTCjoyR6cUbXH0UgDlq0=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUDUgbNVYWFCF9uidHHR3qE5HjEAMx1IWrbIRNwLNcDJ0NFeADxcjcwC3GaueDsNPHYn4HFtyCRw6MJ6GVZdEFE2LTYcXwvioGCr++j1SGwLqNK0MlrE+mm+4WvkIDrRjKx3VtKdY2jrOd+uFu2FqaDA7Exc7q3KaXinmBz1KXw2SagL41INfLYKrFK3XOpQHR2gotG9ClvZwFru8cyBp8euoeDG0ujsNY5aU5HiPctuUwEyZ+33Fh+DJ8pHtBb+UeUg5kmga3pGKcKTYEhrDRKKMxkbGam8ut5icT01+bLks=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>