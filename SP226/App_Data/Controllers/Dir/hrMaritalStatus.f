<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrdmtthn" code="ma_tthn" order="ma_tthn" xmlns="urn:schemas-fast-com:data-dir">
  <title v="tình trạng hôn nhân" e="Marital Status"></title>
  <fields>
    <field name="ma_tthn" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã tình trạng" e="Marital Status"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_tthn" allowNulls="false">
      <header v="Tên tình trạng" e="Description"></header>
    </field>
    <field name="ten_tthn2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="stt" type="Decimal" dataFormatString="###0" defaultValue="0">
      <header v="Stt sắp xếp" e="Ordinal Number"></header>
      <items style="Numeric"/>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 10, 60, 50, 280"/>
      <item value="1100: [ma_tthn].Label, [ma_tthn]"/>
      <item value="110000: [ten_tthn].Label, [ten_tthn]"/>
      <item value="110000: [ten_tthn2].Label, [ten_tthn2]"/>
      <item value="1100: [stt].Label, [stt]"/>
      <item value="111000: [status].Label, [status], [status].Description"></item>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwfNh+SwiCfNh1zlp2wrXugS6YNX3y6OXXkNoji+0JmRyygR5QTMcPFQ4n7IeHieMCo=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfx0TKzd6yL2BlhLuCXsLiYIwT0zhUKwFKCbf0F3z7yGOCmADkr4eKc9w250XkoSt/2KXdYJbhXDrZoh5Ijy9s5c=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZulivIou3e094Gnq/ZybzuLaX/YjRYzhgSwtNq3lGr34DkevZGzeGt7OMf/Ii/fjWpJwfBojIBCh9UmBToucKnXWZOGbj8TkltnH2jyHERjZ15T6bS/237PieX0ox60ApU70Dcnne/a6yLwpmGuq61jZbucvo1kowmTH1fE89BP1yj4fj24NCBn10wxPU9nSUuzKqZC8OY/jTV5SNRROIRKfm+bMQlE6NqeHuGqGuy8BMVz30Uq2Zmlx6kM7elx2xEOHkYIxSUTCg13J3yUCbi89iCWIvzo2srfWV3GppTJ0GTaNkRqyZMbnyZ0S337yRMFAx4jmbtDYlT6y6IjWPpDPaTCsfwpmJOo+RUTYIZ/owTUzOeXdCyqbh/FsR+sDoC3W</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nsKgqBPLepLMfr+E7gvuF5LBrvSLTFDYA/yzRj7rGf5Q2Qm/QyW2OgBCecWLHid9VN2NyCubE1EA+DPEshgXBSFk65G2Qio7o4OrX3CqL8q3g6UrjS72NSwdrL+hNEYPWPKKjGdpe2W+HHZMf3DzWJBWMBw1rzbz7e8R+9nGweoXZgGz6Gtb3ptl7iGKQddt5CTyJgQSuDhSaMajQm5e3dCtJGPRAyq2d5jiMHCb7/3c=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jqJT252k+Efap0cSCl58eazebsuXXisE24ctIfC1FXooDGcwMYaFHZR3CTkn9bxbcclB5I8I4jUDWKPagZfZiR00EvFvJw8WqvarDvfg/tRtoFnTirlJA+QKUeJSNaNNkIny849tad40LkVdTMReK++GGZg7Ig7CJIrOLm4TdMjMnJLq4vV0/wbqxAp0qoO78buiPI501e1Jojc8OaeE5mF8Iycc5S/VoohGUa2znVEyjPK/JTOth1+xofousAqXH</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeuDC78q5LK4X0mpDHb4dyMD/CTu1Sfp/Aln4Qo6NbnDM</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkb9bNrutdNuCrJetX9Ibg1MWo+1IMWeRyhnm91PymvDHlNaJb2cKbqcrwIMd5dZljUU2r/qlBho0ERaS+0jG0lYqqvsW+mtr9LJfNerMi4tWalzJoGR20gYagsMt4/KTaaZtLb9nfCJRAq9zA3Jl/It0oJcMmzMTc9BXj1dSjsMmGyTm+8WBqEQDyVF5e3lArKqLiKTsCNVVc7iHBbvuDY7Cw3ghqfwjjFQxaRoYqgpLen1+R3u3apR2QQjYVqgV9bW9X0YiJydKKl6wJEZBbgNoBRHWf1nRU4hSX/KLbxMz54DvgvAcizpU6Mz1LzU9k7ZHOu3ngiLuHPwDNtMxLKP</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>