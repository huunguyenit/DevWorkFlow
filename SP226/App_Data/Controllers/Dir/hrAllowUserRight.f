<?xml version="1.0" encoding="utf-8"?>

<dir table="hrquyennsd" code="ma_quyen, user_id" order="ma_quyen, user_id" database="Sys" xmlns="urn:schemas-fast-com:data-dir">
  <title v="quyền người sử dụng" e="User Access Control"></title>

  <fields>
    <field name="user_id" isPrimaryKey="true" type="Decimal" disabled="true" hidden="true">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_quyen" isPrimaryKey="true" clientDefault="Default" allowNulls="false">
      <header v="Quyền sử dụng" e="Access Right"></header>
      <items style="AutoComplete" controller="hrAccessRight" reference="ten_quyen%l" key="(@@admin = 1 or (ma_quyen in (select ma_quyen from hrquyennsd where user_id = @@userID))) and status = '1'" check="(@@admin = 1 or (ma_quyen in (select ma_quyen from hrquyennsd where user_id = @@userID)))" information="ma_quyen$hrdmquyen.ten_quyen%l" row="1"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZW0L7KoK1JKvw13Almtzw34iqdX+1R0JlLNDse9rW+ApYImcHKbtFCZHUdJH1EuYWA==</encrypted>]]></clientScript>
    </field>
    <field name="ten_quyen%l" readOnly="true" external="true" defaultValue="''"  clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="name" dataFormatString="X" allowNulls="false" external="true" defaultValue="''" allowContain="true">
      <header v="Người sử dụng" e="User"></header>
      <items style="AutoComplete" controller="UserGroup" reference="comment%l" key="(@@admin = 1 or patindex('&#37;,' + rtrim(name) + ',&#37;', (select ',' + replace(restrict_users,' ','') + ',' from userinfo2 where id = @@userID and restrict_yn = '1')) &lt;&gt; 0) and id not in (select user_id from hrquyennsd where ma_quyen = '{$%c[ma_quyen]}') and admin = 0 and user_yn = 1 and status = '1'" check="(@@admin = 1 or patindex('&#37;,' + rtrim(name) + ',&#37;', (select ',' + replace(restrict_users,' ','') + ',' from userinfo2 where id = @@userID and restrict_yn = '1')) &lt;&gt; 0) and id not in (select user_id from hrquyennsd where ma_quyen = '{$%c[ma_quyen]}') and admin = 0 and user_yn = 1" information="name$userinfo2.comment%l"/>
    </field>
    <field name="comment%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="132">
      <item value="120, 100, 100, 230, 0"/>
      <item value="1110: [ma_quyen].Label, [ma_quyen], [ten_quyen%l]"/>
      <item value="11101: [name].Label, [name], [comment%l], [user_id]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6QNWKSY8IKn3tAN7fQr1FDy9O7BQDASoU0lfR2kWUYUbDkyug+pQUZP19Mg340crOkMGM5GYwP3v392KaaQ1yZLZSfaZi6m0vPKozhDJMfIPJpiZj6zUyX1Oh/2oIsl/oOcYf4OX1QvX3Qm3ivwtm1+DocN3SDnyZnLOGpRHMhrJ0UfOGKEz1CyLX2w0Hw+/1mrEkrgUMoMo2NlqDaOi88/TbyJ/5niOwYz36ZJYBbdm5/bV1BNDZpHqv9OqG4jJmFR+536GeSzUe+cM2h45XBXWZBy/l9rhtZT5Rv699HyMHQTjTsLC09tbUi/DURuClBdus/kGQ+T/GByC5U+nz2DppJy2r+NSmeVR96hfHMSe</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6e0YAevpBO1N2FYIrLrBZUEFAsVOWknZgepPVbxxKbUbDzrdNsxoTt6y7ceu0292I+2zfvvdl1a3R8i2PryatuOzmrizF/uuW+dzReCCz5/gXd9utDtkGGG0K0eirRecPpV4PoJpTvaw9rppSomTw+K9Tlg/NwsGPrVTWTgb2uxQanLPBfou945aRsByZMs8/sCSHdUQeH8r9P+CTyZdc0E=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1pxbIFhJa9KFP838mbCHAtNaqWgE1uWLpaBIH1aDcUHX/is9LTKzqtHdSKlxHHm5f/HL9MyFcTN55QMsztJvMaxStjxmnN7Y1PlfpiillUydusgrJBPc1wUawPZfIsYYFeO2M9fT9UefxQ3F2Jd1TTEtWsiKqGpqslvhR7OThDozOf9jDaUQsdoh5w0Ft/BxtelF++dgkxgtWVjcS7u5yTNGodYVt2YmdMjYGka/6xtIXBNq0qyk6CFYnptsAAVNJQYM/KzRD17ZqJni1gMgojLjtO6CLzMs+YbeqnC2N6EOtqvJPDA7vxIC10kGca7Ug==</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6Qmrg3FoifVf7wtmkxzTnIZfEvcytafGTAMizB7IeWiVS6U30xlJSmlbsNo6ZfrjIKpHpSPPzsEoLZbKEyedp4V+rCuTFFMe3SnDscF0e4OBP3Zs3wM43uJyiFS/k3k67vOq2K+Muhuh11AAAMeF1Eiv7BlaHqj9KUsfF/VnGYheY7V1QY/1BCpgKkx4Np9AZZC7E7/obvh0uwJu3TEi3uw=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1pxbIFhJa9KFP838mbCHAtNaqWgE1uWLpaBIH1aDcUHX/is9LTKzqtHdSKlxHHm5f/HL9MyFcTN55QMsztJvMYvtrl9oY3AdScW8/lj9dfCC1mhyd6m/hVQXZCWLaU3JFx06Lep0B9xv+MAq3UF3++KXdZIyPSIJtVVVyfCoJTPKvM+jJb1DjIdOEyTBxu/y6YYBCS9yAZNoHMkaqTRe/ubQPGxqZ524kLh8bY+Z3VxuzRMTYFYGHfGWHnY7R30PpyRgp1hMa4v73NFN3/t6ps6wJkY3T3cimjDYA8WYhWaafNZVim2J+U5QevEtQ8zoN2jrQ2xyMHhc1tzVhYyPoZYd9ugjKc55s9O/bqt5LUM</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfy/TJisSqTrR4AaW2Uvbl0BfpYIkogGGDuyT0dbUVq9zednr6WUPwgIbDCf36fgLxB+P/Zt9pwxPIbi21VePY0d4aIhsPUitWr8872o1Fq5SDdzxzyMKh6mciBH/6DqCUInR1zQfN9TwcnEhG6mrWTY8Al5EHuL5DPfazLZkrvmt92BhQyBdGrHVx+OQ78aP+uJ9e9bCTLcrdsIvoFqb9fmxCg1gZ9T4JOSHygFo6e30H1L21VJ1XHGZZA1BhFPyx3N39qh9LHpQ44sHaZvsGZo=</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6aZdLwZFHWBGiV2jSgys+HELGwkIDAVxiFzivgqgMvuwENEW3GICFvnKN6nI8T9g9Trry4SrDYHQxrcfrCGFqZwTQBHyNrNkxIhTp6/JHemG</encrypted>]]>
      </text>
    </command>

    <command event="Deleted">
      <text>
        <![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7Khi/rRuBTAWHRMixW6HBbW/5dt5+PpSLSuh2Kty4WXHRB7bgwgpwrIbmWA34bxbe3QXF664I56Ei5a6NkZEKcn/kaMGTPpCqqHNdmGATuASmVH8iiMlRou4lMdSONeZQtQ==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70JdKjIJNJa7poYPFTe8LQkXbFcGj64MYhX2XI8QDOgMjxd/MYv8dcNf5/5Qz3BQz8TNk2YBPi7jUwKI54UTHbb9oJzOvSCSWpvvYMTUPTxJ2bE7KCH6nnsrZSehSlnFfITERhm31sjlxVU0prXhMUF6tiudIky0Snphq2sKoYGwunPfS769xghx0HTu+mNKJRnSqKukoBv7o3IaKbz0QeHjJZzH2KO0VzycjsWHbZ6aU/qmNM4CONMOIXd9ArUxv0Ke73aVKOybAmEFQ4BhjjlSMDnjvb1UNKLxhO3VLw9GdOYhOWSduRCwcdOJ6PMkoSQ==</encrypted>]]>
    </text>
  </script>
</dir>