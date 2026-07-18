<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()" >
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()" >
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="type" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Kiểu số dư" e="Balance Type"></header>
      <footer v="1 - Số dư nợ, 2 - Số dư có" e="1 - Debit, 2 - Credit"></footer>
      <items style="Mask"/>
    </field>
    <field name="tk" aliasName="defaultAccount" allowNulls="false">
      <header v="Xem cho tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc">
      <header v="Mẫu báo cáo" e="Report Form"/>
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
    <view id="Dir" height="378">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101--: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="1110--: [type].Label, [type], [type].Description"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3ypD6wIWsxei97UUI0egwICDoXVdjNnZW6O5WtuqwUnzBTZWbVQtaaaGqIFDfCVJdH4PHp/2BoLXe26PXrbxXzN8hcAJbPWU73BAc7Sl5P166vQt6Hni4xjo/5g2wSvugsvqgCm+oq+j0voYHZCB/JOaXE2U1XE2cQ7jYLvn2ciMX+UporCVbpYjJkcAbr8D+3GW/Yww4VnVUm0XTmMiZfY9KeLKF887plN+X1wEcXeprcqMDjl1KSLB2OkOopvdtjpCktsYvBu966K0xM1Dgo=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUF/+mXAw/pfRpxRjDuQRsZnUGISsj+OpDbS3155Lr5GqymHOfacK26YiPQv2kLt3E4dJxvkFGmme+MpUBg7//Z/YqmRoj47ycby7OWT4dlgwC9wlB2AEALtnniyf/SjyMdLePwZ5cjhGgdlFtMtTOh4iNwfkMawCoI1EHMg8qB2aMq8f7/riu8pK2EnZtqov5xmtf0rLvzImH33h/PhljIiUfAjUYntyvX8znQZyxRMzpVdVrkzIXhfTgm2G0IbKyb7bXb/Y5evrRpp8fDQBIB9Pld5mbPaVo8Yv37XkekRrIr+mgJNZUwvWxXRj/k/3NHrvdpQrkuY6+ja7H7GwMe+2G7YQzObLwhQWsiWTvaCVl7VbTQDZGWA/4mDeqS0xHz2q0Sdbbs/6u4DrmCSKhHMP/JJIYEvEQtqZQoNn/cG3USR+t53p5/If2wytpJ+OyDOaKUfG+gkuvUwKUl0uk1VtyzAB+00hQ3RXoShFzvOAGznTxD46bPq3H+XT1Pl5yWI5hqbiAD2FrG+pd31DUlMCZTzkWukleg9QZsgozlckNO5IvtuwB0hhfHpmJCv4ZFj77TmyBnwhsOMx5bs12D373Mw+7awFR6GC+Q3pBD82Hqy2zpQSJBuzohwxbQRqsmiIfnk0KzKWhMbkJKNXSblgUN/Wn0R6x/mGd0EFWPkvYETvbJY4BG+IstNouLM2Kj+Xn0AkEgU5Pv8NCCxu8xsjAHUZVid74JaCNHZvXVQLiKkszRueByI9gAORVZa6al2lKwfbugSjL8TMAVbg2Bw==</Encrypted>]]>
    </text>
  </script>
  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu70QZzsPaDwFs+YifbSouifiyQBkdvDG95EJTEdIt66OvFJinP2Kyzj3jT0QRsptEMoOdMYZ4n2xjB4ZTbHxrFOJ7E2YHZzAwWwiv1Vm+oEY8qZjOCLprjK7PmVPNZjFGXrsNfvsS1Gf3Uq3BQdc8VU=</Encrypted>]]>
      </text>
    </action>
  </response>
  &OutlineCss;
</dir>