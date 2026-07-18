<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptQueryData SYSTEM "..\Include\Javascript\QueryData.txt">

  <!ENTITY % CheckValidEmail SYSTEM "..\Include\CheckValidEmail.ent">
  %CheckValidEmail;
  <!ENTITY CheckValidEmail.FieldName "e_mail">
  <!ENTITY CheckValidEmail.MultiEmail "true">
]>
<dir table="khhddt" code="ma_kh" order="ma_kh" xmlns="urn:schemas-fast-com:data-dir">
  <title v="khách hàng" e="Customer"></title>
  <fields>
    <field name="ma_kh" isPrimaryKey="true" allowNulls="false">
      <header v="Khách hàng" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh" key="status = '1' and e_mail &lt;&gt; ''" check="e_mail &lt;&gt; ''" information="ma_kh$dmkh.ten_kh"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99EWmZzmyyPzSIg4KVZBJbeiBfYISorX5hKkb6kweqWCjfXQRFlk7XAw1nkNmkV56VA==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_kh" external="true" defaultValue="''" inactivate="true" readOnly="true">
      <header v="Tên khách hàng" e="Customer Name"></header>
    </field>

    <field name="ma_so_thue" dataFormatString="@upperCaseFormat" external="true" defaultValue="''" allowContain="true" inactivate="true">
      <header v="Mã số thuế" e="Tax Code"></header>
      <items style="Mask"/>
    </field>
    <field name="dia_chi" external="true" defaultValue="''" inactivate="true">
      <header v="Địa chỉ" e="Address"></header>
    </field>
    <field name="e_mail" external="true" defaultValue="''" inactivate="true" allowNulls="false">
      <header v="Thư &lt;span class=&quot;LabelDescription&quot;&gt;(Email)&lt;/span&gt;" e="Email"></header>
    </field>
    <field name="loai_kh" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Loại khách hàng" e="Customer Type"></header>
      <footer v="1 - Doanh nghiệp, 0 - Cá nhân" e="1 - Business, 0 - Personal"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99EWmZzmyyPzSIg4KVZBJbeibmUKxxoSVfwbd3hk9IPJd6q73LTGqF0R/L+ymUsWPBA==</Encrypted>]]></clientScript>
    </field>

    <field name="ngan_hang" external="true" defaultValue="''" inactivate="true" categoryIndex="9">
      <header v="Ngân hàng" e="Bank"></header>
    </field>
    <field name="so_tk_nh" external="true" defaultValue="''" inactivate="true" categoryIndex="9">
      <header v="Số tk ngân hàng" e="Bank Account"></header>
    </field>

    <field name="fax" external="true" defaultValue="''" inactivate="true" categoryIndex="9">
      <header v="Số gửi bản sao &lt;span class=&quot;LabelDescription&quot;&gt;(Fax)&lt;/span&gt;" e="Fax Number"></header>
    </field>
    <field name="dien_thoai" external="true" defaultValue="''" inactivate="true" categoryIndex="9">
      <header v="Điện thoại" e="Phone Number"></header>
    </field>

    <field name="nguoi_lien_he" categoryIndex="9">
      <header v="Người liên hệ" e="Contact Person"></header>
    </field>
    <field name="nguoi_dai_dien" categoryIndex="9">
      <header v="Người đại diện" e="Representative"></header>
    </field>


    <field name="ctkhhddt" external="true" clientDefault="0" defaultValue="0" rows="123" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="EICustomerDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: ma_kh, ma_kh" e="String: ma_kh, ma_kh"></text>
        </item>
      </items>
    </field>

    <field name="status" dataFormatString="0, 1, 2, 9" clientDefault="0" align="right" inactivate="true" categoryIndex="9">
      <header v="Tình trạng" e="Status"></header>
      <footer v="0 - Chưa cập nhật, 1 - Đã cập nhật, 2 - Có thay đổi thông tin, 9 - Khác" e="0 - Pending, 1 - Updated, 2 - Changed, 9 - Other"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="184" anchor="5">
      <item value="120, 30, 70, 100, 230"/>
      <item value="11010: [ma_kh].Label, [ma_kh], [ten_kh]"/>
      <item value="110: [ma_so_thue].Label, [ma_so_thue]"/>
      <item value="11000: [dia_chi].Label, [dia_chi]"/>
      <item value="1100: [ngan_hang].Label, [ngan_hang]"/>
      <item value="1100: [so_tk_nh].Label, [so_tk_nh]"/>
      <item value="1100: [e_mail].Label, [e_mail]"/>
      <item value="1100: [fax].Label, [fax]"/>
      <item value="1100: [dien_thoai].Label, [dien_thoai]"/>
      <item value="1100: [nguoi_lien_he].Label, [nguoi_lien_he]"/>
      <item value="1100: [nguoi_dai_dien].Label, [nguoi_dai_dien]"/>
      <item value="11100: [loai_kh].Label, [loai_kh], [loai_kh].Description"/>

      <item value="1: [ctkhhddt]"/>

      <item value="11100: [status].Label, [status], [status].Description"/>

      <categories>
        <category index="1" columns="566" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="9" columns="120, 30, 70, 100, 230" anchor="5">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDHwyWdnnAsOePGxNOFkX1eUUYYArSMjnyUfP+DyW7qMcjRxUL2d4OL7/EUMZuM/v2BOOU+pWly817XFlQJMmQM=</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDk7V+WCQCbTf5mLypqZov9dcqqE9iEgZ6gKU6cb4/feABrlbE93xzcYA3gZc6cPprICF5MC0muW04vjHYa68tA=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcBYezWCrEMH1fHatEHfnpcdxZ+LLOEzlyLgePEVa6nU5mBmayX40Fvk6nrMnFhicuKNv0RXhfsIuKpgH+4s1hL8=</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3af99XLCv10PE39uENjugvgjGlsRTUGxoPhirmhCio5g+oL+NiiXRbfrT4zEroRgNImG2QfjSsW7syhtY3PML4OQ0NYozLjCuCGxcYQ6FtM8JiUaypuYAKgMksWL/vLjeVyybYvrKZbvUwn32ZoKk+7MemgVAbfSM4AlHtpMmE4ZrEtOguc9mUgxsUgPLGMKJmNV4JqPowAbkvhgIur8/DBsxBGYmKIyU9vcHNSjPRxqPfvmZqelfAzKh9AseOAS9gjN769Ussb2+JqH0TdQRTnJFLwtSRgMSimfggP9zdYKwSgiP5icYPZ+1LTXvwKQHgDQL56FCHUutc0lg0QJN9fzEXJCz5K5uoAHmG21z3kc0HLJolRPI6iVuPF4Hr0pw3bo23bHi6bcjXq+AsozfF+DiVeHbJDL9vZ0IZ06WZ7Wz4xfZXUsbKmr4zpniiVll7</Encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcGwGLC9Bf7Fyqz8roVUEQhOesvCb07qDh7NULqfkAtVkcDKPCmd7qwzUeBu8B0/5Qc/187oqRPl6DlyG9q6bwy7U/SAuJhfEv81MYcgNM2ihr3kPf6VG1FET15tbo0DWwYkIasOnhAYRKLlui+TI/F1katSBRpNJljQPnkFTL9Ivol7/w56mjLw1xeSD98p1Ww==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcK9EEIccT81J9OIhrIYMMYF9jnbxFVA6jhcLaqKVPcCWm+Q9ptVDlggmVjmGAMLdceq9MTLLRJ5eUHFGeBVyCYI+3oen9/wmBdoqRLwQLOlqZuVnsPEAGr7V5AYyKJnQAfUy4bPmg0BJVkbkg/KtlMbCyktP+XxllbaWWa7daytUwyP4cmmvPP4F4cllRbJwuu+b56UP6UJi1g77f9QeJLO+r3DEUvTaHvgqBjBp8pO7RNYi5c6tRCVWl+zeMpcV0jG12w4oidOqGoKqLvA090M=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcJb2Q7Fai63M+R6+tx0rIvLLySJ8mBYQkrJOn5QvJYx3zq4FeqeuAKhP7RqOMHIkxA==</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcJ4pi3WeCtWXiaJYp0Qx94bBl1oaq94fkTMUE7QbtmbC4l3cI1Ht7uJtXxWJTKMD8SP0VF//UIj0LA7m3R3szO2hdx3SyUz0oiSwrtkgMO3SOhiZQOeHbe0QHt+3XYNMk72KQqBECBLMx5Uv7BNWVU8w4lPXBkc+GUXU2u2/MzGPFYFZGE2EfekztZx2sH5s7CduZiYSQQvUUgsWO8ApNokikGjR0REb0G5rpeOhL2XrXA3KU/6Twrx3cledhEltgbaNC5f3LOy0lEaNY89s1X0ZkJxEZZvnzwP3tAxAr/bixfR3Y9CBuNKARAPMnMagPrzXic02QX6iONvcpsUmfazn7brUs6z9iTtNkcekRPnkwLz22t5jAdurQ0HpJUjxCs2YFpaaITDcg3jVTRvcoUw=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22RRDLlPhPk4uDMi6o7xKy/5UHetELRZo2KMJxM34E1SzR2Y6NbmzOOpnXa8JFAAu5PMMd0Ebf2EAJLbvU/IGaCERyvfUqS+ZWqLuBnRUR4NgdcCJ4opEhD5H5LaI1emjFy0esgnlAIqWPCUXTU6rwSrPX+aadWnrq40r+lXHhAKQsrql1Ask6XTUYmf5KLXehYZNFScaJQMvDS9MfJdGlDOw/LuDUBQoS2dUk8sQs1sD8QWi/QzVOn6oZYjhc3MC13j8IWCkvv7UjF8wIaq76NU=</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm64k5afzpKCfXR9cthu0X8MWJwxPTg32B6I5dF4YFBG47X4qNBvvCLguYrnOJBq7UOw9DGh6EL48CoxFjTubtQkK79MMQhqddpQiZ7Js5Yu2YFz0ca6ZHHDqlKWkdWKxW212GZHiG8Jjhz/AUiI+DRW</Encrypted>]]>
      </text>
    </command>

    <command event ="Checking">
      <text>
        &CheckValidEmailCommandChecking;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Ud0j32JkLYfRF+ohJHRwpu6n892IuTkaNg1uSTyWCb89uqx7FKYHc/4u6tB7pyul+AgTrErbshdIcI8Yxa+O2kIsfoDREwWZABDs2NvwOzMfYIfUmgrLKOlUKvqWnpcIf8uwD72hdOg8KSNPDfN2y+WKN04FJ8wd1j/0RET7QtNJL9b1kM9Qj4y1XzOpHVHEk0EEN53MdT1k7mERuyIswQUP/J8EHBcZ5rKj0JsrqR8XNQN2tDa+xIrRXdIxMp4V5fiSg/s8n/U6upmVR91vMgmIMUlUKYnSkyKjhl1pYkirM/aE/4rpciLpCayFGIrpX7jeUOd41SiwEYNQ7hYLIKrxE+aTKqjdugxTivkVDzktY0vmE7fz7gKCtdqvyz9Ehr8nXWYW5+gWenr87XnL24UiQBX9DuVU1Xwta39p0LN/rwfX9LOkLJeuFPcbUBVB10uhHaA4xJk/Vz4c8fIFWawLOXzGxo6/wfHhjeTcJMNs9JuwCR9h0YfxsUh5IB8zN01mAhJOVKV1uzeAnRDgt2jmMESqGfKhxQs6xytEirhKH0JAd0nbUfZOfcUk5xFEu3j+b/e1qZBF28UJa5yOqY+GcK6ZKqMV6v6YkLH2FBlvsbojr5vHQYAUa93EqRT2E4pBI/kLL33pmcp4UPl5o31r6J/uIhvPtjY6FscJMefzCokrNHqFmzimymdECgZZR37JSMD9s2rbhpP9dq/fdIi8AtVk6T56nS56Y0sf04H</Encrypted>]]>
      </text>

    </command>
  </commands>

  <script>
    <text>
      &ScriptQueryData;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtcAUfb66fjyY5BPJCotaasWQmqbPvrirq2cqagZDjPyh1ijVHwvhwWe5hsjxEAy5PiLSy/Pc8TMeszCiqTYBcArfkWJJwnbhvjr/uGIDfICaNZvQcs/IMtV9MYVxfykJ6PzEc0Ko0NcYBGINuRFaZAqwp4CHAssiXlxeCHMJHUSkOBTWKBUqsiPC1c5yDHqRigkHsfpC/xP8P1eARNUQ6gbVSXpXxdIJZPp0Aa5U/gNKNzY4VNJFV89hgXz/ad17LyNJq0OV9ID5qWoiZQmZGLirnHVzKRu+o0OxnwdtBgXzuv0YGbemV09WWnhvC71Hh93MOIf2W0sYLZY1LjyBqj1x76LC3fWuIVqboqsY7BPNioQC/Pp5Hprv4IOZjIWjxKSCAk/SCHfHq2UUWehHu86V/FXDHOgtifPC1knZKDSsrfm7Kts9T6qtPIMmFOZPeswl4b1wOMZeizIjoBoaDKURCAOeknfxOVOdIGhRu/+csp6iJqzOIAzz96EC+o79vYrhrFyCGYPoEt3iHnqPg1qgvldL4tK6dUYtfytPkUxM9HiljiTk+6+fAOvW8Ke4mvRHqI+hkFiHsaPdxqzQYySy3iMx2qCmVDNrxUyZvph7+4gHMbTE3iyBZEXCHRwe+n0zsIJB4m5KfETrKOiQdGvQUNS0Y9RTQ9woiGfYgasf0OjPx2CYO/eGoVaWzCRM9P/4RHDABO76E6nY1G6ofqFW4wRv4XTa9dV9f0wkNTM7Da5nCgUieOKllzV42frHXVYg17YEu5q96FbyDUYraPbEc9ezTBpSGvBt9voqoTjDhkAiGui5FaZ4Jm7WE9uwYAZUr860d8r88E58GmVXjbXlmwJdaq/ZV3fBw9fsxfMW</Encrypted>]]>
      &CheckValidEmailFunction;
    </text>
  </script>

  <response>
    <action id="Customer">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4YiJgq+FatkzqY/ZrQ0EqapXv2dF/zPQRP5o3OalCwdVgxrEYCX9SAAH/FJ1PeM1pq9jLx9ENFh0E1I9SWiNvD3BDFU4jhbOUMWkftymOdhwKfzhekuoTqNwvD7isx6Weg+Kt6m7Ew/9rbPc6Ib13+2Wgx/jzUnxAxPvUA6ZVj49k9VHKY/jAy1q4BheUB4QbDYTK9gEcVxHb8XxCdfsGE/S0MW9IwaBB+nYaikd45ww==</Encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7J6iW+rNza+5w/hJUSp7FwSCpQubG0pWVg9rCq/Kjn4c7hGop1GYU+LktFzdhYbRA==</Encrypted>]]>
    </text>
  </css>
</dir>