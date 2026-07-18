<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY % ReferenceNumber SYSTEM "..\Include\ReferenceNumber.ent">
  %ReferenceNumber;

  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tk" aliasName="defaultGLAccount" allowNulls="false">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1"></items>
    </field>
    <field name="ten_tk%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_vv" allowNulls="false">
      <header v="Vụ việc" e="Job"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"></items>
    </field>
    <field name="ten_vv%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" aliasName="defaultGLCustomer">
      <header v="Khách hàng" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"></items>
    </field>
    <field name="ten_kh%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay1" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày từ" e="Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
    </field>
    <field name="ngay2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày đến" e="Date to"></header>
    </field>
    <field name="vu_viec_con" type="Boolean" clientDefault="1">
      <header v="Bao gồm vụ việc con" e="Including Sub-job"></header>
      <items style="CheckBox">
      </items>
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
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 20, 80, 100, 100, 130"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="110100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="1101: [ngay1].Description, [ngay1], [ngay2]"/>
      <item value="11: [vu_viec_con].Label, [vu_viec_con]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9eOZfOEWQcPADKnaQdRF5LsRwUBLzz59NtKqNIL+oj3+tToJKVvbgy6YuhRxto6zqNprRWLR3in/36eyCLYfOJCE79qXiqQ5JdO1Rdc//o1qhVO/yFqhlx4CTGrsc6+LirzPCpv1NkUUWk3OlwRme3jhOZywYhmxmch70Isc1/ocpdgMWejjS0gL2ccopMNYsXAoSKdjWrFMHZXxR5NNm1avRFAdgy7h7Uu0NpEyFRek9tYZCI3cxthQQQn4a0tROQYqqHiLvFbRdIz2qdUPjVvrTsVI9N2Ieif1+P2s0FFH4KQQrmFbt3az54yoeut9zLogUyKReXV5C9tQiW/0GDVqtsF1TjaMUQAAh4e4xXR43DrKXD9W3yzGrUoXJPAbQ==</Encrypted>]]>&ReferenceParameters;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcU5d5UltcR8bTbfrnO2d1KzoFQzpUtyxRKhl7OwrbUCkwxvjs/VV26AQvwNMS7RQkkl7KvNoowpRX8dXrYLR58Lw1OKu6Cna++DSmT879sDZvJBd6xq+3kf+fBZIz/PmvzeyPK7WT1ANvG0qQvdZBOF7bMyERpJh9we50i6ODMBQ2E+O5+nvAKlFkRuccKKrs3/mDAiKq6E09fASZhagDR/amro/+sy/An/HEf+UX2SigJjtQEKzVlyEvFC0e2/fM5G7uPIliMvU1UCKFbjTCUc/sAzVUsd9Kv7ILiLCOnuyiRS2NUYuetJGvqrtmgUgBwKZZ1Cc/VZloXDxJ6NyRgWkV76evBnGvAsKeBGNAoIWomria4nkuDnHZC1FCwZ0hYhUKOstIPDY3Y3jZYbI58GY2iYpePmtE3zqW9YOGJ2rE214eQRgnBv2SQYpUKQUeU39sfukugVun7DK0e1t07w0l4FtnSOSNSiA7SRj3pQrDqtp/raGVK1hF9UheYpHY//zX7FQUYM7QqjCANKwnv5eLFfAGXsndPXxyjI9ck90+VLi2pZ87nyXf/VoSCufiKEBFAHRBWKKF2jMUVKNZgdZx2xpAQ5/6Xx8lFBNpSSCcokprVuV6QQMvZasuq89mrYr3mPb6QBEHVRcl6LboK2EgBeQUxd4SaZql5Le5oRunca6iDJ9OBQGGvlbGOfw7eH5kIpKyLQgkx2RxueQm6BcBQ0gzhHFZLd5s5FOTdFKCZK6NPiDbM4prJdMrfM9r+UvzFN7Uc/MD7fDBuX4Spuw==</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu70QZzsPaDwFs+YifbSouifZ+Z8xb2vrymO7L8l1iONMshIBb8irW1YDA7cu+DB6ur11JOuGhj1b0YBXP2XIrznWtDX7nCPm8raIcGqV2RNAf/sP4a9d05bIuC8aZFPACReSn6Yh6f15Zlo7HwfBY7yav8Y00c9ooROw8QjMyGzjMq657SUpxeCdV3tCeBYOFQ==</Encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>