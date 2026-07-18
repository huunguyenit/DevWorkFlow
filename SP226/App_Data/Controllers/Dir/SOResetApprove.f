<?xml version="1.0" encoding="utf-8"?>

<dir table="sodmduyetlai" code="user_id4, u_status, loai_duyet" order="user_id4, u_status, loai_duyet" xmlns="urn:schemas-fast-com:data-dir">
  <title v="khai báo trạng thái cho phép duyệt lại" e="Reapproval Status Assignment"></title>
  <fields>
    <field name="user_id4" isPrimaryKey="true" type="Decimal" disabled="true" hidden="true">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="loai_duyet" isPrimaryKey="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="name" dataFormatString="@upperCaseFormat" external="true" defaultValue="''">
      <header v="Người sử dụng" e="User"></header>
      <items style="AutoComplete" controller="UserGroup" reference="comment%l" key="status = 1" check="1 = 1" information="name$userinfo2.comment%l"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZZ2C5BSvvF00i+YzFOkMBzU9HmDHaQ9TF67ckyKc3+bJSVkY54Ovlm+2ejIWG7INeHS//eUambyKZuO6UTVtFOo=</encrypted>]]></clientScript>
    </field>
    <field name="comment%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="u_status" isPrimaryKey="true" allowNulls="false">
      <header v="Trạng thái" e="Status"></header>
      <items style="AutoComplete" controller="SOIndicatorUser" reference="u_status_name%l" key="loai_duyet = '{$%c[loai_duyet]}' and status = '1'" check="loai_duyet = '{$%c[loai_duyet]}'" information="status$sodmttcttg.u_status_name%l"/>
    </field>
    <field name="u_status_name%l" readOnly="true" external="true" defaultValue="''">
      <header v="Tên trạng thái" e="Status Name"></header>
    </field>
    <field name="ghi_chu">
      <header v="Ghi chú" e="Note"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230, 0"/>
      <item value="110101: [u_status].Label, [u_status], [u_status_name%l], [user_id4]"/>
      <item value="110101: [name].Label, [name], [comment%l], [loai_duyet]"/>
      <item value="11000: [ghi_chu].Label, [ghi_chu]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5T1sKbKaC1MorQ0VByewPk82zKEzcLu4xvrpdZE7MBg96QkjDMjPXetREBFasm+au53PdW3WVYHPZKMwJvtFRVBKYZVzn3IJ8BeHPFbpibI</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5T1sKbKaC1MorQ0VByewPk82zKEzcLu4xvrpdZE7MBgxUN/nXpIUrERt35SbpRPL3KleRdU8sGHK7t65Dq4Wjs=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5j0FqrM77GENhAy1dfNVYavqoBoV8yQ+dnJZu7qd7h1mbeopPj0x4+QV3b+ji8sAIBUwM84N8bakIAi5ZIBIJaGcLJeAQON7tc/7LI2HQsE</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1DvqYPEGhvkhcFFLA0md0CU8JCl3l8yMlhGiXpYo/WU7nNx8jhsi4YcyaQgRwwVBnVg9HR03PUEYNpmrtovDN9kKM39KjAGjHqBX0gh9VkbbqrSCeWr/n5Nzn1JdA7+C3VYS0fEKyE6Rvb9VX2wTeLMciLhS2uhNRTEVluWZ6e59U2gNXleHBEtMDIujEXYKdrUqbHsxaPqoasPpNxWM+JOdL1LyugEL8yhBJygDPbsCFr+qXaXTNOn2CAJ8AI9ZkqRK6n2KN7Zo2o0rU7z+Fc=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XBqYURJa75X2OpzUmznZ6G9mWv7rrbDQFvYVOGevwEl5Rw0xvCxlbsMuR9JLKkiu/Y9N+99OxzlSM4BpheL63Xlz7gNUxUcrASVHYw4gzc9q0WgyITTQqL1T+StqcgNWSiFFwz1zwmuJdbbmd5KH2fAUeRtgCPYOo88bEWWl0DNaIR6CHVn2upb0qpeSDW4FsBT8RCuOgPMTPEry8wq9wl3MwPa/QkvH/7Z1q1MqKa40T/ZhfJR9up4XDEeiJJUFNCB/xMkX5eqlOoCJOXVdQRu34WNCge3c+TfRfDbWz7pmFL6YoClvXf+3vZxKyCPDC51QXD02ZN91Ne0foGp0zeq7wJU9csgW1gVqI7kzrt4V6486T8Glqh/zsrqNxgjcmvo9Kbr/LSHThTvR/NwWySnLh9yFez50W/zkK7RcSu7VZFs9w8NKw/BAOZvRHOINw==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4vZG8geyQX0pJ1qS7bKa3c25ilTYvg9JQ2GsD7bgHbOav/MUfDQw8W/rT+FC6tjp55/Ss9MqhIi34WIuskIcipVUNLi6zeZp8wvCInTSwb06BRKgG3z5VjFmzkAuCu1SiuP0BfHpiTxhz7c2b67jk6ZmNiPEMGk4xotFxNSBrljk8USFKkcZiPsfnCF2Q7r54k8DkyE6OLXkM/jC1JielNFEqLiIPPBoRqxRJw7jYf0fWkxRCywtCUaOWcmQQPYSWMc75DqXdsZinpnz4d56p21n5y2MgldrSZZRwB8YaA26iIpbez9dsgPDJWDPGDCErkS8Q5pugCynwfrIkn+w+s</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6UmzH1aZnGeUGAWthTTNavZqDXAO6OU+VkjIGYtCTFYV1U3GkZkg+E207IYMbZ2CkFwB5660n3EPPEA0tRgHndESd3AuwPwTOk7tPcDaUWVXnGflrb5dLVhPKFFw21SkFQhHBU48m/kcbu98xHJ9ZaP6WEDoQ2jtosU3EKcH5VrdWVCCh10mVUV2KVnwb7sSXhcVSPR5DlED4sEAC7ApPVQcTsM3kZChsm7Q4UGGFrsA47/722V+Yw8QkW0olNSYaa5g/vWGm+g570mT/kGk/VDu2T/TXovJjMoktQGpTNR7EXRgyHHZFr74cZX/aQtrnBQT9h0CnJJ2EaaJpE6piP28iMZqhP0Ye7ddgecMhQXoOjJAzYpIKmNPzZUgcEQDdy7AhtxQNuDNj364l2+n9q0=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkberI0yp4NBekT5HxDlg3zsie6qWEtCEFFGFikGYWbZmycp/uzQkfQjpa71Yn8YqvUZSj3eLsg5v5nmBV85pACndk=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70F+SXr2tyLGktNDy7D5snBdu3SaAxz2KuHMWoeAGM31utoNe6duchGrpyH4t3piR1x0fsFshSQLna9wsR3lLnyw6Fb13JR8yE7KgnkrgdGaE0l3xycKSXRlL+m+pr333qXqarwiee0YzlM4i1d3hBJHphKjZJat5RGhxSzEYrYbXkqZ74hNw4xVvMxsvLqz9BltOP5br/KpW2Fn3r+TipzAwQjihKP1XARWEvbZr8WJd8xhiFw32c9UyiG13ZWdFAyWJI36Lazt+BlhUNiZfzFIen8zktA3VmfiGmCksRuQXLhlJJ+pjMNiquYV5ASmb/86N+menO4WdYYJA1HxFaQ111WWp/iINte9DwiG8kXFLENiU/iEBijGR92xh2uo0/K824DNTAjpJp/J+n65pWLwaTu/bO9otIxO+TzD6RxDV383ZwyUpLFqn2jb4I0AeUpgAqeF6bzwGZMGf6cN9tGvXlUj2giLilLwIua4B8XmGaGrlJGqnV3IXN32hcwuBwQXSYWcgmKXRZ9C12PwCLsfZjxZuBSu9IXg6qTgBWhprh6i7gp56QrX3FUAmu6g148zPUx2Fe2VHnqsPwwZPfL1IAu3wzy4JvfKTGx3zpaDU19n/WvFQHqJzVJOGCW1mpg==</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetUserID">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4t5w2+icxkb4kqyHqVMqntNnUgeUpd5+2P86AipOFoZSSHVe9urXHKUF/tsb9a1bF/ktB+skylIKj6EnOnQ+JoPpFMP25RX5IlICC8K0pUqgZcu02n8qS1EUpF0DXY7SA=</encrypted>]]>
      </text>
    </action>
  </response>
</dir>