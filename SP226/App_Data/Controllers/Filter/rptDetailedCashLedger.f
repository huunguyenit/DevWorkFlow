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

  <!ENTITY Controller "rptDetailedCashLedger">
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
    <field name="phan_loai" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Phân loại" e="Type"/>
      <footer v="1 - Chi tiết, 2 - Nhóm theo tài khoản đối ứng" e="1 - Detail, 2 - Group by Reference Account"></footer>
      <items style="Mask"/>
    </field>
    <field name="date_open" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày mở sổ" e="Date Opened"></header>
    </field>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9eOZfOEWQcPADKnaQdRF5LsRwUBLzz59NtKqNIL+oj3Hk1WMA9iNmKn60BfWkePmrHSRWlB96mIPS0T/CatB8RZNM2Oyyfq6jkw7Uocz4n1K5alNPdgXHzFWSik/TfVfRcjGlkxAYi+M9Nj9BSttGq5zTwcB2Aiqh9mtYcgqsOqs2dSRY9bE0gfbzIw++iqE0Grw2vR7wcHOvKig+LZxcYr0pjoFSHj+bfsiE+EXrIUaXnlZWaZgDnBjl6/kyHW9V+yP8e6WAdOfUWQjFJY+kIENX3aUnKFGN20G+meqaiLROdnaPGuAyF5wPVzsjy1Jdr4vWPVPes2bytk1qi2/viyMeV28i3i/jtLHxY9Anz5TP1pCQk82lp439TC9LLrpwapGaLZJnyicw2hGDTSaGo1scgXIxB9sh5171HBACJGTpnLJH1xsYL05YXZxhLZ8RQMtVAQhDKJRigW8QvJ3a0f3PKvrZK3akcdEObl/1RAnhCOVdAbBblzsSevjj8kDQ==</Encrypted>]]>&DynamicReportFields;&ReferenceParameters;
        &ReportMarginProcessing;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9x3iOPwY9JZ/sHHlMarDELJsg7x4gDm1dIH/9N52L06cFTlMBxDfVzyAR0ik6EzufIlNDP4ueeUh8KnfIAbpdDd8oZdtBj061k/2qdWQL1bZlKyXOgO7s5Pnj0cSeGwAF6WSNrA80sKuGpmRQFKB9P+1ZjXTj+0eLSt/ApPhu4ePYJSg21qMrd/NfrKHa6LCs15/etN87Q3235yH/oMjo52fpTtUE8ulUQ/NpMoKXnQ27DdUxu+JV/zTdQNggdn19btVS1SetOE8X+DV7wLPF3Tj/ES42ammy7UFvvbaCmdEY/xnK5a2y7YpRtiTc0Ca5KbYwN3oOopzpr0al9wx3rthCVsf4r92WuIWGQKnIQwO95aK5KcyIMMHw1PK5gOS00Bj62P1NYPELgFmbqiZQEnXlGdpxACqF/LQARr/ElDJv5I6Vo63QkgaI5pUMZnl3xBG7SbSTMq8T5rccKxs9OZ8TvEyV4VJfz8zdJG3TzBl50b37cbR2qTC9r7NYLXEiN16RWr/fku6w50Doth3u/J1Xs/gbGi3vuNHb+95k5ZRFSfOuUlLyZgaWgAIooQ4zrG+r1niTx2SoKohmg0J78i</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>