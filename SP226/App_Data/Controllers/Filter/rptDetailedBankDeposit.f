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

  <!ENTITY Controller "rptDetailedBankDeposit">
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9eOZfOEWQcPADKnaQdRF5LsRwUBLzz59NtKqNIL+oj3Hk1WMA9iNmKn60BfWkePmig6hOSAo5vrdrbjLkfMLYlw1MI7x67k+63C0qlCGe/PW9n05Wr6dl62xrB0PhkHy0II1d/ewVs2BBD/GaT46Q9X3EtOnBHspaz0Zr43o6drBGFmnKhDrvvaaaEqr1wwachbtsVtfNnuTjgva8p0W6OdNtu74/6QHS9M7tPbX8+0GI8V2yIXOdPAAcq09jhqU3U0ubTx1EoVqh00H1X3JYXZ9UTV+C+MF15yXq+ZF5+ej+uYaC7k3+jglr1VynkYjbBreOx4XAQATAifCkrOO1o3Aq7P60jgTEA4LqjplDUx5QvWyW55pPyabJu86emSGTrnDLIoa0QPBUMDLtXT+YDbUZLkhzPdtqW53g4uei7puJX/Q7QK2DktCv5pkhvlZ7Y0NtBhPfgzs3njC6SeWyPo7gJHvQQ8R98dhAwe05vaGyyWPQJa62vJQiw/VNQgxJmS6yucrWO22qCUXVNoJRnftePOMBgJ/+5vabUybjvEW+q2CVgA1fqAMCfrSXn3zBm6lR2wUM2RUexs8VxZsiJ61oaTJTfeP4bB56m5qOirqnH7s6uspC8uTfFzdCrGBhAY9kZLsKmlf4mYrpf/gW9f+gLoBn0veYfytlI5SmPI</Encrypted>]]>&DynamicReportFields;&ReferenceParameters;
        &ReportMarginProcessing;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9x3iOPwY9JZ/sHHlMarDELJsg7x4gDm1dIH/9N52L06cFTlMBxDfVzyAR0ik6EzufIlNDP4ueeUh8KnfIAbpdDd8oZdtBj061k/2qdWQL1bZlKyXOgO7s5Pnj0cSeGwAF6WSNrA80sKuGpmRQFKB9P+1ZjXTj+0eLSt/ApPhu4ePYJSg21qMrd/NfrKHa6LCs15/etN87Q3235yH/oMjo52fpTtUE8ulUQ/NpMoKXnQ27DdUxu+JV/zTdQNggdn19btVS1SetOE8X+DV7wLPF3Tj/ES42ammy7UFvvbaCmdEY/xnK5a2y7YpRtiTc0Ca5LbFI0pcppHGxhsF9gQzKY2j8GwaknrwtT50o+0K19SBYwH2gnV30Z0Q6cGSZ6mpGHl2R/MXPMtoOXIKvwAWWe27zf3Xj+b14kKoUUZElkIQIQJBfFHSwWQmXubKEAIXC9+MOI7OZXW9cucaOMRGybAToTTlHCIOVBJxEL6TdQW9otnIadDoOfu+yOHwJtEuOLLBPQgm/WLvVoADXW/pxDvyrTEm/UYszHyvqEBybBK3jVcHGIUtPHV1ln3TnFGcesfbL2uhnHZp19zoLm/bYB9HyHb3F4g1nHVOLRvYtT77w==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>