<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY TransferID "rptInterpretationFinancialForInvestors">
  <!ENTITY FileName "case when @@language = 'V' then 'rptInterpretationFinancialForInvestors_01BC' else 'rptInterpretationFinancialForInvestors_01FC' end + case when @chon_tt = '1' then '' else '_A04195' end">
  <!ENTITY ReportCircularTypeField SYSTEM "..\Include\XML\Circular\A04195\ReportCircularTypeField.xml">

  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128)
select @ticket = lower(replace(newid(),'-','')), @filename = &FileName; + '.xlsx'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, case when @@language = 'v' then N'Thuyết minh tài chính' else N'Interpretation of Financial' end, '@@appDatabaseName', getdate());">

  <!ENTITY defaultTable "V20GLTCTMDT">
  <!ENTITY defaultForm "V20GLTCTMDT">

  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="2" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>

  <fields>
    <field name="ky_nay_tu" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="ky_nay_den" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="type" clientDefault="10">
      <header v="Hiển thị" e="Display"/>
      <items style="DropDownList">
        <item value="10">
          <text v="Chỉ tiêu đơn" e="Normal"/>
        </item>
        <item value="20">
          <text v="Chỉ tiêu dựng cột" e="Crosstab"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit" ></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>

    &ReportCircularTypeField;

    <field name="form" allowNulls="false">
      <header v="Chọn báo cáo" e="Select Report"/>
      <items style="DropDownList">
        <item value="">
          <text v="" e=""/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList" >
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
    <view id="Dir">
      <item value="120, 30, 40, 30, 100, 100, 130"/>
      <item value="11001--: [ky_nay_tu].Description, [ky_nay_tu], [ky_nay_den]"/>
      <item value="110000-: [type].Label, [type]"/>
      <item value="110000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110000-: [chon_tt].Label, [chon_tt]"/>
      <item value="110000-: [form].Label, [form]"/>
      <item value="110000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>

    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2jQihU+ZF1gJYdNPaJrPsDCzDTbAYjxedDUkYV9a1omgMm+cPs69mQwYzgY3h4nm01Vlkt0i7ZN4aRatfJtsDT14VzQlWczZZD6YhQLYmkOYDAvikFzM3hhUTeaQpCshOeBsp8gao/2gAu+NPANCbJc1uS/kVCwo6FdfB8FyO0o/4AoVPcNeY6zuOn3stz0rCsNSAF0vrzMtUqU4zN4Tt6RtvaCTeDbS5fx6r7CFEnZ</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&Yg5kCMHpRxVk0phZxDQR77vgMbfRI3e6BDGxfc5Ox9Q7NQj/TyNRhVfZFlOvLuifczsC3808P7sQbgMP84SBxOZ6l59izXgrM6KdjYh6IvjbJRdDoG8rtdBxv6hnwjJ83v/zdjYfDr8DRfpfsU+4fzrzw/Ea1dJLlz4/FRhWOo175ipm/qs+2CIJoN7hE/WCzojw8cpLpM2w8lMyjeeaO04TlXfpL14C7zkINVkCqbg6vGvPVROBq1ZY/aD93XKT</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Inserting">
      <text>
        &CreateTicket;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHQHZ1sEfLBLAU7ylm0Tw/KMAwDvGz8PZuqZn26s16Y379TkGqQ6m0u5Cg6UVwrK/Crnia1zs2H1NRz/OcoH6Z0HrRaPAHfZuuo1dQ2m15pWRJ9byabr/k08Ed18/MoD1o5tLQ0yG3huMleIobYZq1A=</Encrypted>]]>
      </text>
    </command>
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4VyI/voT65Uj9ceuBFLF5X4PQn1CLVynJVFu/Lgt0nQOSzFIrNUNMUKDSwRd8QrwzUOpwl1Dube7VOwGGDlsmiDobuAwseH4L/nMFCSUFINN4l1jLdin83l5t7eJa1IIlfglPUnudKH3xmXPZ1yFPiAibZFNurXJR12JKFUKEsmZ</Encrypted>]]>&FileName;<![CDATA[<Encrypted>&4ZPjJCDV5/vla5iUvMOC6y/QGS/TL1Hnzb+wektVlgY07I0oV7J4nBOKCfg5f6my</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUpTGGv1w+iiyPFOfxifCL8hdA7B08xnvwG/eJYId7vX5k4fakxp2403YCYiA0/kShI0JajrRnIRVoGVwkeJ2cNoEWwRDYO5lEpdT9qssg9xUYJZF9nivOlNTr7lW17YBJOj9AJMXxTNh87l292To8xfYcy5HrtKgsEyZbYGPSArUYtikRuHC7335f/GV5C7FEMo5tqw2H1chaEJHG7nxEZm7vSfsUbUdpqZTl3h71wMej5EaVQSwFvpgwohPlZdTCeZowbWFSidaz6br2MhQvOQDu9wsRZy8c8/kY0XI1PrFwXoniaBMAQaFzh+v5QiCjlY5IFfCaLK8YPqf4oNiRN1i+F2A+cvyRZJuglIHkPr0SAtbmJq1vCW1yMmsddOUtfrwIyfdVTy/FmPvmCT71LJXoyD2t6OepyHpAHtObBFgXlUKrlqOX75n5+En7VMzN3gIrVxxlJE8HsWqXwgyHO0FotehmV+a4Lrzd/PtYODmAWM39emZF55wvtAYFqHlY0KHjSmDMkQBBBZ77zohPGUMLQe+HiOx9quWz9JHGUXtAkG3Pt6bv5YE8lUh9ewsfaCBuYlsYYQ8uWZogYcS7SfCM5iFkENxdLA/lKJxeIOUhTxX7YBJi+eUKYPkQPGxb5DF8jY4eQs3MAmnBx81dmxIg2xhCvRzpYuKC/vXPgezEp6EFy0Xfm16yPuzrIZSepB+kQtcqVZ+zgF67C3UMzWvuliCuJL+XocUlNvXOCOHB5BuIIALtJkrYzL8UCkV8</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>