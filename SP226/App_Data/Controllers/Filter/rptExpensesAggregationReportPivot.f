<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptPivotFilter SYSTEM "..\Include\Javascript\PivotFilter.txt">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY % CompactMode SYSTEM "..\Include\CompactMode.ent">
  %CompactMode;
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"/>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="ds_tk">
      <header v="Danh sách tài khoản" e="Account List"></header>
      <items style="Lookup" controller="Account" key="status = '1'" check="1=1"/>
    </field>
    <field name="loai" dataFormatString="1, 2" clientDefault="Default" defaultValue="1" align="right">
      <header v="Nợ/có" e="Debit/Credit"/>
      <footer v="1 - Nợ, 2 - Có" e="1 - Debit, 2 - Credit"></footer>
      <items style="Mask"></items>
    </field>
    <field name="ds_tk_gt">
      <header v="Ds tk không tính g.trừ" e="Non-deduction Accts"></header>
      <items style="Lookup" controller="Account" key="status = '1'" check="1=1"/>
    </field>
    <field name="bc_theo">
      <header v="Báo cáo theo" e="Report by"/>
      <items style="DropDownList">
        <item value="1">
          <text v="Tài khoản" e="Account"/>
        </item>
        <item value="2">
          <text v="Phí" e="Expense"/>
        </item>
        &ReportFormExpenseFields;
        <item value="4">
          <text v="Bộ phận" e="Department"/>
        </item>
        <item value="5">
          <text v="Vụ việc" e="Job"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="nhom_theo">
      <header v="Nhóm theo" e="Group by"/>
      <items style="DropDownList">
        <item value="0">
          <text v="Không nhóm" e="No Group"/>
        </item>
        <item value="1">
          <text v="Tài khoản" e="Account"/>
        </item>
        <item value="2">
          <text v="Phí" e="Expense"/>
        </item>
        &ReportFormExpenseFields;
        <item value="4">
          <text v="Bộ phận" e="Department"/>
        </item>
        <item value="5">
          <text v="Vụ việc" e="Job"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="xoay_theo" clientDefault="2">
      <header v="Xoay theo" e="Pivot by"/>
      <items style="DropDownList">
        <item value="1">
          <text v="Tài khoản" e="Account"/>
        </item>
        <item value="2">
          <text v="Phí" e="Expense"/>
        </item>
        &ReportFormExpenseFields;
        <item value="4">
          <text v="Bộ phận" e="Department"/>
        </item>
        <item value="5">
          <text v="Vụ việc" e="Job"/>
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
      <items style="AutoComplete" controller="ExpenseGroup"  key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
    </field>
    <field name="nh_phi3">
      <header v="Nhóm phí 3" e="Expense Group 3"></header>
      <items style="AutoComplete" controller="ExpenseGroup" key="loai_nh = 3 and status = '1'" check="loai_nh = 3"/>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1 "/>
    </field>
    <field name="mau_bc" clientDefault="10">
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
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 100, 30, 0"/>
      <item value="1101: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="11000: [ds_tk].Label, [ds_tk]"/>
      <item value="1110000: [loai].Label, [loai], [loai].Description"/>
      <item value="11000: [ds_tk_gt].Label, [ds_tk_gt]"/>
      <item value="11000: [bc_theo].Label, [bc_theo]"/>
      <item value="11000: [nhom_theo].Label, [nhom_theo]"/>
      <item value="11000: [xoay_theo].Label, [xoay_theo]"/>
      <item value="11011: [nh_phi1].Description, [nh_phi1], [nh_phi2], [nh_phi3]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKYgwEiaKG8RxUiGe9J1p5fQipvDnRWF8u+m0S1WrYZUcumN4sbu4mmLJ4o0TXURN/H5Q1ktk4hmZuGRvedJlP+3Kc2V46TkXLpwzERsv8lru+4Ec+VLd6Z3A5CuPxYHRKDHbgxf0i2Tr8ButuGeLCAZ1CCyRoebsllk9hfD09lBcofPmp97VY6+hdWSeuv0/UcrUel/AVMUzgsruemfQI8AipCGKcV6hUCjx+b5yGYq</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptPivotFilter;
      &OutlineEntry;
      &ScriptQueryFilterString;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUUfHzzA9FyUDnlyfCk6ZE2vEpSbTbw7G6rMqp9gFlJg7emQcGDO6KEhjhE0oJNKoUk+HZowbV30U92JAewhHQw/iXe3i6YCeEAM4wM0qWMQRZbnSX0FsMfQBypCMs6KLcoirwOkiJ+Nn9jssCoX/iDqjY4Bi56kcQhdf22mHGDpkZkPMN35NTpwlR7bFBhcnpzJUAHlZ8jQkroatyYH8Vi0Vsu4kKd71J9eFS2ZvcNZn6giVqY68Ka8WVc48LS3O4mm+rTlGkXRBfyKRTwpysTwJmMf755o9N1gqcmj9AR07g3hkwl47uM9kMjkQsD3oBQh1adW62eisxV2u7642X4jBgzfyknfOC/ufqdaTVoT+YNXo42kBlNjkVmh2UNhn+5gU8bJTHiWctrKwTPxX7fvVAzq4a+5cjqOtrM6WKSPGfKv1iP4IBCtwnVHLqzPdEgma85AzXKhczSSYoyO4KCTyOUY9hynQqL9OJl3NPPJ1LizWQcxn5t8eotOfBQ5yuLmRwIOO9MVfjDfPzjMIKRIUjgh0K17h+jejF8O0cgxfMaNEnb4AjD/amHumhFpxeWkl8RfSSl8a9qhdgqR4aWGocOIEWRTx3Tlj1yoiOOAdvTmchZgiVk4MVbFQUELSEI3BPn7EJbPhM8g8fUYdenMsBbstqil14CoDZYJb5qToEroaTwAiJI7vEx/DyGJ6X</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>