<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Controller "rptReceiptTransactionListByReason">
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
  <!ENTITY DynamicReportFields ", '#$query'">
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
      <header v="Mã hàng" e="Item Code"/>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99LWeKcpDV7GFdDyVy3RoD0J3pIqv3Y62T10G5/gN/6Ql</Encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true">
      <header v="" e=""/>
    </field>

    <field name="ma_ncc" categoryIndex="1">
      <header v="Nhà cung cấp" e="Supplier"/>
      <items style="AutoComplete" controller="Customer" reference="ten_ncc%l" key="status = '1' and (cc_yn = 1 or nv_yn = 1)" check="(cc_yn = 1 or nv_yn = 1)"/>
    </field>
    <field name="ten_ncc%l" readOnly="true" external="true" categoryIndex="1">
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

    <field name="transactionGrid" external="true" clientDefault="0" defaultValue="0" rows="102" categoryIndex="5">
      <header v="" e=""></header>
      <label v="" e=""></label >
      <items style="Grid" controller="TransactionFilter" row="1"/>
    </field>
    <field name="transactionList" readOnly="true" categoryIndex="5">
      <header v="" e=""></header>
    </field>

    &ReportDataTypeField;

    <field name="reportType" dataFormatString="1, 2, 3" clientDefault="1" align="right" categoryIndex="2">
      <header v="Loại báo cáo" e="Report Type"/>
      <footer v="1 - Mẫu thường, 2 - Mẫu nhập mua, 3 - Mẫu nhập khẩu" e="1 - Common, 2 - Purchase, 3 - Import"/>
      <items style="Mask"/>
    </field>
    <field name="ma_gd" categoryIndex="2">
      <header	v="Ds mã giao dịch" e="Transaction Code List"/>
    </field>

    <field name="ma_nx" categoryIndex="1">
      <header v="Mã nhập xuất" e="Reason"/>
      <items style="AutoComplete" controller="Reason" reference="ten_nx%l" check="1 = 1"/>
    </field>
    <field name="ten_nx%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_vv" categoryIndex="9">
      <header v="Mã vụ việc" e="Job"/>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vv%l" readOnly="true" external="true" categoryIndex="2">
      <header v="" e=""/>
    </field>
    <field name="ma_hd" categoryIndex="9">
      <header v="Mã hợp đồng" e="Contract"/>
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_hd%l" readOnly="true" external="true" categoryIndex="9">
      <header v="" e=""/>
    </field>
    <field name="ma_bp" categoryIndex="9">
      <header v="Mã bộ phận" e="Department"/>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" categoryIndex="9">
      <header v="" e=""/>
    </field>

    <field name="maxLength" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
    <field name="ten_dvt%l" external="true" hidden="true" filterSource="Cache">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="162" anchor="5">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="11011-: [so_ct1].Label, [so_ct1], [so_ct2], [maxLength]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>

      <item value="110100: [ma_nx].Label, [ma_nx], [ten_nx%l]"/>
      <item value="110100: [ma_ncc].Label, [ma_ncc], [ten_ncc%l]"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="11000-1: [ma_dvcs].Label, [ma_dvcs], [ten_dvt%l]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
      <item value="11000-: [loai_du_lieu].Label, [loai_du_lieu]"/>

      <item value="11: [transactionGrid], [transactionList]"/>

      <item value="111000: [reportType].Label, [reportType], [reportType].Description"/>
      <item value="11000-: [ma_gd].Label, [ma_gd]"/>

      <item value="110100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>

      <categories>
        <category index="1" columns="120, 30, 70, 100, 100, 130, 0" anchor="6">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="120, 30, 70, 100, 100, 130">
          <header v="Lựa chọn" e="Option"/>
        </category>
        <category index="5" columns="569, 0" anchor="1">
          <header v="Giao dịch" e="Transaction"/>
        </category>
        <category index="9" columns="120, 30, 70, 100, 100, 130" anchor="4">
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7S1FN4LnI67UEpN9mQn9PORZYKb+4U76L4D6lGpMDLVYg2sBDB7OXI0RxLc6cYG/ycw3RvGoHxqiwumvRNcUxaSyHz0h2TVMlMnPUcHPNwdvmAb0g/O/u1W6FX3+qZWWIFfYw2VAAT/Z3aEGdvb2lH2IPwPih/sXAey6ol6lVvX3fdklbrSEEE7GHKHO/Sz3iSIVUp/9isqK9pt6jINfhPco5MvoNcC+DMd8tPvCU30gg0mkDYSLoWBQDeP3UxUTgkmaEvZn9qjM50Dln34kfgshB7FBkrJiLZN+s7fkpVtRMN5qGcJ/ctBTWZTSupLsTECzpecmvOnxbo0dscT6NI=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&Yg5kCMHpRxVk0phZxDQR7z8tkM73b6bsKzwwLg+nQyVCc0vpInz6fJ0XPIbjCpovwOobirBIbmfXetVdL2JU7pLWP6N0rDHsb3cB+k6S36cFRedw2AtKW2BsjKKP1BncKgFsW2VtS3li/HqSOJYJO9PfOCSIGrasHBhXZSW/zd10Ld8a1YQhFpZwXecEmxl7fd4mAPA/zhxuPzK3gCevJy0xKZK9QM11ch6Faf4r4UMV8TCExxzXmPmlx86i7ZZ+IO74xjhPbZ4nLWIegq5qb/MGAfZsvLcfDjhavM+sy1KXqsS8SJ4Gns8ZhZ7uHeScxHk3XiFbnPaVEmQEO3Jhw4bfD+NqOKAI6/mhw4BE68HudJH5rpjUbvo+P8PsfKyaB+sJdo9I6oaWz0HkcUXhT6QzUMG2HNJvRE60BmospuU=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFKFyn5nqtVBL8WX4eo6H2kabgBcKsgcm4iH2SLI2Ez1+</Encrypted>]]>&DynamicReportFields;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      &SetReportFormLimitRight;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22RUEW0slMShueWy06PcBDyd9ktXeZZLi+u4e3uWzzfV6UBkjyLCJvaQKhV1r6qPPTglkHqnaRjYR8qCTAKvDrzeS2HA8/ZNt2AxtdMgmLBHBPQ0o7/VV7dnRYHScjqViXg6b+HRvUVkLcF7LqbzDLnR84f2HXFhtPyOOsI+AJyr2JymKk1gnT4v9+i4qK9wdz+AhEyqvpkGkNXHZVlktOsDEDFOxOCPmqzdaB/bR43MOgGAMqqdK1njC76CmZCRQfQ==</Encrypted>]]>&FilterExpression;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4frKKWuUoibC4rgEc8bC0Rpa0WB17u82+76RO6sdvnNVo9b9l5KMVEYzAe4k3yPKbZVI/Sn1Yhl/iJ27gLL9uKlQA9+QLSPmxH4IiD180SWxIDMcEeU/69wdByHDuCjYase4HRlCbelr3pqdBFwAf3XNmTeptilLnb7JEDfqSxJmf3ifSPpieIOv2ereu/ZJgN81AgRwkI/1PW1Jjj67miVwkTmPe4DEN687IakYqugtH9tyrA+sCdnMQurjVcdndtKyQMPEcfhFQoLWg9VRZKo0roB0JDuwQ74CBCFI9+cMuJGjIyRsUP5FlkFw9x4l//tzNUTlo15lf7WfO/4cox+RjfoHJ+3JlCXIS/MCygXF6xfByW1vBqtJHYHsQLjU1OQpVZVAJLW/aWK2+P48q5GE+ROhlbu/kwxvd8oc9oBe/Q3wV7EFvrY6Rp7I9Sag3w42Lg8K7Dpo2Vw3J4Ef2n47M+SUgpHH6rrXpE15NpSP3YX3oMQdoHjITKgJDongRjJhgBcRHz11862nVRaIMvediej5hRzbpNLDRnCwPCtzB0MVHnOnQAKvL0PKjxpc6LDwZj5eTS9ov64Dbv3R8XWx0yNGZGi4LeCd3VEun6u84muyuaJAEGwYpFKocXMC3JWGsnzsaJ4OXXyajKFhb0IHZ6O7J5yc0i1+a5L4uD05v+pU7LjbSXDmO/N2qX6U50Znk1sc++oaKXnycwfzJmi9ruYNx97IYjLsI9npuwvczUWL6tGZQudiLEyuNP2qP4fMsF8NCC+3ewXOzXPwGcRYBb/UDtV8neBA+HQ01HpfPP3vhVPurlF+f6oUF2mWXalEKHpS3wBFlLdsOT4Bz+zL8w0UdGTOYoFGSao5IZyRZbQblIRM1Vc8V2qkHLklIxUNuCILUGeZDeYmJmG4JGjVkwWtLGHbLQMR8J1XZODhvNWeq9/Pt+HtDQyVbZ1WvK7+O1Grrx+ETOfW+Cu8XwsvQCDBzjTKlNvhE4JFQFtJWUPB/3Tdgb1EH5koItYc+/0Pjph0wvbNGzy8+jgWmB/QEH4Ixk1XeeTv53qezZJ1xGwWeQW2mhS8cch4OPri8jDFOPtM+0TWJroxYQQFDaeyPmXKZFuDZ8omU82atReY1+5EsmrQrHCiu/9yq6vdZfvy8pjGxsclrj4aq5jaTKKBVUpwxHQTsacPAmpzTrYmz5TdblV34sR0f8p/e1a+jG2cFLNuVliymf5LIQJ00ThQoLW8uztH8qgqzCrQ4a2wmgpB7yYkO21ZBXvu5gcQln34AMHWwg8kO2OY/d+X4w3dQNWOIrx8AI88Tc0kLPbRo2gKC1jyYb/tLVZkGbmdUSXe3ptIIANuuzZl5dtzKrBmVvPbxgdMQ0y5EF9DWtgJzLpZfWE7jjIJHHsk3i1NOv29OdIg9//Ght71Hx2pvq66xjQa5BNi9GqHEDZctuXZNPa1WHOQ0+c07bBKMP5iGg==</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetItem">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu70QZzsPaDwFs+YifbSouifZ+Z8xb2vrymO7L8l1iONMCNMMxDeTYhdwftWQa3hYnyUZODJG3o9oSklbtVRuOdKfvo+6ea68BZW2flk7uBvaJDHKkcPrgBWMSk6Cvd8EJ+rbnPmtXCoSJPYdW9rON9lOOjI3WLKyNgF9iNkVs/90TWCUPUqOh4GIERSHa36okoS+9VGnNrKR0UvjML3Duzw=</Encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>