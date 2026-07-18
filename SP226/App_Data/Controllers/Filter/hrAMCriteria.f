<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="vhrkbctdg" code="stt_rec" order="stt_rec" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ky" dataFormatString="#0" type="Decimal">
      <header v="Kỳ" e="Period" />
      <items style="Numeric"></items>
    </field>
    <field name="nam" dataFormatString="###0" type="Decimal">
      <header v="Năm" e="Year" />
      <items style="Numeric"></items>
    </field>
    <field name="bo_phan" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZS/oOgkAh9HdzZPMH0sQrsuZQ2YT5MF97J3gbg3FDLNDaQipnBZiLnM9Y8Hjh1WSzA==</encrypted>]]></clientScript>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" onDemand="true">
      <header v="Nhân viên" e="Employee"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten_nv" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZS/oOgkAh9HdzZPMH0sQrsuZipeh1h2NdS4H/Mz1rSNXMoTgVs1Zln+7+WGStiTY8g==</encrypted>]]></clientScript>
    </field>
    <field name="ten_nv" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="vi_tri" onDemand="true">
      <header v="Vị trí công việc" e="Position"></header>
      <items style="AutoComplete" controller="hrPosition" reference="ten_vtr%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vtr%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="bp_ref" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_nv" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 100, 130"/>
      <item value="11: [ky].Label, [ky]"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="1101001: [bo_phan].Label, [bo_phan], [ten_bp%l], [bp_ref]"/>
      <item value="1101001: [ma_nv].Label, [ma_nv], [ten_nv], [stt_rec_nv]"/>
      <item value="110100: [vi_tri].Label, [vi_tri], [ten_vtr%l]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBb2AweetwuRSjNIt/RVItfnwj8KETZUspDystuKQRyhTh86bwcTpQag/xXBgmMcjIr3se/OLLONhID52eBbyymBDTzhiuW0Q878HKBqQOEGZFiVZh+meKvma+RY/roHTCxeBjm9QCWLbr4o/ovz6d4IxUgcBQuGmzwu0vbboCWP1WW6HihR9lVLO2VZma8UE+yAfifhlpoyhKFFPc7oE9IzrlLGvPpZ18y1vq96EYQjI2QyW5hAxrvMShmTjjTSxlvjzliwu+wP8SxwOBLKfgT1mNg9TwaTRzTaMDalV+JvuBmBegGmqZqYwnHWVCO+26FgByAyZTpMp5QutE6etbaVSGxDmgbt0TZfSr6op0RxxN3EoAFUKPGaSeWGNMfplLfShTHoXE8LnvI1mGjJM6ZKka8QZbHpaCqeDG6qpQCfvP3Mllxt7UwsKvC9lZ/V1q4N/3UG7wsc0vu/efhsunTweGVZMRvOHYhc1RDg4TZxnYGDZ/hRQ58QKfq1Ec3RTs/3zwWCQcrfdBQerhyUIp1owIcqIsiE/YW9s3vyDyoHmOuphSZ5lhYgD4yyg4ewpf0D9LUWfhVpNbEkA4kuC/awXo1wk+UTw4Jlr4GBcp9MQm65fvA56K9d6RsP1FzKJzwlmpNSTQWOiFONPmwfNjK9QKsZw4Q5rBAnPm2vc5ltTFSUiHbUnkJ0ZOwj1x65t4JPXUEm5B0xV6F7qpuC0UxqPnCA3xhMIEsYu38BSvY0371u7JYbg4PY4G3e4ANDZkda78Uyc/4ggzJku63PLzASHv1C4UA9GXU99m79eOKJbXwlov5YyOKqZx55bOQ4cQs=</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="EmployeeID">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6ePvDEiPLJoZDJnB0zrXDog/gdfHTv2ayMITCshLQQMfjZb0F4/gdM0op/3ioo0rxCCuNceZbBfRjG2h81Hf1LPkNqCr1RkHfbF0yP6Fu9/n7NkT5Zkx+RJzZR5N8RHmrayiXXjgydymMRS/rceM2l0=</encrypted>]]>
      </text>
    </action>
    <action id="Department">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6ePvDEiPLJoZDJnB0zrXDog/gdfHTv2ayMITCshLQQMfQ0u0zVjiexMtMlevAJs2A5rKKbtI5ZSDNeaHqOd8oLqtXETKhvEreEM2ro+6ajqXAbWxI/WsGikuKB1LM3VCeYVs+J3wC1Rmaj426TsjxCk=</encrypted>]]>
      </text>
    </action>
  </response>
</dir>