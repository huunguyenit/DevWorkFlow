<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\PeriodLockedDate.txt">
  <!ENTITY XMLCheckProcess SYSTEM "..\Include\XML\CheckProcess.xml">

  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
]>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Bút toán phân bổ" e="Allocation Entry"></title>
  <fields>
    <field name="ky1" type="Decimal" dataFormatString="#0" allowNulls="false" align="right" aliasName="Period" defaultValue="(new Date()).getMonth()+1">
      <header v="Từ kỳ" e="From Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="ky2" type="Decimal" dataFormatString="#0" allowNulls="false" align="right" aliasName="Period" defaultValue="(new Date()).getMonth()+1">
      <header v="Đến kỳ" e="To Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="type" dataFormatString="0, 1" clientDefault="1" align="right">
      <header v="Loại" e="Type"></header>
      <footer v="1 - Tạo phân bổ, 0 - Xóa phân bổ" e="1 - Allocate, 0 - Delete Allocation"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit(s)"></header>
      <items style="Lookup" controller="Unit" key="(ma_dvcs in (select ma_dvcs from dbo.sysunitrights where user_id = @@userID and r_access = 1) or @@admin = 1) and status = '1'" check="ma_dvcs in (select ma_dvcs from dbo.sysunitrights where user_id = @@userID and r_access = 1)"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 100, 130"/>
      <item value="11: [ky1].Label, [ky1]"/>
      <item value="11: [ky2].Label, [ky2]"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="111000: [type].Label, [type], [type].Description"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLCheckProcess;
    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1AoAmRGNTAzHeFxkPbwLwQIS6Vp891Cuc4oDcIsCt2xIB7M+rCeHzh/hZ7l0RMR9Pmw/MENzOvGwFqTN8+z37v9kfY0bkGIueNacA8WCBLUpCFyTx7O1iAhX/Qb+0y/C0Ai0Ppf7bSrBTqw4U1zHro+eTWtLtic9eodz1Zde+3A</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBZ6BzPonTyq1dLDhtA6QszEwsiERgh+EA/cPIJvTds61M2a1RmSTRPnswF96exm3HLqErxE79S6C9BVj+ZMRqSfY8OZqC772+g0qPSN5Obk/w==</encrypted>]]>
    </text>
  </script>
</dir>