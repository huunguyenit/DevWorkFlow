<?xml version="1.0" encoding="utf-8" ?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="hrrmlich" code="ma_dot" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày từ" e="Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày đến" e="Date to"></header>
    </field>

    <field name="ma_dot" onDemand="true">
      <header v="Mã đợt" e="Period Code"></header>
      <items style="AutoComplete" controller="hrRMPeriodInfoInput" reference="ten_dot%l" key="(@@admin = 1 or ma_dvcs in (select ma_dvcs from @@appDatabaseName..sysunitrights where r_access=1 and user_id = @@userID))" check="(@@admin = 1 or ma_dvcs in (select ma_dvcs from @@appDatabaseName..sysunitrights where r_access=1 and user_id = @@userID))"/>
    </field>
    <field name="ten_dot%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="182">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101: [ngay_tu].Description, [ngay_tu], [ngay_den]"/>
      <item value="110100: [ma_dot].Label, [ma_dot], [ten_dot%l]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdGm589nGw3hgv2TNtZkkZj9PkaC1rqAwOgJ0qbuVn8iPzBiuKLRs5Q7NwA7H/cv3VGqkbigWGPqZM9yHQHyOvypSjmdyMVwwvXC8BUDrpGCEo06PW/h59lD/bQareTV9LtKn0io0Uh2M2JDi1UtbDbE/9NMMnkJCq2wcePqngzuFBL+nJLixWZ4TE8beC50WGJ51doim2MQ8EXmOhrM4OfpuRusl3QaE9UCmgYYXa5ikPHPum4uSixdVp8Dtey8jPb+ycEefjfSu1538UTztVXUcsYqI5bgKfTENONK944OHjeYWvziZrwTjoT8u3PRprD/eWjxGuxjzFXsVYuXRBgL7Zn72n3gN04q/5k+WIey8GYHCzuQgcVmWtpVscmrrSE/N26vPn6GTqvQ9jAOZKaUMNhP5nvy+6eppFJ0uVScE</Encrypted>]]>
    </text>
  </script>
</dir>