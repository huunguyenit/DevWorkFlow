<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportCircularTypeField SYSTEM "..\Include\XML\Circular\A08200\ReportCircularTypeField.xml">
  <!ENTITY XMLWhenFilterQuerying SYSTEM "..\Include\XML\WhenFilterQuerying.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">

  <!ENTITY Controller "rptCashBook">
  <!ENTITY DynamicReportFields ",'&Controller;', '#$query', '@@sysDatabaseName'">
  <!ENTITY % ReferenceNumber SYSTEM "..\Include\ReferenceNumber.ent">
  %ReferenceNumber;
  <!ENTITY % ReportMargin SYSTEM "..\Include\ReportMargin.ent">
  %ReportMargin;
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>

  <fields>
    <field name="tk" allowNulls="false" clientDefault="111">
      <header v="Tài khoản" e="Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" normal="true" key="status = 1" check="1 = 1" row ="1"/>
    </field>
    <field name="ten_tk%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="phan_loai" dataFormatString="1, 2, 3" clientDefault="3" align="right">
      <header v="Phân loại" e="Type"/>
      <footer v="1 - Chi tiết, 2 - Nhóm theo tài khoản đối ứng, 3 - Nhóm theo chứng từ " e="1 - Detail, 2 - Group by Reference Account, 3 - Group by Voucher"></footer>
      <items style="Mask"/>
    </field>
    <field name="date_open" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày mở sổ" e="Date Opened"></header>
    </field>
    &ReportCircularTypeField;
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1 "/>
    </field>
    <field name="mau_bc" clientDefault="10">
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
    &ReportMarginField;
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="1101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="111000: [phan_loai].Label, [phan_loai], [phan_loai].Description"/>
      <item value="110: [date_open].Label, [date_open]"/>
      <item value="11000: [chon_tt].Label, [chon_tt]"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
      &ReportMarginView;
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    &XMLWhenFilterQuerying;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9eOZfOEWQcPADKnaQdRF5LsRwUBLzz59NtKqNIL+oj3Hk1WMA9iNmKn60BfWkePmrHSRWlB96mIPS0T/CatB8RZNM2Oyyfq6jkw7Uocz4n1K5alNPdgXHzFWSik/TfVfRcjGlkxAYi+M9Nj9BSttGq5zTwcB2Aiqh9mtYcgqsOqs2dSRY9bE0gfbzIw++iqE0Grw2vR7wcHOvKig+LZxcabC5ZPFYQic0ricu4CegR5uFNrFbqf0kIkAMRS4P3BagBZsi3pwWHNsrpBwo+I72lD7CHUIG99020PhG2gg5vieb8aYTSbdEp3w81Q3OwG1iJGJ9iAEAGkkZh2GHoEc/7CjIt4caie5JgAPRy3+wgjkCsyF6c3R99LnPW17RHBvHcwTzueU5Rk0W97thmee0okBu9LfqpPYdI8Uq7qQABJV89oEcR+pXWpy6FRnhJb2jYz0J5231+byX5HSUK//efbK8+l9+6nhXYjyFEh9u6KFcaXZJ5kMoVgaGk34OurvA==</Encrypted>]]>&DynamicReportFields;&ReferenceParameters;
        &ReportMarginProcessing;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9x3iOPwY9JZ/sHHlMarDELJsg7x4gDm1dIH/9N52L06cFTlMBxDfVzyAR0ik6EzufIlNDP4ueeUh8KnfIAbpdDd8oZdtBj061k/2qdWQL1bZlKyXOgO7s5Pnj0cSeGwAF6WSNrA80sKuGpmRQFKB9P+1ZjXTj+0eLSt/ApPhu4ePYJSg21qMrd/NfrKHa6LCs03VjDXX7RNjckHGArFPwGod1KtrovHqE115YmcouSPAI3WaKOIL6t8SdgfL1AxwnceT+3ST0dpAWzD45pdddLSLpFcTeh2R4iWubNcrE2DcAycadLnursPScSh5qUc7rRJe8t1t/YXWJVRAi3/vyc0qklgoe/0xIt5FhnV9CpKCpmWnCIOypIR5UK2N9mx/OIaXKwAxWa5lv2j/jYj1+FQAUdEj6xJ+blmipkr+t1AiJPApAXSsDcoEQmmj7HPRhMCf+IjJqL8uCU3DCfPeDJ2HYMf4UuBifn+SmNoRIKPhXF45codCQF5kigalDr5q/oEega2/hyGCGVKtaoB0x4BGelwQ1rVa23qQQ7+OujGwaePHNk9MrSt8WssGFgKeqs+vuVoCt/FIMX8+l9WCYz2FY4luIVnmFYsapG7i554bNd6YwT/khymwSC/VKFHvb5lCBbzHKWFNNI6eY4I+FIocH+G8X++V0kTI7vv4tD5hIkalWiSLJeDbx/4AI1gY2iZjzBORyGwWCESCkDluLYT</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>