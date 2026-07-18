<?xml version="1.0" encoding="utf-8"?>

<dir table="hrphepps" code="stt_rec, ngay" order="stt_rec, ngay" xmlns="urn:schemas-fast-com:data-dir">
  <title v="số phép phát sinh cho nhân viên" e="Item"></title>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" allowNulls="false" external="true" defaultValue="''">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ho_ten" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)" information="ma_nv$vhrnv.ten"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZY1hhyR1cCxbTpYE36KRQ1CmB1/Mc8Tfe5JQe/uxbIsScBmmdXsGUelhmJ+3y/dAkr0BQxn2uTOCng2RkVX214c=</encrypted>]]></clientScript>
    </field>
    <field name="ho_ten" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày bắt đầu" e="Start Date"></header>
    </field>
    <field name="so_phep" type="Decimal" dataFormatString="#0.00" clientDefault="0" allowNulls="false">
      <header v="Số phép" e="Annual Leave"></header>
      <items style="Numeric"/>
    </field>
    <field name="ghi_chu" rows="2">
      <header v="Ghi chú" e="Note"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230, 0"/>
      <item value="110101: [ma_nv].Label, [ma_nv], [ho_ten], [stt_rec]"/>
      <item value="110---: [ngay].Label, [ngay]"/>
      <item value="110---: [so_phep].Label, [so_phep]"/>
      <item value="11000: [ghi_chu].Label, [ghi_chu]"/>
    </view>
  </views>
  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+AUuhaXa5OzoDCGtBAwQvqlnbPZYZhL3/L2wLiCsrZWa8uN+nLIWsz5ZP9ccs6J7fCDvfKYGL0P6CI4vBrALFM/4W8AYWE+OYYaoPb/qrRb</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf7pzHFhXaFflgm5c+NyaPONAw0JEdZm2kNZpUDqJmdWuD8hI4YZdZJBqEWmJOWTYUC3yx0G2j/s9me8PC84167d9FtIRaZ8ntohooJ14vzhs</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6TLfoWKwwcQ/O7FyNadU2tk1CUaqVq1aM8LqGcoVzj0zCGhcc+UWrIUk8TFYAscunj2k/01lWOaKl3CrePVFnqtcTjVKMchOPj4UYvW77m9s0tz9DJh0HEmIXcRcZG19qyyjtlZ7t+70+PVZCgWjZcu0GmF04jikhVd8MNwLfDLcoKqj2Y0WOTw0V5kgfN+3jA==</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliDHM40QpvMHWFEm7nU9iXtRa/LovLRF7BI5fDpOp0/cuMgNGj8tJDJ6wTG3GYYmjUge4CoOmdVqCyab/mdFCqoK2KgxDwpAv/KEYk+A719ASyyLKUkrQ2AKdnXF5hEIiAdOLDxt/hHE5V3HPEkQxf9/VwCE4U1nAIZQG1XXIQ8m71NttUneNDELTdb2qBzIfKQ7/H+O1e0MEYX7pkznpwsHJjBRlycD+Zlvl7gTRwrUB7hEvUH4HxyOUn7iWfR1yJyBpCsjz4PC8dBvVYQO6HxYEl7lKN3VhakzRUMyTvXk9a41zdt2e0ic92KPyx63S0DkPI99otBhaT7hWF3W48tWpVBxVt7E1o8IPOV/UR/97x24kPUhO5z93WSjKRUVLdJ3d+IimW9OM6OkFZiT2xvyJJGsH+DEg60Ytw8YceX9w=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82n0ob5zXQy72Mi8+VsqJ5Q26w7Hjr1K98qBkOf5x6bdrHmUT5KVu5ddCTZabaApdxHqadl8m71rzunYQrcJmzpKEro1R55YU6L3GpoR6szbU7qaUuVfAkTUvrBQwZIHsGNDe3A1sHg5e41EZ5ADZY4K/ALheXkR5Im/GtaXjzM0MLI+hsUmH+H9ernDAAfS52a</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jGlsxBbxSr1eJ2chu909afQ65OYAsBolpQP+QcXw8uONj6c28h6uTvctYMQ4oaW54q3tVEDMr2vd1O0GzVqJ5jCLkmc2h+a8xSgw+bekFsbyBfvUsAA6fJAB41kY835ZZVKKp9V1wzF9SK99BKunPoiCYFvuW6NCdj6PRlDQ31Nl/v0oAcJr7j8tczAFN2xfa</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkberPoPTQNM+kNCUJouJ6ei72J0w0UnLSlBf9nl3orZqtDFClhzSq+lh1cgoAQX0K0kg==</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70GCYx7S/VJHxGKXDPD7ojwK8d6T59PvsVFn0nVYGGDMdLwmceb3IJ7zLRlTT9wXs+JsgbAl6lLVKtYhspDxbLFZ0x1bthCd75TuhOZ55SWpzsfbtKIOiEG8mu3TNMVibcPRwLu880/fB3htlQLZrivoDofO0COnbtCL5VC2lCdWQ+u+8+ThmCGRCwZqwE48XebT1EFSuNK42ufSIU3Juq2Is/m6pYSzZ/WKTnm78h1U00R7gEezeZKCsVKlsxqGLjPX4kmN5qwXREtVT3wE8l1NjNCMABfcXLY7hAV9Dss3pRdq2KvhTQ74CeP90EXp3KNYUdPiNtjGGATfsWPqr8PUxyzqdj/E9XcFh4PsLFoPx1DALot/tr5hqfePGlo5F1FOzXv1h0oy+9wul9g0zmd7XhAWH8oMDPOqhcI9QdYVPzcWK2TL0GOS8PhowdVzkOA==</encrypted>]]>
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