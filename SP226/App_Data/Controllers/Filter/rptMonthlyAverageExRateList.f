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
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tk">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="date_from" type="DateTime" dataFormatString="@datetimeFormat" aliasName="fromDate" defaultValue="new Date()" allowNulls="false">
      <header v="Ngày từ" e="Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
    </field>
    <field name="date_to" type="DateTime" dataFormatString="@datetimeFormat" aliasName="toDate" defaultValue="new Date()" allowNulls="false">
      <header v="Ngày đến" e="Date to"></header>
    </field>
    <field name="ap_gia" dataFormatString="1, 2, *" clientDefault="1" align="right">
      <header v="Áp giá" e="Assigned"></header>
      <footer v="1 - Có, 2 - Không, * - Cả hai" e="1 - Yes, 2 - No, * - Both"></footer>
      <items style="Mask"/>
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
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="1101: [date_from].Description, [date_from], [date_to]"/>
      <item value="1110: [ap_gia].Label, [ap_gia], [ap_gia].Description"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKK1BRPJgsUqzblUsPyGwOckJkm2lvE5A2ZzlVCLQxx05MiEtOfi3LjA2Q6p6l3tN3pgRBchUr+srj9eWlYSj0dSFRO86xKBUkTjjG6bXCzeZDF6cHlPRmRht051q9H6ZNZYv0Sm1hAbAgxgsAmC6eDZzmet7C3WUoDzqA6zq7ca</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUpTGGv1w+iiyPFOfxifCL8hdA7B08xnvwG/eJYId7vX7uLa74LvmOcrpSMcE/u9qtB8tG8K4D7gzK2Ro/zUOsWJk3e9uK00iy8q6jqPJdRuy2tMr38YHgOE0bKbsNg8i3SIt/1/4vRabdAObcW32UHT5Tjy4hBEkTPhotrtjVnUU/8uOH+5aeLtj1JH+MJDJ0qBUSrnY2ahgQEhoJ3Q46pno9rJXXpKkzGvye5aXCFkwyvakI8U/790UcEM41R8KhfxSMyv0Dxxzo2x3jPp9WFcZs7lR2rmIZj65GvvRUBvAgFewdtoifvxEpEMWXeeESsRtha8TRol8SiEjfSBv3y501nf81WTyOdCeASb7XPRS0ihnEZAotFfcDusEMmQ1XJBslB9vFeP3amIis8NSyCA==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>