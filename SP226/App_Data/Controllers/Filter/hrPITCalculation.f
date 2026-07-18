<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\ProcessLockedDate.txt">

  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
]>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Tính thuế thu nhập cá nhân" e="Personal Income Tax Calculation"></title>
  <fields>
    <field name="ky" type="Int16" dataFormatString="#0" allowNulls="false">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" type="Int16" dataFormatString="###0" allowNulls="false">
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
    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4e9weqlTwgl3vJ0y6YSDweVyyTE81mSt0M2Z2SthzY+0DzdccdFmZHURbCiT59DmadlTNaWL5kxeamMhRSoehSPNXveEwEy4QK0HcO33CmxiuVYsp8gWdbfiV77vfqx24pZoS7Z6ePPhODydNOBxdl0DSocKosKJTk0qGsuis6hXXgqQKHStOD45oTlunP6m6tKXj0N4I2oxyR/ZnHxCMXTzYEYm48yvZ49YOAupnb13qh4q87KTop8xVRY+K136jUnXyA85LXZ8ulN1J4Kjm2nkH2TD+GegDlztfmBTx0mhWRGiSreOjGCLM8efhLiO9e6dEAfUV2urUnVcQ6H3WePxrkJOmngof0u8pw12r6EW4tOMgRwdgGUla+Ee4DClQ==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9y7yL4YHdcmt6/SxnP/f71dsdwXozH80Vu0Rs9CfiS1qxf26zG8gzYJHIWjoSirI6grP4CiSnPrh9PecHtwKu/ovwG9SulhBgnssIzldjx+ZajaJRk0z8XY/4GvTyZKmzXFfWV4fdEa3UliP0nT+Gma7/p3SlxwD7XWygQNZOdcTw9Bt2tKAm5OOF9uCUKa0ZA=</Encrypted>]]>
    </text>
  </script>
</dir>