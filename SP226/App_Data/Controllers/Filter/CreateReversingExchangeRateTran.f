<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\ProcessLockedDate4Unit.txt">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
]>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Bút toán đảo chênh lệch tỷ giá" e="Reversing Exchange Rate Transaction"></title>
  <fields>
    <field name="ky" type="Decimal" dataFormatString="#0" allowNulls="false" align="right" aliasName="Period" defaultValue="(new Date()).getMonth()+1">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit(s)"></header>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1)"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 100, 130"/>
      <item value="11: [ky].Label, [ky]"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="110000: [ma_dvcs].Label, [ma_dvcs]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;<![CDATA[<encrypted>%QUk/b2XzXW4SkIBsdbQxE1GftahStOf55sMt8ulC070lPIj6RNCFAJZF/bc1u916KHALztO6+rtnlkd0r1UGpQ==</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBZ6BzPonTyq1dLDhtA6QszE1dNbzQzOTn4QRiYLu+PlW1e4q+w6fZFnGauwiiH2Y1PHsqnjCOKealX9mPloALln3oS3YpX8LuWSz22gV71Ok9ZxN7/hFYrJzNWDodK32aRzgrO4NkKHN268l6kc46VhipRROWC9FirO6WmUIyPF5Ea/N6SwOhtfvpvIRfQGDX4qXmxXRgUg6chl+NTKwemrKoLH9uexdnb8ViN32r6m8bSU9xwg/D/j95UdHpOiq7eDYoEjE2YTeuGHMwtOEmciNCcdQ0ECFxbrNCBQW3eVedAe6jlpwAZiFOfcZY5gDy4FlrsssYwz+8lPYUgNIvkYLZ+60+VXbPvsrrdGW+5Gd5Brx76+ZDNY1WvYwZD/YGMS0sSkizUxB2ojm7A/CsiIXfhP7Y8N2dBSkZxdKxg05MZTpKlRWnZP+Vc14pFE3YYLvUxP8uBrWgpUzpmUKgyo</encrypted>]]>
    </text>
  </script>

</dir>