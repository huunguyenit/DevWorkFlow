<?xml version="1.0" encoding="utf-8"?>

<dir table="hrquyennsd" code="ma_quyen, user_id" order="ma_quyen, user_id" database="Sys" xmlns="urn:schemas-fast-com:data-dir">
  <title v="quyền nhóm người sử dụng" e="Group Access Control"></title>

  <fields>
    <field name="user_id" isPrimaryKey="true" type="Decimal" disabled="true" hidden="true">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_quyen" isPrimaryKey="true" clientDefault="Default" allowNulls="false">
      <header v="Quyền sử dụng" e="Access Right"></header>
      <items style="AutoComplete" controller="hrAccessRight" reference="ten_quyen%l" key="status = '1'" check="1 = 1" information="ma_quyen$hrdmquyen.ten_quyen%l" row="1"/>
    </field>
    <field name="ten_quyen%l" readOnly="true" external="true" defaultValue="''" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="name" dataFormatString="X" allowNulls="false" external="true" defaultValue="''" allowContain="true">
      <header v="Nhóm" e="Group"></header>
      <items style="AutoComplete" controller="UserGroup" reference="comment%l" key="user_yn = 0 and status = '1'" check="user_yn = 0" information="name$userinfo2.comment%l"/>
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
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2FwRxVRdbmVu5HNSCp5ZzICOECFNPqE6VQ4ON8GJ1Z4US1QyNpX8LzJE05I1G85pESfknB49ja4h1NqrVq23ckPPpfjTHT5KyCoF2CxnXwLIs1/1efSdppikMujx8nRtiPRkpVluDehFhLCeOj/K9BnvcY0oQvnwkWYa5YHrFIp3rZ93uTi9QuDxu0QRVBAKSEFEmQmYTrqSeP0/uatsdlFnU57Xa2/OJ/xx8bFISzzOqWbTmxtuMIROMvRTOHu5QP89rd5EG7nm+M0fnS/Pl8l3KhqcN1C1DXVWdgfeCPK9t3P6HkHRftK1ZIfMgLn7hZIbj3Z2+C7k2+eRuVJniE=</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6Rl1GhBt6edFaqZ9bF8mIJflFgiis1L1duTe7IUy+nj/NAP651CAyCdDq2ob3Tls3xbK5R0OrFMXYBPiQ62P1bCZaqxWyoBbTrEZ2d3MYNxH4J61Xbr5RUWnNtuByTDrVs2UYld+ugyiPJ7uMrC+zZNIjAF3Ayr+uEsEW+FtWli+mnIcA6k+t7Ru/rjcG3yxr/vyF7WWDDSRYfJzUDPTsC7H/DTSEk0GsSdUauoi/yK9x6DEe738uerVrIB2PWz5sZoqN2xz+4dnlRSuW1JT2QgnZURn7xkY3cEV7GbCsicphOe62ZHFkQzKtHczBCkXcIlQWzZ5hQVm6S7Y4Ek9AZrnn+NvPAig/7MWUd5f8rT1vABITSSp57vXkebiN9//UmnS1h98HmXdCBMgfk9JXlOIHWGX5dDiVs5/bO3s65K2z8uy6CLiU2YCCkQB8NwfjArNalTQWknLqdGdXewY7a0yvfn/QorWgMlZeuQW4eK/</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2FwRxVRdbmVu5HNSCp5ZzICOECFNPqE6VQ4ON8GJ1Z4US1QyNpX8LzJE05I1G85pESfknB49ja4h1NqrVq23ckPPpfjTHT5KyCoF2CxnXwL85XERdN6kPUJBVagJao+Xc5xLZT0yvCcC0NvhLhHbhGFpAUt1ta+qWwUzUGnSLd6R7VW64UaXw7K/8QcLlvapaUfBKEHZfp9RVx1ysEixZhTRCNxlKdpdvA1On1giTnTPgEpGVfCCwtiXwGJPkyX+PmIO6jKOLd67BnwG+q5Kc6+hnBYxapW4gyi0PXyEU1CFOgFUa5UmIN3G8joJTUTTcp+XscMtchaypdzXmHDzEYsaorXSkMVUPgvX/h4sVhbuOIn88LIJXLIGDEKM5NOu0GBUt8cOZEjxG+Gy6jYsAHVluZyyqunvjE9cnii+E/sKms8YOzmomHzXIRKDeiC6w==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5tkXcw0QOPUvGldzQ2aOsK9QN/KC/6cPo2sEGcNJO5iwell4I8JocPV2EotG10t6jtkt5oMtaK/peZgSWwSvGqa7dUJlvUUj7PKGvstAR60fDGm0PTR6oq/rGpODCZByi0mBiRQhn8+c0caVcseNuhNC2wPZPJyFMolnn9wEv20a7PGWPUn3DF71B+bxGjfs0NKjp5H2hmK5NLFozQoAlBNw/+ZL9sq1xQ/uNrKIiJQHJgINlPtjbvARpmODB3BriMB9s7Kat+y3uL6lKHYp8HYLkpwN2tm/lE5C6OKU2R8ECLzA7euEqSBWHjP3mF/vl9MoM39L/Ojs+bLYham3id5pv8NUS/5Yc18+WZ90iGJwaMx6Ezuk3W2XLDbXz1Ba26D4kZDeNEPuFffHsUTzLfFZxyDseL/xj9rj67mQdWUsdaNiRJBvOptkbDTAdeeiScK0LpMT0ajsg65Dhm7h0o=</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2FwRxVRdbmVu5HNSCp5ZzKz+Uoo572XMASADYcNKFiHDq0iiMhxfXPj2Vhxt0e23g==</encrypted>]]>
      </text>
    </command>

    <command event="Deleted">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6Rl1GhBt6edFaqZ9bF8mIJflFgiis1L1duTe7IUy+nj/NAP651CAyCdDq2ob3Tls3xbK5R0OrFMXYBPiQ62P1bCZaqxWyoBbTrEZ2d3MYNxH4J61Xbr5RUWnNtuByTDrVs2UYld+ugyiPJ7uMrC+zZNIjAF3Ayr+uEsEW+FtWli+fNRyK26EUOM1IvAw6JPOUXzC8hrS4US3VuMFW89Rod2lIDImcwUFiykrt2ZAmEzWIpjHLD/ZEreEFerpdM+jum1X9lP+C+FlEab+d4wUQjj93GX4NopHMMt/PZAi4RkGqo618bNiJtR7ZHsGXxyektScps9lGyZ5EDD5hmYE6AiRZN01EPY0zNhTVIuTQrdH1wE37hb+nHtVJWFuwVjN4uIZv3D1zafVB896sxQQim9GMQzPY1ISw11n3TPEYpkDNtPI5atEEthRXmdIW8ALiw==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70JdKjIJNJa7poYPFTe8LQkXbFcGj64MYhX2XI8QDOgMjxd/MYv8dcNf5/5Qz3BQz8TNk2YBPi7jUwKI54UTHbb9oJzOvSCSWpvvYMTUPTxJ2bE7KCH6nnsrZSehSlnFfITERhm31sjlxVU0prXhMUF6tiudIky0Snphq2sKoYGwunPfS769xghx0HTu+mNKJRnSqKukoBv7o3IaKbz0QeHjDArpJvXHW2SRHGZ1zFR/7</encrypted>]]>
    </text>
  </script>
</dir>