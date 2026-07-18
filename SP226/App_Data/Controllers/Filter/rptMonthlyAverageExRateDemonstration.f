<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY XMLWhenFilterQuerying SYSTEM "..\Include\XML\WhenFilterQuerying.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY Controller "rptMonthlyAverageExRateDemonstration">
  <!ENTITY DynamicReportFields ",'&Controller;', '#$query', '@@sysDatabaseName'">
  <!ENTITY % ReferenceNumber SYSTEM "..\Include\ReferenceNumber.ent">
  %ReferenceNumber;
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tk" allowNulls="false">
      <header v="Tài khoản" e="Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1' and loai_tk = 1 and (loai_cl_no = 1 or loai_cl_co = 1)" check="loai_tk = 1 and (loai_cl_no = 1 or loai_cl_co = 1)"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZaKDE8NkAheww3P2CifgAo30XkWpyvuUr6FteEwIgYRwMxSMj2w/OEU9CYe7NGT2ZQ==</encrypted>]]></clientScript>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" filterSource="Optional">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ky" type="Decimal" dataFormatString="#0" allowNulls="false">
      <header v="Kỳ" e="Period"/>
      <footer v="Kỳ/năm" e="Period/Year"/>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Năm" e="Year"/>
      <items style="Numeric"></items>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc">
      <header v="Mẫu báo cáo" e="Report Form"></header>
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
      <item value="120, 30, 40, 30, 200, 130"/>
      <item value="110010: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="110010: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="111--: [ky].Description, [ky], [nam]"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    &XMLWhenFilterQuerying;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VqWAolknr9aWWzlwgV7+2FmaIOssxD+Xe1J8CwqIzNNzLHNEl+KrgvXcNPu2FfZqGR02bjSCWQBLSqHVw5t54/C8uztXxc8RvfGgVfXx83cSFTbuAm6I4BJEuJXnGRPzvAXjKx9XBA9CGk8degNFTML2Zee972uCXlrAkyLiGIDh4cLPyvVWyH6Xp7ITfaGQQW6n5uGJzRtbUR5KRfePkRSbc9ucIsYKn0Zut2+HIwjHRV5Jx5yVj4kmFtRbrLN9W1rG9YwsIoDiqf1+gsvwqimSv0sXABfG0NZAC1fwcaVU2nsIcyroa6vj2Zlt9WGfg7RnaNoBs+Z9fsYXSK7+vo=</encrypted>]]>&DynamicReportFields;&ReferenceParameters;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYsS0w3kJz0tvCdgJJDma1pWNu0Nb6I9hrNZLJW41QcumvW9Q1vjs6rs6GcZxG1j3NKEwnI8Usnq7VZGROqF0Ux+RJPA3d7rXQtCboDq4B9cIiLI9Stb+e+Az/0JsJhl2TcUGW+NN4UcTIYvRDiItFNR9ibglaDdUVsX4lOYcnL38pwenBhzHHkAR7QQvf8wlb9esB2SNpEFmWW1AFUcVhrzZqp7IupLNM8Yj+vapF2vnzD7AHq4wESkMoWiFpYEq+fJEqH8e0qP4QMAck1MFi9ID/QrOo5nbfPwWIthDcEKIjqvNKEKpd9g4mVYqWNrhRfh/uipRbc7FrArBN9PJjhxZCGniajxD5mSYGP0RR8WeynpYLgA/7lsBRuXoOBABtuKhTCtdvTWlW8A+5Jfn651ClucF1Z8UT0B4hpZb548E2Fq6sPwWp7+LBP4DA9AWktnYoQNY9kPjYo8iVyIl0dXZz10yowJnHPkm9K52bstNy8chQdIpCVNBaJ+uviZtD5SNfuM7+YumMYbX3BItCb7M9wKSHqO5IYMa53MPCkqnEqjQU2HVInmvA9HTrXHT1kaI5ZxLlmMp9S9hbA449jNeX7/anTTkfnmr74cb5uU+TRa3d+6fn7kUGS94C7/QOIlJrPQ8OnuIYLSjtUlC+iFJeE6WeGe30Ymz/X8Hq3cOcvzOn5WuNtJVyEbIioywFMqgqInwuvw2TbqzU1RERx+in8SE4ppErRO7XzRBCOTvgrNsA5XWa4gXc6EC30UL4KNio7cFunzxdvrlLNlMG0Y4WD9UsbHstuVyIe1hMZLSt/G0RJEPid2KdzibvFgszT3R9mEF2niN9DnVlCrbXnYKu9GAAzXwLeTIY5mFXv0TxuGw8cUYIdkpKQuAsoshvcPtUf45c0WKpI+ju+01qHDUL/mh2pnmjBDyGHBKuZlAFSQfz0poNkt3A7R79cd8QyEOqbiU5l7PKKWZXWaZMYXMfNKHa/+i0+IOqUAOiAY4hnARcNyLT+H6J+CMmgf6fpARvO4yiJePm+CokBt1nfKHdr8Umfl6mzO4TWDoxndaYK6iClV0RBGAPvwoasZ54fBuT0BYtJibd5/KYMtFO070hjppuzaVvQ2RQ5aJpXu0=</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetCheckAccount">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6eg9iqZLkEShP4g+b+yVTYSdygUhKLSi9fsfrlMx+fTn6BbZOWBuGQeeTiDfTCKNsPPM/jB5vjIuLR7cmhotxU0bMXrIko7bAV4S6cLnT/Mrp8JnB35YdsOHup4V8UXXrjjwm7R7cX871qvfjGysFiFPi0xtYiiEl5LffsUsGe4rPLmJyNWyaeV5E0C3YHpw3w==</encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>