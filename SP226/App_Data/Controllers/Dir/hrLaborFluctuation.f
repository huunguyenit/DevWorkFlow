<?xml version="1.0" encoding="utf-8"?>

<dir table="hrbdld" code="stt_rec, ngay_ps" order="stt_rec, ngay_ps" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thông báo biến động lao động" e="Labor Fluctuation"></title>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ps" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày phát sinh" e="Fluctuation Date"></header>
    </field>
    <field name="ma_nv" allowNulls="false" external="true" defaultValue="''" allowContain="true">
      <header v="Nhân viên" e="Employee"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ho_ten" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)" information="ma_nv$vhrnv.ten"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZY1hhyR1cCxbTpYE36KRQ1CxLLXWGXlTUynvbeenot011w40XY4YALQrvJI8SEfnir+AbwdPhyUk7qt6VWTeOGs=</encrypted>]]></clientScript>
    </field>
    <field name="ho_ten" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tg_bhtn">
      <header v="Tg tham gia BHTN" e="UI Joining Time"></header>
    </field>
    <field name="ht_cu">
      <header v="Hình thức giao kết cũ" e="Old Commitment"></header>
    </field>
    <field name="ht_moi">
      <header v="Hình thức giao kết mới" e="New Commitment"></header>
    </field>
    <field name="ngay_th_tu" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày tạm hoãn từ" e="Susp. Date from"></header>
      <footer v="Tạm hoãn từ/đến" e="Susp. Date from/to"></footer>
    </field>
    <field name="ngay_th_den" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày tạm hoãn đến" e="Susp. Date to"></header>
    </field>
    <field name="ghi_chu">
      <header v="Ghi chú" e="Note"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230, 0"/>
      <item value="110: [ngay_ps].Label, [ngay_ps]"/>
      <item value="110101: [ma_nv].Label, [ma_nv], [ho_ten], [stt_rec]"/>
      <item value="110000: [tg_bhtn].Label, [tg_bhtn]"/>
      <item value="110000: [ht_cu].Label, [ht_cu]"/>
      <item value="110000: [ht_moi].Label, [ht_moi]"/>
      <item value="1101--: [ngay_th_tu].Description, [ngay_th_tu], [ngay_th_den]"/>
      <item value="110000: [ghi_chu].Label, [ghi_chu]"/>
    </view>
  </views>
  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+AUuhaXa5OzoDCGtBAwQvphasf2Mh08X05Sl5NGp9nyYAHzelcPpLsCdE3t+wjs81YB9AqbJgygP2MXh3KGesBtrNHK4HCo6stvSzd5Ra6b</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4UtpCzURbs+rP8RwDz7BCni2Bn+DNiuJc4qEMvixIgpHtkoVy/p+pQFAr1XZYPvi4tBKpahPMQ7D6BQBwJEA9aopX7pS5jFTPMga2mRJy/0</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf7pzHFhXaFflgm5c+NyaPONwdzdUSDlEifB6Yylv5plxdMcI6//m2QGLkUrhCjHnqPAjlZe20QCpMs631yKen4kex5EcDPKmqVmXA4d9a8fA</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6TLfoWKwwcQ/O7FyNadU2tk1CUaqVq1aM8LqGcoVzj0zCGhcc+UWrIUk8TFYAscunj2k/01lWOaKl3CrePVFnqtcTjVKMchOPj4UYvW77m9s0tz9DJh0HEmIXcRcZG19qyyjtlZ7t+70+PVZCgWjZcu0GmF04jikhVd8MNwLfDLcoKqj2Y0WOTw0V5kgfN+3jA==</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliyvQLctLuIIDHeEb2Tz8JiGB4gcnn7KN2seKQDgVPSpxKxAy2RIGCEeAl6XReHrl+/eK7fjCMEnfrVcbSmf8yvmiRCgINg9jTAcP/7RLqdzIjY88V4Ikr7ltCJiqShbRyluHWce9BRGSWD5x73AVv0e/g4Knh7AY+Zss4PLTMU+QhuZxYHfe2IR9nef3MjRVK96z2HWKhxUlsOiLcsMZxW2B04iplpl08pg88oIOwn7PUOIwhpF5c9SDkB1fsmn8LrHTEVI2M6epLbj+y2rNY7s50HDMgPvcXyJ0U5AhgHVt6UvaA/DONBsLfVKN80UkKnsuKY6ezyo6Xt1qJYu/K96djBbi9eFoxAP0F0tvVCbckKxP5tGFeyrY1eScw5YcbeGF6uRcM+8UVe7a4HL1Rgsja13LQL3AYX3SNfxfL/26FzCmZQUb0nWDiPgDJEzC/</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82n0ob5zXQy72Mi8+VsqJ5Q27ixTHqwC6j/LRuy5AWwZespEUF7a6+n8+/O7pGKbdqRp6nPwUnp3NWRmB+uWQk+NGxJd24OR1ZeHrDlqJ7T230gBcSNfzw+OcM/zsbeZRqczPCyOAtlXAIc3IfoybxEJ/tK5/WUup4DunBCWIm7Zn7NI73fFRHJ3v7ruWTlL4Qyj+UUL5NRsjUIgqQPGp895IlnfUcnpdRAYzeO4KrD18OeQI/croq0yrq9MHaILVwtEIFMUpoxmVAxjUEdSG+9NA==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/j+BHsiHU3UxTd6YZDfq3yDNRKX3FLZYkCF8Ry6RV52HWsErXSa8NOGJhT9BrJN52dcsT8BTWR/CpNMl4m19HYPlvI2CwneZbYRpyj8eRGjTInf3Q6AJcKnnPfkTd2gbBSF1tC4aQL1LYmc4fJmpnp4WESlJ3ZXifAtVh9mLjTMD//KxI82ra52Y4O0oAffFGuRt4ABKb+vZl86TKFlOWYUzSPPmgADt+kotoqGvGA7zQHTTWpGwEoFhDil8Nha+c3oy4crd9vGm7DGa5uQZbFuQdXY6kzQpF1a31NUw10RS0kfrCIjINPaqrfEcp8MUgwS3qcdDbXiX1z6FgZWIchKw==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbesHxIBXoZkW282dFxVQiwnj5XxB04Y547TNRc2hpdh1pXPnnVpAh1Zh2OGJJcl+JEA==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70GCYx7S/VJHxGKXDPD7ojwJrpxzbeTKS3W8P0b6siRpmqPWewweQopIZWeXmie6h/zhhhpGi1dov6nsAl+exL4T4VZiEHp5KURsdakn58ZlIpnm89Bns5pTvsKNpEZOUUXw/6W4KVAJ0swQdmNNMJ4MSB9fchxb1H1lmPU9bYX4ll2DkL2ftyoDVr7Y/CsRhZjNDTjlgKk2wl/3Hrkn3GJVUPHTPgApJU6BJ8VpU9zwrtKS+Ogl9l86sjI0ktra0e1I1HL7GcdJ724qBq7et9fYHnNsQ2Jf8oJerZ5v3Se9cdn66EzR9dptnMuml7RDomj97gXnSEoWlVXRt2JriDUzJU7fx4ILSN5EgCH+6SBH7lSC7BNIWLeZ4eoh3BrNA74GgSLHJmTV9+gaDwEFWs1bm/1zSZDqB0ZhWjERqGfIACyBo7InesjEiQ0xSZ3FjBL6BCFCII3p7ZFbvn7hmo6FSGV+5yNue88sAcxMOux3DIAWPqa+OkMeM4hmDqd8fSWYwRHBDg6HLXd26jhpJdMITJ3w3TktCoOLyWhsCUHmSrIhPeMBusR3NpdnIGH664g==</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="IDNumber">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK6Wdyk9aPi/fGimY6rlT0N8nVAGzan76LcTwu5Z5TgGNe1NWZAFthZQVFXCS3ORqLbPILfY5lclrzI1lzkCB9izQcDmPERv+f/FcKknTu+wPw==</encrypted>]]>
      </text>
    </action>
  </response>
</dir>