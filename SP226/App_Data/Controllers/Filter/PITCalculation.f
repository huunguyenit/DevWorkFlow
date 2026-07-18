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
        <![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7KoRtBBb1YTwEmlrPIJmMbEcXNDbb1Xe0iNSEi8O6VPkB1aVNSCknrQJW/oOMsaBOkdK7ejKHJCfjEEH23ibd6y1PlUi3zyHie7yyvQu2ahEnNqYfC10CzL2L0G2VAr1etw==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYa7JLHs0Nd2YURIwNAxWju7za+JsYcXMo+82hj2MBeZQntLuaUwiNcrVXpihFIeuWPLFvUu6K5V9cvjuU4ktiLcatx583WV+ZryeT3N+pPqEDYklWtpBVXKyMCV7MrItYPe1s045s2JlG5yTds+ka4OzwULYo0ALm98lWZSF0wZre5qXf0pDfnnV/A/+YqemS</encrypted>]]>
    </text>
  </script>
</dir>