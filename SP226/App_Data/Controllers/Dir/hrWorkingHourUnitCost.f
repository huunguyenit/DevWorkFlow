<?xml version="1.0" encoding="utf-8"?>

<dir table="hrdgcong" code="ma_bp, ma_cong, ngay_hl" order="ma_bp, ma_cong, ngay_hl" xmlns="urn:schemas-fast-com:data-dir">
  <title v="đơn giá giờ công" e="Working Hour Unit Cost"></title>
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
      <items style="AutoComplete" controller="hrWorkday" reference="ten_cong%l" key="status = '1'" check="1 = 1" information="ma_cong$hrdmcong.ten_cong%l"/>
    </field>
    <field name="ten_cong%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay_hl" type="DateTime" isPrimaryKey="true" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày hiệu lực" e="Effective Date"></header>
    </field>
    <field name="don_gia" type="Decimal" dataFormatString="@generalCurrencyPriceInputFormat" clientDefault="0" allowNulls="false">
      <header v="Đơn giá" e="Unit Cost"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230"/>
      <item value="11010: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="11010: [ma_cong].Label, [ma_cong], [ten_cong%l]"/>
      <item value="110: [ngay_hl].Label, [ngay_hl]"/>
      <item value="110: [don_gia].Label, [don_gia]"/>
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
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZulin3peYnnrcOSvDf0tWqFgbURPGySslx4qbiab8LHciZoGLEHognpCe9SEyxV6sEn5ei7wpJ6W6yBRuklJvltkznEAS34Dtk5c/3lx4zRSu3PgKg74+WEzN4yTUAnWZQayVFWPBNJxFmRXzBCKP2UN1ssGBf/mNecJQ8CdE4Nik4DY6Ht7bV2vFyQhvcyw+ZdhOcXRqFiR0Z3dyHQIimlEKg/80V6G795JkN77jCeHXQjBlXrLWSl7TxsX+J/+4gdZuwSAZjLhmmem8vx4o8vTx4LJo6+JQbYFiwRhqlDcdqs8Wfbz6M5yCwp0Lfcd6XLfzlqC3B8JuIkJR2P3TOxRvmJLdgaerxwXW0bDj5pkfJASFMrMHMLCF+Nnq6ENJF3k1qI9HGO4qjddLHhYv3L1FxLqec0Gq9m9YPyYoPie6ZM=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82np3U1OUqhjLPsFmfafI2YgqX1rEjpVv5hFj4xw9kwjtQrtTQAXeeuylSu/AGcrw7x759mFdYG6aEbmjNUacaguEQ5NLw/UGG7c5vkfDIrb6ZfYkWyElIoOePfPnXks9i5J7LkdWZOUVWt/aYDkIziKo+Q61VGthJh0mef6pcU89Y1tWOzeHGbkGmebgVQYc+aHAoAt+cSbVz9d7uNGkrrX8p3/nkiSbWjhAWozKdI1NKz7y7n4NRXuSMBufUaXpgrvctoMrnUwCozDJ/cHvdqjg==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jbmjLVEaL5LOirB19XEEBSWH2vXK7A0PhpDR2NqJfbCqv4T0rBWRDzikT5UPLm5Oa6yUuAu6MyaTyPbMjHNUhwrL70jt1qDrdlIu2wFpM7IbGSbBSN3UVSv3b840Sj9N1aFtdUj1+4jEMFQqX9qzhApfrXOjAZuSPPZpfJS8ME4FjGjZgsxQI5n6xsa7lhVPbYLDdwAtGvjCvqQSQ6iAQEyU6FGBnTtVnQyOzC6ygVapeBnx5NxEQ/a0tUA6eYHXsfNlGP3rmHDVwnbIxBJlgyVjsazNBVldKTkZ35yg7P8A1Sv8gDIc/3i3ddX5TsgeQCgWJF/HKLOuPGPhV0aKvgkEf2Fs/Nb8fEAONIXqJ9WMD+jYt037CXqO/UXsOGClo</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeuZh6ZMhJ3z4eB1uSgYugraJ0HFIps+pNrDDbyYzo3MzTz1z+fnjWDVKBCH2zjoC8EjY9cS2+bdwa4vjc5Kn5QY=</encrypted>]]>
      </text>
    </command>

  </commands>

</dir>