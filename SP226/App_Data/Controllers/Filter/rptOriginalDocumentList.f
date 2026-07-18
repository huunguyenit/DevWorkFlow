<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY XMLWhenFilterQuerying SYSTEM "..\Include\XML\WhenFilterQuerying.xml">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">

  <!ENTITY Controller "rptOriginalDocumentList">
  <!ENTITY DynamicReportFields ",'&Controller;', '#$query', '@@sysDatabaseName'">
]>

<dir type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="so_ct1"  align="right" dataFormatString="@upperCaseFormat" maxLength="-100">
      <header v="Từ/đến số ctgs" e="Batch from/to"></header>
      <items style="Mask"></items>
    </field>
    <field name="so_ct2" align="right" dataFormatString="@upperCaseFormat" maxLength="-100">
      <header v="" e=""></header>
      <items style="Mask"></items>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit" ></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1 " information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
    </field>
    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList" >
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form" />
        </item>
        <item value="20">
          <text v="Mẫu ngoại tệ" e="FC Form" />
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="keys" hidden="true" readOnly="true" filterSource="Infinite">
      <header v="" e=""></header>
    </field>
    <field name="maxLength" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="1101-1: [so_ct1].Label, [so_ct1], [so_ct2], [maxLength]"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110001: [mau_bc].Label, [mau_bc], [keys]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    &XMLWhenFilterQuerying;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4d7dOeV4hoOX4kI2zg1sNULtHRHyv5+1fKkLVPmWApKl1TWtbTC9Z1irCUjTDMb3jTowjexEiyqN31LGOargUrSiUo48bp+R2GVX+eRTX44UzEHPvklRE0mKFTpdwluLPKfdwtHg4cDLt4dRPsAoq54=</Encrypted>]]>&DynamicReportFields;
      </text>
    </command>
  </commands>
  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcU5d5UltcR8bTbfrnO2d1Kzii3p6ehknKjvfgm+r4/7v1XRkAvKFtXYzDayytSRCUOK9Bbng5Qb7HvljPsV0n9uqFXSP/B3KFIvlHs9M5borDkewIwaMDOGwqxt3Jt7vGS9bOLhRaOUjOakvKEGBK09onLa9/HfKFuqXIb3efg/6pYJ9UEKaCZpmTbprkJPaAangdG5vh489BXUuqe/kvhTbQdM1HloIfdi0Blx68qAEjZ/Atblu64q0OqsyxwK4j5bgTKA/m+TUtkpjnkQ7XGPpL4pNRrjCSIZ5YYWUobqap1581GMZ8RlFZUPBpxJH9QrFxrNR8lelGaGAZ+rp6jnJvK4iv/rJK1wyNgyZF9Pd3SJHXJypM5hEV9DlGffGVE9iyLAqI9hFBx60uSBhDsugd/pJ/jAck9CZDz7/3Y7JlA6fAzoLbQk0GINZfm5YesxVydvSv6O0QyjMNaNhz6sg==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>