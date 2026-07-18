<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
]>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Quyết toán thuế thu nhập cá nhân" e="Personal Income Tax Finalization"></title>
  <fields>
    <field name ="nam" dataFormatString="###0">
      <header v ="Năm" e="Year"/>
      <items style="Numeric"></items>
    </field>
    <field name="thay_the" dataFormatString="0, 1" clientDefault="1" align="right" aliasName ="prIncomeType">
      <header v ="Thay thế loại thu nhập" e ="Replace Income Type"/>
      <footer	 v ="1 - Có, 0 - Không" e ="1 - Yes, 0 - No"/>
      <items style="Mask"></items>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" reference="ten_dvcs%l" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1)" information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 10, 70, 100, 90, 10, 120"/>
      <item value="110---: [nam].Label, [nam]"/>
      <item value="11100000: [thay_the].Label, [thay_the], [thay_the].Description"/>
      <item value="11000000: [ma_dvcs].Label, [ma_dvcs]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XHr/yZgO9BS8mxonQy//dUKxwb4BDwl4TZFScf3PuHC40/hzsaGSialxLsZubGsjl85JeNgVQ9eSbpRn+355bUnpEPyUySlIOO7HXTR5IWJ7/K1lI40G4t1Ai+MbCvWLG8ssIPwSn4m8oyOPx7S6/GozRHsDAWlYy7/canj2XSNnQ4tcEhd13siHHVcKslnNvfHlMxvdFNv/D8uRr5xseSUJzBCRcyg/hc6qIVHSWWWBy/Smz/RiloP0ALMaQSgaGIxTXKTb0kokM2L6oiZXMX/bhJOUGmG4U1SuuzYh8RWifkWzX6dwWb6zuCz7K4H0xbbWjpdoPzRmPKch0/aBoDtkSfHuibZadHtTjBW2TwsG+zazym8CGyMuYiQN3vdwlRrS6/2s/Yc9SWk0AbEKBdjCSZ3o4odWczdBiHJ6TdbeafXvFcGbtIJGb//z8rgEGDA8NIxCkUyGJqrjYXPVJ9jgC53kw7467EQKp0SVsZIAYHk9bmyFw+o0NMNdSQyHkTUunZJEO/LQ4joluxx/lU=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYk3gCzThxdv/1mbeMsm2XOqigCNmSgeQB0hRVKeX/gI/4wON8omC0WOhdh/KDVZ+3MiIYHL/PCS8I0RyWZhpwyyxHUP/+5DnevVwVrBMEt/Z0sqQYdx9xEEmbR57WVJ8DZkXuNwm1pKKGfk01+xZPKQ==</encrypted>]]>
    </text>

  </script>
</dir>