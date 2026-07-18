<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrdmmh" code="ma_mh" order="ma_mh" xmlns="urn:schemas-fast-com:data-dir">
  <title v="môn học" e="Subject"></title>
  <fields>
    <field name="ma_mh" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã môn học" e="Subject Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_mh" allowNulls="false">
      <header v="Tên môn học" e="Description"></header>
    </field>
    <field name="ten_mh2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="loai_kn" allowNulls="false">
      <header v="Loại kỹ năng" e="Skill Type"></header>
      <items style="AutoComplete" controller="hrTMSkillType" reference="ten_loai%l" key="status = '1'" check="1 = 1" information="ma_loai$hrdmlkn.ten_loai%l"/>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="diem_td" type="Decimal" dataFormatString="@markInputFormat" defaultValue="0">
      <header v="Điểm tối đa" e="Maximum Mark"></header>
      <items style="Numeric"/>
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
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110: [ma_mh].Label, [ma_mh]"/>
      <item value="110000: [ten_mh].Label, [ten_mh]"/>
      <item value="110000: [ten_mh2].Label, [ten_mh2]"/>
      <item value="110100: [loai_kn].Label, [loai_kn], [ten_loai%l]"/>
      <item value="110: [diem_td].Label, [diem_td]"/>
      <item value="110: [stt].Label, [stt]"/>
      <item value="111000: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfx5ygYUqBflFA7N7aGadDr4mimDAnFx0zgHop0Mna+bTREqurwPTV6BzsO0Ag3+yZ/oVf5ZIrmOU/Pjx2nUK7QY=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfxo9sadXlwFLP/JrHDWSfC56m7XjclSaIXAhUjhrhs6AEML+KwP5BVfexIzwZaZF++gFN97F3wg/EBWDaj9dRdc=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZulic4CwKxF1/QJ4KnzpQB8I6hoBTEsvluyMme87jo0Wi40hgYIHtkyz8NH13/JM52nBWzgSMvzZupOXuWCMFlMf0Pd10wqU5v1zPXyweC8lzyzihML6itMT/aPEZPbfs7CdceyqDTyqUNpMyc5c+/wqIPfnbMYPS4BmXn7I4YPI7cEuv3Mfn8QGpc751Z5jaMkxYM25UiLunRH7ekSwfRiYkdxmKfMh9RxDlsxB1xMaUnfKwTG+JzIbLJh9P3IJvfAa6O0WPIol0/WHnn7T1i2HinW5ABrWmjYMXKHAR3S8oXQ3x1IfGlll85J1JrkJMTQ61WL38MH3JyFySGQJ4ouSLvYxxM9DtsSoKTrObF7nCYE=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82ngqgZFJrd9uu2MN+w4rBM1WmzE3BtKZg2vThBpac61xTQ7Ojs78VKj2y6p1qkmJ0qMmGOyoyIAf3pRBKrNmIncjd+1ICfay0JnKGu9mB1EMoNJzWUEqzezgh2JvVI7f4sukJKTITHjiaY/kF90G9yfKS/U4dEfLmSoX5GMfixC/f5VsmEQWsfMqy+VrlOhNOKU2uwFoP1SLJIQMN6WyY+TLGby6dI2hflcBSRwna+Jdc=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/j7zht7I3El4OvxXXOLJLNmSmX8EkHogD6f6YBKMubRub6V0ZskDD23lyvup7KScQ+AITN830O/Y5E2UWTUED7pp4wLgiV4GhEWSM9gb5mi1Lrmi3O9f0FyGIL/vtKTsGW3CVUmoy66C1hhPY8e1xYg1oswrwksxsLD48AQvEg141ZNrwkhUT0BqZjjwuUsMyGVvKVd1o2e3hRNHJmCOM4N4ayBj9uwit4w+Gg0AR5acunzIy5AwptMEnIMOud1bLtII2FRF1TYVmSQLSuFMj5iw==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbelJYv0Guo3Hv3Bgg7zBfyRUITT6h1e410BgakQ6U57lj</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Oc0QJdCnkoxRoPQPeia/JUOoA1TeaxEsDPM7z6x5+Z5xj9fB0lF7hPyktheybFAAmCUoVAuVK9447UUqBZ9TPK9Dmq8X3v6w4taB5n/wSI2J3+AntUym5ueKyaktd9uHGK5ygHCzdKF4mX16PDY5kxwaWThb+RRf3n+xGMKbUAAYqtVZbj53QLlAk5kwvwO5/4ld32V/ppeCsmj7L+cclFhIMIuUd5U7SJMCWm5/PSFIk7qR7BMfuG5FVLzhLXM3ciOF2XZ8YsQBJ0gzuVTxlpFHUpRCZmkEs1huoSXuM+Hbo+o8qO+AOvm4xLzDYoeJP+JMXRx5e+4f0XtKClTl9zXof9kmcOec5zmamqIEhah</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>