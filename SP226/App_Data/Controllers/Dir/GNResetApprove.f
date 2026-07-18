<?xml version="1.0" encoding="utf-8"?>

<dir table="gndmduyetlai" code="user_id4, u_status, loai_duyet" order="user_id4, u_status, loai_duyet" xmlns="urn:schemas-fast-com:data-dir">
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
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZXyuy5DznO8BiGbIWtJAznNDvMJz20BLJfMZDfsq5Es6SuMsou69OlrE9mMqTetB0TgtvgSbEgSrWrRgFONqrMA=</encrypted>]]></clientScript>
    </field>
    <field name="comment%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="u_status" isPrimaryKey="true" allowNulls="false">
      <header v="Trạng thái" e="Status"></header>
      <items style="AutoComplete" controller="GNIndicatorUser" reference="u_status_name%l" key="loai_duyet = '{$%c[loai_duyet]}' and status = '1'" check="loai_duyet = '{$%c[loai_duyet]}'" information="status$gndmttcttg.u_status_name%l"/>
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
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3C/qlv42TuXA+B4BrICfBlbUmhMP9nMGL5piC304GNVKREvmLhbGZgc8HlLbwrvmoKxncsL5tPvOhKxmnRZQnP/O49vSIB+7Jm0aTY36OvZ</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3C/qlv42TuXA+B4BrICfBlbUmhMP9nMGL5piC304GNVCvTw2gLwzCNuyB4xCOy6i/ZRyKjl29jbooSK/0NSDDc=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfx0TKzd6yL2BlhLuCXsLiYIE6ss7NtvxpKmGWvTu9INhzM7U1teg9fl4W6IVi2XVaROHhpkmFZ3O3sYZD07LWuQBnkFlLHd/zChi/9Ia5KKX</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70F+SXr2tyLGktNDy7D5snBfmqfIEuiBJRl+FHFEPdnwixz/nmTGKR1cuIxGOr5AxqecgJor6PBwItkBk3xiImaD4WfOWAB2Syxld6dmG0UqBw/o9fIZg6lXROx0jNRz8roHY15dwMzcKYSOychXfswFNlhehLRvTbCshy8JwZYRb+M07FK429YETnyikesQ29y1jYlIt9N+k1Ee8v/LmKaxdzom3Y25KmglaYfj5izA5tZ/sV5MgWsGPxLsNcuHHb1Z/d1lp9Vw4bKdy2CqpvtHXEepGsbtpUopNZRQ+NtNtR4R4uTGBnU6vlkbYUmGtStlEknZjhcSVRKaokqim6uC5esLClCLzSjoQE71VsWOxS6gd/bAyLDi/miJhLVngGAem3gPA5whh67iUmvWg1iz8fEIynsV1HDrhOCyZbSy3eclKxahcUtBxVutmsEV/4sYWzoYRwOLVkcoAPRiWUJG4nBEUyime70IyD0ONDjnt/sIbHeT+qjZGpDRlDwBtNtxjOH0l0dcs5aTpXCW/fMbR8TvlRap9HRdqvrVEStHFVAWxl8VpjhvTN5B45/c1Tcf8igiHaGnX3bXrQB+VO0NkMK7lg0WntL5oPJffUYcFBxL/bEEgGdyHq2Y2+Wv/bg==</encrypted>]]>
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