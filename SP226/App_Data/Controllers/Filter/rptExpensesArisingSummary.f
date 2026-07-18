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
    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <clientScript>&OnSelectionOutline;</clientScript>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
        <item value="20">
          <text v="Mẫu ngoại tệ" e="FC Form"/>
        </item>
      </items>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7onyScXTRW5IHhAQtI9XdnKXKYFBhnwh8RFQN+yvTr5K/Spaoz0zjaWrgjy+dNflWjCa5IV4ONLlCOeOkUdUnxwXpZZDH78ddXRDWDA0WN7VCG9kIKw9DbpyFzymrRIKe32VegwBMIBPDaDqYILrNy6TxtUATK9X6J7EaOG4CV8HhqOVFmHrAHCZBj7JcvQw1K8L6FVd1yJCiv7tnFV6xEGeEQDF+5faN5UGluBbZ+ik93QvMvuQiZteE9aku6gLXhRw/nHTS24mbgYiWrJZJl/2J2jbG2mqC1+DJAWds8QnfM0lzkVEv8xm0KvU7Oi5dCDFlNQmU7uCeZgE2a7j6KMFKNfQhlKFQXy6O2j0PQzqRAyck/OPke9h9HTmPTi2bdEzpiZQrc4HgFtMa8hzyF8qkaRJh4HuXaneuKld3GzaoVWVZQozV/wOIb/3a5Q91KOMynTpxqM+6+UK+bP2IWgUIsYrr/kLJPyjrbUaR4OBoQRgpL7Wa/ZhXlTGKcRQvlMNgGWasqP5+jr/D5RopYMBjdwXLbNJkqcheE84wgvY9n+NE2HD5FADZu9k4xbpvaqC5tEntd0pXMvEEKbl1EO2ERrvd5De04BwUgXhHXBQI1e1pATYtRfPDW7mT72fE6NxicwrSVCHdNGvS+CwCcBMFQdT4IC+mYv+p4uv4dF</Encrypted>]]>
      </text>
    </command>
  </commands>
  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUUfHzzA9FyUDnlyfCk6ZE2iOQ6P1TqYcj6Bsbtu3IYAEwkffc5+iUqwG38A4SKR5E6kvU5yx4d5IsWfQ1GeFQoTVrFv+z4PkVeUZSS2zbY8zOZzecJblt6BnLHOFdleU4fLxabvOTkWnAR+uQC1wpHzORbJjsW4YcOrrOJE1YhPKhoVH9LimJP4CaX4EuGFg1qEF2spHjri2p/QwA3eR98JqilN47hC+bOAL/FONLdq6v7mSHWZa/MMyJd2UgBxWBOwgh1PZ3npaZYYyz8wUfibMf4ic6HPTHfTHbUzcCKIUUi37JaYYWUoJ8ymJgYN+OtwTXOq5bU2+4B84YClDdExCLydK/OJLOhWhliC5XEOdq+LMM9slZyxXfzR1FGpKLRqve5nM+A3PDK3ScfUfJ6igHlkcXG4GhKJ6brPG5tUq2ELAFlePVK9ApPeKIlcsIwGcyAxg+91k2Ss0GngnSNXJ3RvOlegmsuB6JgZfux31RtjWMJBzkNw7iZ6N7SL2nqgJ0fKfa2lJlb5GbXbnaKk4noiDHnsS0ixV4l6D9fRBNYFCHFsrASkcOpVgwI5+5ul2D1YmDMnQ/U+JX57MvGA==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>