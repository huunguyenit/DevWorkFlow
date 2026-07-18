<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrdmvongtd" code="ma_vong" order="ma_vong" xmlns="urn:schemas-fast-com:data-dir">
  <title v="vòng thi tuyển" e="Round of Examination"></title>
  <fields>
    <field name="ma_vong" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã vòng thi" e="Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_vong" allowNulls="false">
      <header v="Tên vòng thi" e="Description"></header>
    </field>
    <field name="ten_vong2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="stt" type="Decimal" dataFormatString="####0" defaultValue="0">
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
      <item value="110: [ma_vong].Label, [ma_vong]"/>
      <item value="110000: [ten_vong].Label, [ten_vong]"/>
      <item value="110000: [ten_vong2].Label, [ten_vong2]"/>
      <item value="110: [stt].Label, [stt]"/>
      <item value="111000: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9uObV7QOkBsfen+WZqTe4LJYRWG9uSBPsuJ8CdO4+Hx+yrRPJjEUOgH00syISj7OtUjWEiLDUG73eqrEmWiWAACHEFrYuE5Z9jZJ/kJKVwP</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1wCG08Iofxvb34CPN0r8iyITWqREim0N3+B40vrW9Aj5LhLBoFDxmPcrpMBH3qbcvH/nrBGhNUU3Q2WcMW9AyXDyhX6hOVw6mGpqP/KlcmP</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuli/8HupLnHwJWEN+Y5ODM+XQ91qSiQPAMsZe3lQJu++3mGflqaQoO8V+7zq7hB03yixEN60vXFIsGHG5DL7NwoSeqURJJogvuJO4qWUeS/5xBQsT4EsmxKa7oSBvRlMGofsMZSjerQhFa93er1/6MfdRGVukFBfD8RLnbfG90jWUKaPvFs/eyWCPf6p1+c4a1GvEPRtjkGudOue36GRS6Wlbedl2bIL24J9ZGzpjwbL8Y+gLrg7+FkezaGtEqSC2Grylo4cql4jVGHZ9vSOqBzKm0NwXIp5wcro8HlQva9UJne4glDtIozyXihnBYGXboHAmfRzGQ5vOE7cQeF9V2KkwCf5LEL6OGMWJ6I5ech/As=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nIKT3RjZ5zXZjdgMQKXPJXq28HR9seKgfi763dFknpy51KV71yGJcek+J0mqRsPxSJy1xK4ujiW3hIzJ0GvQQqOtfxSurQO9IIMVZspLGbI0WhCvE1R1ymtTxoOmCWpGv0sWWM2V9NMy1+yFbm9i0RdCCs7fjYXpZoftTWCsaH+EyF23eaUco4Kuw6rqKhbJq6KDJuybpUns9dqfBfRJpJfY/h2X8Nt2ms1T4VEx/Ikc=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jgWzkjPpwsi17DNHwCeqPMpRjaBEV2Ghs08DLb/k4WeDmksC2wieoERBWtmS5xhDmyPZsycyDjIV+9E4ElZqqgmWIAJmRqTByTX4USCLuPF9Us4gxsbSllIWDxC61MNfNNfFN3Af2AtDm4mC+7RmxoVazjjuVLT+2agEdc88EZtK4bkTvc/7wzjo0IOVJRQX3VYOfp5M8M/b0aQqGOGy/QtmFHBqzUlddgmEuZ3cltRDilp7u0MN/nMS9G4jdQVNJ217xVEFcAH9N1EPZy+w+1g==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbegfoIArOXFAw1OEU6dpX8KaYm5kAa89vLIJzImNIFgs5</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AxzAG4bdJ6ntszIWnWU0gXeNT70UyMpfura09YVztuTPu4/X8q1neFNW0jLXDYstcph0Qmiygq9wD1x4WSYzcSM3UvYsLABR20NRjjEoax9Q8/tQ0749+FYDvGzPVm7sJ9RQKlkCZsoGjmKlgqbgaWrUFjESNaNH2QBOXHBRKVUmZqO4ml/Y/CvISFdqZhmenZFWif8MiqA3VsEh9OEt9O6LkqkH3LtErmMP1+dw2X32snj2EEtnJWNoJoNzJEfjNuP4Uvooyy3FGKgO/ttIn4PQvKWlAFXpxnR90A8OrkG9zDwwr2sQHE93ApNCJoZjT78XfmNzzSigGcMJpqNTfURIZ4wyb6RhnH4rDNAfW3s</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>