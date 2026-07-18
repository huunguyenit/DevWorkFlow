<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>

  <fields>
    <field name="tk" allowNulls="false" aliasName="defaultAPAccount">
      <header v="Tài khoản" e="Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1' and tk_cn = 1" check="tk_cn = 1" />
    </field>
    <field name="ten_tk%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" allowNulls="false" aliasName="defaultAPSupplier">
      <header v="Nhà cung cấp" e="Supplier"/>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and (cc_yn = 1 or nv_yn = 1)" check="cc_yn = 1 or nv_yn = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true">
      <header v="" e=""/>
    </field>

    <field name="ngay_ht1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày hạch toán từ" e="GL Date from"></header>
      <footer v="Ngày hạch toán từ/đến" e="GL Date from/to"></footer>
    </field>
    <field name="ngay_ht2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày hạch toán đến" e="GL Date to"></header>
    </field>
    <field name="ngay_hd1" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày hóa đơn từ" e="Invoices Date from"></header>
      <footer v="Ngày hóa đơn từ/đến" e="Invoices Date from/to"></footer>
    </field>
    <field name="ngay_hd2" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày hóa đơn đến" e="Invoices Date to"></header>
    </field>
    <field name="ngay_bc" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày báo cáo" e="Report Date"/>
    </field>

    <field name="tinh_sd" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Tính số dư" e="Balance"/>
      <footer v="1 - Có tính số dư, 0 - Không tính số dư" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc">
      <header v="Mẫu báo cáo" e="Report Form"/>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
        <item value="20">
          <text v="Mẫu ngoại tệ" e="FC Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir" height="">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>

      <item value="1101: [ngay_ht1].Description, [ngay_ht1], [ngay_ht2]"/>
      <item value="1101: [ngay_hd1].Description, [ngay_hd1], [ngay_hd2]"/>
      <item value="110: [ngay_bc].Label, [ngay_bc]"/>

      <item value="111000: [tinh_sd].Label, [tinh_sd], [tinh_sd].Description"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuwYr2yQAbtOXS+fWW3PkYhLlh23qOlaZnx8ygGIBXkkfzwn+koL4ZpXNsnzv+oYs/xAI4Q6YkyqhjaZ0lS/aUmqZvRAgXeFC5IUlgP2KovFCghtVFWpg/sUw9ZCuUnNWpWy7jBpHnVNjW1tGJhl5VXKU01wchp8OLeQITUFKmA/eGqodYYYqzULlf9wMLNW/gPpxtjaAfYCIalvntH7kWT+6a4KwwDqcY4LF4QZhm1iG/yFnBZwbxWdNQfLkvC7en6TlomBtdisvLbFS34mOP7vPf7vKUgcnfk6tX3gO0f/rd6OAcpHC+R/Eee/AG44yWLTsloTfZ4v3cL6ih1NRuB7tyiXEWDwtnVgRUwFzB8xmbuF10Pru9ceVQisJ9ZNy0ID57+fReVPybzOgt7oqTaVDnNX8WyzT3/LZrpX1CuwQKNGOJR1/3mXUVTCkVJ7fhZiI/91qfiFt3iBhCRdWy4HPvLV8eKUas1CpOT2ubr8AVNuz/DfGL9sHcGga/EJH2SCAlSNfxKipe8wMntaReyXkGzLC5hh4KpPS0iwtkOOCd+Dkl6PiZ3GM3YWfxirnQSzPW8+/tUWQUGzQ7U2f/MThd61C5aOFjj2W7b9MKJbw80hz7i2J9M0rnJGu+MpMYi23xYWKzAZN1ZxyRuoOx+0=</Encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcU5d5UltcR8bTbfrnO2d1KzoFQzpUtyxRKhl7OwrbUCkyhCS0cKDjjydtp7U1Gt40VMTwS2kDaU5gfDO0hbswEbfmLYv+TuSC3odBnauXxCwyKhQ3LJjKz/4FfXF/suC1VN7RSrZcj0mCbO+SSEkOSRRSXko7Z2u7veg8DVcQKw6o4GXnZT5nWfQEtiBsrZy9CiVJubPpK4JHbaB/GwN3frITYBiZtvmVcS0Pl8GjaLKtrS1pXqJMGwQUVvHS1iAkoHPEJ0sGi6hCiPAAIklvCHgeKlNbEHKShw5gfDTkguPRjHr6H0jHXNi/VGbIYyOEcp9SelaVdKoFJXSKFKgK1cUR5M0J5FCBtS6jWg8qnGryPeBQBopduxpQ2OYBQ6eVUdjvQL6PyzKDwEyn09dQU2AsPJuvViBqdVbHN7gipGKhq4uy0lgxy/BVZWQPcr2+TvQmNOeZizRyDMtjEoCwHWCNeCJgndCATWz5oVUoUWcEfohaI9LDjj4QkP7btt/t6now2aAJEDjhDUN7Map47LXXXLQrQjUHTFf0ew/4HGy6f6cRhSOQbYa4us9PiF3H+XocmF373rOjATv+Xa77I+V1HzLU5dEDdchlMY1fWFy4A9WDMcuFV67lomY15hVfixcsMvh1WUU9SI9zw9OG3EZt3ehSI9iw1JHV2TfjMFxNI/HDn1s6muHEO/LIKuFDdN0r+151/U85575uIcucgXmQ9XEcUfu9OVZYx1sig5oqhvdqMF0FyQjr0vhhFRiQ80SRiqQsC7ZI2hLNQX3C62aINxJGpZ2M1yoakL5dFdQdmkoMfIwf0O/WxdD3+++vx6kuol9ST73kCv0M1nPbb+lJLfi4pcWvvcMv/z2d/1SETLcj1rmXvqDPmAt44vlNw</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu70QZzsPaDwFs+YifbSouifZ+Z8xb2vrymO7L8l1iONMshIBb8irW1YDA7cu+DB6ur11JOuGhj1b0YBXP2XIrznWtDX7nCPm8raIcGqV2RNAf/sP4a9d05bIuC8aZFPACReSn6Yh6f15Zlo7HwfBY7yav8Y00c9ooROw8QjMyGzjMq657SUpxeCdV3tCeBYOFQ==</Encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>