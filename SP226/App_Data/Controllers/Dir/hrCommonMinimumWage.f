<?xml version="1.0" encoding="utf-8"?>

<dir table="hrdmlttc" code="ngay_hl" order="stt" xmlns="urn:schemas-fast-com:data-dir">
  <title v="lương tối thiểu" e="Minimum Wage Levels"></title>

  <fields>
    <field name="ngay_hl" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Ngày hiệu lực" e="Effective Date"></header>
    </field>
    <field name="luong_tt" type="Decimal" dataFormatString="@generalCurrencyAmountInputFormat" align="right">
      <header v="Lương tối thiểu" e="Minimum Salary"></header>
      <items style="Numeric"/>
    </field>
    <field name="stt" type="Decimal" dataFormatString="##0">
      <header v="Stt sắp xếp" e="Ordinal Number"></header>
      <items style="Numeric"/>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" hidden="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 20, 50, 100, 100, 130"/>
      <item value="1100: [ngay_hl].Label, [ngay_hl]"/>
      <item value="1100: [luong_tt].Label, [luong_tt]"/>
      <item value="1100-: [stt].Label, [stt], [status]"/>
    </view>
  </views>

  <commands>
    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliQDRbTWfMEubOaFHQ4hzhiEla9eFnw/pl/zVwLE0dC+nRz1VNpcDF9TN+ZB9c58O48wjLp93PQPLFTSgvMIwPRc+CFa0YnN8liTxLNwvltt1XzaASwMB/Xc570Cb7BzaKu9oV29fUg6sReDOjOpWBbkZlUfUO+5hUB+s5CG7tXHhKPIL4xtHC2JKz0j2AVP4RDbWzm7DSglWujL5+7JN+VoLHlN8meV7tVM6+LNnkq9ieg2bNYMw2FbGIzQui3GC/fz+lQSm67YYwHF2ZcL6+z7BX59dzE9IMUniATFTTZzklUH7gXGIQSwsVVM5CFdyI39wU4Ve3WDegmjUHFToudZUoLZ1jX+n8hQkvwDZwKfn4e0QhlU9AQ01S4A04wK+8</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nsOiRUKGzM3WmFguQEF2rIp8J41jAyfdjg/kI1GzBOzGZfpmqgiYNKiM13H9CHxT8zurSY9OMpD94o7abr/pumguB3pw9Z8hngCy87meFkWk5dm6c9VUIXaf5mDwx3B6lrYdVOtTubqeZl1b/crduAp/R+k8HCLpiNNpnrhwmpCAlAW8sPeRY6a3n+IaoW7Zl6vah5CVIW5cvixcosZesAiuQWqOV5EQAhZv/jtEqa2U=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jiOhBfHQ+ZMen7E/3asYGuzaDyDctaUEEa7sWgYF5Xv60p0xCfnK9wkkWsoajJptF9X3r7PPvu58Xo3zyivuJ3Qr6Go4cdx1xqTO2b7MB7GNN9N5hZOo95+D0VKkOYYYpQ/XoiiEprRsOOZdhgQXz0fETpcfNtPgR91a35LA4vsV/68yepYhAyMMwVVjmrhf8CCv+ES61TmSaIsr8JoiJMutuAqHfITfQyifJr/LSmPmuPXNaQrMJMvaIjrNKWk+N</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbepToCnaWLN5XUW/OoRvI1uEf/T/ShbuWow2SlPjjRAZS</encrypted>]]>
      </text>
    </command>
  </commands>

</dir>