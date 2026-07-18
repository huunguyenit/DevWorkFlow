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
    <field name="date_from" allowNulls="false" type="DateTime" dataFormatString="@datetimeFormat" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày từ" e="Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
    </field>
    <field name="date_to" allowNulls="false" type="DateTime" dataFormatString="@datetimeFormat" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày đến" e="Date to"></header>
    </field>
    <field name="ma_dot">
      <header v="Đợt tuyển dụng" e="Recruitment Period"></header>
      <items style="AutoComplete" controller="hrRMPeriodInfoInput" reference="ten_dot%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_dot%l" external="true" defaultValue="''" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="vtr_ut" onDemand="true">
      <header v="Vị trí" e="Vacancy"></header>
      <items style="AutoComplete" controller="hrPosition" reference="ten_vtr_ut%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vtr_ut%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hreDepartment" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="loai_tt" dataFormatString="1, 2, 3" clientDefault="3" align="right">
      <header v="Loại thi tuyển" e="Category"></header>
      <footer v="1 - Kiểm tra, 2 - Phỏng vấn, 3 - Cả hai" e="1 - Test, 2 - Interview, 3 - Both"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_vong">
      <header v="Vòng tuyển dụng" e="Recruitment Round"></header>
      <items style="AutoComplete" controller="hrRMRoundExamination" reference="ten_vong%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vong%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="kieu_bc" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Kiểu báo cáo" e="Report Type"></header>
      <footer v="1 - Chi tiết theo nội dung kiểm tra, 2 - Chi tiết theo vòng tuyển dụng" e="1 - By Test Content, 2 - By Recuitment Round"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit" ></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" clientDefault="10" external="true">
      <header v="Mẫu báo cáo" e="Report Form"></header>
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
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101--: [date_from].Description, [date_from], [date_to]"/>
      <item value="110100: [ma_dot].Label, [ma_dot], [ten_dot%l]"/>

      <item value="110100: [vtr_ut].Label, [vtr_ut], [ten_vtr_ut%l]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="111000: [loai_tt].Label, [loai_tt], [loai_tt].Description"/>
      <item value="110100: [ma_vong].Label, [ma_vong], [ten_vong%l]"/>
      <item value="111000: [kieu_bc].Label, [kieu_bc], [kieu_bc].Description"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKK1BRPJgsUqzblUsPyGwOfExZ33TM/SCIg1uNlHGL9BEvl81TGPf+5d+1fhBEq9KxiJ8ensqaNU0tr8U5/qYapr1JtpOoxZRSvjMMCArPEKbdYGDQMRl8yXFfR6G2O5l720j67IvCidsQn4nUWSMfYIqkXam/lGGU1JzZDQMlpelgAPXiJpGKFiQtk8IHp8Sqp9aTlibZOdi4lgyeNys23prrk9firAtivCfqp2WnFa</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUpTGGv1w+iiyPFOfxifCL8hdA7B08xnvwG/eJYId7vX6Q/UtDtbKAcuBmWbDHDOsNcdrJCyoT787vbFPUtXnsIFz0/BlNTtfw5PMp63/XpHozXb/i4u5a9S8uAq5d3LJ3uwkwby17wPutWh+oitLfjrlYt3yuW7/ZYcHVePnMxQ/aDpe+u4oxHhKj60srMvxJyHKGCOloQzxP6/rTI3u8+9OIOGGbG2qKwynyMvjlGP4n0mzWzhOJNRPb5IupzWOpGW/0KWWS0yBVR8hePTTGQN7Pp2zMf+tZrpvNUPb7jddoelHaOYbFkB33HWm1luukCw3hPBaWbqfmpnnLY8x2IDU0JYCqPstFFXrQwR3/sIBt2YfSnenWQkVlnWklYODUCn9CfvZ4iBBGcPpun8v2wm20pW7fusMERLoBoTuSy2E=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>