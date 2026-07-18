<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">

  <!ENTITY Control ",@$control = '1000'">
  <!ENTITY CostingUnitFilterShowing SYSTEM "..\Include\Command\CostingUnitFilterShowing.txt">
  <!ENTITY CostingUnitFilter SYSTEM "..\Include\Javascript\CostingUnitFilter.txt">
]>

<dir table="xdmtgt" type="Report" code="ma_dvcs, buoc_tinh" order="ma_dvcs, buoc_tinh" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ky" type="Decimal" dataFormatString="#0" allowNulls="false" aliasName="fromPeriod" defaultValue="(new Date()).getMonth() + 1;">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="fromYear" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1)"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
  </fields>
  <views>
    <view id="Dir">
      <item value="120, 30, 40, 30, 100, 100, 130"/>
      <item value="111: [ky].Label, [ky], [nam]"/>
      <item value="1100100: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
    </view>
  </views>

  <commands>
    &CostingUnitFilterShowing;
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBb2AweetwuRSjNIt/RVItfnwj8KETZUspDystuKQRyhTqruyVxqLFyT52O9GpDnIEQHV/m+DSCrvL1oiDuenWX2bN9zv0LoCgFPvsCAxhq0AuBqor740M3XcQAVVcCfbnD8d2PpHrOrc0jZevFTXmhRMNjjaxLepXlusAM1oDZbA15ndMuxQunbsvuNILrO3sW7MkbGkfb4wS0DKKbal4yBo0W5S2MZlwhouHRAWw3gaRl24oukp/BhF7Qa4C/n01QYvu/NLv7vCZzHRzzdC9f3johmMvTpB2wWYqakeSTv2OdvbiUmDIYUQyPTKLd2AzPjzbuJeEqwZbRCB5MbiiElJGw2C0GyzR5E2sclCKpVT8fJUFJaybeEw69y9/uQrFHGM3KflBGPks4/7Lwlsk5X/djhc4xGqpd4E17TqrrWBw==</encrypted>]]>
      &CostingUnitFilter;
    </text>
  </script>
</dir>