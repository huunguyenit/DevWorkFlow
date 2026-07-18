<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\CostingUnitLockedProcess.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">

  <!ENTITY Control ",@$control = '10010'">
  <!ENTITY CostingUnitFilterShowing SYSTEM "..\Include\Command\CostingUnitFilterShowing.txt">
  <!ENTITY CostingUnitFilter SYSTEM "..\Include\Javascript\CostingUnitFilter.txt">
]>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Tính hệ số phân bổ theo sản lượng sản xuất" e="Calculate Allocation Ratio by Production Quantity"></title>
  <fields>
    <field name="ky" type="Decimal" dataFormatString="#0" allowNulls="false" align="right" aliasName="Period" defaultValue="(new Date()).getMonth() + 1">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_dvcs" allowNulls="false">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1)"/>
      <clientScript><![CDATA[<encrypted>%44RLlF80A4PJgP4a0syZrY4s7JKRNwAwRcvHwX7lL2nfvElAdm4/fDjNTJpQZkNC</encrypted>]]></clientScript>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_yt">
      <header v="Yếu tố" e="Factor"></header>
      <items style="Lookup" controller="Factor" key="(exists (select 1 from options where name ='m_gt_dvcs' and val = 0) or ma_dvcs = '{$%c[ma_dvcs]}') and status = '1'" check="exists (select 1 from options where name ='m_gt_dvcs' and val = 0) or ma_dvcs = '{$%c[ma_dvcs]}'"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 100, 130"/>
      <item value="11: [ky].Label, [ky]"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="110100: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="11000: [ma_yt].Label, [ma_yt]"/>
    </view>
  </views>

  <commands>
    &CostingUnitFilterShowing;
    &XMLWhenFilterLoading;

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1II1gF//A0y1pxU7o4CQkg3pLp6XpO6MyaWcH4ZRra0HyLiJDN6OkR2IYUwgwRjNOMy9Xnl+KHIAn0T7/kJhYVukq7zYUBEdYKDOkUiOlsWGiTePOuuHmS8j01ZngvPTr4InJqys9ZvnFNnP7Me5O/Jkijrl+8KF/yqWr7s70pGXxSOK/NuHEFjmdhqO0eniejWfIfgmrLLxO60kLwE4vI=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBYC1QDmH+YK5VOwQjUqNs+eOkvO/saKH7fGzeWoXhxH9e5ppmtte9pZSkKLw37GM82a5Bt4v0wiq182CEpngnVMLXI5pNLUIsGFyH3Q0Lln+5gNp86QkDcGzayr5I807PDYqeTLWQ/1nYMSOgFtQ5tA</encrypted>]]>
      &CostingUnitFilter;
    </text>
  </script>
</dir>