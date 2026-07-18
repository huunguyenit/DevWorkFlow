<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="date_from" type="DateTime" allowNulls="false" dataFormatString="@datetimeFormat" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày từ" e="Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
    </field>
    <field name="date_to" type="DateTime" allowNulls="false" dataFormatString="@datetimeFormat" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày đến" e="Date to"></header>
    </field>
    <field name="ma_dot">
      <header v="Đợt tuyển dụng" e="Recruitment Period"/>
      <items style="AutoComplete" controller="hrRMPeriodInfoInput" reference="ten_dot%l" key="status = '1'" check="1 = 1" information="ma_dot$hrrmdot.ten_dot%l" />
    </field>
    <field name="ten_dot%l" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="ma_vong">
      <header v="Vòng tuyển dụng" e="Recruitment Round"/>
      <items style="AutoComplete" controller="hrRMRoundExamination" reference="ten_vong%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vong%l" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="ma_vtr" onDemand="true">
      <header v="Vị trí" e="Vacancy"></header>
      <items style="AutoComplete" controller="hrPosition" reference="ten_vtr%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vtr%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_hs">
      <header v="Mã ứng viên" e="Applicant"></header>
      <items style="AutoComplete" controller="hrRMApplicantProfileInput" reference="ten" key="1=1" check="1=1"/>
    </field>
    <field name="ten" readOnly="true" external="true">
      <header v="" e=""></header>
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
      <item value="110100: [ma_vong].Label, [ma_vong], [ten_vong%l]"/>
      <item value="110100: [ma_vtr].Label, [ma_vtr], [ten_vtr%l]"/>
      <item value="110100: [ma_hs].Label, [ma_hs], [ten]"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf7Cr9P7DZviRVm8tZVROSLXtj9MZ33zLRypxpikDmbRANZOPXRPDpMgEBacbDOJ8L5qJEs3yeCBu+4gsRrG7ZxrzZc3eK6znFlrDpCSwpPSA+hcUP4oUml+pKYA1OfXwRzG9y+u7XLllGj2e3YClBuPJ44P5IH09+jruovGiTKKEhP56qvUTnOrNBv7oxbbHTbuBpvZdgEva6jmcnCfABp4=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYBPjBKeM8/Qt3MheupAycbm2zTTGGEZMyjhaXuza8xtcz3ul9SFOsGjkqayHsCE2vmHkqABQ34uK1dzPJedUfakUok4ENcLiEw52J/aEimqXBHbMMDNbzK3b1Y4XqMoXiyXYfDrdbnbaJ6lEjnb8VUH9wyJouFTWn2jAj/D6/+BC4T540Y7LD0uex8LVOnjzlrF8KLqtLh65GasygQqd/tSCJvfS147b9Pc0Lh+fxLUGCbc7cbuDIuBIccpeYurpl74xc5WNBzNv06DOEv7TjHMUNnrMSqykTrMXB45AydD0I15YDock6zhsso0t+mg+/wyCeh8pl5dBLlzPfG2AltLhJ8ZDFVgukuXGnmj4jUcpeEILUrJbgYfthxgDdbCVZxjHn2ucD0jIisjpBo5uTl7zZvcZCDmrNgagUghWOk2o=</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>