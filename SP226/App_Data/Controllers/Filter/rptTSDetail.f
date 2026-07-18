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
    <field name="ky" type="Decimal" dataFormatString="#0" allowNulls="false">
      <header v="Kỳ" e="Period"></header>
      <footer v="Kỳ/năm" e="Period/Year"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="dau_ky" dataFormatString="1, 2" clientDefault="2" align="right">
      <header v="Đầu kỳ/cuối kỳ" e="Opening/Closing"></header>
      <footer v="1 - Đầu kỳ, 2 - Cuối kỳ" e="1 - Opening, 2 - Closing"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_loai">
      <header v="Loại CCDC" e="Tool &amp; Supply Type"></header>
      <items style="AutoComplete" controller="TSType" reference="ten_loai%l" key="status ='1'">
      </items>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp">
      <header v="Bộ phận sử dụng" e="Using Department"></header>
      <items style="AutoComplete" controller="TSDepartment" reference="ten_bp%l" key="status ='1'">
      </items>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_1">
      <header v="Nhóm CCDC 1" e="Tool &amp; Supply Group 1"></header>
      <items style="AutoComplete" controller="TSGroup" reference="ten_nh_1%l" key="status ='1' and loai_nh = 1" check="loai_nh = 1"></items>
    </field>
    <field name="ten_nh_1%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_2">
      <header v="Nhóm CCDC 2" e="Tool &amp; Supply Group 2"></header>
      <items style="AutoComplete" controller="TSGroup" reference="ten_nh_2%l" key="status ='1' and loai_nh = 2" check="loai_nh = 2"></items>
    </field>
    <field name="ten_nh_2%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_3">
      <header v="Nhóm CCDC 3" e="Tool &amp; Supply Group 3"></header>
      <items style="AutoComplete" controller="TSGroup" reference="ten_nh_3%l" key="status ='1' and loai_nh = 3" check="loai_nh = 3"></items>
    </field>
    <field name="ten_nh_3%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc">
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
    <field name="nhom_theo" clientDefault="10" categoryIndex="2">
      <header v="Nhóm theo" e="Group by"/>
      <items style="DropDownList" >
        <item value="">
          <text v="Không nhóm" e="No Group"/>
        </item>
        <item value="1">
          <text v="Loại CCDC" e="Tool &amp; Supply Type"/>
        </item>
        <item value="2">
          <text v="Bộ phận sử dụng" e="Using Department"/>
        </item>
        <item value="3">
          <text v="Bộ phận sử dụng - Loại CCDC" e="Using Department - Tool &amp; Supply Type"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 40, 30, 100, 100, 130"/>
      <item value="111--: [ky].Description, [ky], [nam]"/>
      <item value="1110000: [dau_ky].Label, [dau_ky], [dau_ky].Description"/>
      <item value="11001000: [ma_loai].Label, [ma_loai], [ten_loai%l]"/>
      <item value="11001000: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="11001000: [nhom_1].Label, [nhom_1], [ten_nh_1%l]"/>
      <item value="11001000: [nhom_2].Label, [nhom_2], [ten_nh_2%l]"/>
      <item value="11001000: [nhom_3].Label, [nhom_3], [ten_nh_3%l]"/>
      <item value="110000: [nhom_theo].Label, [nhom_theo]"/>
      <item value="110000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHai1NL/F43lwMSgr14iP+41Uo1idtrwSmh1DF6GuMxh/BKzl/JVUVZp+EpsDXbF901at5/+WMofpCr1NBMAhwtjji27X9AfPxQZ4aV+W9hJQMfdGCmjYapIN9HI1PpIabGbAE/YnJmBcQZGnoqcW32bdI6uKPSNv6b/9FGEBT+B+nJlZ328QPgCR6Et9P9QcbIOKZxUyFoIDiNmbbZ0xjRCqEhpqIQp/qoAoWJF+pFD/SnGF21NTx+nWAs8r83reoeQ5bIHtdQ0Q5xh3b0pcQgmSIT2J4vkgjhcu72wRzrvr3OHdr3hQ+8KbTB920LRIPC+UimEssSA1TGZ7fBfoQo=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUvLrUm1DcMeBmcORPeCv9/hhstTFDcYwpC/k4p34bXRK1ddqEoXHf4cyqsCs1SBgqMOuNgz8bYTDOCokwVWYaPwibT2hLQJk1nGEwezeF++jfGZfq1+zkGv+MhLAbXeokWSPtPmorcvjhnI+atQmb/jt3etixQv8jXlzOhA8LRAnajJkq4vdUI8q5mV3keD51GhuuYbFzc8cYP9ClQe8y0i65nVel32YEgnucsj+dJtTGWL8cLpKnFkpGckR+6/o/hqB7C7i7VX3jmZIHaS716BOtBNUEg8yY5YBXGqRWAhQ6DgYPJg731LTIcyIxFNvufkHre9IX+S4p87129b3j1zweSAJzQ22WmDlNYOgrKPwYfKjvrmVrNpt4C1AkyAseiVWMN7Sen+gCo0tdauU1Si53xRSnj/eInr1TCh2NGmbLKblow5JgRp17TFH7iuWmPsojd/NILhR4z+DPMCv+IonYWjtGZ/QcFyTAiNTs0qkoXU6KKeuN+9vnev7gegUbKcwd5Ms5OutuNWDATzUfII6vQ0kJcb03NifBOiI1xhg4b/wiv5le67T5dai7ADXUFakViXvgWUOTmH9HgcK62sABY6ob/2B01PKDUmjWujpi+cUTx8mMUTGcXn2A23faCTKOpAZQ+RxgsJWBG0LjFQ==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>