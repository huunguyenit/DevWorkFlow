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
    </field>
    <field name="ky_pt" dataFormatString="1, 2, 3, 4" clientDefault="Default" defaultValue="1" align="right">
      <header v="Kiểu báo cáo" e="Report Type"></header>
      <footer v="1 - Tháng, 2 - Quý, 3 - 6 tháng, 4 - Năm" e="1 - Month, 2 - Quarter, 3 - Half a year, 4 - Year"></footer>
      <items style="Mask"></items>
    </field>
    <field name="so_ky" type="Int16" dataFormatString="#0" clientDefault="Default" defaultValue="3" allowNulls="false">
      <header v="Số kỳ phân tích" e="Analysis Periods"></header>
      <items style="Numeric"></items>
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
          <text v="Mã phí" e="Expense"/>
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
    <field name="nhom_theo1">
      <header v="Nhóm theo" e="Group by"/>
      <items style="DropDownList">
        <item value="0">
          <text v="Không nhóm" e="No Group"/>
        </item>
        <item value="1">
          <text v="Tài khoản" e="Account"/>
        </item>
        <item value="2">
          <text v="Mã phí" e="Expense"/>
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
    <field name="nhom_theo2">
      <header v="Phân nhóm theo" e="Subgroup by"/>
      <items style="DropDownList">
        <item value="0">
          <text v="Không nhóm" e="No Group"/>
        </item>
        <item value="1">
          <text v="Tài khoản" e="Account"/>
        </item>
        <item value="2">
          <text v="Mã phí" e="Expense"/>
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
      <items style="AutoComplete" controller="ExpenseGroup" key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
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
      <item value="110: [tu_ngay].Label, [tu_ngay]"/>
      <item value="1110000: [ky_pt].Label, [ky_pt], [ky_pt].Description"/>
      <item value="11: [so_ky].Label, [so_ky]"/>
      <item value="11000: [ds_tk].Label, [ds_tk]"/>
      <item value="1110000: [loai].Label, [loai], [loai].Description"/>
      <item value="11000: [ds_tk_gt].Label, [ds_tk_gt]"/>
      <item value="11000: [bc_theo].Label, [bc_theo]"/>
      <item value="11000: [nhom_theo1].Label, [nhom_theo1]"/>
      <item value="11000: [nhom_theo2].Label, [nhom_theo2]"/>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcM3ZnXRpCKGTf/2UqwEvNilqx+meYZ1OOYrZvZ1NzZj882nP0EGv9MLXytaiP105ZcU7Zs2k+1x0XCoztxkL/tON6/Njd4bvGEV4EHCG54Gnr3xbu2hNoKeXzIA3nl2slWfa/IzVp2j+rY3RGWFTVUC+VECWFNhpazQn+mzCm01SrO9oKNEf1dnMHKmU6xWLaWZWVhBxmGOcX7wIT+ygdJ9L1qUFEQiYqBjXc3d9zzrN6iem+Tnw84tt342bxK5o3ldQvhRGrRSNvZLvoxdMwfnYkdpkNAuPrFTSUdJx2iluYzYgJofUxgyiewV57K11X6JX/6EQbn40EOKCX3TdpMkyyWg1wJfZXiKPlz3ql2wmTRQBP+BqfDnnZS1GYgV3DVlq85R7D9i1yA9McgjPeVk=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptPivotFilter;
      &OutlineEntry;
      &ScriptQueryFilterString;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUUfHzzA9FyUDnlyfCk6ZE2vEpSbTbw7G6rMqp9gFlJg7emQcGDO6KEhjhE0oJNKoUf4Kirj7hKPerufLekKpZ6O+CTiLp34Wr6MOgBfDE3pcs9Ba8KPBQ0TlioRwvQ3Es0YzBOuPPan7e9PP24h2dYXEgiXCU9/m1K9t6DCEMG9T/bl3i1DMZMZLNCpDwlu5FgUtdDrO9M49pGKszT45t6N+YSxvNzW2JKdKyRZT9hBkimFOY4B80vc1cM1KlRucndxB4EKu4Igug4iuoEoN9Wa6iphJK+XClzQAr+QGGmrdE/07stZSPSWOEoz9bN2jwJd2s0vFAPvrwD4XoOHIVdS0UpZrwql1OcC7EhllCjkVooLXKDs87eB/RPIgbDtXaab+OvwmPSwMgCl6NbTafRVVi1yuFigPCzpKeaEEKGF1nC5ifrH7HfEgM6lWJ5uwvdYRf87nh5KVy2aWu+UgJdHTb9bNzH+GEoPlDD0Dia/mgGD44CEpF10pb8a1dMl1UvhTu1fBGHVEG8PQ9sJXGrLbK3vFZndvZ9n0WyUi5IJlfZuSga9lrsdyEkiKz3IfNT5d40Zol2l9NbvyAWFxYXpd5Y8Aw1FKTFtmVeXP4ZmLvskZWT6EmhXPGAuKbBf3QCAP0V5WHwSHfpO+rFSLsdmrmptnXlGhwG/vfAnntdKqMHJzSqim0wAUVfLmywQtSrSpw0Gv0nM1oF+mz3jv/ZdrPXNmHmEtx6aYrgQLP6j+BeFdysbRZIlNgMF3zUT0gXQWj28A3RLXaBX4HiQArIwk/GKVr7P77J8P1x2WULY8=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>