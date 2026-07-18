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
    <field name="nam" type="Int16" dataFormatString="###0" allowNulls="false">
      <header v="Năm" e ="Year"/>
      <items style="Numeric"></items>
    </field>
    <field name="ma_ns">
      <header v="Nhân viên" e="Employee"></header>
      <items style="AutoComplete" controller="TaxEmployee" reference="ten_ns%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_ns%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="TaxDepartment" reference="ten_bp%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1=1"/>
    </field>
    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"/>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 100, 130"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="110100: [ma_ns].Label, [ma_ns], [ten_ns%l]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKBqqJeBFhuOpLkf5Z3TI1FJLynkK2K2IRDu868eh/h8QlIUnBOryt2jOJrtOxTe9Ywvb5QTR4s0T7VqIDPXU9nj5OJiFH0+aS6jrIdnEJXxXXNaZJjhKlnqHquAGtX2Gg==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUP/1R22xXsb+HK8z5v0XkAiPOq5AwHj39yjkxWkVx1cxuAMrjUdSRP2fUfSWNNOYHNKxtrCTvkNw3+aM/39lC+YRrJIPk2zkQARzzofGQ9OFzukmAMeN9d+wS6zutstMYBJhV+Rbjk66xyD4Cseq/vLoQWsrJZ+Q/3b0dh4YPsR7E5hRlsLTZkakLzkJ2h8Uc1btDzn9Itz5Z0/ATz6EA0IW5cRoYP20H1zHtBcPsFQgqBqF2Qs3rKpLMR3wMf5clz6pBeYLnjVwQBEZRg+uCMtjSRoNi20d68e4EVP8ZfQG8Gd+KHWV7W7Oc2T7yeDeaHpaYfNkLpG5fhoOy+xLd7Q==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>