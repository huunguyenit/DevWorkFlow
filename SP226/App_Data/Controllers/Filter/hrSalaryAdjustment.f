<?xml version="1.0" encoding="utf-8"?>

<dir table="vhrdcluong" code="stt_rec, ky, nam, ma_loai_lg, ma_bp" order="stt_rec, ky, nam, ma_loai_lg, ma_bp" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ky" isPrimaryKey="true" type="Decimal" dataFormatString="#0" allowNulls="false" aliasName="Period" defaultValue="(new Date()).getMonth() + 1">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" isPrimaryKey="true" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_bp" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZQaXQt9NEozCfWzxHzlg1ThvsqR4LCbJJASOBe0PxNsyj0ws9qc/kPZ6MfZrhbxvFm4wYCbCZ/yf/OMejPBXwNc=</encrypted>]]></clientScript>
    </field>
    <field name="ten_bp%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" onDemand="true">
      <header v="Nhân viên" e="Employee"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten_nv" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))"/>
    </field>
    <field name="ten_nv" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="bp_ref" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 230"/>
      <item value="11: [ky].Label, [ky]"/>
      <item value="11--1: [nam].Label, [nam], [bp_ref]"/>
      <item value="11010: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="11010: [ma_nv].Label, [ma_nv], [ten_nv]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6eY49RHeGAbpnleV6V3x8cAs1wRsAKfqD1+/GaDBSnp1QH0GafH39na2ot2nQ0OMP6CClgf39BVOimBFxSexrD8J54haCSsjsZZnCZhCsIdGVuBL18rmZ91Iv1A+AID98DCcNvI2MSh/ZIez2WSvz32sZndQuDO4uZi5btXVzLalXVKDQ+N185TaiSN2mPowvOcNP5quL28lYrTfxfC75sFnVJUmxj3Mu9Ff4+5/k9apW3PmViHEHnOPLfzqKyTTwA==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf7Bbvcu9NMJJ69NSEFLz4etNGN2LIuUzyqgvc2FmIUx0SzFJ1YnGNpn7FznmfVeS39jHLH9CA3dBxA8qBvAlfm3fxUFdZpP3GX1w1DojYDf6</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XHr/yZgO9BS8mxonQy//dUuUJDs3WZqAkpuzR+spFjnNSnT9rTbf9nJ80K6e5G6Tg+gucnn+rmlFLdiypqv/3tn0vxfpOy7pYmHwHxmISFfWEKdjvp9tEfqA7Ip8Oe4Al8STkwWWGthSFkjvfIiEwo3ds1X8XK4UNr2eVDovOLqE14ZR65JqVqraAtIh6taxzoCFY7/c0fnEX/gFQ0NMlW0XJMjEjhhAjA0I/szFl2qBHsyYnRD2LxD4FLMYaHlfYH04ewVoTtPO6f+1hDrVklNIZ9aQwB45tBbOsHN/GAYayBytAgmC6/CFz+zRSIkFNNufCOmM426bnzciUHKw8PU9x3JpFmspKnbPoR60pdyHkGXj2B8sbQmBcDZxeY1E/o2MaYV0hIACsyh2qXI0a/4yG46BwzD2p7Egk3+xAkkifsiFDSS5PCF/sk9+YBNMoNzekRE+FH9Wx0kkFSke3zmJMYuRdS5xdlYPEuDVatYlGr0ecNAJWApUExJOZq3Uw==</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70IELUNRoRrcP93iqKrgkwDDznSsE+ePKFC+SacrGXTeamCm9K4Z8wh+mpkiupWpuUwFBiSrXV/jJ+uta3Gx636vg3uw3U5+/Sh1tQcHzdjpqtjw5G++tRViMbcNHLiL1/X801/Y41cpuHO3lK+opbx5eyd93mG4KsZoPVQrSURXWZnFRy+YX/ZEgnL70EcCs7BpHYwT1I+iOx6lJnumZXwDVjM29wrGK1sE0nFkTgAa+nMbKg5bmpKPs6ROrjVQsgq91CdwExBSjjn267CdspWLzkEFNpJWtIeQ0Up6ASGwXt/YHqhl3hzxmpY7ssJ7lQ1LQqYQNL85vV8U0y14Cxc3al4RGXLlj7Zn5M1lkYwBFR+jnAZJy8nLSCcoKwyC0hHrFmgvcZfBS9x4YWlJdeH0=</encrypted>]]>
      </text>
    </command>

  </commands>


  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70ApdFkqajK05i9SUWmzDG8z01d2tzzhG7n41EFkPnCpE/GBj+HyHSmk8rzCvgE1ONA1/kMfG7TOt2oqls1cQw3G2s8SQNLLMD66ujhKU8wlv/tYMt07/CQ8Vu8z1gPCBAvVhNUyP1Ii7MpI/RmLPNfQwKoeh8wQLb6fbGWpztdE60x0rGSuE8BGLLsEafd2X8ISwEiLza9bpX72ANwJiPNpcVKvShJHJ4nePPiriLwiKSd2lwvDnrpVE+HsfydmI06tZPma2/7AJOloTnD3EQn+k1eO4ZHdhJsMgQFpp21ly1G/eMGH1+cfXuSCsWg+NjAuq6gmJVgvoZrZtAdrKpEy9H+On9mE0Qzp58GbYHONnWqF/YoCsL0L4fsaDYyqlCecwiK6b/oXCsDAcgG3mIUq3MCa9KvdgKSs2QsPPJDztOlNcLwGnWCGPQpVNdNPyqjBCSNb9ZiV380i5k9bUchORPBltzE4Flksu360AsEAKbjY9lvloPGOysMYE0Mk2a3pQ+6CUyFX/3URXsKmH/MBUft4XM5JfnJHAuzgZq/2liJ09NJxWG3lwBZHEFaIZeVrdYDu/g8FFX+Z8RUZM8S2pyhS9bugHNMk0gBBzM00r0E6iidZbJ5IzEpUM11ZLiB1a8qE02pkfyfaaGaA9ef4zEEd8XL65EO7B2Vy/ft1fvs6RSA9Wvl9SnrrAJcbryNbjgswPLnCUUgP6zdZymnwpBdgeIhhOiwXNZPDxoxbe0z1BmVYspcnRML5/NdER7fAE7+geYkJ9Is8cLVUyqVCGxJXxjcXv47GmiEEuEkWy</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Reference">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK5AnMsH6nWz5jWh8N7/f2bQ/Yxoka5KeTkRr5Zix8n6I6rq91BgdL0Euo54JDp22RpTxbxodUCJShhjWhetlLJbgrmsFzYlQqlYuMIfFCnLqw==</encrypted>]]>
      </text>
    </action>
  </response>

</dir>