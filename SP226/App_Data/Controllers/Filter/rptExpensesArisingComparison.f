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
    <field name="bc_theo">
      <header v="Báo cáo theo" e="Report by"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="Tài khoản" e="Account"/>
        </item>
        <item value="1">
          <text v="Mã phí" e="Expense"/>
        </item>
        <item value="2">
          <text v="Bộ phận" e="Department"/>
        </item>
        <item value="3">
          <text v="Vụ việc" e="Job"/>
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
        <item value="0">
          <text v="Bộ phận" e="Department"/>
        </item>
        <item value="1">
          <text v="Mã phí" e="Expense"/>
        </item>
        <item value="2">
          <text v="Tài khoản" e="Account"/>
        </item>
        <item value="3">
          <text v="Vụ việc" e="Job"/>
        </item>

        <item value="4">
          <text v="Bộ phận, Mã phí" e="Department, Expense"/>
        </item>
        <item value="5">
          <text v="Bộ phận, Tài khoản" e="Department, Account"/>
        </item>
        <item value="6">
          <text v="Bộ phận, Vụ việc" e="Department, Job"/>
        </item>

        <item value="7">
          <text v="Mã phí, Bộ phận" e="Expense, Department"/>
        </item>
        <item value="8">
          <text v="Mã phí, Tài khoản" e="Expense, Account"/>
        </item>
        <item value="9">
          <text v="Mã phí, Vụ việc" e="Expense, Job"/>
        </item>

        <item value="10">
          <text v="Tài khoản, Bộ phận" e="Account, Department"/>
        </item>
        <item value="11">
          <text v="Tài khoản, Mã phí" e="Account, Expense"/>
        </item>
        <item value="12">
          <text v="Tài khoản, Vụ việc" e="Account, Job"/>
        </item>

        <item value="13">
          <text v="Vụ việc, Bộ phận" e="Job, Department"/>
        </item>
        <item value="14">
          <text v="Vụ việc, Mã phí" e="Job, Expense"/>
        </item>
        <item value="15">
          <text v="Vụ việc, Tài khoản" e="Job, Account"/>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7onyScXTRW5IHhAQtI9XdnKXKYFBhnwh8RFQN+yvTr5K/Spaoz0zjaWrgjy+dNflWjCa5IV4ONLlCOeOkUdUnxwXpZZDH78ddXRDWDA0WN7VCG9kIKw9DbpyFzymrRIKe32VegwBMIBPDaDqYILrNy6TxtUATK9X6J7EaOG4CV8HhqOVFmHrAHCZBj7JcvQw1K8L6FVd1yJCiv7tnFV6xEGeEQDF+5faN5UGluBbZ+ik93QvMvuQiZteE9aku6gLXhRw/nHTS24mbgYiWrJZJl/2J2jbG2mqC1+DJAWds8QnfM0lzkVEv8xm0KvU7Oi5dCDFlNQmU7uCeZgE2a7j6KMFKNfQhlKFQXy6O2j0PQzqRAyck/OPke9h9HTmPTi2bdEzpiZQrc4HgFtMa8hzyF8qkaRJh4HuXaneuKld3GzaoVWVZQozV/wOIb/3a5Q91KOMynTpxqM+6+UK+bP2IWdu/U0MKtBfeNoCMP9/4IxhnkJ0pDBNLO2mUQCUznfufUrZnZIekjgazIXy4g2PdDcqt/zE3qA6IfmYn5r34pGhVtqTxmcE6HWts7H/p/aqhQrh1I5X2xnTpDD1nQAhUeITl0ccmXsnARCsePsZC+4JKPL2fRI3dLxK5onp0pC3RbLW3jrpJelq31h4wObWZJrnuNwNIHwFhHfXocRRkGVpcRM3LTkM5qOKoVALV3C+WMjPxU4o5g282eo0RwmTa8=</Encrypted>]]>
      </text>
    </command>
  </commands>
  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUUfHzzA9FyUDnlyfCk6ZE2iOQ6P1TqYcj6Bsbtu3IYAEwkffc5+iUqwG38A4SKR5ENHfr6jOHBO5IDzFnlRN9ieWY/nywFrneeWlUrQ/LAH7pqXuZeOdyEz1Ujvqng/9EiC0QnDpSYfegB5hnH+QEtU15UqU8pDHMYQJ7C6NrU66VmRmpxxZR1ayMs3K7YfheAnWABfgxmIIs9IKJxDqZ2ZdbRyFHOXIOugFq1HQGgUpUs7UUCP8avjgl8TbWAHAiAXuUqjKOx13QhMi5VRci2FdOePszD6gvJG++bmHhprrrqUiIbdoG9ZMD5H4PUn2K8RYrkQWOzD2Ww5lIvMs2hdDyA+Bpaegh63Paal8jFOEHepLlqmrhUbm4Bh8JpX/OKxaBICKMFo6JcmDku+ASNazDPA8ooUQoAfst32pACsW223Pq997sfkNVsGWcRZi/G9+NjtTS862pp0+bI7a+JwFG4H/DfOP+wAUC26bHEvadQFkOsOiHgTjiFze2eRsbDm/PzTYy5VlxIzmSJyVkIhcpvKMgo6V9m5S+cyq6Ikgn7+mqhwAWjKDDJctFZWdZ</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>