<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="hrbhdstg" code="nam, ky, dot, stt_rec, loai_thay_doi" order="nam, ky, dot, stt_rec, loai_thay_doi" xmlns="urn:schemas-fast-com:data-dir">
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
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZaFQ5GKy0xtW0666wRMJW/z7V5APJyCChanCUszbqPMEuy505OuhkHXflcqwNCXwZPxC18g+fyFC2RhYdfGmq5M=</encrypted>]]></clientScript>
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
    <field name="loai_thay_doi" onDemand="true">
      <header v="Loại thay đổi" e="SI Change Type"></header>
      <items style="AutoComplete" controller ="hrSIChangeType" reference="ten_loai%l" key="status = 1" check="1 = 1"></items>
    </field>
    <field name="ten_loai%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="tinh_trang" dataFormatString="0, 1, *" clientDefault="*" align="right">
      <header v="Tình trạng" e="Status"></header>
      <footer v="0 - Chưa xác nhận, 1 - Xác nhận, * - Tất cả" e="0 - Unconfirmed, 1 - Confirmed, * - All"></footer>
      <items style="Mask"/>
    </field>
    <field name="bp_ref" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="182">
      <item value="120, 30, 10, 60, 100, 100, 130"/>
      <item value="110: [dot].Label, [dot]"/>
      <item value="110: [ky].Label, [ky]"/>
      <item value="110--1: [nam].Label, [nam], [bp_ref]"/>
      <item value="1100100: [bo_phan].Label, [bo_phan], [ten_bp%l]"/>
      <item value="1100100: [ma_nv].Label, [ma_nv], [ten]"/>
      <item value="1100100: [loai_thay_doi].Label, [loai_thay_doi], [ten_loai%l]"/>
      <item value="1110000: [tinh_trang].Label, [tinh_trang], [tinh_trang].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6eY49RHeGAbpnleV6V3x8cAs1wRsAKfqD1+/GaDBSnp1QH0GafH39na2ot2nQ0OMP6CClgf39BVOimBFxSexrD8J54haCSsjsZZnCZhCsIdGVuBL18rmZ91Iv1A+AID98DCcNvI2MSh/ZIez2WSvz32sZndQuDO4uZi5btXVzLalHKHfSN+CN/+Y4n9hmNzx3vt68bNjKRI6L9K+icBWbuNfN/7TdPi2ovNKOB5LJjeK3RU31UAVdh0P0XZ2L0Fw8qFAA07f+VPvUoYfvzbmoQE=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2TP0yOeTTQnIkUatVMKL6DBGRv6irPWp+gzK6ZFEGFbRjV/hEe4fH1UgThDp0wGvOQ/2cTBQT1MghkvKeY2u4GzBTaVOoevpUKXQ4Vjy2fVXi9dYj4dpHO+vTJ8H3BcCg==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XHr/yZgO9BS8mxonQy//dUuUJDs3WZqAkpuzR+spFjnNSnT9rTbf9nJ80K6e5G6Tg+gucnn+rmlFLdiypqv/3tn0vxfpOy7pYmHwHxmISFfWEKdjvp9tEfqA7Ip8Oe4Al8STkwWWGthSFkjvfIiEwo3ds1X8XK4UNr2eVDovOLqE14ZR65JqVqraAtIh6taxzoCFY7/c0fnEX/gFQ0NMlW0XJMjEjhhAjA0I/szFl2qBHsyYnRD2LxD4FLMYaHlfYH04ewVoTtPO6f+1hDrVklNIZ9aQwB45tBbOsHN/GAYayBytAgmC6/CFz+zRSIkFNNufCOmM426bnzciUHKw8PU9x3JpFmspKnbPoR60pdyHkGXj2B8sbQmBcDZxeY1E/o2MaYV0hIACsyh2qXI0a/4yG46BwzD2p7Egk3+xAkkifsiFDSS5PCF/sk9+YBNMoNzekRE+FH9Wx0kkFSke3zmJMYuRdS5xdlYPEuDVatYlGr0ecNAJWApUExJOZq3Uw==</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70IELUNRoRrcP93iqKrgkwDDznSsE+ePKFC+SacrGXTeamCm9K4Z8wh+mpkiupWpuUwFBiSrXV/jJ+uta3Gx636vg3uw3U5+/Sh1tQcHzdjpqtjw5G++tRViMbcNHLiL1/X801/Y41cpuHO3lK+opbx5eyd93mG4KsZoPVQrSURXWZnFRy+YX/ZEgnL70EcCs7BpHYwT1I+iOx6lJnumZXwDVjM29wrGK1sE0nFkTgAa+nMbKg5bmpKPs6ROrjVQsgq91CdwExBSjjn267CdspWLzkEFNpJWtIeQ0Up6ASGwXt/YHqhl3hzxmpY7ssJ7lQ1LQqYQNL85vV8U0y14Cxc3al4RGXLlj7Zn5M1lkYwBFR+jnAZJy8nLSCcoKwyC0hHrFmgvcZfBS9x4YWlJdeH0=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70FT9bC/F05Xr1qdlSO1qjmcAtO9aHFGHrlnJVkscgqnodypJTkeLn/B9uxi/uGNfBU8U8uSN0xLLC77CyP58IGo3Z5BKtVjUJmmFecb1IVLu4sV64pbmguk0kp/gac5/BtjMhJ6MgvquzhlMHcuJCVRfd5YntMig5/0jtVL+LKzdooyQTTBSsVZpRXOYzKaSU6q8iGJdFG0ek6iPv2o6FCfzTRMN8HB1bARjWIt11fl1gdum1GxEy3ugLxAPDcbdEEQNw2vBPaE31OZZICqReeRG2cShQgRDwDg+BvDp6Di9eFbzWHYir1NzRHMXpK1KkQZHE0MyxeLM20WYgwEPcEAeZ5hUNWF4N6Y2bwzveMew1+qQg39IvSJcsCjKFX4hnGpXhnVZap5IRUoFKSzBss2KBQ21fgXrv+hmPGqWXP7cJkHgzcvBoy69GBa6jEOxHKC0aA7m4eJJA9O++8mNx02rhrugQbnRIOjpqQfIKiEZ9Kyo0tbkuGTXXH8cQ2Rx++CsSoJ1EHav6LTyq+P0PmdfIn67NIT03LXsnXO1KbjXoNQn0O9OJmE1A9bC0I0FUeqNiFkkNeJ55OfwwAxNzZeLwuoG1VGE4DHUcBozo6kg5WPYkH9fk3P/E1nGljD2isf4G3DMq/IX+nfWRqz4+m9rAJYt1/i7QPwaU9dnXykDRP8jMXa0b4KxEgNbAWvsHPI7tNN9VG7opE9WL013KiEYbQ75xHU9g8ost5CjiPSn9T8Pj1878JkrNUMTv5sdfK0ljlxgUB3dqnoQuH/0lpe6WGhFDeCxPJDAf9HcgZMEvndM1q9mrHIEO564cK/etUwwFDGn8iU5w8B3JSjnp5Mmjs6izIKCIIfhSbpzEYkQ8wfw2wEgp3EzBrhwFGc8I+m9ZXNaOoRcI3RqSJlqJaTjTepVRHx7IkFowU1lSQO+wKQP9OQP4OopIeEXm9ofmQ==</encrypted>]]>
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