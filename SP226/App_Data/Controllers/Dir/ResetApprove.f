<?xml version="1.0" encoding="utf-8"?>

<dir table="dmduyetlai" code="user_id4, u_status, loai_duyet" order="user_id4, u_status, loai_duyet" xmlns="urn:schemas-fast-com:data-dir">
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
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZed8+yj4r7hwmywvoI1LWyaiRWNdLSqJx3anObYbJDUDk7rHOIb96i178dCnsjzzlQ7wOIsIpk1MGX9jbN47YlU=</encrypted>]]></clientScript>
    </field>
    <field name="comment%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="u_status" isPrimaryKey="true" allowNulls="false">
      <header v="Trạng thái" e="Status"></header>
      <items style="AutoComplete" controller="IndicatorUser" reference="u_status_name%l" key="loai_duyet = '{$%c[loai_duyet]}' and status = '1'" check="loai_duyet = '{$%c[loai_duyet]}'" information="status$dmttcttg.u_status_name%l"/>
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
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf8LqilpRk1xhDc12rV7XwScs6HeugZor7bO0sGyIaPQ4MVegLTl9MeXO5e++tst/RyE5NsiKnHhIHZHT3tsT5K8chgkhEFXUK1VLp4CqMv+0</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf8LqilpRk1xhDc12rV7XwSdqFv5LCRks7aeVV1/ZqiSLgR+XJQHnCCKpUbhDxdlyx0fSfji0Q9mBoHRUKRxuwZo=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5j0FqrM77GENhAy1dfNVYaxv88we7LvU5OTvAXPqVsNlF6bIwriBs/E3XP6XLaSkwg09lpKxG8ta611+GLAb3A=</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70F+SXr2tyLGktNDy7D5snBekvpuvkGm+a83orXlj8e2ALIc+J5sQV8juKwF22SIMr9rFYziNvytADa3Ijr0D0Ku17Cn/1di2K6KMClztHdZPgUSNBSiJu1BB/cbbbWsR9qv8iV9VEnGzxyvwtNuZYsaBE6Klc60uvHPhNUqdwYdrQky1dnsWW0g3iRGjXM0kk/qviRbk/BnHj5Z+qVhhUea24cPHhhfdX5prD3d/AzeA6Dxg5JqmMumzb8U5RfYYRpfR8NBb2rxgeNZsEXaP6KgQjApHc9isji5P89INMVv+9TJburZaNK4Z/mQSmpvdvqVjIf130+McZ5ohdRPGACmi5IOHsoGVOB4xukruMJQdjk7uOfZ4cTns15PwPhxQSNKjHU3VrqdzY3cYsZg+elY9c53A0yCyjceLGQ+8W9F1QKqT4j3owt6vELvrPCSMq5fVhMUjY+jB+7mQQ5ole8DpGpZwtBe40DtM5POUrObRSCEQrKngTlE82AA02FTEsgLzP3ZnLrg8PaDqRqtrRwqJSDrM5blu3qzhm71pGNvUZLSUxKCIGw++X7hMvHTwx1QjkC6sE9Bg3tdkxxcF9rVZaFlhFRusL4Kjguaha0bTCEKBnOAHtD5Iva82pivi6A==</encrypted>]]>
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