<?xml version="1.0" encoding="utf-8"?>

<dir table="hrctloailuong" code="ma_bp, ma_cong" order="ma_bp, ma_cong" xmlns="urn:schemas-fast-com:data-dir">
  <title v="loại lương theo công" e="Salary Category by Workday"></title>
  <fields>
    <field name="ma_bp" isPrimaryKey="true" allowNulls="false">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)" information="ma_bp$hrbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_cong" isPrimaryKey="true" allowNulls="false">
      <header v="Mã công" e="Workday"></header>
      <items style="AutoComplete" controller="hrWorkday" reference="ten_cong%l" key="loai_luong = '9' and status = '1'" check="loai_luong = '9'" information="ma_cong$hrdmcong.ten_cong%l"/>
    </field>
    <field name="ten_cong%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="loai_luong" dataFormatString="1, 2, 3" clientDefault="1" align="right">
      <header v="Loại lương" e="Salary Category"></header>
      <footer v="1 - Thời gian, 2 - Sản phẩm, 3 - Khoán" e="1 - By Time, 2 - Product, 3 - Piece Rate"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230"/>
      <item value="11010: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="11010: [ma_cong].Label, [ma_cong], [ten_cong%l]"/>
      <item value="11100: [loai_luong].Label, [loai_luong], [loai_luong].Description"/>
    </view>
  </views>

  <commands>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZulin3peYnnrcOSvDf0tWqFgbURPGySslx4qbiab8LHciZoGLEHognpCe9SEyxV6sEn5FnqaP9hZT4OWvQBFwCzZ6bKngf0hZ+NUXKjnIB6anyFhJoGmzgGawd01Jo/QtePaR0+1o2/ZFa+duek7zWIdkz2cIw5jqljsoZ9UCzS4uqWloO44S6J91RDcLYBeZxSCkXKPGtAVoZaNK3sgMqudd+l0DBpP+bpwhoTO1LcPA1d3nqbqC2yl7IVx0zNTa0WyQ4Y9XDfgGZsOcfTqvjfZRxqSds5riMNOEoDpMI9vfhQWB2uDG4qq0midc9soIVPi7yc3mkQqA2TBHyJF73iQp+hZ5eOML5Z4gGdJ/MosLcsOwgBF+Xq7GMjZFKUvcjd5rh14KvwjtOJb8WW9nf6fxQ==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82np3U1OUqhjLPsFmfafI2YgglMYmFOqS0xw+x4Um+6IaxMx5nY9qG1bQ/XyAxe1Xf7a3b5hzhYxcDj+k8nAQvQfNLb3AJv531LXeTX64oIdihzqibNN354BXeZi4Z6vGmC7FdC0/nuXrXZFzjRgqbFuaraz6bjh9feTxGTXnmRuAyNE81vznIxKyPNczuI/0WPQw1cErXejc86aTiVclzOAE3Yb1tGzMbabZrv2IY+Rgk=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jbmjLVEaL5LOirB19XEEBSWH2vXK7A0PhpDR2NqJfbCqFuH4Un+JnWdJTcvMAe4KsHma4PRvG+3B9R4nqpWpsgjQPySvk/jD+jLjtU4JTkl6QX/sVFZLWQJcDgktGDky4wHHJ7EzlAb7fHk2Wog64BNWQt4WdLhKPbg5BCov8XcE2e+ZR7W2V76RsCiSx1RJHw/HPoRoRodj7ERgnpa0OU/BGaq60VJBB/stoCL/JUxvvOyQ7I5tzDQdxt5Vw2n9IAWoryjfAZ99WjSdvY5YEjxOUP8t09kcFjyaTgV8ogYw=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeuZh6ZMhJ3z4eB1uSgYugrbZ6axlByjeNYUkLBKtwpK3RkZlV7Dde/aVUhur/p4mJw==</encrypted>]]>
      </text>
    </command>

  </commands>

</dir>