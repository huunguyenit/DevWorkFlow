<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
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
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="ngay_mc" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" defaultValue="new Date()">
      <header v="Ngày mở sổ" e="Date Opened"></header>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"/>
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

    <field name="maxLength" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="110---: [ngay_mc].Label, [ngay_mc]"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110001: [mau_bc].Label, [mau_bc], [maxLength]"/>
      &ReportMarginView;
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4PhtDWYRR8zKDjYZlS1SzGxW5xBGU6rJmn4j+Xpie7A9bX3sg1Cn5LlZk9UaNNE8UU0N6z7aLBlAc0VQ8rz/izqk4TsvuyrKTyLqt2YmuZTC26ZYVbJZwfQyt0jrcECwTedq1aMZbO4lgHH+hUq5GnoIyH22mtQUApRRTUTASQelvEzuhyvjuFydoUKbra6YcOxFpy1phAC1kHItCIdaaI16pjAIJfIER+qR1l7gh+Ec7hLnMbMVa5+ipNHomnveWO4pydjPIIwUuVHbgpZrUXP0qPG1lOMRjOqZ7R4dYB1atwh5ORZNnNKztg0W6dzT1V/yLyPOI8CBilhf+8iWDWoFW3DTuuS730nWrbnBTwdp1gED7hQgHpFf09EKMhl5z+Xm8A9sgNpEYogANR0CkI=</Encrypted>]]>
        &ReportMarginProcessing;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUP/1R22xXsb+HK8z5v0XkAtyX9qVieEAsEESD4+eOGTdaykQLuCYyAC7ZQ7vbeM0d/hMuvhQuxs/RjvNn1CZwwCGjYPMDzT19fWuZz1uJBUcxmV/JxUvCsOYF6BDvavpj4ENAHsJCljhS8JmeFUxN9gB0b//WnOSDcom+l4ruTE4Q/Ot8TgN6NCKyuYltQJB1It+wuG0lkUgfOW1kd1FO0IHNeiTKPAyV3342XgZ4o5yGXcyvP//0KRPftWEkPt3PXpHONYfqsMpkKY/1dxjch7cLP9We2uGWm2FO9eOydTwOJyFLwlpuPYL/0hCGoETfeTf1V6kOkA0LT20Qit7OXBdPLjDeIH5vZHftOy5NpOFIZPstwFLzgTLz1juhoDvIgL5jGLjzwQbTflSUKtw/w7B9KLF5F4Oy0JIP+uZcFNNr5ka4WbkVtUAAibxF1GZS36EgFh0EgN3crOkCNW9EA3br0CuL2PMUfDcXupJB2swXCs6aor3k36XN/+KTPPXF</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;

</dir>