<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY k " and ma_ct not in ('CR1','DM1','H02','H08','H09','H11','SF2','SF3')">
]>

<dir id="0" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Chứng từ từ ngày" e="Date From"></header>
      <footer v="Ngày chứng từ từ/đến" e="Date from/to"></footer>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Chứng từ đến ngày" e="Date to"></header>
    </field>
    <field name="so_ct1" align="right" dataFormatString="@upperCaseFormat" maxLength="-100">
      <header v="Chứng từ từ/đến số" e="Voucher No. from/to"/>
      <items style="Mask"/>
    </field>
    <field name="so_ct2" align="right" dataFormatString="@upperCaseFormat" maxLength="-100">
      <header v="" e=""/>
      <items style="Mask"/>
    </field>
    <field name="ma_ct" allowNulls="false">
      <header v="Mã chứng từ" e="Voucher Code"></header>
      <items style="AutoComplete" controller="Voucher" reference="ten_ct%l" key="exists(select 1 from @@sysDatabaseName..syscheckfields b where b.ma_ct = dmct.ma_ct)&k; and status = '1'" check="exists(select 1 from @@sysDatabaseName..syscheckfields b where b.ma_ct = dmct.ma_ct)&k;"/>
    </field>
    <field name="ten_ct%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="user_id2" onDemand="true">
      <header v="Người sửa" e="Modified By"></header>
      <items style="AutoComplete" controller="User" reference="comment%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="comment%l" readOnly="true" inactivate="true">
      <header v="" e=""/>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit" ></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="user_id0" dataFormatString="0, 1" clientDefault="0" align="right" inactivate="true">
      <header v="Người sử dụng" e="User"></header>
      <footer v="1 - Lọc theo người sử dụng, 0 - Không" e="1 - Filter by User, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="maxLength" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 25, 75, 100, 100, 130, 0"/>
      <item value="1101---: [ngay_tu].Description, [ngay_tu], [ngay_den]"/>
      <item value="1101--1: [so_ct1].Label, [so_ct1], [so_ct2], [maxLength]"/>
      <item value="110100-: [ma_ct].Label, [ma_ct], [ten_ct%l]"/>
      <item value="110100-: [user_id2].Label, [user_id2], [comment%l]"/>
      <item value="11000--: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11100--: [user_id0].Label, [user_id0], [user_id0].Description"/>

    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22alPjDnV4JapQMqYNEp52dVk3waJzJqFnYvAIGzHRkQy+IJeP+Wid7PtvdBz0Hh/kO8v/qPXzqp7V719H44P+7witeC6C68IW+YLiocMtmT1EeFRlnTM8vcyPxBHfrtTcAAHw9LvIYYRAEBlKBAHSIFxazsgTh2lVOIuisC6wX1W</Encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcGeuoNfgpy/m11KHslB8AFsW2sEQ0BxJ3/DybN0FS0hTeaZUbHZxSQD1WfpA0HzVBqImDkIevJS9IeYD1wss1vR4QHMfGWtZnQ3rSWUXSF/l</Encrypted>]]>
      </text>
    </command>

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6ewGKrqbDYzMmFKs8xTBf1w6pMNA32SVtmrSIGddT5qmI6KneBiH/oqyoRC0LLdK8zcawfDlGd6n3nOSinxZLR7P/bExqp6V+cUPgpSclsHRLXr+xPLlkipjUdEIvpHgXwYtP4/lbyckYppVlCdIiMGOIoQqnH/YvO7StavY1aIT/ZXZgWaA8RArGh+2gxjYKwdTuLO5zbbFnwKQUs9+Rw4fr+iqeGMlJ/f779MrdPl/9XCKM26Jx0SeLV687I8LYdOSv8jgPbEN0UAOHwgOW1ny+XPOMMYw6wGXO4iSI8e</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtYBagcalDzVLMZUje0z+/tjaLy3hQCMPahY5KXrIbW6SfbfSr16kJCOq4EHExvhAtZucWYiZ+2Nzft/dPm9ZAGMNAkrZG5rkaGIvVWWw4N5zZGG6uCUudpTj+FNrmL9ql9/wysWv5nve5EtrT5UaA8RWf2iXQ92yKQZLXOKcZwXbdEvRXiJ0zCHQfSKkGOb1ERkORns2ptGkfrjAvBQQiAemSKWT86ZlPJSsPCcdhuQ8Db0dKfZjUfej7iIZJfm5yZP3kl2334ivU5QvIUx+fraAv49PO0hoFh9fu3Jh2HJBbhuLNtp9yPDRJXOhZoSigOvJ8t3CnPWTjZNha0rRCDf/xE1+EbWqeTJKQMBkN4GnFZfnY/mtteRFqpb9Ui2teGkeuJ+Hh79UrCNv8ZaKGvL97TV5H5KnjV2SvgpSrkUON+OHHsWZLa9de75oVGe5XpYJOEGwviJ+p7CmJ7BN4gh6p50Xgg1UwG5JQWh0ZfoV</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>