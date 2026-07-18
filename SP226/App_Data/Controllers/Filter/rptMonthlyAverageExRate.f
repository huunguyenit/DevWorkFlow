<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>

  <fields>
    <field name="ky" type="Decimal" dataFormatString="#0" allowNulls="false">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="tk">
      <header v="Tài khoản" e="Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1" />
    </field>
    <field name="ten_tk%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" allowNulls="false">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" reference="ten_dvcs%l" controller="Unit" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_dvcs%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"/>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 100, 130"/>
      <item value="11----: [ky].Label, [ky]"/>
      <item value="11----: [nam].Label, [nam]"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing" >
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6bRdq+JMvaYUwdjDYqWqhq1Ue3L/pIwFjuH5RtgeMwJBiAXFImn/hu/8e8S33wgmUajGTeLp7m2blr0XgQV/4GU5R/zgAv2klCYeaYEp09qMx4qJqEhcZK43CjP7ip8xYErYC30AYB7HuyiXcwcckDAjxBlGZt5gi+exT1AU02VI+NrtLP4YAt0Jd1wsgXuP0b43u7cfN8kDTypdLEahQIZcnOLCtARpE3SKaMFU5fLFHSzEFrJ0xSEdvjlRFNGsYldwZFaCyQzE/AR9G8hPp8I=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYBPjBKeM8/Qt3MheupAycbm2zTTGGEZMyjhaXuza8xteyPF0h92PjacbhRzveO3bPBhonJTgGj+opsHG8JTjTqkW5lw7JT1cvf6lCBDqxU72xZU6gJ+vEt/WbiYYehwuJbOxZ96YEO+7UoY8zolScz1/CnBB4Z3kyBmC+JpAFnHoonBwRqtv5DAzOOwrCgm/ikV+qcjeSjitUl7kGOTF7yHPL9odkJQvW4T6jTdKKZgqeC2FDQHYo1T9ODFt6fje+FzWwWwLFGhgM0Y2qnSM5XQ/YYRDljoVCI73sFAWTPUto/Yjc3c0CqYwXP4fiYd9NS2GnQVMtksILXKwqeqafyjD6BGAOIHNKjo5Q6PUk1b8cbZw7r3naqkyBD0idRDurU4i5XcgHWP1nB6J66R9qLa7pt/TztCWGCQaMl50aKwzw+w9oZxv25cRIvOMzLyTevJK0Bw8kvhMx7tr7dUZT5ETYf1F6g0m1p/HuwtxWeWI=</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>