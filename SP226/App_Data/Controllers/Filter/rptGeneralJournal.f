<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
  <!ENTITY % ReferenceNumber SYSTEM "..\Include\ReferenceNumber.ent">
  %ReferenceNumber;
  <!ENTITY % ReportMargin SYSTEM "..\Include\ReportMargin.ent">
  %ReportMargin;
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay1" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="ngay2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="ngay3" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày mở sổ" e="Date Opened"></header>
    </field>
    <field name="in_ct" type="Boolean" clientDefault="1" inactivate="true">
      <header v="In chứng từ thuộc nhật ký đặc biệt" e="Include Special Books Voucher"></header>
      <items style="CheckBox">
      </items>
    </field>
    <field name="ht_yn" type="Boolean" inactivate="true">
      <header v="Hiển thị theo diễn giải chi tiết" e="Use Detail Voucher Description"></header>
      <items style="CheckBox"/>
    </field>
    <field name="gr_yn" type="Boolean" inactivate="true">
      <header v="Nhóm theo tài khoản" e="Group by Account"></header>
      <items style="CheckBox">
      </items>
    </field>

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <clientScript>&OnSelectionOutline;</clientScript>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
        <item value="20">
          <text v="Mẫu ngoại tệ" e="FC Form"/>
        </item>
      </items>
    </field>
    &ReportMarginField;
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 20, 80, 100, 100, 130"/>
      <item value="1101--: [ngay1].Description, [ngay1], [ngay2]"/>
      <item value="110---: [ngay3].Label, [ngay3]"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
      &ReportMarginView;
      <item value="-11000: [in_ct], [in_ct].Label"/>
      <item value="-11000: [ht_yn], [ht_yn].Label"/>
      <item value="-11000: [gr_yn], [gr_yn].Label"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4PhtDWYRR8zKDjYZlS1SzGxW5xBGU6rJmn4j+Xpie7AC2MntJ+2DDFIisMVvm52HUvGjzzlsOtTKcOwp/VV9XIPHnnksSzWr1clFQ38HYmTa51lwOe2HETyBBjZ09QFhz1zS/zxT1b7QgUu57XRPzOWtqrkv0oCzIkusrbceqaURsI2dJ6OreIyVnyT38JIriKE74mxsfuxfNtAy84CkhlUWAa8liDhr6MvCMKLTv7VPhXUF70TTclNFB6rFQJ2ZNFR8ZV5smGZwtUDQtIloSTcsmmywH3EPyS+soa21DOyxsGUIOdViZKUdxCnaKipqQH25HOWtbMWW0NbFuInToOt5JxC4FHsAWiAPw+r75466obZah/roOZk5fkHOrR8D279dX+3A0+R3ZzNrZgH7CWzVwerDj6XxcjMXeIBrakhaAy7mWDpRfBmdSkrmXUNiDl0s/J5oDGIIMttw9fAf2ZhmO8UZMgTZx+loBD7+U7xtLutryoLKyQTB458XTXNb0xLUAS98zjdjZ6wLvX1aH7xUKvuD4klEjWX0ylqKuJ7</Encrypted>]]>
        &ReferenceParameters;
        &ReportMarginProcessing;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUP/1R22xXsb+HK8z5v0XkAvufLtm2qWW20iLAQ3UGk8C7vUgSALH4ahRS0BWxLovNYdkXI4aH+3yRiAFdATtnwW1NjjzBdHSqWuRFbu8sNZN44vF6m25VY1y6pZfc9FBxH1r4WAuiLGFWKemIOXrL6MziP+qbXU902d1MzE2464tss6TdnlCSN4xCGaxKuWuW8MK87ApZv5TCDu45+JeyWGs62qUcpJ8KVsoFdQPHc76YmFd+lPL7ZDQ/CiYKQLLE1I9HkZdYLVuPT3z1Y22vU4FT8uVzVNgsQKxXpx8Q+tIefhYYRWM5sQqngYlfhBzg+umFkEL9bEOyzD4KVS1VPCHC0ZZ9DTGypg8dl+z5XdPASQFrHciAdnJ8RUtCrCEohxSekfYpSne3DAWxxGZa7dDN0wDXOdWKRcnYgLBMNt+oGT76kjtU+v6r2BNfKV1f</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>