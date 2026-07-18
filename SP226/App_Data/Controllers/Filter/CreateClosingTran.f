<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\PeriodLockedDate.txt">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY XMLCheckProcess SYSTEM "..\Include\XML\CheckProcess.xml">

  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
]>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Bút toán kết chuyển tự động" e="Closing Transaction"></title>
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
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit(s)"></header>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_access = 1) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_access = 1)"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 100, 130"/>
      <item value="11: [ky1].Label, [ky1]"/>
      <item value="11: [ky2].Label, [ky2]"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="110000: [ma_dvcs].Label, [ma_dvcs]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    &XMLCheckProcess;

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;<![CDATA[<encrypted>%QUk/b2XzXW4SkIBsdbQxE2ofugSJWjeJYGss9/FutJdta2OfcGC/PC0Tu8L6JjSbff6h4yLBejCxfCfVTLSdQQ==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBZ6BzPonTyq1dLDhtA6QszE1dNbzQzOTn4QRiYLu+PlW1e4q+w6fZFnGauwiiH2Y1PHsqnjCOKealX9mPloALln3oS3YpX8LuWSz22gV71Ok9ZxN7/hFYrJzNWDodK32aRzgrO4NkKHN268l6kc46VhipRROWC9FirO6WmUIyPF5Ea/N6SwOhtfvpvIRfQGDX4qXmxXRgUg6chl+NTKwemrKoLH9uexdnb8ViN32r6m8bSU9xwg/D/j95UdHpOiq7eDYoEjE2YTeuGHMwtOEmcis71Z9GZSTT1vA/QWdkbJnH2Ns8UKlp0VdBY4UNrsIlg6akjoBH3VnW7Sztk+sD2+flvJAfp28Q+HkHhi30P6/h1OPghuZxMukweYASDQ56ykshfTxmbNMFQkC2jI53UodqPU2lGiG7I/Y+u3/+X1E8fgpJSGyqztov5Iegfyz+5+FI3oh7aqESsl3aJHENthRt99bpKXHYwcmVs2Agt74Q==</encrypted>]]>
    </text>
  </script>
</dir>