<?xml version="1.0" encoding="utf-8"?>

<dir table="vhrtttcd" code="nam, ky, dot, stt_rec, ma_tc" order="nam, ky, dot, ma_nv, ma_tc" xmlns="urn:schemas-fast-com:data-dir">
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
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZS/oOgkAh9HdzZPMH0sQrsuMIH+TeJVH1vZV6CZ1NVlkT+ZO56sDIycZWPZ1q2vcohwunhNyupK9SvuXQqz5aH8QJssSnj+JAlzMyuPlwoiP</encrypted>]]></clientScript>
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
      <item value="110----1: [nam].Label, [nam], [bp_ref]"/>
      <item value="11001000: [bo_phan].Label, [bo_phan], [ten_bp%l]"/>
      <item value="11001000: [ma_nv].Label, [ma_nv], [ten]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6TkFfbm+hKnQy3Pyn4h91TZ5fuPen+zVRfYcwLd4Vg79/LcqQm1CK+I8FMuhYZ/7P5KKJN6MAIRze6zFSvqSNmhHcrzOK6BAq5bU0+xHnO1iGZVkDbID6fj4E2hzwobgp6gPl6eCR1y4OtNqmtAm8AZ/w4il1qsc/TpgJBgYI0SQT7G8sJIeRV4HFIal/umq3lIjLMUyQW0ALixM74K7tW5JZw32h6vfxjx+HuZTyNDn</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf7Bbvcu9NMJJ69NSEFLz4et+AyXpeBidJHetZA/q/irIDTrGTY7e+pOgS0AmuXUrQ506cHTzhnNy6s5Lsdwuk4WA3b48v4RvW0AUr2IIJN9M</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6Uq5fBXWWl8EV7soxTZk/BGdfhT3J6jCcE0/B3xAI+2NN2RFQ+XRbE4uqnfk6l90HSTxR7Xm2G5MG72bqKxfgPIuDZ+obrqWk1Z/4bbvCaQNjiK0/tHq1A9iggFW0S+zyjnvl5wCwXFCXsM7LsD/PC0B/7whoWZuq3WbPcDmO16ohg0w9+do4wwUdiq4E4cQrL5/Bnr51Hm0sXkvG6n218DRioVVQgxA8mRMakFYN/42USjxkVEtkA/OM03xxc9N94oOq8qxomT2gAO9S6jF4Cct930My40p6IuWNCvIsL5+jaImh4RRMfxL3AioNJ5vmw==</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70ApdFkqajK05i9SUWmzDG8yGW3HuKBJw4kGZro6TIFsZXoaTcBqLvG6C5+K9ej3UTeGa2C6w/P4V/7aL+xVaC9qGqbLVHflBHUR+IFACpG3Sfk79+fHpucC/S5z+zVxgGADkD1v4O+vCgxyCXWni6XwCt0zbkR76uJJsqD9AzmH0bSLpEiOYSOj6NdugwBaBGGngooEQ4VGC9at21pPMINTL7HairzN42WYZsVEtsfTY/NF9SBMAWgjo/6GpaRH/UA4usZ7GDHYDtlTeXlJCgCtUzuKA97/nOFRIkSsEMqbTb6M0u98Ywlc3Sq90zSaFTtbCVAlzzWZb5Bex5Ddg+A+OQQM9rs3R/vt8gkh5hzDWfA0UdOw5EAqdnaQtdFDYbfT+xUmiIAAJY9dl4Glx0MeOq4f5L6KQRwUbauwHw8XhUdVvBgPk4+WKWyuOeZDb/0yAsDr/fklSAgXBnI7u+LzJHvzImTmhFjLES6l5YUlNSbyYbxVS1lHHFL/3hho4zSuZG910/DwPhbfliWKF3sSwoEbDCpBNy3XfQ0b3/W8AsI7aiHvzh74eA4rQ7HSO5wbKV1C26lGy1VOqXWIuPTsky1cjMDHG0dNLhWOG6BWRToXy5jO8dsSDLKc5PwMGfWJEsnTiyxlFjIfhnsGb0CPuajgn4cUrTJydnQLqKtv5Fs48IpxFxLdaE4/043HXytbIqzzwHYHwbT84r9OPnSy7KRFN41vuTCdTniFEkB+cQlc1wnd7zxcwvDxL/EC2CRiOX9bOq3oqwqUyRV/OLCz1d7kuC4A7YtFliTNAjFWPv3eNwmUdwDw/9ExXCekO8/0fLEQyyBFz1bP0rTAaabx4TElfGmUdQLtjT4ASH+OAeal9h33/nlsZiA5HbESANSjZ3/FsOWj9nZGENjYBydnaKTMVo3RQ/QIBoYWHtBxz0TeSBiX8i1jEnhYw6SFqQ8UEdhr3zqyiovj26hSJfaa5n9rfDSSpFpBWtvPdcIKy9RLMglMOdfNt18u5JVeLbfeBEXVJHq7ei9ax4oSyy0LcpGw58AlkN3+fxKWQdhEkzr8JlZF2HbuMfZM5cdvuiR4Lk/5eI1mak0j0sOx7zHyenAwa2OpB++NG7mhTnaUFNggp6W3pviMHTP9IWlTy/HkVhmJJxHJrgYsWb3H8VhE=</encrypted>]]>
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