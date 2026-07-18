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
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="tu_ngay_k1" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày kỳ 1" e="1st Period Date from"></header>
      <footer v="Kỳ 1 từ/đến ngày" e="1st Period Date from/to"></footer>
    </field>
    <field name="den_ngay_k1" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày kỳ 1" e="Date to"></header>
    </field>
    <field name="tu_ngay_k2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Từ ngày kỳ 2" e="2nd Period Date from"></header>
      <footer v="Kỳ 2 từ/đến ngày" e="2nd Period Date from/to"></footer>
    </field>
    <field name="den_ngay_k2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Đến ngày kỳ 2" e="2nd Period Date to"></header>
    </field>
    <field name="ds_tk">
      <header v="Danh sách tài khoản" e="Account List"></header>
      <items style="Lookup" controller="Account" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="no_co" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Nợ/có" e="Debit/Credit"/>
      <footer v="1 - Nợ, 2 - Có" e="1 - Debit, 2 - Credit"></footer>
      <items style="Mask"/>
    </field>
    <field name="ds_tk2">
      <header v="Ds tk không tính g.trừ" e="Non-deduction Acct. List"></header>
      <items style="Lookup" controller="Account" key="status = '1'" check="1 = 1"/>
    </field>

    <field name="bc_theo" clientDefault="0">
      <header v="Báo cáo theo" e="Report by"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="Tài khoản" e="Account"/>
        </item>
        <item value="1">
          <text v="Phí" e="Expense"/>
        </item>
        <item value="2">
          <text v="Đơn vị" e="Unit"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="nh_theo" clientDefault="">
      <header v="Nhóm theo" e="Group by"></header>
      <items style="DropDownList">
        <item value="">
          <text v="Không nhóm" e="No Group"/>
        </item>
        <item value="2">
          <text v="Đơn vị" e="Unit"/>
        </item>
        <item value="1">
          <text v="Phí" e="Expense"/>
        </item>
        <item value="0">
          <text v="Tài khoản" e="Account"/>
        </item>
        <item value="2, 1">
          <text v="Đơn vị, Phí" e="Unit, Expense"/>
        </item>
        <item value="2, 0">
          <text v="Đơn vị, Tài khoản" e="Unit, Account"/>
        </item>
        <item value="1, 2">
          <text v="Phí, Đơn vị" e="Expense, Unit"/>
        </item>
        <item value="1, 0">
          <text v="Phí, Tài khoản" e="Expense, Account"/>
        </item>
        <item value="0, 2">
          <text v="Tài khoản, Đơn vị" e="Account, Unit"/>
        </item>
        <item value="0, 1">
          <text v="Tài khoản, Phí" e="Account, Expense"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="nh_phi1">
      <header v="Nhóm phí 1" e="Expense Group 1"></header>
      <footer v="Nhóm phí" e="Expense Group"></footer>
      <items style="AutoComplete" controller="ExpenseGroup" key="loai_nh = 1 and status = '1'" check="loai_nh = 1"/>
    </field>
    <field name="nh_phi2">
      <header v="Nhóm phí 2" e="Expense Group 2"></header>
      <items style="AutoComplete" controller="ExpenseGroup" key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
    </field>
    <field name="nh_phi3">
      <header v="Nhóm phí 3" e="Expense Group 3"></header>
      <items style="AutoComplete" controller="ExpenseGroup" key="loai_nh = 3 and status = '1'" check="loai_nh = 3"/>
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
      <item value="120, 10, 25, 75, 100, 100, 120"/>
      <item value="10101--: [tu_ngay_k1].Description, [tu_ngay_k1], [den_ngay_k1]"/>
      <item value="10101--: [tu_ngay_k2].Description, [tu_ngay_k2], [den_ngay_k2]"/>
      <item value="101000-: [ds_tk].Label, [ds_tk]"/>
      <item value="1011000: [no_co].Label, [no_co], [no_co].Description"/>
      <item value="101000-: [ds_tk2].Label, [ds_tk2]"/>
      <item value="101000-: [bc_theo].Label, [bc_theo]"/>
      <item value="101000-: [nh_theo].Label, [nh_theo]"/>
      <item value="101011-: [nh_phi1].Description, [nh_phi1], [nh_phi2], [nh_phi3]"/>
      <item value="101000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="101000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7onyScXTRW5IHhAQtI9XdnKXKYFBhnwh8RFQN+yvTr5qfliS5MQJpMMm8hVlDVAGEy0btmAoXoVnH6IueDmpYd5cHExoMx3N9ucoh7iJQCrKtMB4aSz6Q5KiE6O5iEeVuNM4o1MDogVhIfeXpkH4J3Z5kFDi0T4GFh3sdRkjc34UocuSTZBL5Hfd0VRkgWQ+sebR7Z4LlwMnrOtzgzYA57ULQ7d9CLatnvnQQL/Zfci/2sZIExZEhsU9jirAPV/0ovrRmMKaXQUho9fXHKQt/wAs7X7QSxs9KZTtMNeSBhj5PHvMAZVPGG+/l2RmxKx9UDWCBuG99wdLqDKI9o/O1TXg5ENRIiuWXjjco1pdnWggjDElQ9B2JANLX21s+ZMVobzEO+XxNauQ1nPKeMA7QFFv+ODUT0EUled/WTQbeTAIetwUjPu8jNVpTicEMVuEI4fXAvxKgVM7weSOrL+8C6zu2ugU60Lgr5E1Op9lPe9</Encrypted>]]>
      </text>
    </command>
  </commands>
  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUUfHzzA9FyUDnlyfCk6ZE2iOQ6P1TqYcj6Bsbtu3IYAEwkffc5+iUqwG38A4SKR5ENHfr6jOHBO5IDzFnlRN9iQZ7Ox/cfTHc25/Bcah1Yv5W16fEBWbjabiaJu8ei+Wd3lazdf+xAuAWMvZ1puy1rv6dZYdwq4v0aj2Wxc8PLiYnR5SyF1Ou9xnpDU/9BG99TMT0awfUYjhi6MaWdtZ/KCxjJm//tPZEe48EC87gGF8hjFaHbAqhY4bzrzRH1SUPkFw/mG729HWVwK7tDsarp+Z43lga55PaHwXw4P9upJQoGD++e0WnjPnNKeIAo4/xs9JPi527wGelKmp5Ek+aopfuGaV31HxHK26l9hr8q43jVNd/eaIVtgSaPkifX6UZ0msKXwg5y9YevvwnWQMHDzqOXbXqH4bF5z0Gavo4WI81/tqUvR7UWhevTpPBpo46g9s3F99CpkKiFOBzZHIsjSjpnNzvk6ObHLVSoIzs+ZMCoeCAPBLYgE0XttSxeWDpocgiOU35OLxnGMcxHRtM7g==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>