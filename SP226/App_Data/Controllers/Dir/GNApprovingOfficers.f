<?xml version="1.0" encoding="utf-8"?>

<dir table="gndmduyet" code="user_id, loai_duyet, ngay_hl, ma_quyen" order="user_id, loai_duyet, ngay_hl, ma_quyen" xmlns="urn:schemas-fast-com:data-dir">
  <title v="khai báo người duyệt" e="Approving Officers"></title>
  <fields>
    <field name="user_id" isPrimaryKey="true" type="Decimal" disabled="true" hidden="true">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="loai_duyet" isPrimaryKey="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_hl" isPrimaryKey="true" allowNulls="false" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày hiệu lực từ" e="Effective Date from"></header>
      <footer v="Ngày hiệu lực từ/đến" e="Effective Date from/to"></footer>
    </field>
    <field name="ngay_hl2" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày hiệu lực đến" e="Effective Date to"></header>
    </field>

    <field name="name" dataFormatString="@upperCaseFormat" allowNulls="false" external="true" defaultValue="''">
      <header v="Người sử dụng" e="User"></header>
      <items style="AutoComplete" controller="User" reference="comment%l" key="status = 1" check="1 = 1" information="name$userinfo2.comment%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Pu1Wt6Lcc1gM8cs7KJkOerGdlXRXUj4WYChjEocly5fmMKyMxhaOvqMyj5X8rn9vWQ+RM5EuLYPyNnQRwj0b0Y=</Encrypted>]]></clientScript>
    </field>
    <field name="comment%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_quyen" allowNulls="false">
      <header v="Mã quyền" e="Roles"></header>
      <items style="AutoComplete" controller="GNApprovalRoles" reference="ten_quyen%l" key="loai_duyet = '{$%c[loai_duyet]}' and status = '1'" check="loai_duyet = '{$%c[loai_duyet]}'" information="ma_quyen$gndmquyen.ten_quyen%l"/>
    </field>
    <field name="ten_quyen%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230, 0"/>
      <item value="110101: [name].Label, [name], [comment%l], [loai_duyet]"/>
      <item value="110101: [ma_quyen].Label, [ma_quyen], [ten_quyen%l], [user_id]"/>
      <item value="1101: [ngay_hl].Description, [ngay_hl], [ngay_hl2]"/>
      <item value="11100: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuykoibraUdztjPAMQRzUChskj7uKEl2JIgemNIyLP8BNHURqI6xw9hggnuSSNdJ4ehxGTOj3msBG+nQinIgHsRFJyMtr1PQmTr/RG/IHWrH1LGfWRSf+QDBs0e+entMqV6r7D+1Zg8Pv+CB0qQVkNvg=</Encrypted>]]>
      </text>
    </command>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcNyilImdi9RCub81hubuaw/Qg7Dp2o8ibJpxmo84G9HyNP1YBNBgLWOq0Qb1vp85ML8i6ll4RGgUK2FSCZiWY2U/C4ED0Zp2axvW41T8baQq</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcNyilImdi9RCub81hubuaw/Qg7Dp2o8ibJpxmo84G9Hy4o/WMFP5YjzN3tYWIGD6Uv+N1iQak5zaaXlVK2u4aIUnZIiBhld04h/W/+2/VAHO</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcI0P/H+AZcpPJ+89k+Mq/qe0S1VxFy8tLZibHVrpa0INFSg2MZ9kmnxMU5f/h1iQ/PnaiJKHMdJrrrvob1oIeJX3Dr6jT7qfYV0SrkFRIE84</Encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcEj7ZYwJaqtWE8gGzNwLdQnuoaT7ZgF3w/QWnVOfAL8Ce9UYH0VpHLGWkh+thiqj/vvZ77HvBuW/mX3RgH8rKr5kB3vY9sOQILE2jCTn3tzwU8BTf4K5WlDT8yBPR8vtfZrBjEJYVqgp6Q6+vSPWlwwdfCRfwm9sRnXS1ci0zvejL5bI0GPwwsRC+oLiS92pViqCcs/lZBNMszQ0/iAKu/oFC1BSR0MM92XupWgEgK/K1/hQeENaoegj5G9l87liew==</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuxyf0wrWgS6+6Mh5oH71UgWYKCEru5qUcqJHGcNMH5F4giRzqbirt8elGqdC2zhVa0hhPWKCzpCdCFIa1Fvua3qrKgZJLhAx43D9JYas9KiKLrH0NsjBNUv3BgbOwKzITVYnhP5nnMqamQxYU+0a97sQGXnXKB+62GBN3HViMO3oqe96gALzy9BvTBBkxS+vZiizjxK0Tc0GEXZaAnS88tR4G2b9ZX44TvZcp9RbbTnX5SmUkfR3MJHkdhjCPRejc3txbPp0DgiOHQYM7Jmp/kRU76rGgQCbIszXUw9/wQw1r+JDZnYxsy9+qvC4dpvI7j01hA+2ePOnbTh5jkrkbgSrqRqDZ1u21IYKkUi3qMysU8b/tWdxH+zOuBeodtdJ2TZvPIFTD+N74iqfBgXSE2SkSLSLSuOobr9Mm3h3lg7/WWJ98q0YzAaId4VHLG2raO2O5B5B0aso/XRn7u/EhONjPsOk8B3IkAH7QXnml5sR4dXhTV77O7CkD4j3V/ZB+5LRnKMkKVdTtHP2rCH5U0Q=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5+QRWddH3AlR+z9nDTz+7Cn2CE+SB/Scr3/81VjqTDqPEyc94fH5z/HqQQS2ltXD6KuIkG1SfHjUkpsAzAtZnjVzyd5LIgnzS5KSEdtt32D4AA61mglO7KYshQiTMQ4wSk6VJzS/Eml82O298bC/I/qpFRnFvVvprzPthhQ+kFBdQSyloTGF8WBsYPusj6kNbt1qWUtbc2sk1QtnxdvqiR44hbvAxgvJC8R+38gls85OO2gP0cP5VQKzzpFXum/ZvIYIyX3XlM6g6wuE9loeWO31WneaFtcpPVZaISI4EkAjE3tTKn1A4t8b2StBfWzQ+RGm1zyCd2ml+mQ0bE7cU4W2u/kOczQFypE9XNJciXgg==</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/4os176twMEBdY0xyo0KN0V5dncAZ1CpKZ7VSblFLA9OTDXHXiRpgOmfUR6mMOFavN5oFFsRE11CkOxSsA2OzUsX+i3F1rBnj0mcWsB8mAg+XN3ZwNz8XxTQnXCinyriYoguw2teYylpbrzTgs4FN0axzy234hlsPtmVbf9CVCL7B3EgwMVU4t6RAdMQlHhAF8veb1ZZTg1mEzZ+Y090yQ0y2A/lPJeuKAsKcLodUrPFTjbyXB1Mcn+3j7rLTVE1KfWWilN8pLlkVW1JgMHIlBblJOR0VrRE5wDHbk3cVS4bQcsI4yhdTYjad4k/IWVtfMPDouanknJXzW1bKqz7F84z1L+q9UQYxywozIL2+6DsEvDKxK7PmmepKVnPw87xqKb0Sa76AIb6N1knXV2GP02ub/7VhbGCyBwa+nTtGKdjiIPqOnKkJukP6dAWmhwMptrxi3eu4FJ3nK72k/B0j0=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XV+asbSvBt+EA7QD47/4wbZ7UmHjVfDUncJq+pJtlf1NiVdWot/03WDDwtzTe7XJ4nGgz2Ji+WjEIgMT+UqC7RI8=</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2EcDIe+Zgaq9K5PJOweTML4UrA3nmtjl+RBNgk6iSYuImOsy9/CHcADRw2vlao0wCt/+A9Fsk1nLFpEusqDuiugCFhzVI7Urads9TMK+eELU84mshhjFuORdgovgxzT67ngLQ6ViCxfOpt5Wi+OGd+JczQT++NYzy4P+NVzIdg+r5CjB5qpx7ad64Bp+kKwKaTWeV2xVfFUiD+05ZZsNdewpPz3F3ghjk24c/PyCdn9DqTJBfL8sb00XbkHcMb41fEvTfoBIu2G8Lc/cfy/u5XUUIxxU56xJa65CwCHlTem6oS5lRTHACrXvfCChZYvivemJPjz3o7lzQ85Beuocr4n8DRnRyrGn+u+QKgtB5qANE3Qzt4U7RkWG+K5ni9rlovYuC2EbBwSkItHHkiYHLObEK/hfOIGMtqKYJVvHclCv7ABLt/4XKsWvNNOvIvq3HjZN4d0x3OXDkKSQGwdCeqJWM5T39z/4tLSS8eDVbj+Qa</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtWzbf03r7IR2Ts9lQLMrsXtwBQtTCWlfYc0uE2NGtdAinmxHCJrQ+pzchx7HlH/CuurxenwtoYD4uVrt5ksm9lB+fdvlAlhSr1WQsPc6l9uHSzAUgiaznrqFtjrNo8eteqJpT/hPCGUVkz/BYxUR41A90nEtJAkLCTOpGDgAPBRi60cErgU6L7xM3fNyAtD5cVWOG/3BAqHK1XM5uN/JuV2jrQ/67VBVfP01A498NZcJXFHDrUrXr44lsbhbEaVdI4LUA2jZnVYgLvofGxxRwMu+rwoTTSNkpRTvaZfcU83fKM//4rh0ow/sRyvWdyt1Oc/by2KYSJHipsEebDhLlL4QsLNd8lLfGLaKSX+HASz0nPC3ulHTMIaIRQsY4WYOm0X2ngtgl0MJheTxQs6JDu6jjrsNiEc+Hkb3GmnXU3+XPwpodInGnMtRwkbgxDmTZgHbRFEbQnhyEm5kvpgcGxNF5jgsCzhTJDd+KfQ7PzTnopDKWy5RQII8ckFJJS4SEUpCtjKTS/TR2ZOUn/O6raw=</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetUserID">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4axea3rs9GcwsMhUWTvo9nfXnlW5hQgEeyZG9SNz6jyDb2ssSnAoC8dpo5+yf3FbJnUb4utpQ2w8Mpd/+c583WwMxbQvrgWjCcsQhQJkngvIaC0af9ZUSZTg/HLcGn3W4=</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>