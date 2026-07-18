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
    <field name="ngay1" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày từ" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="ngay2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày đến" e="Date to"></header>
    </field>
    <field name="ma_ct" allowNulls="false">
      <header v="Mã chứng từ" e="Voucher Code"></header>
      <items style="AutoComplete" controller="Voucher" reference="ten_ct%l" key="wedition &lt;&gt; '9' and status = '1'" check="wedition &lt;&gt; '9'"/>
    </field>
    <field name="ten_ct%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="loai_ct" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Loại chứng từ" e="Voucher Type"></header>
      <footer v="1 - Phát sinh, 2 - Sửa" e="1 - New, 2 - Edit"/>
      <items style="Mask"></items>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 25, 75, 100, 230"/>
      <item value="1101-: [ngay1].Description, [ngay1], [ngay2]"/>
      <item value="11010: [ma_ct].Label, [ma_ct], [ten_ct%l]"/>
      <item value="11100: [loai_ct].Label, [loai_ct], [loai_ct].Description"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7KlG5Nwa3yvG5CSvBnKHjLpUCeO+lmt5I4/FTQ3nLRv19sen160/7LvFB1MRlzBTfC8sYi1gI8XU93XjQU5bs4qNvNByxdh8kXMa3V5isumQXbt9+oqTL/EzTuihb9B09Gw==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYU3jg67mYTmJvr0ghQ2FoZbHIzklYnV8t/i1gFxjmm49UUzGPjp0tcsk/w42IlcIInK3Oqip/OgsdcMqQT/QIkGhwnUWalPiGI6s4OB1nFfWUAmIVt8NUqE/hfkxmWi0Ag43tU5F1eFuQP8C/UUITRX5CWqSRPBEqLeHZNUzEzZuvlmdXfW1IVwrZQHw6UAI4KCSkmlPuXdiOKq0OZP74uw/Mbts6YgrnJHyMPQd4bu+vzyOsXlx1IOGz0tpo2AnLMYpB8Vpz11u0eu/5GKaP0zE2dkT3vsm52lg4vSniHqbCh3c7SCBOthGoZpYI5zJ6UkTDcjIeNhGJNd5OnnH/Q+xH30VB2/PB+kLSqElKEs9NSkAQWK/stxKUpyrbr751f12UP1hDJiX0F8XOoCWfAg==</encrypted>]]>
    </text>
  </script>
</dir>