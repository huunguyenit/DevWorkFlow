<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tk" aliasName="defaultGLAccount" allowNulls="false">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" normal="true" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="date_from" type="DateTime" dataFormatString="@datetimeFormat" aliasName="fromDate" defaultValue="new Date()" allowNulls="false">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="date_to" type="DateTime" dataFormatString="@datetimeFormat" aliasName="toDate" defaultValue="new Date()" allowNulls="false">
      <header v="Đến ngày" e="Date to"></header>
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
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 100, 100, 130"/>
      <item value="11100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="111: [date_from].Description, [date_from], [date_to]"/>
      <item value="1100: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="1100: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9eOZfOEWQcPADKnaQdRF5LsRwUBLzz59NtKqNIL+oj33cdCqc6PCmjEuTsNaDmZWQtGLrlpqXs5aq4r7DiH7VL06Rztb0edwX3906suwlkVopst/84OB5JQEcDm4hoaM0Gmh7rGfKJEo1XQoRKJ4knUcqW4eM/EwJqEs4rOurq/bl9l4BJGy4h+nSK/5nZFDXpLBKDjzol4V9aq/1Y4kwB0LzejkzQsh4MxWlLENouC9U77/xfrHz4xs25JzxJr1w==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdDqS2nZpjMFZD+ajcJqY6S0MraksmenqXt2vjKyhYADTAN8k603T01iM8FyPlNPl1WMI6kgjgjRD/FW1Q3ikp74hXDc5AYeEHfFIXqLn/6rgbi8xt8OFiXh8ydQqiVMp+eSaF1Bf8inkTIgj+nDejuIH9rdF75a9f25K/XIDYB4x8u02Jr0IiHn8b+MOIoQyBSGCT6wiaNY+7Ki4lvKCmEnBsEH164tD16/yHnwaTPTvEnwgnWq9BOYgDhY1BwBfM5mbiARQXaqIKAFk/LB1I0wcYKqmo7pKV3ummHFrV59+PkXh3fQLRVtVPs2q0LKqxZyNcovOyzh7uVkiDz2CdGpqlHTVXbM/1neZnJZJuFDNwRXcVMaTOAfOzWsaeIzL28z9pcbUbeArsK+L4bcutG4E2Yqf6ST8P9w06n8g4kIjaDfHj6rSTJRcBiZK52a2vI2y3EjSI9ckoj1gGHkk0IR50TUKOhoZwSCK7573agZ4dRG9HhxxNXS1YiFs+/Aa7/dYWSHZ0nfr+b0jK5C0MgSL0ATUSVgWtKNxThCgJfSukFijedRGwWXvliXYdn7B5K7QmIG+IDSUzl0MaidhtJjbiUFzTXvnqefJWMITIHvANKH6fTvUU7KL6jeRsfej3IRfYe9kiEn8PL37HCilhpSFx87e0U0mQRzRL8N/GYLywhpY+RtgbqEklKcW/tWk7xDhINNENiE5W4ZSlYR9ID5gcpwm4GRfh+7MQQk5W8k9azJuFgYREz+mG6+uex1/N1CHN9qmv/f8WwBSDOxL/yhMzRxdSlc80dmMeTvS8j3I</Encrypted>]]>
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