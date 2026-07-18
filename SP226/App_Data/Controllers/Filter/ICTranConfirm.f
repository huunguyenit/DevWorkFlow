<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY Key "declare @rk varchar(16)
select @rk = lower(left(replace(newid(),'-',''), 16))
update @@sysDatabaseName..userinfo2 set rkey = @rk where id = @@userID">
]>

<dir table="userinfo2" code="name" order="name" database="App" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Xác nhận mật khẩu" e="Confirm Password"></title>
  <fields>
    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right">
      <header v="Số chứng từ" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày chứng từ" e="Voucher Date"></header>
    </field>
    <field name="ma_kh">
      <header v="Mã khách" e="Customer"></header>
    </field>
    <field name="ten_kh" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="cpass" external="true" defaultValue="''">
      <header v="Xác nhận mật khẩu" e="Confirm Password"></header>
      <clientScript><![CDATA[<Encrypted>&i8xXBDxrUicbWBNXbvDJpliUSApVTzvNdiT+9b8CvmXDltvBhUQH36jT0VaktnNrg0qaTW0ujiw0weSAP8BIvw==</Encrypted>]]></clientScript>
    </field>
    <field name="chkpass" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 100, 230, 0"/>
      <item value="11: [so_ct].Label, [so_ct]"/>
      <item value="11: [ngay_ct].Label, [ngay_ct]"/>
      <item value="1110: [ma_kh].Label, [ma_kh], [ten_kh]"/>
      <item value="110-1: [cpass].Label, [cpass], [chkpass]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &Key;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcJ6Z3osRRn7IZEXHQKbH7bvn00/BFtMGq+dcWebrvfFZhWGGYQLUbGHYAN5/PoDqCd+LYXeP2DAdwuGdE7jnrPz9odFsMAeG1ZpUyWKPwKcB</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPRbB5mzzhVQxydv75n/Vm2lFkhV8N+l2A90R772qeVMSMgAV4P8UcTJcYa1OLzXOpVM4v/BUPa2a293+KogQ1s=</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2EVysHeAi+9H2/tp6pPuuLMVoacUjm0aTAx4OTopU/Y61x6glMwJvt1Xq+H/5YTXSrDGUxsRNy05rb1eML3Epng0FM7PbIJx9w2ilIfd22bHcVvdiUyCKrYtJaPAyUrhtyqoNsjCVuleYGJ4MaWJBF0R4kos/jHF+/mnPTbK/g5mq</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtdVk9yNtmVDDs5ep2ivY7fFn/0yGCUk9WpUrW+a5NreTNC6qzWVi6MnKF2bzXL9XYYzuF5OorMav2uUhB+YXtv8jQ7RsPyTyBwEGvWbySs5jOQdUko1wrvQ3KREEt5XwVHSfEvgp3w3tWVaHKtSaLCBFuoh9PKivi1rsdQ3j1CMaIxjLvxzg2T22ybnYTszxhdfLk+FZjStbmo068Quy3pP25t9Bn+EvHbdoqUOkiWopwZkcJiFqeMFohi5WzzXWTTtUNu/jEXuB0VKM0REWNXGobYXpOeLhsCRAH4zqeMK2K8EMHpYX1NNK/gHiRaYCrobVqmx0ft514tMW81b4uw0HXcvpp4C4SnFIP0DruMEWQW0fxH9oc8Yd9FQeDYPzaD1xJF5zv75nxBotKuTxHGQyzpcKtEbByMLK/8tp56Ei61hyW2aZnYlO2TreUxZ3Uo+1jprr8rAtSo62cwI4ATyLf72EhrOFaAE5jJY2+WEw2c2PmK+RYNtz0sO2ZIUc7UnIEOQQIXhKIYaE99Lh9dKrIGVAW8B9rAeQDmRejO5eu8vUIVFqAFzgrnnNov/ahY3waJV3sondgSj3DruZN5BvizVnrSDCxazOo6FKEvTaIv+rbIojSG4z6NXPwQDeSHYkHK0ogK3V27Wy9H2DIX+9kU0fm9CCju4+HFxin71YvM4whtrXKufVZOQd0UjmuLim6a+XnaFzy4bnDfBc2/1tGmz0dFs24S/rymXhOT7HCj5jFWjOeZgVAfMXA+/E4GcP1Jbv8CbspbEV5CPfD25t2q4RG6Atu5prjnq/gxr5ZEnskQb7ufGyLqMidTHQ9m5QE9Mn53pqrX/6/wDG51oWlaZzY6dMjVWvFLmnchMM2oRxLVQqTGyM0N7xy/KXwxU1powGL9CWIaZBynpiBMJ1JCdEWlt65+J+hRoyOGFuYrjuMJIw/aLesZg3UV7YSRPfonezq8gYA8E0zBkdrBtVeLdL+tGwM4Yjpple/q3+TlBwGghK8be+z/jlUZl2Pz3wK7THjq9dGzFXPlEM5yXczs/gKJ2i4Dnzqw9ofmIhvV9IgATVnB4ob9qxa2zRhztE+oN+RzDpZjAerQ4Ba7OU8XFJws1NgjSenPFRuspJhdghnhhWeNxZU43cd/sSznhcmUAX/q6zP+k67R7I6QtL+5HNyB/FSYVd6zipJxPivjO++fbvoK9/Ao5RSB0bJWl9zycMD+ay1+5sa7VC+d4uailMcJM484cUwCKUyIwzXc+tmRp9ZIp1tGQC3leCCS8Ga3kO7klbAcYp6IBw+vAff4a5kDFb8mtOr4IU0erjW8I2nDiLTFQoh0ZqbwVqlRjW6/6r7a6MqDLT4pBj054Udwy0Rm7VZsv6hj7S1LD9eErunFIv7qbbNbvYfRgrwiFWrrWnJRFuMs0BVFTz+bLZDbOOHpASM1uNYzakvsKRhoKe1oAvT5EAamk41TlpH7HOLCj3AKtUBORDlJtxPnMdihVUGxn6JI29ePQaGdFZsnXxH2Agf6I0WvsKPcEnTHqbLvF+OGvwNEMeJENIRZgue9m/joIae4J40Drf+b/OCzrXMVtqiW7yorM1xC7UUORutbnQh1UnHwsKIrSxRazO/tvTL/V1x8y16Ar/cGwtCRi3Tt3P5LK49Zc126q0NuYFfFHOF2/QH6rJaAWirxwqKPIy++YK0gz9kn2i10WbeMXWfz0Hj22LvOW3fbrwsijRspg2CiB3wqJaE1sTOCT9OhFYLijKADyBKIK8qkxFoJA6LKT9Rfw/greJzczzFdyVZK26Ll88jvzmnxOaZveVDz9YfZg7l4E7L3znylJn3hQKVPCktyyTXX4Bhgn29nhy/E47OZkdTZmpcn0K0zZdC4Zu8UpqXRuSYMzy70Y7cM062wi6OnE4zcdBi6JcZnaNxBzQbfvMCOhtDgUicWMEUM7GTMAGRSkVxhK1YEYCoyT873rNZS1D58WNlI2CKiWPNs33qIRWibjPmivabl61uJdyARL03RA5nONIf6mne4xcWS/9Ww+js+qWmX98BAcDDE2dc6rqXzjMZKqDRPKAKIkUlIfVZ21aQOmbpT+pwWkhxLm4TrqZ0CuWspio6Ls0HzpSeqg6qjlavHZnpZAEklo4YQsdrj2OAYhqVdzQVZtMGeQMIAbm505F2WHOBfDfZWRYImXhthWxxMCSqwSowmhG0W+kOiyH3RifB/GtqLDjHKKF1jfjcIMRple907OLdcv6HwZeCb1vuWObsVE5Y11Qc//FOi2KWwTnXs4ng0p42pd5CASs5IOEufPAb0CO0fxryWVoltGxxGHxjtnl2oM815YeN7INQFoD0R6bMSSe4k23s2hg/tF6gHRR7w==</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Key">
      <text>
        &Key;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFSBQg/pBQX51W2+SC6JFeQlYux5/aJVLXn3tCW+LRjpfAIianrkMuFLLZ95pGw6gw==</Encrypted>]]>
      </text>
    </action>

    <action id="Check">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2QFC2P1K/gBCoiwOZkDh31ai1fCIQGArLLgWYzIt0jkNsqh7ob8MrP2CF+e9X/+iPcOhieCfYFZERiaQJIh0XAUriVNnCzT+Vwgg2pcWDPtBSziZhbq8QqSUNUR/PA1v0Kjonrp9ascrICM0l79ryLadETLrITsr0/s3HUF/EP79Fx/T8J6noW8qYDdf1H4EhxQNO0osV9DAgzDRDjboC4=</Encrypted>]]>
      </text>
    </action>

    <action id="Cancel">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu53MmEpZ5pgveb7WI+K4EVyMyf7wf+YtiluH9VeBc75mymGHIwAZOgZBashqHvrXTFjN9VtOUrgUEphOvmJLwiOCdw1v1nKGeOd9FgFr+6TdQ7mGEixrZ8umHosR9UYEyU7ebAUfAM6C7MrdtuQgK6ZgYq2IvIL+IlRD9emFyxW1Sgeyvm0tKtHRgeW7wjELLY/DPgfA1HPrS90Qa28iFwsXzQv/8LdHEsyrRgshTFT8SowxCXcN5l6Ip+uesa9fN6/iv+H3bKS2b+6ZdAaDw21scQc0fzDBgQyIlEiTKcQ1</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>