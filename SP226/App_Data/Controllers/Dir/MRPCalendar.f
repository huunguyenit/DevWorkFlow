<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
]>

<dir table="mdmlichlv" code="ngay_nghi" order="ngay_nghi" xmlns="urn:schemas-fast-com:data-dir">
  <title v="ngày nghỉ" e="Nonworking Day"></title>
  <fields>
    <field name="ngay_nghi" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" >
      <header v="Ngày nghỉ" e="Nonworking Day"></header>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZYsW7cMzNe87IcJgL8lJY2a1zz1FWIBDHUkK+bOwBeXX7XDxSfNFbiS3i1NKLOEMaQ==</encrypted>]]></clientScript>
    </field>
    <field name="form_name%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Ngày nghỉ cố định, 0 - Không" e="1 - Fixed Nonworking, 0 - None"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="160">
      <item value="120, 30, 70, 330, 0"/>
      <item value="110-1: [ngay_nghi].Label, [ngay_nghi], [form_name%l]"/>
      <item value="11000: [dien_giai].Label, [dien_giai]"/>
      <item value="11100: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZulieDMiJUjfviqOrevGMuE1to7g5YOM1Hq41xDAJc3gls+BWqpT8GS87oVe279UNospFlYKwilGhfsZry1kwxhqJFiJP3ekozvl6LJzdibhQCK7EhRjs0YYyNC5UytENb5cNtYXIkoDm4dr+KufmOGEJdAk4x4pPbcstLwgGzh27jPwXq8+mRQYhFro1jhR2HH+XQW97dmL96oNpsegXAXhirbJU292U4CLK3d2qQFcGDj4sOfhswAwV1/RvjWfirwZymew6FFO3coQKD8fV3jNDDdqlXLICYcDoMtKymOTD4De2nmU6SYjFnkhJs0tAUURQ63TTj47gnf6ExOh78lteg==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nKMyZaw6wGwhp519U4BFbHxlOzsBE2QxvgjYfggA5cTusmMjl9KxhPupeqjoSr7FRZwL5F8MfL+kYdmJ97+ztizyxd6Vq46npn1waEAd6ye1hOjoi+XdwKgB74A7vt4RmrHFLtY7dZNv4nCX0IcLG9mG19E73X0dCx+XfnTLGY6mcQPbLBUhv2CbY5sPwCRz5/8uk0DR0wYxytrbBo5DUxQ==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBqdxKyVHbMFGSgctjyato7AamKdHAPb3XqaNWSlJevq6wW1+m50bpgPEg4AiczG69QLI9kRxNi5SVFHcQgGd5wYFDxhWhXUFP9hUuKRcE7GiIS3Z/gycrY0R66edOPg2gpyu3N9yKBYW9OZQh+7SVIDS0uSLFlWegcDDLC66kXuxP8lArEJWoNjRFsEU3GZg7985Ik6sklnNfQOawp3zM6dsiWIme/2/b92hv6eRsTgxQzBq138BqNdS0+WtXkkcwa/s7mILTy110fEoPe1gYkSgr1/taow+wMrLe6b320s7w==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%heK0EsYkYNYDu+zfwh3z/BkPHGSJUg54y3V0uD3K0wOkEX0UAqp9tRkOZeSAYj/Q4GYAYOxVW34RmhlL5yKhTDiDelQRt1CKEhA26V2kADiEPLdqwgKGlJsmXfOc99M1</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70KcCh58IJwrFKWH4ieU3gZln0FNTMy2ma7lN7zJceVHv843qv83OBmX9luktqfomAzI+RY7KXUZFECWX3+cUo6aRN/fGpuDQJ+l86YvlwyJ4QFRTHZHndIKb+TvydE/sJuEklX3DjA7mZG8pUNLNJP0kmPn1AVtex1Mrdy24AnFLCNxtWTfsAqxR9wYRHaZGEfifG0TTDC3AHd4yl1xk8ibfPGUFpTTk/b8nBZUL5qM1q17ZT6j0UP+LeO+wJjNydmPAyw51JkpimYhpOs4xfO1e5UKQ3spV/3Mqug0iprNOEolI35hoOlhQCpHpCuJeXHuh5CXgRIiUJAhYUtJ73hL1LMuuBlVtZ1HOkcFQ61BwxhPFdVj7Aj3L/64bW5O1hwXAV8Ul6twscj4iiln55Tg=</encrypted>]]>
    </text>
  </script>
</dir>