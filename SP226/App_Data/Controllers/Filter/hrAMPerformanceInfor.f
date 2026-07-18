<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="vhrdgth" code="stt_rec" order="stt_rec" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ky" dataFormatString="#0" type="Decimal">
      <header v="Kỳ" e="Period" />
      <items style="Numeric"></items>
    </field>
    <field name="nam" allowNulls="false" dataFormatString="###0" type="Decimal">
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
    <field name="vi_tri" onDemand="true">
      <header v="Vị trí công việc" e="Position"></header>
      <items style="AutoComplete" controller="hrPosition" reference="ten_vtr%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vtr%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" onDemand="true">
      <header v="Nhân viên" e="Employee"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZS/oOgkAh9HdzZPMH0sQrsuZipeh1h2NdS4H/Mz1rSNXMoTgVs1Zln+7+WGStiTY8g==</encrypted>]]></clientScript>
    </field>
    <field name="ten" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_nv" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="bp_ref" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 100, 130"/>
      <item value="11: [ky].Label, [ky]"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="1101001: [bo_phan].Label, [bo_phan], [ten_bp%l], [bp_ref]"/>
      <item value="1101001: [ma_nv].Label, [ma_nv], [ten], [stt_rec_nv]"/>
      <item value="110100: [vi_tri].Label, [vi_tri], [ten_vtr%l]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBZ6BzPonTyq1dLDhtA6QszE1dNbzQzOTn4QRiYLu+PlW1e4q+w6fZFnGauwiiH2Y1MoVOtNFuf3R5c9RlRCc2Avy4ZmKG2/ecJZho9GGFg4wx8mTQfnZP8LKx3gisTQdB41Nlch2Ivh6/ZahX8qQTFTSm0X15yTdWlFAPRlTOPgPenTSjdHdL/224XxQGxOJPCDwCF1fYE5tjFcxZPl+CkdDM36b34BLPtkc4fbV+A0LkMJUm4I6c52hxIuIQb7D1WEMIcC8mTS80i8TEMDrnp8xIT4IhBt90VJ2W24i21a52SjV73J92qqLo6qM9WYDnFBBcMvlNIVpDMTYSfyN1OkPmYaRCHakLuPA6REXM0Fxa70iWIWLXmpEnuRindfAaD6vfnPZ7slALmoxvOoL9KL+onnDkNRL5VQCYl+W+ewT+KU8ZDm7oPn6Gt7khRFeaSChoqxy1l/z3iqRPtR6dIRt2nfuOHhEvy+d4TkdHg9H/HNoyekj1Z9/FO0L1m4WBu8LYLRfyUvvEEm8TKcV24R7H3iPAVQrT5vqZfNU4N0WNxaoqRaLB+B+EVHDc2zVrZO6CRhSwXXXTFFEt1zPKgUUzhijJ5QTHSQ0qzvWhSBX4xg7R+dsNZL5euBS4odm/Q0cNRpvwys6oIxr4weI4yX0RwmHitrAY1FkUuIGcx9n7xp2Ze+dTINIlLhv+3QZLgtbitq2tGWrHM/9LE7wNgqdalgRGGcIELWPOlGzOsmJFMFIibXPYMEafpkmDLQytgk+4jCE41eZo/YiJVsbX0jxboIv/7McJ6ZxbB4M2rdSvClsGvmbgfln8B+cN1Sdwnh9uFX7WDD0U2w9Bcotz9EdGo4zq1VvMllC+W1CJPL0GD8SsayOap12uax3HDx5b9L73zhXh8wcZAcE13b635jneWkbjF7YqfwgK4nrgxpOA==</encrypted>]]>
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