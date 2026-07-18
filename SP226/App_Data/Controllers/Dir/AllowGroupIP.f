<?xml version="1.0" encoding="utf-8"?>

<dir table="groupallowip" code="group_id, ip_address" order="group_id, ip_address" database="Sys" xmlns="urn:schemas-fast-com:data-dir">
  <title v="giới hạn địa chỉ truy cập của nhóm người sử dụng" e="User Group IP Address"></title>
  <fields>
    <field name="group_id" isPrimaryKey="true" type="Decimal" disabled="true" hidden="true">
      <items style="Numeric"></items>
    </field>
    <field name="name" dataFormatString="X" allowNulls="false" external="true" defaultValue="''" allowContain="true">
      <header v="Nhóm" e="User Group"></header>
      <items style="AutoComplete" controller="UserGroup" reference="comment%l" key="user_yn = 0 and status = '1'" check="user_yn = 0" information="name$userinfo2.comment%l"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZZnWxgrKSDIYYgOiHBdObfpaedzv2EXjqHJRxMZAouA5xn9Y8l1gaamNyrjGsLEWEA==</encrypted>]]></clientScript>
    </field>
    <field name="comment%l" external="true" defaultValue="''" readOnly="true" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="ip_address" isPrimaryKey="true" allowNulls="false">
      <header v="Địa chỉ truy cập" e="IP Address"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 90, 80, 230, 0"/>
      <item value="110101: [name].Label, [name], [comment%l], [group_id]"/>
      <item value="110: [ip_address].Label, [ip_address]"/>
    </view>
  </views>

  <commands>
    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliG6UeevSJ4SJDMvrXkYMGtAUEdy/oV151r/ChVUqDjAMTNMFTnkc/2tHpaWkO7lpp+ZnUJ7u1efwUsp8YBSgS42aDF4NiU0F+pqkQlH376FVZVCcQbUjiAky9ZrzHNBHOTH+V+2UAkuWrXimCaDUI+clgSVmxoKw4HnJSmCHrato1uOmSue6cE+HhxeUaWX3MgSQHCFCvKRjy8oO1uMVCCP84xxloErH9cskRw/y1VUOYRgJVsa/6RvxMfOSUvVODvw9zXN3vYcjeo5ZVid4P0UrOlsL2QSyOb/VwqM327XKjaOzOALXuVTATZgiAj7GS/fqEKflYM/2EFqRFG6ugET1fJfPn1JEWu92GtGpk1mQj6b5oS1YrtCUEBap8gpSX5STD/vwB1s6AT5b7qsCNAK6d8Fb7K1rq6uWvMaaCJIM=</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHY1b1Z6DQVvjDrs5T4h/4lG5BKamCeSxp0XeNwGFOCwYQ4IfgrrKXIKbzBJ1td3IrJbits4BQugRcXsQMy9aEnlDNJu9KbYGF9VzTIVJhtE85r/rqxr+XOBfNZD4AKxT0eq8KD6GWzw0tVf19sE7GPdDLNxMMlFC09OgHurM+5oN/uo4BTUPaYMUncv/C+r0tot39WUC7jtk6wd3y9L7/n0OdferhMnZHJGe6lF3qBvoOKSkPjOwp28gLPOagHT9UYbV/CkSk/Ub4w91dn6cVuSz44jcUvuIsHdzKkOHG8w8gMA4mo1/nVQrtrxM/5yh4M1XSyOM3lKsvRs+USEpu//jqUH81kmNucFtywdZlBbyw==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1MpVFDKK00MnirxsgsajDes1a+OuGbVRdLtKT9t1P+zLHmom1N4JV9ekD1r6wf+g1wdE4bHDuONNh6XUHd3XUY=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nZ6t0nt5DSYE6VMHhPZvG+ce5FJFjtZVlwXFnFzVuL+Yvz5lS7Ve0hwKwRaN9kdfycP79dg1E+E4/zWemOJin816cXEAYhRbIUDFvRNbBu5p7khNDqIYycU+/7rwq4kl0ng6JWAlysfS3mvU8/iuFQHkSi3Y9VU0uy1b3bM+/a8T6syEguXGw6UwmsFUxPPyRu06z+YQSCfNO89iupsvzV4e0v7KObXpMUCFeRB5/Ahk=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jCJTDKP7RCknlYRsbB0rcqFw3k59DH2Ft9M0sEJ9CrSkdp37vjO+uvC0xUyYwN6V+RisG+iO+S7RmLjlgXWwrXW/83m4NFU//FKfz3fbnwWdneBzlYLkHlUD3vUiAt/TeilSa9mebjSq87cMQKjFc3TULWInHIytV+6Z86u4xZ96zjJBetJsXgqRDQCxUsAebgMkTcB63BubBh7ackiCrfEpjS9s5boIU6MCLEkrZNGWY4Fu3AL0mgfff2SUcuHW5keOFqWbR8kqbiSqkjXJ5sWKxBVoVGRrH2bfUSlB777LpmIgIUDAGwdNpZqwphNQD</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkberFUZ26GPXmy6Llv7oDWN/6jzKnc6QX1LccP1kgouPEeoyq6kuZgmDdGLa4huakZ2g==</encrypted>]]>
      </text>
    </command>
    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70KlkBPW8xKtDiwP3gicSpZtykoN3YrZY8hjBaZXrlr4BMwdFZHNVOkuM0oEGhYq/phXAPA16DhhH+YuAzxQovLF/TF5f85f1mqCgKaA4cM9H8JNDV8Z7fvR0n/0Uj9kT6ct2SernloUXeHp7pgbmSr9MUqqG6oy2ZZYVtSKpf1XkAWcbfIuXXDheFnVNh3TuPhY009IA0rUnvbfWrm6809wjERi4EtwlZ5wV7xbl9YcFwFqtMABqI2mBhJtjukw8u1naQcJl6wY8qdoiexTSd9ox99fElvThYQHvjmgXdMkSTVDjOM1eNcRFf8+ukeqO29a21/9r/ZmKizp7AgCfR/DtuDrQx/lXcDYnu/y61OcUzrUercH3GsmQSyw4vDf9n0PRt2jBDiQG9EvvL+YTpjtHQ30gMqR7DODu6Gd0q0mAsdPOJyv8mfOI2gG23V8eD2BdjaJ1T3kABjIjwCRaU44=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70I8cKshdMVFC4j1XKHyCocPv6ao3b3dTVwoFWe4ueRaZniJ5icx5ItVngCPpVqy5PGfJPAnXFSEJZB0S/NkDocqrVMarhfpfMW4t4fVvZYPYOvdDpYgYj75Q5Dg2zUd89WDJ687x7CoxK0hcSxZcytZ/cygVN4gEntZYdXOR6XDlhtF1kWvFSDM4uGKUdxFW/xGkLEMUoHzh/ssMhNGlBE5DneKlmt51Qj5Bna2uTUT45Pcde+e7SG6tSQuUZvXaeWzwC4PJt9mZnUuKh5AVN7OTQVBjbYn1I1VoAkXz1G50Ix61l63Oxdo5DyfEF2TaVWa+DBNsGdiBn135xZ0HNtSpVfLIvZewmH1or5aL1PEhXm2APYBMc0nrahuBlK1Af2NaNPZqS2RyLQCNiAJTh3/nP1gsqythVQbsKptZUp5A</encrypted>]]>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70MyuA1txzOxjMCi/sL7itK13ae2P1E7GCfjwk/nCQGP5IwOMpito6c4j+GAbXA0H1vPVeH3E6YX7+EaR64VlVunJUeYoqhN8IJVrZlmb9UuKAUWWiuF/JdfsYELIl5hXjQci1I5A51Q4Nt3dCN3N7R+ij1G13sOj3fzKPUI3jpsu</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetGroupID">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4t5w2+icxkb4kqyHqVMqntNnUgeUpd5+2P86AipOFoZSSHVe9urXHKUF/tsb9a1bGBY3vkWawr94C5Odtdnn0YuPJBoRYi8Hpsc8LsqtiTc5UCitMN/X14q5Xc3i83zeobnAKzMyx96e3zJhhQip/O2nscg2NpW3S/seALbrdVyA==</encrypted>]]>
      </text>
    </action>
  </response>

</dir>