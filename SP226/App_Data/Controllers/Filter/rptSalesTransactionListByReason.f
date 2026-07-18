<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Controller "rptSalesTransactionListByReason">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeFieldUOM.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY Identity "&Controller;">
  <!ENTITY FilterExpression "f._filter$Expression = '&quot;' + f._filter$Pattern + '&quot;.indexOf([ma_ct]) &gt;= 0;';">
  <!ENTITY XMLGetParameter SYSTEM "..\Include\XML\GetTransactionParameter.xml">

  <!ENTITY GetReportFormLimitRight SYSTEM "..\Include\Command\GetReportFormLimitRight.txt">
  <!ENTITY SetReportFormLimitRight SYSTEM "..\Include\Javascript\SetReportFormLimitRight.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">

  <!ENTITY XMLWhenFilterQuerying SYSTEM "..\Include\XML\WhenFilterQuerying.xml">
  <!ENTITY DynamicReportFields ",'&Controller;', '#$query', '@@sysDatabaseName'">
  <!ENTITY % ReferenceNumber SYSTEM "..\Include\ReferenceNumber.ent">
  %ReferenceNumber;
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày chứng từ từ" e="Voucher Date from"/>
      <footer v="Ngày chứng từ từ/đến" e="Voucher Date from/to"/>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày chứng từ đến" e="Voucher Date to"/>
    </field>
    <field name="so_ct1" align="right" dataFormatString="@upperCaseFormat" maxLength="-100">
      <header v="Chứng từ từ/đến số" e="Voucher No. from/to"/>
      <items style="Mask"/>
    </field>
    <field name="so_ct2" align="right" dataFormatString="@upperCaseFormat" maxLength="-100">
      <header v="" e=""/>
      <items style="Mask"/>
    </field>
    <field name="ma_vt" allowNulls ="false" aliasName ="defaultItem">
      <header v="Mặt hàng" e="Item Code"/>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99LWeKcpDV7GFdDyVy3RoD0J3pIqv3Y62T10G5/gN/6Ql</Encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true">
      <header v="" e=""/>
    </field>

    <field name="nv_bh" categoryIndex="1">
      <header v="Nhân viên bán hàng" e="Sales Employee"/>
      <items style="AutoComplete" controller="SalesEmployee" reference="ten_nv%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_nv%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_kh" categoryIndex="1">
      <header v="Khách hàng" e="Customer"/>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and (kh_yn = 1 or nv_yn = 1)" check = "(kh_yn = 1 or nv_yn = 1)"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_kho" categoryIndex="1">
      <header v="Kho hàng" e="Site"/>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" categoryIndex="1" clientDefault="20">
      <header v="Mẫu báo cáo" e="Report Form"/>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu in chỉ có số lượng" e="Quantity Form"/>
        </item>
        <item value="20">
          <text v="Mẫu in số lượng và giá trị" e="Quantity and Values Form"/>
        </item>
        <item value="30">
          <text v="Mẫu in số lượng và giá trị ngoại tệ" e="Quantity and FC Values Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="transactionGrid" external="true" clientDefault="0" defaultValue="0" rows="126" categoryIndex="5">
      <header v="" e=""></header>
      <label v="" e=""></label >
      <items style="Grid" controller="TransactionFilter" row="1"/>
    </field>
    <field name="transactionList" readOnly="true" categoryIndex="5">
      <header v="" e=""></header>
    </field>

    &ReportDataTypeField;

    <field name="ma_gd" categoryIndex="2">
      <header	v="Ds mã giao dịch" e="Transaction Code List"/>
    </field>

    <field name="ma_nx" categoryIndex="1">
      <header v="Mã nhập xuất" e="Reason"></header>
      <items style="AutoComplete" controller="Reason" reference="ten_nx%l" check="1 = 1"/>
    </field>
    <field name="ten_nx%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_vv" categoryIndex="9">
      <header v="Mã vụ việc" e="Job"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vv%l" readOnly="true" external="true" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" categoryIndex="9">
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
      <header v="Mã bộ phận" e="Department"></header>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="ma_hd" categoryIndex="9">
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status = '1'" check="1 = 1"/>
      <header v="Mã hợp đồng" e="Contract"></header>
    </field>
    <field name="ten_hd%l" readOnly="true" external="true" categoryIndex="9">
      <header v="" e=""></header>
    </field>

    <field name="maxLength" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
    <field name="ten_dvt%l" external="true" hidden="true" filterSource="Cache">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="186" anchor="6">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="11011-: [so_ct1].Label, [so_ct1], [so_ct2], [maxLength]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>

      <item value="110100: [ma_nx].Label, [ma_nx], [ten_nx%l]"/>
      <item value="110100: [nv_bh].Label, [nv_bh], [ten_nv%l]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="11000-1: [ma_dvcs].Label, [ma_dvcs], [ten_dvt%l]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
      <item value="11000-: [loai_du_lieu].Label, [loai_du_lieu]"/>

      <item value="11: [transactionGrid], [transactionList]"/>

      <item value="1100000--: [ma_gd].Label, [ma_gd]"/>

      <item value="110100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>

      <categories>
        <category index="1" columns="120, 30, 70, 100, 100, 130, 0" anchor="6">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="120, 25, 25, 25, 5, 20, 200, 130">
          <header v="Lựa chọn" e="Option"/>
        </category>
        <category index="5" columns="569, 0" anchor="1">
          <header v="Giao dịch" e="Transaction"/>
        </category>
        <category index="9" columns="120, 20, 80, 100, 100, 130" anchor="4">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvnZPRiKEfPKjxHBmJnvU1lVtlo+1Oh7odASSFZnsPBg9Zo+rjYXqzXYFeMYQpMONV0=</Encrypted>]]>&GetReportFormLimitRight;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcM0GUti1kCp50u/Joaj4mLrRFBFrkg61EVyh0XGpA19zx05m0tH1OgdPSKya+jhQB92mZjn9Ot4aMXMuRM9wUx/xclTHT0ytQP5YzsDNDeJ2</Encrypted>]]>
      </text>
    </command>
    &XMLWhenFilterClosing;
    &XMLGetParameter;
    &XMLWhenFilterQuerying;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7S1FN4LnI67UEpN9mQn9PORZYKb+4U76L4D6lGpMDLVgK3fIqxEJirSInNOAPFYNgAXFldrH8iBHOlP0jSIKjbjIyRmI2QeCwiZg2T/a74sy7l8457S18b3qoVRm7KluUzfQBnLFJT9AUKf/ipEduZb2od4pwQV1Gj//Ibpq9gOtLbeDYYvEElGF1hplRIbP7NvNoau5ec7dzw1Yk8fwTR5JzFUtu5v29WpLvM0HrfOjKB7vqUXqwMPTHUpK8td/68vymn8tQJF1VIoE0Xtq8A=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&Yg5kCMHpRxVk0phZxDQR74g1O3m6RoZRPRYjifX/Aj8PFYLrshnbZ3JwkbE+7wwKoRhqi+IAcuxyl4OcA1ZD+cYk5zjKpQxPCq0Zq3bfnzKNxDE0QT1OTQtcd1YvEd3YWgAJ1M3yRX3o0Ouhe/uMrE/75K+6u1FDoAeqA8iqOC5daIWInfpuiZaPJ00sAVGzFg7eMcHxU9E5MAAwNSDhkIW6GsS4XfzBWz+DNyBCRxb/0M6INYI3AGpVeHs/HoiogejNq1Mizq2Qm3elYenFs4uCBl2+YBUYR1tGqh5wJo150wAiAqLRmsk0oL0SrTYDjrKfHvaPt9oqgZvGBNuur8gvGlnRC+8nRR49itZ7L62d56q6iuuSk0m1c/AeXvlxAsKNHuIkrJPd8siOSdnCkNoW77wOtbZKnUk0LasLV/s=</Encrypted>]]>&DynamicReportFields;&ReferenceParameters;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      &SetReportFormLimitRight;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtf0ePKWMx2z3mvcfODpAeD6TbO3opaqe/n04Q34AtpZ1kFiw2I6YDJ5nIJArEF00UAQPuE7LmyvOyrWFWtbBGwBiTLcimC6l+Y8udMOHcRvGXWa8c4GE0R9RiJcXRNgIl3iIPrzSVsGEfTp230+NJWPsR7B5KTu8dE0JXZ7PGwfBpHZCMZHAB6+7leDQaVQXHa87/v56odpwmEfzTj1Um637Zoly2j1nZtxmDwhhaESU2cdTfBng8+wjnL6EKMCQqyDOnSy+E8uoZatJFm6k+W7BLyv3wTCSv4nzRrNFcta8bjq+0WllO0nLzK1+g6bWEkT0CM+Ma16CGSFohPFdUsHio/zO+5bJGHMmIP5h7Xd0</Encrypted>]]>&FilterExpression;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4frKKWuUoibC4rgEc8bC0Rpa0WB17u82+76RO6sdvnNVo9b9l5KMVEYzAe4k3yPKbdZWpH6UTEPgNu3HTm6qnghToo05xbWSVUFQAVelZfZH0kLPmNuzQj5sBHfXFQCozIxJXlm3JO93W4RhiqVcRwJ5TvsByu/B2/aQ2/+Jf4XsIQcmV42C6sOUSrljTRYpuWh/y28LCatc4aCpyM5KsgQl6JCWDTM4AHPfeDhfFFMcbLQ1Y9kveT9BA83lkxxD+ntFsuo3+HNmZk2ER+fLylAiA1TS+bid990jEz7HCx2cGZ34vKSAhuygp/bY7waqDpZJK5i6/BFJCqX6waLfHHrTpX5A06pTX6eU7YpHCHABp0BRUp0EytH6hiuTCJNoGsB8E3kmBZeeXhGfvuLXCcu8GRibKpldwVH3z5umn0/khssAVUhAyMrlEwIBt+H+OUyvoYNUTd4lPqR4hd5GdS6uvgwrmNLJMtyFVMNkeYaUcdy4HacCllx/F8qN1stbuZwN+C+yVo2RlNfiQXViHlyKBTmZgKoVLXymH3ybLjGVCMBs6318p0X6c1YNGSwYn3lS9UOZrvkZVc25bMWlTY5tvb5vj9D7ENB7dLZHcCqFDtbBgaicFZm3y5NZAgJlhDsGZb9bk4S8bAhKm0NC0lTkwHXrXqGEgg9PBhldhYDRjDrSobC6mOosmMTL1DR07xU6pWSLdMXilBCE0L++jbks0yR9ir+6zTGukFbGt28F6+w4pAn2ggFlNmhAKMFLH9lr+ekyglQnYpdM3EjK//mmlHCsIXnnIGmVMF6A3fgS30FgmYIGvJ2MwTLOLURfns6iAdnhsLAwCzL9ZykY/NCr4GriRdmRln8kAH8Day6Nt5dcATGpZChEJrSr/hLEq6GncrJ0Cxdlz0iWegYsGDqhH0YWYhEdMRJVxPX+8jYYLVpvTJ9fk3dNrNYdO7Ki5+EHCKRAaCqdw6YwSDIXNK9kBKAyUX6GJUH/6YSd/ZN6llPZhmqILgHVT7e04+jr/m/RJQBklFSeZEWYgZ5qGRnpbtKmjmKPdummVMWqECC70GRpUkrEzZdfGY79SPfhHt7Oc7pSlGJaCCBhQmxAM+YsEqnZuuOnV1CGdxCen/mDKZfNhtcQZTInFpB60Q3mkMZ03QkquzqGNEQ30KMMOAIqS24j/84ahmFF2Ekjett7XX7/YdMspEaMkcPr/qOUlbMFwIAxe00KvFMfZXBiQ1nXGZltNOrnkKsvoGc8uxl6niB1Joj2scEnJ2zuZGjYpw==</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetItemName">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu70QZzsPaDwFs+YifbSouifZ+Z8xb2vrymO7L8l1iONMCNMMxDeTYhdwftWQa3hYnyUZODJG3o9oSklbtVRuOdKfvo+6ea68BZW2flk7uBvaJDHKkcPrgBWMSk6Cvd8EJ+rbnPmtXCoSJPYdW9rON9lOOjI3WLKyNgF9iNkVs/90TWCUPUqOh4GIERSHa36okoS+9VGnNrKR0UvjML3Duzw=</Encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>