<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Controller "rptListOfDetailedVariance">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY GetReportFormLimitRight SYSTEM "..\Include\Command\GetReportFormLimitRight.txt">
  <!ENTITY SetReportFormLimitRight SYSTEM "..\Include\Javascript\SetReportFormLimitRight.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
  <!ENTITY % ReferenceNumber SYSTEM "..\Include\ReferenceNumber.ent">
  %ReferenceNumber;
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"/>
      <footer v="Từ/đến ngày" e="Date from/to"/>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"/>
    </field>
    <field name="ma_kho">
      <header v="Mã kho" e="Site"/>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="ma_vt" allowNulls="false">
      <header v="Mã vật tư" e="Item"/>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true">
      <header v="" e=""/>
    </field>

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"/>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu in chỉ có số lượng" e="Quantity Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="view_nhap_yn">
      <header v="" e=""/>
    </field>
    <field name="view_xuat_yn">
      <header v="" e=""/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="1101--1: [tu_ngay].Description, [tu_ngay], [den_ngay], [view_nhap_yn]"/>
      <item value="1101000: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="1101000: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="11000-1: [ma_dvcs].Label, [ma_dvcs], [view_xuat_yn]"/>
      <item value="11000--: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvnZPRiKEfPKjxHBmJnvU1lVtlo+1Oh7odASSFZnsPBg9Zo+rjYXqzXYFeMYQpMONV0=</Encrypted>]]>&GetReportFormLimitRight;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcM0GUti1kCp50u/Joaj4mLrRFBFrkg61EVyh0XGpA19zx05m0tH1OgdPSKya+jhQB92mZjn9Ot4aMXMuRM9wUx/xclTHT0ytQP5YzsDNDeJ2</Encrypted>]]>
      </text>
    </command>
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHXojy5noBgKx3Sg2+EUbM2JC+T6j2bvYoMZKxvBSdhe8uefB72Je7SHIDWTO2HjiraUBgZ5gHlAW0V9CUVC09ODsmq66GCcBe7ZK6axYCJ/4qecitzSm0baDQUlGEAQ/qsJEv5zkNazqrA3nDHebjFvoji1N3X27B8aIcmC82oV</Encrypted>]]>&ReferenceParameters;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      &ScriptQueryFilterString;
      &SetReportFormLimitRight;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdDqS2nZpjMFZD+ajcJqY6S0MraksmenqXt2vjKyhYADT603pcch94Qvt3QLMl7HIi1+f+xC6UgQK23Xx4bCMjwBLUOisyOeT0Na8FKYMv9AeZt5RWhcVa1ilwP2ohhPsqZiQpex+wloCwfhIzKNuF64w1M/UyxyXee3IVbIclbMXAdY9rRxfr+1ghzT+8ZpFtTwZ15glbyvRcDcjzV6lR6gUmkXQDpLffiA1F/pfuG2REG2oNSRa/fms0d5jFRJUo7S3lvSFtWS/Kf6IvBbzSnLXHEg1VbRZAIVRLhVq79Y5ItFjUbdXM0tWgh8Wvv+uHJN5ui1F1GU/Pq4x3PUOF6HIhhKMhhxQQPB0/EeABG/s5/AklUJlzrinc2f8z1Pmn9txP1jWn9e7TGu6t/CxBhLhkFSx48BQQSdGhAH1nZ0F1vscaA3QEl/wcTzBi9JHohegXNnhfmKTj14mvTEgQcT8HBn3u32OHTTFW4vrliI2dSa1lzePTA2OuUIoj7yn5aF9uRnz9UGD2X7XY0FAgvnMhexcXPiDmQ9s81dVAlYMDvvaKl7MIexnBSe6s16mp/xzZ/uLiD10Xgic67WmVewuG8j4SblmewNqvBUSqlhgTpKO177rMOPlLYm9yPocI8DsViBgKEhp4iWxR9UR2Cw=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>