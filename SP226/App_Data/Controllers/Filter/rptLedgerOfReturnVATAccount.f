<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
  <!ENTITY % ReferenceNumber SYSTEM "..\Include\ReferenceNumber.ent">
  %ReferenceNumber;
  <!ENTITY % ReportMargin SYSTEM "..\Include\ReportMargin.ent">
  %ReportMargin;
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tk" allowNulls="false" aliasName="defaultARAccount">
      <header v="Tài khoản" e="Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" normal="true" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày từ" e="Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày đến" e="Date to"></header>
    </field>
    <field name="ngay3" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày mở sổ" e="Date Opened"></header>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" clientDefault="10">
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
    &ReportMarginField;
    <field name="ma_nt" width="0" hidden="true" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="1101-1: [tu_ngay].Description, [tu_ngay], [den_ngay], [ma_nt]"/>
      <item value="110---: [ngay3].Label, [ngay3]"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
      &ReportMarginView;
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4PhtDWYRR8zKDjYZlS1SzGxW5xBGU6rJmn4j+Xpie7ANDnHo3pKtQ8LByLBKUBzbVdwkOgIiklmVYvlCUHz0Yhkk4aqRUKmekfYb2zsmZb2cHbsxTLZm47gp0b+qRWJb8VmVkgqAm4zo1SMQEIG2SEfSVD7G2q/oKDWPZgg37N0BRSAhQqayC8oRYiAos31LoCIztBPbcZDgtQeAaMH+dLn1czPjVbukFLpKPbWQWYHhLNLmti3/DKXXe0dCV9Oh4h9v6H++36G9uyyB/BOUp5ZAYUn4f5xR2+73GroCzh1sASEsd+jHMS6BF7/h0UNMiImSBcjuhmbQdBbGoQeBDiEapvr/zlgFGFD27UpLjitBKIzXQ0liiKsugmUjqRlV86bY66R+gb2bbMQ+rmi5Hs=</Encrypted>]]>&ReferenceParameters;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22SfbYT7OQOSjX0vrrAlPzH0XXSCzEU+1yIfouaA03ABFqyxKfEZ8qNI70YcWbWbgWi3DG9ROzd7ARdAsMuFRwZKm/2AgmliH2WEwuMfAfjuT</Encrypted>]]>
        &ReportMarginProcessing;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcU5d5UltcR8bTbfrnO2d1KzovGjX8PqAdTr/BMqZOmhD21/kcC4L+SaJqqrhB5BWWvZL9ud38/F4FoVNsFtwoIezr32qRPjDQRKQrSED5B5LRArmmpR2w3sq5UuPB9oMZneENkg7TXILsfSBC8F/Tq5xHSdIVqHm4mK6TKwSELcsWUb1MZDuAm25ImSr940b1og6/KVO5gNXmFNGJ/cltkC6j7ZbrkfXpFzr8vpGZO56KSbWPcezMZlxm2Q/KWRuepsBiNUvIlBwIqgTWvcdNV2uUABB1lGb/Nl2TrG1E0JPfhmTr/HYj8GB8t1VdDCZZzLXirBXhZq9XOkXvuyMlAPF8lE29xTT7ZE5pE/wRaOfAQ/CSeRaTFKMx2aJ6ihFvCT3g1ORxAglZIqtexewBs012ZvqG8Yv9HA3pYa89TL+2VwVzU8EcU5Hye0GpVWjfaKUGkpk5KdoCz1rkOMlfg0V45fj39wjZu3OSky6WWce3yJeIcSd8a4GZBxXJ4cpkoV/0Exd91KqrgRHToasVEVy87ZdqO/rUG7OOECXg03DWhERgo5yYSklx2tbgzdwIJShi2HMDpbdxnqLvVBCNa4eJXTtPH+5oCrqB9A5ro29b0TWlaOJGSA9YyKXg8DeA0J/EVtGKcHAs2aoDfIGWgmzkPtBFhycnLRL1mTRCuzPtSG8ksyK1+TCVd9VY0rTGN3wsCbr/n0mzkY01Mhulam/66gg6XFows9dHo0b5UNMkIzZfJ1grMNKBzdlMFfM753apLJhaIa+eAZ1tJJeKo2w==</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu70QZzsPaDwFs+YifbSouifZ+Z8xb2vrymO7L8l1iONMshIBb8irW1YDA7cu+DB6uq+uKR3SbL3QJRD7izevqdf1czoA4Ajy7NWcvncm4nrkWZJrNGNVGf+o/1+HHbJ7FA8YcoVPZGWLwp15gLWgfxF0HGng+tWvmZfouZIT1Ahy</Encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>