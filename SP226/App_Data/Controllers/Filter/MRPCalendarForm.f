<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
]>

<dir id="0" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Tạo ngày nghỉ tự động" e="Auto Generate Nonworking Day"></title>
  <fields>
    <field name="ngay_bd" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Ngày bắt đầu" e="Start Date"></header>
    </field>
    <field name="t2" type="Boolean" clientDefault="Default">
      <header v="Thứ hai" e="Monday"/>
      <footer v="&lt;div id=&quot;hidden_line2&quot; class=&quot;Break&quot;/&gt;" e="&lt;div id=&quot;hidden_line2&quot; class=&quot;Break&quot;/&gt;"></footer>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZYsW7cMzNe87IcJgL8lJY2bd+GtlmuHLc30pVIXZXvdkr2z70EESd8mefRMhVcYhk0YQgVzV7CgNsIHUaFANoe4=</encrypted>]]></clientScript>
    </field>
    <field name="t3" type="Boolean" clientDefault="Default">
      <header v="Thứ ba" e="Tuesday"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZYsW7cMzNe87IcJgL8lJY2bd+GtlmuHLc30pVIXZXvdk4cvxXtCF87zbn8xgNyjQvu36HVktMors7ImjyATEe94=</encrypted>]]></clientScript>
    </field>
    <field name="t4" type="Boolean" clientDefault="Default">
      <header v="Thứ tư" e="Wednesday"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZYsW7cMzNe87IcJgL8lJY2bd+GtlmuHLc30pVIXZXvdktAdkZSrTBrzIb9R2OsQmwsBnpHsrVKdUDQg2bAZYwrA=</encrypted>]]></clientScript>
    </field>
    <field name="t5" type="Boolean" clientDefault="Default">
      <header v="Thứ năm" e="Thursday"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZYsW7cMzNe87IcJgL8lJY2bd+GtlmuHLc30pVIXZXvdk50Z8EN+8C4Fs6rOtSYMw6yL4f8riwYV0BXpxF6yP5Sg=</encrypted>]]></clientScript>
    </field>
    <field name="t6" type="Boolean" clientDefault="Default">
      <header v="Thứ sáu" e="Friday"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZYsW7cMzNe87IcJgL8lJY2bd+GtlmuHLc30pVIXZXvdkJUF9Y3FDuQfXc6/KXewrHjlj5Lm6eCT7XnFjYcH25m0=</encrypted>]]></clientScript>
    </field>
    <field name="t7" type="Boolean" clientDefault="1">
      <header v="Thứ bảy" e="Saturday"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZYsW7cMzNe87IcJgL8lJY2bd+GtlmuHLc30pVIXZXvdkLDlWsNLo/djwHEYG7Lbqg3FWI5+FhMvmbTKDGIRul88=</encrypted>]]></clientScript>
    </field>
    <field name="t1" type="Boolean" clientDefault="1">
      <header v="Chủ nhật" e="Sunday"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZYsW7cMzNe87IcJgL8lJY2bd+GtlmuHLc30pVIXZXvdkptj/akekTkfnmMFuP4NHTGgh7CNoSQueV1K8bm6jxaA=</encrypted>]]></clientScript>
    </field>
    <field name="t0" clientDefault="1,7">
      <header v="" e=""/>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0">
      <header v="" e=""/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 25, 75, 330, 0"/>
      <item value="110-1: [ngay_bd].Label, [ngay_bd], [t0]"/>
      <item value="1000: [t2].Description"/>
      <item value="11--1: [t2].Label, [t2], [nam]"/>
      <item value="11: [t3].Label, [t3]"/>
      <item value="11: [t4].Label, [t4]"/>
      <item value="11: [t5].Label, [t5]"/>
      <item value="11: [t6].Label, [t6]"/>
      <item value="11: [t7].Label, [t7]"/>
      <item value="11: [t1].Label, [t1]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiFvCSUzODD1B65oQP6sdrTGNxgrmG8Pi+/E+Oayn2S2vxXgr3tHAO3TvlEmIbSHBR8Nb2MLJXxHE+79qtC3G2qc=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%9+lEuyMLVd+oD7VsgGmWyBpMMU5TtCuMMJ3jGnn9hPs+F0xSc5dPm38vRtsRrmbuss/YSXVot0OSVSPS4/uFnjENyWE8OxCnv0kAMMYcgJhVB7/70uluiL+Ce4CaYSXXtB8z4UzaPKiLwHkBZExunuGpvzWOkzU2cUwwyWHspdBe6qqgYRhTfoE9rgqca3fzTQ2JFzkjXcws0ewgFea3oQ==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiGh17az4nOGxBq4K3Vap01+XUmm+R/VLzaWmoFF+nJxvHqvUs3olHCBEWu4qJjgBkM4ctPpRO0MfVJ3HqOvh4FA=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70O0wy9SVvmau+gtMzpgUrhdXJXtmKpdBi/cm1GGkDJ8eoE39fzGqWrM3VfA+4glRycThDJTgul3VNm9yG0KJTAHwE+nupO3NHeQYd9bTphp64fTrEdC/6qQJ4olJqeNtpJt3YybaNEoQcCRZMpQxhft33/m8AZPGyXYUfOJQ+Ra7isIRciPsH606fASfgMNvsREBRqcBGvL5CKjOe8HYDpr6mckjHlEaRY8wUGosQMmbaI2zBbmDweTpDZVU+a0eEOSxc8MosvpF5zI+CLi/Ma0A8gY+9Ri43Pc0pIWxYKYUa1bHvpxaSYGdGN9fQj5q5mcWzkf4mFCArDL2NlPqB6Tnlfj8GEZoc2wT4OdXtaKleT0O6lQNpxX2vOYkbpJTegMc0w5MsBMCIy3IcwLZTOlHX3UFZ7C1pzX/BbUeJKLXvQa5k4bVPH69nqQuDKLeBIuF8oCxzoqkm2J4+GQZrzSDcUI1dt7fbAjNTV3T2bOhHrPtoRHdGPSXa09ItEwU6q+Uxp+eGQhTNDjnbxzQfyiYpsmASk6CDCdftWcSxRez7IdOiisXMfzljG5Af05GUQ==</encrypted>]]>
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6bRVyGVSO6Z9ow9FLIFYSz1DyNnoPLt5+FiEUX/ktBzxQILRaEmFEfMWjXDh1nHEs9l5bnXvrrl/KkCUqbqiupkDLMjNVYlF76ahXBBnZXvadTOl15IzDDjj1EStxt9hIZandPbNy+IgSUAP0FRxf8K2BPbwKid3SeOz/dPFm8F5EmoK51+oL4SALxwNfONGAL8UcO4OuXwXQs5ipVDyORs=</encrypted>]]>
    </text>
  </css>
</dir>