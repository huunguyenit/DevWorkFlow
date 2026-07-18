<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY Controller "SOApprovalCategory">
]>

<dir table="sodmkieuduyet" code="loai_duyet, ma_kieu" order="loai_duyet, ma_kieu" xmlns="urn:schemas-fast-com:data-dir">
  <title v="kiểu duyệt" e="Approval Category"></title>
  <fields>
    <field name="loai_duyet" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
      <footer v="Xác định theo" e="Determined by"></footer>
    </field>
    <field name="ma_kieu" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã kiểu duyệt" e="Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_kieu" allowNulls="false">
      <header v="Tên kiểu duyệt" e="Description"></header>
    </field>
    <field name="ten_kieu2">
      <header v="Tên khác" e="Other Name"></header>
    </field>

    <field name="dvcs" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Đơn vị" e="Unit"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>

    <field name="ma_bp" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Bộ phận" e="Department"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>

    <field name="nh_kh1" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Nhóm khách hàng 1" e="Customer Group 1"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="nh_kh2" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Nhóm khách hàng 2" e="Customer Group 2"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="nh_kh3" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Nhóm khách hàng 3" e="Customer Group 3"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>

    <field name="tk" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Tài khoản" e="Account"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>

    <field name="so_luong" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Số lượng" e="Quantity"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="tien" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Tiền" e="Amount"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99BvRLo0nK+lfdcx3g9nYvnvq3xIpd8AxVdRSK7rV6C2t</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&mvgwyDUQYFhNUKqm/pw4S5STjo1oneywYn8iAjP6HiWJvSlqvjfvon5gcW0Lqsqw</Encrypted>]]></clientScript>
    </field>

    <field name="ma_nt" dataFormatString="0, 1" clientDefault="0" align="right" inactivate="true">
      <header v="Mã nt" e="Currency"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>

    <field name="loai_ct" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Loại chứng từ" e="Voucher Type"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>

    <field name="stt" type="Decimal" dataFormatString="###0" defaultValue="0">
      <header v="Thứ tự ưu tiên" e="Priority"></header>
      <items style="Numeric"/>
    </field>

    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="10, 110, 30, 70, 100, 220"/>
      <item value="1010--1: [ma_kieu].Label, [ma_kieu], [loai_duyet]"/>
      <item value="101000: [ten_kieu].Label, [ten_kieu]"/>
      <item value="101000: [ten_kieu2].Label, [ten_kieu2]"/>
      <item value="100000: [loai_duyet].Description"/>
      <item value="-11100: [dvcs].Label, [dvcs], [dvcs].Description"/>
      <item value="-11100: [ma_bp].Label, [ma_bp], [ma_bp].Description"/>
      <item value="-11100: [nh_kh1].Label, [nh_kh1], [nh_kh1].Description"/>
      <item value="-11100: [nh_kh2].Label, [nh_kh2], [nh_kh2].Description"/>
      <item value="-11100: [nh_kh3].Label, [nh_kh3], [nh_kh3].Description"/>
      <item value="-11100: [tk].Label, [tk], [tk].Description"/>
      <item value="-11100: [so_luong].Label, [so_luong], [so_luong].Description"/>
      <item value="-111001: [tien].Label, [tien], [tien].Description, [ma_nt]"/>
      <item value="-11100: [loai_ct].Label, [loai_ct], [loai_ct].Description"/>
      <item value="1010: [stt].Label, [stt]"/>
      <item value="101100: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMHsGyglwDXtpADs1rLNOrEuFL6L4hSbyyL8UgIBpFHW</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQuo0eS5b8e+DofV8FmhQ8f5+a3+Ekd+oxpqkqpDJ7hyMpfe1mwKYr3xhUriBcXoM1kw==</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDHwyWdnnAsOePGxNOFkX1cJTAuZkiCsA0+8sooNYWbc</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQuo0eS5b8e+DofV8FmhQ8f5+a3+Ekd+oxpqkqpDJ7hyMpfe1mwKYr3xhUriBcXoM1kw==</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDk7V+WCQCbTf5mLypqZov8kVtY8II2YjBmvmOHrFcrj</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQuo0eS5b8e+DofV8FmhQ8f5+a3+Ekd+oxpqkqpDJ7hyMpfe1mwKYr3xhUriBcXoM1kw==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcI0P/H+AZcpPJ+89k+Mq/qf1yOewTR1n76l513CG+Wh7</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQuo0eS5b8e+DofV8FmhQ8f5+a3+Ekd+oxpqkqpDJ7hyMpfe1mwKYr3xhUriBcXoM1kw==</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3aN/7PxwrNmja2J0eINLzr7zUf/9ZOjtpNZZoZqBHdQ4eiSJFZt8UQO0xuhv1ekTUzXIULZSAnsqnPlpdgAH9eHWHsctRfYk358BdR5JW7FqWAruneUXTknqG0/jA6NXj3j4rv+dFId1wkFhJsaxc33LxfZJQ5yFVY2KsuyoCsyougo+PjvfhnRzfu9zcwUjqlJeNomCMiQHbzBSnmMUlodBcCIQpYzLDG3oUwh8Zbl6Ek0SVXITvEGoKcjhvCNy+rj1Yhanf3Y9e5LVEIGFeyPz1Ya52bg+Tveh3lZRewRdeFkKW3fUVQ2vmavKaKtJuYytDrGMFMsOZ7GwY55SMHZJzR7BMLWH9clgirTwKvJGmWyyI52OpMFW2szaYJ0fWbxrNlwn7+/DVFEgQvcvl5pSUmTWxR2LsYGQhindsoQumM6M5AKa+hCbEJAwCRWnYHVbFbYhFOehl6mUrh6Tn3vhcVjSq4T2Ckei+a66f0XNKmVPYo9vYOC9/0y5syq0Dt</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5+QRWddH3AlR+z9nDTz+7CtLNQ+cQEl7q3IETmIc9aLMZMerCD8ONdiWCwVWcTGhwQ5kvrBnkYf6zr+8UdN6gdbcxc2vnM9+I7PMcpDax6xgT62oG5KNyyQMCXWhcGHjGRufUXYScRRU15VKd0dw6nynf1ZJwPmE26X32CeMApBw9zQdePbVI0dM/P4+bZM3aPNuCLpoxur+k3M8euQMEMjj2a1vHuQ615fXMJLYv9Dw==</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp9ozwmNWaFXFGEKfmQZvzteyajH68ocIMOwsjU3SwLQck3nl1IHalBUV9QFshXjpI/BbZVv4xE9PU43XkmJ5v/lW+TtDPI2d87uAlOKhCxnUleH97/tyFE1u4ntFe6ZDja/pSYwCX/NwOUuLZwCvQv0v0sElnvRIA3vtDbfn9TNnft9BEmQjIHsUoilI8giDmV40jjRKEotDRCbHKdkPI+heDr2YoTYbX80lsOapLotn+eB1Ouy4vTf+la2lieUEVV2mWySjP4OluHJPzhShttlmYLC5GemOJ+HLO1Ojm1cz4lv8N7UMw43XMP0BaxcjjxK3nnp7+J4zqE4KOj/m2k1y8HeJ9tggwNvtl9YDfEs3A8mcf5JeqksK43M/sqG5IBTm5El2Qo/nKd1O2RjRDs+VPh1e6dfSIwLkxS6wn+xpE2qtB8OV05kKB0KDZwe0NnMOGQ3TyhHMQ9TVUN6xs13AaEctyZoEC5ceo3atWO5m2viuHaY05F9i0HY7kXr7Z/vulfGWlHlZVhoHjSeus4+0eOW2A6rMOabUm/6QzCdxWwtqfXu8s1ibxKu2IaksklfEZTjdV3VCRL+fS1lrc3H1WFGxm7XqEx/X9AZO4MUYJKsRpHo7X3/HoArxUqo0WXd2PWTAPvUkbkTA3Xv3+Rbd0VRqXJuPv1SGtgbaJAFWLuKvJEjNSYZAP1ZSudfge7Qj9SR1vv9D5tmdNT8hAZTgzZMLtzaJ/pGrOR/jfs0G89rCd4XbZZMEyD4CJaK1qo=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XVxl0/FGUbGuOCRk9Y48XA7sNjN9jnKdqN4eM+ZfdAy/6qw984eCqcptDJlHylK85RQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6kEDHGc6Oezn3sNY4bKjH5qxEH/CSkkYj9fkTC6TbMalI0a3Ft5IBX9iIWY0VU/8tbD3PkyGkghNCTCX4EhhINycnL/A/ICvQW64jlOnn4t4sxCjdMTGcMefHyDE9ddHeo3qxF7qeOYoCCLk8B4rJ59jgq0B1r0p8hqrAIyl3vDg==</Encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22bSuNVcsiFY2XvyWSbeqhk7mWWN9vGjAWR5YhmM7AjFn</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&XBj6YDSBZrE7ldnLBomYrSxwArwbRx6xJ64RqQuObwSBNQzkR44X4xOY04DsJQgAaehpAJ0Cfa4HPHw6AiV0fg==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&XBj6YDSBZrE7ldnLBomYraWk1puRRmoNTnTG2cUDrmMEU0PPFd763XKrCGWI/8E5OSUFcZr3gql8b1amK+j0aw==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&XBj6YDSBZrE7ldnLBomYrWYBgYZJ5ko3wuq7YLlKUf2LDToYZTRDTETyypWx3klcwyLYMLU1kNZGnBqnK2DjBg==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHVIL7HkouhE65bfnddYX6NBNJm6H8Ylac2JEkMT38nQPfgTOp5gFqaIjPQrs33heAU+OJmAZu7IhPOST23vOC5E=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&XBj6YDSBZrE7ldnLBomYrSxwArwbRx6xJ64RqQuObwSBNQzkR44X4xOY04DsJQgAaehpAJ0Cfa4HPHw6AiV0fg==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&XBj6YDSBZrE7ldnLBomYraeFcFLaTHrXvpNd9GiL0tR+O9ldvzTwLVDnHCKr3M6gyiEDnO+wiczrWRQcyQyo8A==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&XBj6YDSBZrE7ldnLBomYrQiKBZ/ItM5niFlX7/stf7dZYQXtrDLphXldwDT0dX9iW7QsqS20sbYluR456dUH1w8Pe2+istLjuWZ1+SiR/ao=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHemLmDblVZZyuvFaGPTzKq8K9wbgN5j3pldI02fUnyOHmiRb1r50HQeAiDMza1aBgZW9CeHhr+ITMovrI39Ablw=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHc7X/84zX1ElDBQ0Oio9BYhpU71ALmfk5ffMVXbbEaC95FDNPuPVyyo0paJ5AWSXOQ/onvbV5bNXYdtHuIDX7H8jFKJNFaPszc306jhi5p99HS1Qv0eP8NdyIUbO1I6wkydyR8XStyMnqOjVK+LvzAqiPdge+2gteJgnKePIWc8FZYyfLG5ovouH6R/Rut9rw6dCLsaQ8o7+EHTza04XccZ+Ckw0/ll2Mo7HwVgkOMap1KWr566oRhJ4rzcGfskPTGlKd1NhhvpwsvXi4b1PxxbaCOuf9VIAuWfDTIc6nqKBJk0+/cCkONxxGlUtI09QpBowGQ/G2X4x0TVJmIo76EC82cHF4FkPgedPvHhFPoTZ9bksaGFQI6UBat45UeP/TAiw/VY0/JYxiVS8669HwCGIG1x/x350pLPSVAXrt6wG/L5EiCKOXvWRFosGV469dDYeFzy69EcUOOxwzQwbfBUtjyBZ6QXbL4wAdF43tQGdIFASuifUUqkqh4NGUWAMXZiMO6Waoxq03qVVJO8jtiCWqZQkegnikRdQkEwdUBO4cuz2QkRBwKbOysVW4j8+23W9pk1ITuwIL6cZri2b5arGCAffCACRB8EWp3g341xu9heZe9MeRiTgvYJnPRrzoJg7gUzikDdBLf84ry3/YckPTXSxfO11b4Ds1w9bXpmg1ErI9RQ3FMcpRQu+xnLvjW/+th8wlbdNbwpoTPhFfY+f9vO4roS+x7m1H+iAX1+4</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&XBj6YDSBZrE7ldnLBomYreKa4/FdUvAcKPIuh0/y3Rjrlmclj/L0qU1N/3d3Zz/7MAT+C/VXqwGwUESrNLqC69dnpkwxSghlg+dJ0avOTo1NxJ5tznl9mWYfqDZ5lXrXs5lam8S8+Ppp3L5gXT9pYhfj3AovJvebhsLdvRloo5d/Js2JQ+ojlFpEsn46zG08HfF9yvmVDxv6ZzuPeo0mDV9Uod3ySlf1sb7o+o8TjQTLUhzF8NkBa8ExOkewSnbX1PGZHklSG8YozkPZeuZPUl9ji8N8qbrUnQv4k347EfJkdFKNvQ4GAPIvTf+xsQ7yzq1LYFw6DEJtL4eCl/sM6A==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&mvgwyDUQYFhNUKqm/pw4S9LGEVAopVwJuOhVTfTTJQQtWAbQgfKdNN4lAi+WAtvpUUbHeb4Y8S1rB/qCYYOQlwfyuvpUFXDrMHl5NRwpg/CrjdgxPHOmpUe0Nmc6C6gJNiW4FwgmSgADywl1ydMwIwJ6oTQ3k2mvM5lkownl5XFQrGspFkZQMkcyfZYyj98864ermm/axWeA/pU8DzHwe5bYHE8dpRlrSIU9+d1xWK4=</Encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>