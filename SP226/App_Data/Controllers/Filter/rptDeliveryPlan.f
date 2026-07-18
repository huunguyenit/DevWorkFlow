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
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày đơn hàng từ" e="Order Date from"></header>
      <footer v="Ngày đơn hàng từ/đến" e="Order Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày đơn hàng đến" e="Order Date to"></header>
    </field>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false"  aliasName="fromDeliveryDate" defaultValue="new Date()">
      <header v="Ngày giao từ" e="Due Date from"></header>
      <footer v="Ngày giao từ/đến" e="Due Date from/to"></footer>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false"  aliasName="toDeliveryDate" defaultValue="new Date()">
      <header v="Ngày giao đến" e="Due Date to"></header>
    </field>
    <field name="nv_bh">
      <header v="Nhân viên bán hàng" e="Sales Employee"/>
      <items style="AutoComplete" controller="SalesEmployee" reference="ten_nv%l" key="status = 1" check="1 = 1"/>
    </field>
    <field name="ten_nv%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_vt">
      <header v="Mặt hàng" e="Item"/>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = 1" check="1 = 1"/>
    </field>
    <field name="ten_vt%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"/>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
        <item value="20">
          <text v="Theo nhân viên bán hàng" e="By Sales Employee"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101--: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="1101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="110100: [nv_bh].Label, [nv_bh], [ten_nv%l]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMCcBHcMp7P4nk26g24rLvVfjyQAtvnW46n6FD29+Z5zIjnw77MGMo9YVy/gbln46MAAdcdEA6zHdBAFlj8W7ouO5VI8walA/fBu1SMwYtPJ3TuEonI8ysaF3ZJKHY9npaVJUllboHzhjP5VOL2Vy1OElcRBjdArDOk1hJRkzl/nupd9hIgqXJMmt1+qgZF9ZIgurrzoNmThhRsxiockNMQjA2awUVzEib4QPKdbdGDBj1JHU7fH+F2fLiE6RL2VDpYJmwGWmdg5uYKyY4wVwyY=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUpTGGv1w+iiyPFOfxifCL8hdA7B08xnvwG/eJYId7vX6Q/UtDtbKAcuBmWbDHDOsNyp4lQkw3xjDDaeQsRYNJmSMXq33YrnhcVDPPRpbsFueqhphhu2VuhFitWLqDx0E/jCQC2m6JO0Q6HupkGgTrY+pBfkjVFJvW0huVuUAGjnqEzaVHWOklFwjYO/AWLlhrBkOBN783C8kUQStLVsE+UG4pxNuJBZgNfge3ZugaggIt3CmjlxLXWBRl4QYPwM4iEn4OV1Sf6DaBxZeHqWgUglRLZJOgd4UrfODsDBj/WP8QSy0kasu5A0xLjaNp3u1aSYbYZ6Em6AFmXTJk/4qjsLIeZjrcIlswgJ6a6Ker5xIGVlZwwxkR4yM9GvhvQT8m</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>