<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">

  <!ENTITY % ReportMargin SYSTEM "..\Include\ReportMargin.ent">
  %ReportMargin;
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="date_from" type="DateTime" dataFormatString="@datetimeFormat" aliasName="fromDate" defaultValue="new Date()" allowNulls="false">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="date_to" type="DateTime" dataFormatString="@datetimeFormat" aliasName="toDate" defaultValue="new Date()" allowNulls="false">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="tk" aliasName="defaultGLAccount" allowNulls="false">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_ku" allowNulls="false">
      <header v="Khế ước" e="Loan Contract"/>
      <items style="AutoComplete" controller="LoanContract" reference="ten_ku%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_ku%l" readOnly="true" external="true" categoryIndex="3">
      <header v="" e=""/>
    </field>
    <field name="ma_kh" dataFormatString="@upperCaseFormat" filterSource="Vacant">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="date_open" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày mở sổ" e="Date Opened"></header>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"></header>
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
      <item value="120, 20, 80, 100, 100, 130"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="110100: [ma_ku].Label, [ma_ku], [ten_ku%l]"/>

      <item value="1101: [date_from].Description, [date_from], [date_to]"/>
      <item value="110: [date_open].Label, [date_open]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
      &ReportMarginView;
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcCuUnkuO1EYX5KGtC7i95FWpNmexE86a5ee2eIRVY3ZCdYzPEP4/u7NtK+SH/N9vA5Utv75wGozstE+gxa7eLrQZliQ4FRzxwIxWETaYyFBFg7Jynh0mVyj6Vm8nyHMmTQ==</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9eOZfOEWQcPADKnaQdRF5LsRwUBLzz59NtKqNIL+oj3RUykY1GT0gQ57AsI56lE2huqfCBFeX0Q9bMf/4WEW6meMuzIqdi+DenRsc9AGcs8a3wrjZWIIGSXrqwn8Q6293U/mfTS0xfernBNejwto7+j5nTzY2/EMjQnvAfpjtFugrfMUGuSUYEYmH3W6/+izq3//+np52STiAGL/Wj9IUMC/LqdeL+zgfk9FcvwJeg6ArWUMRKCM2pIP8+zpBtqfTSpb21yTlmraW4VCLh0xRx1tSXiAPXVpoENsMle9/jvf6/yf2EKhAlDxjZXOVAqIYldRTvxEGCfvMHf8IILsOeexjWFTtUd8Q9jjompr0QOu0Ye/PmHFmN4yfp7T9B8UQ7ijblH4N709WNdcIiHmevn32qoijN6BDoMDLMGeZlPcgF+g9VP3LVLRIl0yQPwNcmeNOFLWOflf8Hv/14mcCxlePlk4dplc2M7K0lELbu9DzUSFxuWFrqkEYuNYj9QC+5IH4mwenu5k+NEzKKH5dDXWQD5uEh0wWVv8dizOesh</Encrypted>]]>
        &ReportMarginProcessing;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9y0QuIYPMIWvLaePUtJ/sEXLfwx3nOXnZzsY0Jgey+z98ooCO5irhauLLOSCF7YJmplstnreTUfgf6hbr58noDwUEHoSvtu+UBbyK2ppK9xQMcQ3hM1x9S+GvzuPiMdUm11p4ERaHCBjjABvu4YYdGWwL8EmZ8wfctiQjD97u5QJCAkr5vLk6Y+VZ1KBJkQkCF5HdI/QPpX4N0jUswpNmWqLGv/No0W4wADuXjAlmOZSRHrfix/yPBs/fAFliSq1faslnYjHzQamrjR41R9EoVLBbHjtKoZ+7GXN6k04iE+iD4ah1aX8G3yB4I/WTWdJYgzz5GXTxEy6j3nkP3K0GrGI2LDY7aFVxG3MGwNu+rDeDZZ16d28d7EQM9+1MmdTcLuYjCpEbBOS61vgw0PNvYwa/HVCmMTkTuXFuEsdKIrc4ccFum82y3Cl3MwWVHsgNMmNyjZ+5FHkdalFVF+kEaWEWOeHadQ9PRqoN0Ys3H2rjXs7KL7sk+mn314lm4jOa1Nnj+PfOpJZpCndFKfYOqv9juRnuQXbYmMoLnZghNPb0lx4ph9qnjN9zAjzxdUCdUHrJRBFux3pd1px1o/3hjLP8sb7pE5sDL5HIZRWkNz6ZTbxXE6UuX8xUp/srhNKkV0coXX2zd3Qwc5/9BUQjFH2VukRZYnigq6xWB9YTDEWWSKB8oNvdQj8OGA5OSI3LeaM91c9ydQ9bOPPO1E8e7ZRwq/UUwDFyZfcZz5uIk9G/7+zj1cnD8i3Z7XTC5nzMvfpJd3tg2atK92Q6iZmj02zLfqaGpdaUJ/8SaDVDJmq2Y7m73FIKEJSFKHGbcfHLso6ouG/J0E4W4Mmde3vTLb05S5zMSUsqsBhuagT9I6Wg==</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu70QZzsPaDwFs+YifbSouifiyQBkdvDG95EJTEdIt66OvFJinP2Kyzj3jT0QRsptEMoOdMYZ4n2xjB4ZTbHxrFOJ7E2YHZzAwWwiv1Vm+oEYmFMRfmjwsOch1YJG7ACq9tpqQFgz5u6/kAWqF93OoaE=</Encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>