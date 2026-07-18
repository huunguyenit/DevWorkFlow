<?xml version="1.0" encoding="utf-8"?>

<dir table="dmduyet" code="user_id, loai_duyet, ma_quyen, ngay_hl, ma_bp, ma_nt" order="user_id, loai_duyet, ma_quyen, ngay_hl, ma_bp, ma_nt" xmlns="urn:schemas-fast-com:data-dir">
  <title v="khai báo người duyệt" e="Approving Officers"></title>
  <fields>
    <field name="user_id" isPrimaryKey="true" type="Decimal" disabled="true" hidden="true">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="loai_duyet" isPrimaryKey="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="name" dataFormatString="@upperCaseFormat" allowNulls="false" external="true" defaultValue="''">
      <header v="Người sử dụng" e="User"></header>
      <items style="AutoComplete" controller="User" reference="comment%l" key="status = 1" check="1 = 1" information="name$userinfo2.comment%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99KUN0KY2RwKLnqqFnI8XBPWq1EvCzZXfjnmSdftpeTgBtnpnI/lyljpU99SoKm4Sy29y4z9dsYmv86hqTDmNe1Y=</Encrypted>]]></clientScript>
    </field>
    <field name="comment%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_quyen" allowNulls="false">
      <header v="Mã quyền" e="Roles"></header>
      <items style="AutoComplete" controller="ApprovalRoles" reference="ten_quyen%l" key="loai_duyet = '{$%c[loai_duyet]}' and status = '1'" check="loai_duyet = '{$%c[loai_duyet]}'" information="ma_quyen$dmquyen.ten_quyen%l"/>
    </field>
    <field name="ten_quyen%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" isPrimaryKey="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status='1'" check="1=1" information="ma_bp$dmbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" defaultValue="0">
      <header v="Tiền" e="Amount"></header>
      <footer v="(0 - Không giới hạn)" e="(0 - Unlimited)"/>
      <items style="Numeric"/>
    </field>
    <field name="ma_nt" isPrimaryKey="true" allowNulls="false" clientDefault="Default">
      <header v="Mã nt" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status='1'" check="1=1" information="ma_nt$dmnt.ten_nt%l"/>
    </field>
    <field name="ten_nt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay_hl" isPrimaryKey="true" allowNulls="false" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày hiệu lực từ" e="Effective Date from"></header>
      <footer v="Ngày hiệu lực từ/đến" e="Effective Date from/to"></footer>
    </field>
    <field name="ngay_hl2" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày hiệu lực đến" e="Effective Date to"></header>
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
      <item value="11010: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="11010: [tien_nt].Label, [tien_nt], [tien_nt].Description"/>
      <item value="11010: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="1101: [ngay_hl].Description, [ngay_hl], [ngay_hl2]"/>
      <item value="11100: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuykoibraUdztjPAMQRzUChskj7uKEl2JIgemNIyLP8BNHURqI6xw9hggnuSSNdJ4ehxGTOj3msBG+nQinIgHsRFJyMtr1PQmTr/RG/IHWrH1yzs8a/V0Wxb3YjlaU+RzJbYN7gjd0zKBy0MD3Jx81R7ssQtSIcHhrzq7IGIiOdtBsw9xRWMURvA6utg5UPEFMXehi0ots8QJ96pBOSXykKw=</Encrypted>]]>
      </text>
    </command>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcOexaTDrbc0yE6xwPJOFsOz34r6B281WwzbkCimquF+P2Z7vwq9plJu8dOT83Jex7BsQKHP/A/voFG1CP0rjxQfxhFt+3NBZLhsaGqfYATY6</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcOexaTDrbc0yE6xwPJOFsOz34r6B281WwzbkCimquF+PxH8Pwv7nq5Ds1hn+xQUEBis34fZ1dzH3Min8D3XjjHgKXq9Sy/ZLMwo6iILpWy1b</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcBYezWCrEMH1fHatEHfnpcdQGWr6GhlrXosmbStQL+jsEX1K2xp7g2chlL06zpEscYZ4q9IADiTQ7cUA1MaptRrk7rPSbYowt3GPHzWhoHCp</Encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcEj7ZYwJaqtWE8gGzNwLdQnuoaT7ZgF3w/QWnVOfAL8Ce9UYH0VpHLGWkh+thiqj/vvZ77HvBuW/mX3RgH8rKr5kB3vY9sOQILE2jCTn3tzwU8BTf4K5WlDT8yBPR8vtfZrBjEJYVqgp6Q6+vSPWlwwdfCRfwm9sRnXS1ci0zvejL5bI0GPwwsRC+oLiS92pViqCcs/lZBNMszQ0/iAKu/oFC1BSR0MM92XupWgEgK/K1/hQeENaoegj5G9l87liew==</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuxyf0wrWgS6+6Mh5oH71UgWYKCEru5qUcqJHGcNMH5F4giRzqbirt8elGqdC2zhVa0hhPWKCzpCdCFIa1Fvua3qrKgZJLhAx43D9JYas9KiKLrH0NsjBNUv3BgbOwKzITVYnhP5nnMqamQxYU+0a97sQGXnXKB+62GBN3HViMO3oqe96gALzy9BvTBBkxS+vZqdRfuUTMC+U9d7B7fVg2lfrJRR4CWsWTxCO5yWeQ6A9e+iCnKyw4ZhlGYiJ5/zmvwzTbmA7H6+xMJemo1VziCr8TyR56d2ucgb6iyf54nmb/bwhk1DuFUmKes0mAhdKuLGXzK44t3Gs+BOtDsaMKlu9Bm8DJyXIoCOO3tnFf2U3oPk4qv74mBsHKUII2RzyUAKrSFTIkNNLW8WUIm2qpGYGBcY43POroJECmW59A1+23Ht6rtKXa4z3fWfYst7PTCQANXbh5mCu7tDrEQSGW+4WAfjhdhhJAcZN1jQspOklnv0Apve837UR5lge01WnVbfEQLW4cwZQ6ON9RMfxEjn7h5JsaO/ukSq+ow4/Pt+uOsZpUq14urYoUcNHwsySnof5qFF6CadpaWDMxnMDx5g=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5+QRWddH3AlR+z9nDTz+7Cn2CE+SB/Scr3/81VjqTDqOfA4sY7KunnNx5NswAj7+FojjFhllHPKtthQl59uXVz+3Am83blScUJFEY2Ev3HVYNxbfx7Hwy/JfzYrHkqjbJkVAm7ho9N+yWeJao6N67OFc29jbgIT4R1jCyMBKiQnJtYq89Lv66dwd9sR5FMWp+QiX6Ltw6ZnH29wSCG18xUKQK/Fh9+Ot4iy7R5Ibuz5Zvi/JOVXM90rfaqtN0/+ncf+bTCDUf/oqolgty6RYtMPbeoA9+k7SHJgzFRu0px3ZHuK5T7Pf0uxOK9O7tNfXyEh4sAywVjmdCt2a90b41lR4N5XrWSsJpwrWWP0S0v7EPiTMxlsuCiMEM8zeP1mai18D6uKPh1gmjg0OQOh5NC</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/4os176twMEBdY0xyo0KN0V5dncAZ1CpKZ7VSblFLA9OTDXHXiRpgOmfUR6mMOFavN5oFFsRE11CkOxSsA2OzUsX+i3F1rBnj0mcWsB8mAg+XN3ZwNz8XxTQnXCinyriY7JdBPi4DQBX+qiY8FtdLE/NE1x4uVEpr267T66ECD+VEPuxoHd8/h551swOD9d8z8rLFWZKa62RPpHMpZ53GMiviyW0e4qs+apThtipI3llJI4HrYkfx1qTSWsoA46oNj3IqYE5+0ngSEBv7T6hiipXgrbA6uZ/KwVlA8YuL04BFh4ayq7ajkWKNTpOqCIqPMk6XJ+qN2AMp2CdJBautYbcL8CQyqe3+lkokAH7Vq05k/O/nTC+dp/GmLGNrB6B85+y0vvFUl+9SQ2vLH9vKJ3ZVKZKfARPVsn51/7/Ss//Vdp+oFLGo23gxXBIdnr74KSbttMlZ5gcnsQVmB8f1/j/ez31RtxUH1Zy5d2e8F3qV9/rHoR0RcB27m59o/8RQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XV+asbSvBt+EA7QD47/4wbZ7kQTiIMYHqhaDfMA6pucAc6uOCgVT25WO1xJA2oVUwFou0ciRx1xLDRNLNFdMcAU1zLGvthQR5/PXEfHwQerbO</Encrypted>]]>
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtXJ8tCm6EIndL0xkZxNhdcPBahP6df9SHASz71osq5GoJA39JXn1ecbtncp3uqnbFtBWYNsGAvcMnK3DNIJUDHJSssvcirzHgRHFG2efg0YFA1eHN5J0xF9qiIoxcveEg44lIOIYqwXbmxWNZXS8l0kE1kfMoA0xUO8cTJvEPUHG6ueuoAZM0tUrcXBB6ADs7E8s0p88yjzLFYkZj0U8kczI3h2Zds+eYwWqGPy4kTpK4o76rAf+jgqzEypUlTUC3XOTbwen18ab49N5xW53JRNbt5y4KJR4x9IpAjDbo/O4FhFjQwTlgO32irM3wKS7DMQY+CJm5xA6jMqTy3bSKxonFdsEOEqeTPdSuwfIOO3w2D18ZYmum10C/YXqhmHEFVUwbB+JQ8LZWU+df/1S4bjgLQhRQIJ3d9gHWRwaLS/A2acOFYH5hezxuiaY9woHgcxQ9YfKjzXj2B9wx0xERhGiAWZWjLxTyc51MSkPAqVGp1W8wEV+MBO835mdT8IGFc7iLA/B1iLx+0RHI8dhkKp7Mjs+Nsgzzsp0skVSeXRkRSKb8G8nflcEXvs5E7x/D3Tigb2zuxjont6qe8szrg7Le11AGfWok8GaBPppsBi+</Encrypted>]]>
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