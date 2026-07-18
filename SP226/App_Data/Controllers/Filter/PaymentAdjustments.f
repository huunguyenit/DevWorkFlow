<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterInit SYSTEM "..\Include\XML\WhenFilterInit.xml">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptFilterInit SYSTEM "..\Include\Javascript\FilterInit.txt">
  <!ENTITY TableDetail "d56">
]>

<dir table="m56$000000" code="stt_rec" order="ngay_ct, so_ct" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Chứng từ từ ngày" e="Date From"></header>
      <footer v="Ngày chứng từ từ/đến" e="Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Chứng từ đến ngày" e="Date to"></header>
    </field>
    <field name="so_ct1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Số chứng từ từ/đến" e="Voucher No. from/to"></header>
      <items style="Mask"></items>
    </field>
    <field name="so_ct2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="" e=""></header>
      <items style="Mask"></items>
    </field>
    <field name="vc_type" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Loại" e="Type"></header>
      <footer v="1 - Phiếu chi tiền mặt, 2 - Giấy báo nợ" e="1 - Cash Disbursement, 2 - Bank Debit Advice"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_kh" filterSource="master" operation="10">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="tk" filterSource="master" operation="20">
      <header v="Tài khoản có" e="Credit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nt" filterSource="master" operation="30">
      <header v="Mã ngoại tệ" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_nt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="tk_no" categoryIndex="1" filterSource="detail" operation="10">
      <header v="Tài khoản nợ" e="Debit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_no%l" key="status = '1'" check="1 = 1" information="&TableDetail;"/>
    </field>
    <field name="ten_tk_no%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_dvcs" categoryIndex="-1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="user_id0" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" categoryIndex="-1">
      <header v="Người sử dụng" e="User"></header>
      <footer v="1 - Lọc theo người sử dụng, 0 - Không" e="1 - Filter by User, 0 - No"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="39">
      <item value="120, 30, 70, 100, 230"/>
      <item value="1101: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="1101: [so_ct1].Label, [so_ct1], [so_ct2]"/>
      <item value="11100: [vc_type].Label, [vc_type], [vc_type].Description"/>
      <item value="11010: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="11010: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="11010: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="11010: [tk_no].Label, [tk_no], [ten_tk_no%l]"/>
      <item value="11010: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="11100: [user_id0].Label, [user_id0], [user_id0].Description"/>
      <categories>
        <category index="1" columns="120, 30, 70, 100, 230">
          <header v="Chi tiết" e="Detail"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    &XMLWhenFilterInit;
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8i5ohJMjC9MKZOD6zbZAMgk3NGGiufuY1cGklsjD6iGA4Mz+FYeZkayuxc9lfK6og64PIycfBiVY88CCq1mSjt9DgU1+CWUFZ7ZptZaQTj849H6tKvIjgYltOSM6UmPuKh7ScKHe2OAn+Hur00hSExCPe8xvB01owpua0byKruUljG/MQQEI0xz6nGqi6CNbYP/+Tl4uqrO4F6hZ+R/BW3LOnMfahFdczDwSGxtVKYl7YPDtCYoqeMDrRpiwnHvlS61ZBdE80u1g1ee6XRWwFP656/VvHgSkdus4pW20y7FPbAyS3cgUVn1UYragOcLdXMr6SCoox3s4njw0Hw8rRk=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptFilterInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdGm589nGw3hgv2TNtZkkZj9PkaC1rqAwOgJ0qbuVn8iPzBiuKLRs5Q7NwA7H/cv3VDxl27oRLKzE8axR3I+5dzQWA5lG+yhRNP0Rs32ZuEP7O96tseasp86uGb5nn2ag5iUaVFRls8VVBfhI8OqRWOECodGwPfoOyjB+bmF2ucSNuRUyilI9mkWGPBX9MEU/LlXgDyXySbga4C+f4xx+Xfw77V+jO+9aeCqEwzNZWwbHin6mKewATtPmqEGhRzJSLhE6rPXyjDLTPJl8JMY1jg6t+LbggOTjNWPUGE/ERmFeKAA+QlxWd3eExDawPe1gx2Rz/7zWrJ295CjCxbalcHSgy+Rcj46KHOelOHsYZcL7LtMK6KHCQCPRjdG/gzIdbUe9JD0D4/HrKnYwh2jBGJOUqLoxPdPLNg+tfpcFCEYy3pqivgzND1iGQpBbL0I+xA==</Encrypted>]]>
    </text>
  </script>
</dir>