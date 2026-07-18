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
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
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

    <field name="bc_theo" clientDefault="1">
      <header v="Báo cáo theo" e="Report by"></header>
      <items style="DropDownList">
        <item value="1">
          <text v="Tài khoản" e="Account"/>
        </item>
        <item value="2">
          <text v="Phí" e="Expense"/>
        </item>
        <item value="3">
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
        <item value="1">
          <text v="Đơn vị" e="Unit"/>
        </item>
        <item value="2">
          <text v="Phí" e="Expense"/>
        </item>
        <item value="3">
          <text v="Tài khoản" e="Account"/>
        </item>
        <item value="4">
          <text v="Đơn vị, Phí" e="Unit, Expense"/>
        </item>
        <item value="5">
          <text v="Đơn vị, Tài khoản" e="Unit, Account"/>
        </item>
        <item value="6">
          <text v="Phí, Đơn vị" e="Expense, Unit"/>
        </item>
        <item value="7">
          <text v="Phí, Tài khoản" e="Expense, Account"/>
        </item>
        <item value="8">
          <text v="Tài khoản, Đơn vị" e="Account, Unit"/>
        </item>
        <item value="9">
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
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 10, 25, 75, 100, 100, 120"/>
      <item value="10101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7onyScXTRW5IHhAQtI9XdnKXKYFBhnwh8RFQN+yvTr5qfliS5MQJpMMm8hVlDVAGOHBcxQtczFaU7oEV2UWAmYS/gXmbdT6rxe/dfwVDq1t6mZ27NE/sRvz63mPnCIxNiM034MxfNV11rNQdlCbvRsQZgg96PsYrTwqF2H0ec3YK7DDKlX5gG/x4BLpOcz5hAgsBCeWgTKhtF+w+Bd4PWwjPKQqxLtFD4lfZyzUYsRZj/8gTe6Oj3s+cj+XoBxqepRrD37yC27gkSaUYT1IFmcfsWdpSOxtgsI7kPGU/9h2CsyyJRD9Sj8gzoohKm5xjwtsOdPvGGFNA595RIzwuBggllYjWhtc9lIVWH7LJ4DB8pVeQEPKAjUoVeGrgnheTqB00vghkEH5NYGagjDYpW1abP+owDTKusn7NDWzdGKxcngpCqm9jipiVtwnjXYlfQ==</Encrypted>]]>
      </text>
    </command>
  </commands>
  <script>
    <text>

      &OutlineEntry;
      &ScriptQueryFilterString;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUUfHzzA9FyUDnlyfCk6ZE2iOQ6P1TqYcj6Bsbtu3IYAEwkffc5+iUqwG38A4SKR5Eb+tAZLxyWKsrVkcfDV3n0k4KggjwOGbVpph+dfmMtJpSnTXkxL9OoDFNdnrF2W+U74tuv2aLwo11BkTMk9cue8+IJwdYdbVfcN7iRNDlGHAtMSKCaLxAbbN3KoLzTmnt9xmGl26qX3YRkWdMyBDYGycDAmU8TzGpHxXA61U0gj5sBFWxoA2qorb6yLnctisA/dVPmbBDeK4i0BlpM6NrXFYNIksQrpEshBKijxujJYnnrP/xv7azPdm9/JLOEsvJCnsChVzcC1BoBoob8++8YXQITNxvWOjVJkWfQrDL8wt9UPmErbAcatVXgA3rMIh3hX6KjFTc48w/VXNTsNcQcrVjAsSEO5UKYipORvYXjAS0DFyvLta2WcaD8PEDHMr9knrLB5MEiebNInPTeSzwHzCIXLRVdbOJXAMJG/NNga8qzIf7SArw4WV8Z+Z9SCFZDosEgbdwDaRAzXUM9fDWxI0VgK5iFnkKb8vGCeL8tpVZ+7dxmP7C1uNKpKcf0hSx</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>