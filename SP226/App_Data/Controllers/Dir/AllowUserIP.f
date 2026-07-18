<?xml version="1.0" encoding="utf-8"?>

<dir table="userallowip" code="user_id, ip_address" order="user_id, ip_address" database="Sys" xmlns="urn:schemas-fast-com:data-dir">
  <title v="giới hạn địa chỉ truy cập của người sử dụng" e="User IP Address"></title>
  <fields>
    <field name="user_id" isPrimaryKey="true" type="Decimal" disabled="true" hidden="true">
      <items style="Numeric"></items>
    </field>
    <field name="name" dataFormatString="X" allowNulls="false" external="true" defaultValue="''" allowContain="true">
      <header v="Người sử dụng" e="User"></header>
      <items style="AutoComplete" controller="UserGroup" reference="comment%l" key="user_yn = 1 and status = '1'" check="user_yn = 1" information="name$userinfo2.comment%l"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZZnWxgrKSDIYYgOiHBdObfoibDXceOb51ymCaM4x9AWhfnJYxnYCrqAgR0CWhoPXwQ==</encrypted>]]></clientScript>
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
      <item value="110101: [name].Label, [name], [comment%l], [user_id]"/>
      <item value="110: [ip_address].Label, [ip_address]"/>
    </view>
  </views>

  <commands>
    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZulibmTiDu/1e1fIXUjQl5hcgXo+aXz/HLOiBZe/zx2+WGJB4Rg0Aocw85J5PEo5i/VlY/Hi+dIdSLFE1CiUiXxuUHIkQ7+2eEAfqFWkmYD7R3M7nfNUXs1fWoMlSODq3LdpEWXRXv6FYFtfKvS7pMJdyp4e58cLOFBgccvk7A/l4m5GyfFsrc48LD+qDvXsIXF/JnEFg++nVZS83UUKA0QD6JUczXNOhPiZXSGrnMwnELOOHht6eeveoVVxwS+r2yCIgeAcY9qm4s7CXsE1U79oR1HlVgqibUU6nZ80f7jAnD4KxHk0rqm41DscG0/Y55Q6nmmDtep8joYlK4AD4Ob1Lamtil9kg9fDq1hj1SVaVYFUsLKG7aCRGe8z53wh27dbUCG/RRRvidzpK8b7RMF7iQ==</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHY1b1Z6DQVvjDrs5T4h/4lG5BKamCeSxp0XeNwGFOCwYQ4IfgrrKXIKbzBJ1td3IrJbits4BQugRcXsQMy9aEnlDNJu9KbYGF9VzTIVJhtE8wUcfdJkgS0Ty1U4KFFmm+0NKoTBuSTp6Dq2FTdXvAMYqiym8Meo8lTFupHHLWL2p3biDUBy2V8LIVfkQr9pZkHCrsBgDYXTzsGier25c+oLHM8edvAYSrHd/Rab6JoGmCD6ujeCTmHovWqHU/OurSf0l0BuuUX6MlgYwO3aIbalVSVvSUcX35tHebYocWDUyzaegoJjXyJwGdleHAAtXq07Vbgt5/BA2a0qFyaSUH/0</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1MpVFDKK00MnirxsgsajDc4Y6zB3ZJIddWDfMAR+muFqRq5kVVHCt4m0E1VjXLcXBHi4uX8Ny2gPkMF89D7HFo=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82ncc7JM7ElvUCS7Q6nVmcd+uf1bBEJxDZoZugapBIoH3klS9JM61TN4FXphzpu4zbLVeBWyKg6RjtqG9Tv2oUUAiD3MRlsxVvN5jPAkuPIEtivFgmIzj9RnxA6YtZxTycIi7TZdAFnG8DsIs7P4JQ2a0i7cK9/gVmeQXqs6DgDSZRpMAX5xnYxof/ntY9yh+wiCcSPOMFtulmr/9EQHF5g3pctIwSCfbvJxvA6MPjE6tU=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jCE8505xr9tplUHyoaB8joQ3u/FZwJLYxZgcYpywcCCuPFN1FjZfxGk0d1Uw3VXLSKYfHnhyEDS7nW0fauDWB4N3hTUPut5yeFCgL5zva4NqAEC3ufkNxMJereQRUwr8XI1yMl6tJNr3kbaPhHzDmeDkpiU4FxLc5XAr4Pjx0N8IwvAk9nTy3/lAZHLafo2qsa3gDlMjFyLo3645dsdEBrL3614FcW+oLFmbiBcKXkTUqKjzNFOCLasZMhtYc29SM8v2f1VrvgdwUbvdOmf+2puDYrtVhIi7WMlX9UOHw5yFEzHohCbY79hKIEoepvff9</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeitF4hflHGOHzrZvkpp6HCKZTbYctvkEGNVv9BrgrEA3PljeuFcZtECljcxHmxREwQ==</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70I8cKshdMVFC4j1XKHyCocMMPVsDTD7DO0jupuXhvpYyPV5YQAOrJqXsVeEU5IBKRRftFMHdpu1bwL6c2Fq48SqXhYfOr32Swqfgvos3Hs8mr57mjG19I9r2eoP6jtNlNMuYIpOY2w09qIbjet1JlZBCS7n80cjZnwkLjA08z7YPjDR4u1tClaXfMpxc79WU0FgmJENQ35cFTn/kNz8xYkSN+Iez4wE4uHy1iw0r/ruutMv4EIWzXxvkj9i0cqQAABz822izsC/MQzb6qwwhWWijtW43cBSrmZyYMGW6kGthoq2npWaNKPqVZFw08rWDNL1SMTfDFwEoGzhosGqIZZDMKBcbtOaug4ujHDK23mkq3/Gq8otDpYa28CoNat0e/37J7UzFb6fAM2KWtdYVc5WY7NOucv2S1COUUU2dfwKc</encrypted>]]>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70C2dJ74KKf7T5+uiz88/uOB6rUSE1jeJkKjaeuiF24GF7Fi7dZn66cdfIrqEias3KQpab2CtKyWtNQLiGQn6GzQG0uSQ4uOQaC7WXkU01KVqXjAYkzrJimbsUJxzyol5wdohgUmXGEvpNESv2311Yb/59CgEos8jqQlbsb4yqN8X</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetUserID">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4t5w2+icxkb4kqyHqVMqntNnUgeUpd5+2P86AipOFoZSSHVe9urXHKUF/tsb9a1bGBY3vkWawr94C5Odtdnn0YuPJBoRYi8Hpsc8LsqtiTc5UCitMN/X14q5Xc3i83zeobnAKzMyx96e3zJhhQip/O2nscg2NpW3S/seALbrdVyA==</encrypted>]]>
      </text>
    </action>
  </response>

</dir>