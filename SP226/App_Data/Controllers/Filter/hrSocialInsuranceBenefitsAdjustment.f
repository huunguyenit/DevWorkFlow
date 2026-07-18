<?xml version="1.0" encoding="utf-8"?>

<dir table="vhrdctcd" code="nam, ky, dot, stt_rec, ma_tc" order="nam, ky, dot, ma_nv, ma_tc" xmlns="urn:schemas-fast-com:data-dir">
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
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZS/oOgkAh9HdzZPMH0sQrsuMIH+TeJVH1vZV6CZ1NVlkI73c4Ftnhg0ea0wJtBxU+wQJD4jY6gg0uzZPIeHD6yOICav5sVnJPCFK8CV7Sn2V</encrypted>]]></clientScript>
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
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6TkFfbm+hKnQy3Pyn4h91TZ5fuPen+zVRfYcwLd4Vg79/LcqQm1CK+I8FMuhYZ/7P5KKJN6MAIRze6zFSvqSNmhHcrzOK6BAq5bU0+xHnO1iGZVkDbID6fj4E2hzwobgp6gPl6eCR1y4OtNqmtAm8AaKeQ1BjF77ZEK6d7cePFokiIwzlfR52tvKD8UL3+X/Fuob3eWcA2QonwGIbjoLtvTLmv7l9/u1El+34tq3NFnU</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf7Bbvcu9NMJJ69NSEFLz4et+AyXpeBidJHetZA/q/irIv+2+V2t8OW8u+o3iWELv7uiDTI4EgCP2eSOOOuFE9i2a8V0RTXzAtgWZMOWCKUYaUkyk0zAxevf6jtzDIYCy4w==</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70ApdFkqajK05i9SUWmzDG8yGW3HuKBJw4kGZro6TIFsZH2vpfSRV/EPmIOD1JOvSB7fu7JdAJxTYrkcntj38oQmcRQdam+a9sqPKaUyjB0hPh/WXoGU4q3R30NjtLrRuT/yRyg5i2VXOW0h4DXUE2Dho41quYnE2NDsheNhXCR02YN5CmFGHGWtSsRU3D58JTd66pl6oorUHQVVHf2awNCdUWYL+qI15WC5uZIBYmCflmZgQy7k6CWwynhzJToPGCc6ZMNq2y2kaxLrqkepRpkBQDrilcEi5hY8GxiMRwlpaPP+hT4JeL2Woh3zisPqzMY1+7Dy01IsSS2qstTV/v7KN3BpPijQgH+rc8feVJoGLCqJKl0V1Ib3y+l7KdMLSZU4HDMBo9ey4zr+eL8L+Gi0nU04BQUJPwmnotKEv2Hi3/aSA1xdpk6ixYFInMlKrFrUbZGtT/CK1a1pAX0yj36CUK1o/2Zy6MRTcDameymCs6o3APeQerFMNIH/Vr7EEcJUE2dRBhwzDj6bNY7iKrQ7/xBDQjtukos3u7ZKmiMhvyevhpj9YFnPw6o0oyCaenjYruAWt6b/p6CHxMZhM42tvX968f8Ix/+nSHJ/hKcRwAJMbhmPmSFri0hNriUR7XgYmplAvw8xP6qN2G+/M74saHrPsdLswR1fN8ybGX1C2D5IKnuAW8+cCbnIybAD2z6AJHb4xIpgxyljcyDx52ZZn41sIpAP/D3lM6ktSjIEYEnHA5Beuwtp7suxsl7k4d0VzeC6O3l9vE6VEWcAsn9Qp4Ay9l38PQLI7fnrZSuERhyMq9E2a9M/nNlHaWi1KBo7GHYnqkhyJl8+vYVNRO39IdJPr6Mw/G36YfixECJ0Vcgoj/MJnG939Lww3emv9i8qXu0C2qG28gl0kwlbDCQtqts28Dr+01e3Ocw4PQ3IesLDZmgBfDFfQkMbx230sEGIZS9sPTR3krQXTk3ofUnkgapcXYokDMt8YcFtchVxUfqHvfglj8L2e8+A3RpZXI4OaoX3AiDb+v6txgQTw+3WXam5vU1nhCCe6xD09nLMHn45tmUYIJqE0sACBlaTAi2xJpE5+7jgMS42xgLOk7nFxv/MisiOhMkN86G72+zdYatYvfAry2W1iaQVudqJLeGmxTy5323UcN+712Jo1cr4=</encrypted>]]>
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