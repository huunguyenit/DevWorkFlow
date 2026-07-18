<?xml version="1.0" encoding="utf-8"?>

<dir table="vhrdncbh" code="nam, ky, dot, stt_rec" order="nam, ky, dot, ma_nv" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="dot" type="Decimal" dataFormatString="#0">
      <header v="Đợt" e="Time"></header>
      <items style="Numeric"/>
    </field>
    <field name="ky" type="Decimal" dataFormatString="#0" allowNulls="false">
      <header v="Tháng" e="Month"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="bo_phan" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZS/oOgkAh9HdzZPMH0sQrsvm9qGwrBqERW25yFp45adRoKiFj28zFdn2mYu8qe54wOwRTNpMmmXDjFubpyD7R6H6isRLgt/9/vp9HQ2h4yQ3</encrypted>]]></clientScript>
    </field>
    <field name="ten_bp%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" onDemand="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="bp_ref" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 10, 60, 100, 100, 130, 0, 0"/>
      <item value="110: [dot].Label, [dot]"/>
      <item value="110: [ky].Label, [ky]"/>
      <item value="110--1: [nam].Label, [nam], [bp_ref]"/>
      <item value="11001000: [bo_phan].Label, [bo_phan], [ten_bp%l]"/>
      <item value="11001000: [ma_nv].Label, [ma_nv], [ten]"/>
    </view>
  </views>
  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6TkFfbm+hKnQy3Pyn4h91TZ5fuPen+zVRfYcwLd4Vg79/LcqQm1CK+I8FMuhYZ/7P5KKJN6MAIRze6zFSvqSNmhHcrzOK6BAq5bU0+xHnO1iGZVkDbID6fj4E2hzwobgp25UU7xtIbolShCOi2bpP4uIiVdZ/AHS5duXOMEh+smYzMl6YjLxGpB/1hzpm4N4xtAhXQMUAXwZ4ZK5qkqXqskd20A5NCDui5Zxn4lmxgSM</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf7Bbvcu9NMJJ69NSEFLz4euZanrIC+7GEYvNI0R86X7lgBznhqTdOI/Qm7ym0QM2cw/7N42iJ/S8HHCzgjVoSgdu+6n26KcIMZ0gesSkyhI5W1ah94l7yucNIVS/kQauGQ==</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70KInAnqcXJOY1YJQqLL4krhl46OH701sAJ0MiCdr1ukktTFT3Obwa1D4CMFUEUAu37jzW6EB1n5VvdYmAA9Qce1jlvl9kwWaY2KTGEeYRO2SfyHJXexcae6HXsvNKh0328aVdCZ0C2A9f6XsTypGRZsdp9bJGAaX9RguOpazYwYmY27mgHn256DqITi/ZUudJ4E9f6gSBK077SMissD9hlOLTLVWSomiybDvbw96he6GMneDST7pve1ZdV8wDMAibaP60NxDPOQGMS40kCm28OKo7sknQU5YZaT2B2MTOcySjZBG8rFjac/5+wt4oj8SzMArL6wbnhLBw6DaD1gQZAUivtoonq20mlyklh3Ell/Z</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70ApdFkqajK05i9SUWmzDG8ztEsZuX3cSgpjvYTx5vUeS9lOKBXNavCSzxs006+fmhaSdYyFFXu5JKOxppMN7LH2LutM6SQTTJuGJeozeVxkqT1VtbdSTa5zgAv/QRAXR/pyeDKUC0ySW4hztDjAXwu6JsvZjp6nTJa1mXpnaoVLHM+8qPncIEoJfTkX/gMYrjQHknZQubGB2UfFAOoPCBSahjlO50kGzUO8m0cPUx2eTecJLLrUCBH+vjgDDi8m79iK3tBdBgfdySWBOUXShAPMcVUjObuYa4w4lTjbmeVFaX1AuRTZ1b7adO3M1ZhFspYSTe7z+7g5buyfxyd+r2spHfZXhxSt2Sxr+mkl+AYjr7ZrlZJDW7Ea+OD0vqw5QTcYkXnYXWvTSaqG2e/b0usGgqn2kdux2fvXl7VTSVDlXT08Ue0YaQ0x0uWN+0cZoB8R2O+DFVGuCYkm92AD98kPn6CZqRTENV/LSOmgHeVD5v7y30p+GVo8/p82todQTf1zdZ8rFN3zliVld8jaNJ0d+9N2H+D4tN9vck4F3kqAwp0JjOVGExIZe/wdsfDibLWvP5SljYcW/mCqukFkLgYXzEt60Z1m6m/zYv/ovLH0uG2Ihs2rEM901IcZ+1+f3MXlhD1HJo1C1s9y5JBw3EQhh1/BzCBeNBjuvEoc2fM9oepoQ+i5esjGKmEOn0+TQXEfjKxZQx66LnM8xKdMvweZ1NGF7G8Dax9bCdalZPn2gYN/JQgiqHQ4aDuBlxkRMWmIHAieP/iMWYFQSiiYl6PjVLknWHCnNl0Mqi7+rw3q+/KOjZ4bl2I+oJB7sfBL7ISxfo3EFH0UxUtk/pjSwiuKrFkcHVWTPot8F2X87v1+3UrMCChxAblNvPDQnRiyK35lMutCewF1HlTbAklfqp/JL1Yv0k+1CePb+DmRcyNBzRRthlBOPKBLpAw4VaMsxH4Kxgb0G//T9WGkhinyI/x3U1AGfJVRX7aIPOcylhcMUbcHPfuhLUxWcCKxpdTLpRAXClkR26SBeEEA5moA2M9Y8dtJJuL/1MvEdXLRyut3qEbYB3Urq7M0/mGTFk7Uqo/8cD9+UrExNl8uP/ClFY2BwGvfIYOKpOFuzyGZLlxIkEAKTVyT2XNd3FDjnu+hTnmhEWsOKVSLLp8RPhQnIa7c=</encrypted>]]>
    </text>
  </script>
  <response>
    <action id="Reference">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK5AnMsH6nWz5jWh8N7/f2bQkgLsQYVSpqEemRHWTf1mhj/Zta8wLN8KCPgPSXbL9YK0BJAPffxD1MADDJJcormBMMT0yYGS4j09QGJxDSsoQg==</encrypted>]]>
      </text>
    </action>
  </response>
</dir>