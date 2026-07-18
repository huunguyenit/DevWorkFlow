<?xml version="1.0" encoding="utf-8"?>
<dir table="hrdmtgtl" code="ma_nt, ngay_hl" order="ma_nt, ngay_hl desc" xmlns="urn:schemas-fast-com:data-dir">
  <title v="tỷ giá tính lương" e="Salary Exchange Rate"></title>
  <fields>
    <field name="ma_nt" isPrimaryKey="true" clientDefault="Default" allowNulls="false">
      <header v="Mã ngoại tệ" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1" information="ma_nt$dmnt.ten_nt%l"/>
    </field>
    <field name="ten_nt%l" readOnly="true" clientDefault="Default" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay_hl" type="DateTime" isPrimaryKey="true" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="0" allowNulls="false">
      <header v="Tỷ giá" e="Exchange Rate"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230"/>
      <item value="11010: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="110: [ngay_hl].Label, [ngay_hl]"/>
      <item value="110: [ty_gia].Label, [ty_gia]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3Vs2YbfrK+fZGJ5J89WpdHJgmF8ldES5iaDvPWXivHokEYA5cZkBEBL6rx9xCo5DhbfZMofdgJrQpLFWHudUbQuopqvdVyA2rLenPXD6Zksa/x/pCrfSU2gWV9OgeC6AUer4mZT9ocu2xBwyHh92MzrV+nWVlOdo8p5MUeHJVHi7xv11pZ07v8LnNTzfrIhgg==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3Vs2YbfrK+fZGJ5J89WpdHJgmF8ldES5iaDvPWXivHokEYA5cZkBEBL6rx9xCo5DhbfZMofdgJrQpLFWHudUbQuopqvdVyA2rLenPXD6Zksa/x/pCrfSU2gWV9OgeC6AUer4mZT9ocu2xBwyHh92MzrV+nWVlOdo8p5MUeHJVHi7xv11pZ07v8LnNTzfrIhgg==</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliXycgBwZQJWk5NqVU2cFvTj+ARDIM2pvQq10NTTWfURTAt0PtMnbq56ke67Qev4dBMPvqW0RD0MgIPKDp/dp2xMZyPJxz2nYC7PcBLp+vYIUkHZeL9COeyYZrYT3ttrEWPTUl2FCOkjc3Z7rdeqFoczTbypFVEtAUEzOO8FOqNGyA8zmQFutgPB11W10FTW3z2OahMgmFFgYLX/ERF/6V1lGVgZt+zdy+mQqiUirQrq58pzp2Xou+spr/2WGcoccKq02WVOvT1iopeaiMeVU8OrKhA1Y/GUonAd3kEz/r+3R3It+bI36L+OOu7AYG+snigAMXXoFjdjOdBAI48TjgIJimmh+Wsbaec7zVxYk0AD3Dq7Q30Jxl29CPt6wNW347WAZuPH1gRJiU2+7gs6VQwg==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82n2nhwYbnVWA7Lwk0GA2x2SMMd3scEv2q6LnR12Sj32MaIrJ08Q+gflwi7xuhsNFV7OyWpD6VmoqJmHHg/yYOTJv5hD7ZaZHBZZvOULRCLbKDV+ETc6T0gIRKS3Ijn01v+AoqhmH4t1UR7ZqZi5H60HKzzusygft98EboFjd7M2kXa9S2osEOLkafQXOs/rihxqs+a8OhWnuWh2pNuY16peOuIUoHI+F1qtaoEmt9uw+Nmjl+uomWl1rX12d0uKAbN</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jHNu+Ln2q3a45aBlTsQF+xlbzcE7wQii5rsRL5YLPD+nhplCF2nW3mcGPykSCmdpYC6nR0pjK0Nm/Q8NPUhP/by6dWSCUIpNGsG8FJClMMDn0EoA9h2B9pqZnDTgF16AcOMkbDVxiwCfD9Wc+Fnel8mG0J6vtsyUibx8whDayEzxtJPnqqW1+mtAHuuseBjNgwLmoeQ6NGpQCIYv18+xpcEyHNKZeCCzslxyMBZ8Hc6v0/3842eDVtJ18/Tj/AoiK1lY3FYXX7J4/07ZWAFWaRMZxXc/XH5uzYgSNT5r2IhIxuZJ1gQ73ZxsSWU/8yUZSdQvsxVkjHQoxbBQ3R3pkNDzZw+KC2o7QhBLJNht0BE4=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeq6vJ82MBYWsgLYiYHxL/pmsMeUAvlHwjFfd1GVLYNBgXAWA5ALCAoJdA0WJtuDpZg==</encrypted>]]>
      </text>
    </command>

  </commands>

</dir>