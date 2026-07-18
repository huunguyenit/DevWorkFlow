<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "hrTimekeepingUpdate">

  <!ENTITY ControlFocus "ngay">
  <!ENTITY LockedDateKey "ngay_ks >= @ngay">
  <!ENTITY CheckLockedBeforeInsert SYSTEM "..\Include\Command\HRMCheckLockedBeforeInsert.txt">
]>

<dir type="Report" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Thêm điều chỉnh dữ liệu chấm công" e="Add Item"></title>
  <fields>
    <field name="stt_rec" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" allowNulls="false" external="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten_nv" key="bp_ref like '{$%c[bp_ref]}%' and (@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="bp_ref like '{$%c[bp_ref]}%' and (@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99BeQqEwYHzOzSzZfI/zdFklaqYX6CAwpNUoPSc3sDve6</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&SBybkNWdArVdsbXXItSILmX1tZPLg8YGJK0OablMjsA++dJmYfMP7DPVV4rzGoIe</Encrypted>]]></clientScript>
    </field>
    <field name="ten_nv" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="gio_vao" dataFormatString="HH:ss" align="right" allowNulls="false">
      <header v="Giờ vào" e="Time In"></header>
    </field>
    <field name="hs_vao" type="Boolean" inactivate="true">
      <header v="Hôm sau" e="Next Day"></header>
    </field>
    <field name="gio_ra" dataFormatString="HH:ss" align="right" allowNulls="false">
      <header v="Giờ ra" e="Time Out"></header>
    </field>
    <field name="hs_ra" type="Boolean" inactivate="true">
      <header v="Hôm sau" e="Next Day"></header>
    </field>
    <field name="ghi_chu" rows="2">
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="bp_ref" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230, 0"/>
      <item value="110101: [ma_nv].Label, [ma_nv], [ten_nv], [stt_rec]"/>
      <item value="110: [ngay].Label, [ngay]"/>
      <item value="110: [gio_vao].Label, [gio_vao]"/>
      <item value="-1100: [hs_vao], [hs_vao].Label"/>
      <item value="110: [gio_ra].Label, [gio_ra]"/>
      <item value="-1100: [hs_ra], [hs_ra].Label"/>
      <item value="110001: [ghi_chu].Label, [ghi_chu], [bp_ref]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcLrPoO0uiMmGLUstaXmnD2nW9LENDUG4sj89VIGlBekqHv26vysLRoEh041M3vCerBjgw8fjCIfuxEwXu5AhKOFBaUeU/lUxUi11ZPxzos9O1AghhF6r9yxIdPO2NYm1TKpQrev6Id/wYkfaEyvlN4c=</Encrypted>]]>
      </text>
    </command>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPS6o0FO4oa0V8ggf7RVJkjpvu5lLetaENfYXcCme6Jq</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQuo0eS5b8e+DofV8FmhQ8f5+a3+Ekd+oxpqkqpDJ7hyMpfe1mwKYr3xhUriBcXoM1kw==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcCLjOzEBOw7WLxwsZmNVIhdyKUhv/DDvGaGbpwHJkbqg</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQuo0eS5b8e+DofV8FmhQ8f5+a3+Ekd+oxpqkqpDJ7hyMpfe1mwKYr3xhUriBcXoM1kw==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CheckLockedBeforeInsert;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1+Pgf9NIWpQIcrgh/QGVisGp7nJJkK+Kat2tW4Oo+liVk2o0OrrOfE6ruGMAJ2lvHeMDFAg2kxVbBBmWBNvVJvbHAnNEmfIHWroM4j0XKsEYIzf+twHPujm8N1bO2Hav8GbaAbLfkmIivoaUq956DX+kRmtq1OE5lL4COE8rF1KmWSU4Mj8LT6Rhsl1wDJkp5D+zIhcalHQMgGEcGMyT0A4GV6jcHzBdKQqAbGiSHwoZj4zxvxFXoCPTy0gxAsfBXDvSsXaxEPWt0qSy3LGmSwe/T/q37yBP0npEPln+Wz4SyEadljpZySwxoX20iriRKZBc2AOCX1ibgS7SCEgWztwuim1crJPOr+btfA2CKfoukUT7hBuW561pZA+RR0Dde3/Jr9V19haQqScyrL205H43uYe5VvkoYDtn+BZLc5CUNEIcR7C5ycAcF33bunWxZLGm2cD8s7e0oF8zAkDGVynlK2XOxOhVrRnM5EgOCTqx1SDEUZzxTfEwDIyKMhmEkTMM7FT6G6NAJM6B1SCnB9qPUjOQceoUKw8HLGgBbYZsnMaGunMyUBhKZC7HRj0zhpv0MjZzfehgVvkq7w6qnr/IpiDqYRER/kW0s8a1jYrY998zgdiFPX3az+n/5GKxq1HmcV6bwz7X2QhuBGCWMHl8VJXdaT14n0+8sR+twqCnjlirEPDDF9lPvF4Kw1FJ7RhuqF42b1yvrSr/2tDQvHuCyHdE5o0CFDDg3xOVu/6es/+TzZaGdWOe7+7tAMli0bUZ6pBdRfS4WlPwjmLQkdj5XiN1iHLt1kDG3ybQ4JOPalJefgwi8GdSP1QNOZiIq/5HGUHMHtfwI5kUG1Ca+sCJkj4IehtsqbCLYOdS7w7MX+/Xv9zac8IUbR1mQ/ga9MRBR8PPSCH4KMlNI6WOvRaMf33SVVjZC3Z341X7zIry0bqgeeB03mWBKIpZcmKGx64Ty2ez/KR/7isu5ayW2b8e8w9arjXJUis7ghxir3+Mv2eIQUUp+luEtJCqMgPnSw8JteUdoYHz9/ge6OCns5TQfXFjSNgOqFSka47o25/0KdW8G0M0PucgrwWuy1rwR0sEHf9rbJGfdvuS+5W14ZUYdMqpBnKnIcBUEqh5hTcTcCRy6pHv6h/N8g5daQ6Qu0SnULzOeAJZLjV5I4uxjOCdrdUxypSxifECIXuHbd3aZyvnNEfKkdyc4+MtiWRyCWl1IXu9FmGXWeylb38QwY=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/158oObqMu7AhAxW4r9TBggy+g+6x2DG4dzE8tx3T1f1qB1CZ+6OYdyfUDjIYuvZbGMgxZMC9eK614Lrh2XdVXAVUH2YQMjT067ijnkIlZ4e</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fIcAV5CMYrPNMYrPcY+VxSS4aDYghagqjEFWrrVhibj6fD3H6pp4BZbdh8Ta7O0Y/hglRnU7QRLPejI6D/RJFe5gfhEpOZYjblu9+3o1vRAJLV/oEBW72FWEVPjsZ8ACUBaqgpF4CTkcMo2ZRwf0D0p0L2oATqtDz+bCW4ybgCh3GpWF9OX9s5uixX8yU2oc8gWvHsgbnNlMVnvScFVJ3sNvyx7zR2fzzospJWcevCyQruEBmrb8Kb6G5bFs2EmFYG/jMaku9eeTeio4e8m46jzQ5UwB/kz0FkCWBFDJbDiY5mo4WD45NpGa3bRdAMM5YmLLr2qISbDQCErq7g2OOglUFc2C2V083Q6ZZWlrlw7QKNbPZr2tbyabLpdQaE3tg/Zmxi+U38lVa3FtWmreBNogoGXu/eo/BZnPGORWCyxVZGtl4PFWVr8dcz9LPPeCwhpy5IsTlPMJLkF1YzqEStHtQRGFUtXSM6qkHMGndDsCbXw4PEsvqxpddDZLuIDxEHQGU7WePckwKZe/gXFq9u0tHZn43WxkhU+PLmNI+YL</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22SAyB0lrLIl8l+LB5Gl9ES8J7BXWwS26JYkGY8fKh3Vm</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&XBj6YDSBZrE7ldnLBomYrWYBgYZJ5ko3wuq7YLlKUf29T6rM6zKKRtMTbzx3cd9782X0t7tSmvVPwM/jgh1KcA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHVIL7HkouhE65bfnddYX6NC4wMtci2ihWiawi4sQTqKpGpo/R7/xgC7rnOpb3BiGKA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&XBj6YDSBZrE7ldnLBomYrTC9VoJINgFL2LKXL7Pr+fbsfa8hYJAeuFT8H0YcVwWlPSLJxA81cKsrdb2WamBr6w==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHVIL7HkouhE65bfnddYX6NAycsD4liWbdOdiEOExQwsSfh2VcKx0S+ufzA5JHeQdkw==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHaKWwx1w+WQg6f7c0Ou7rMu+VZwVM5aenHFkSuK7c9JF8zlHtKwfwTbtcahkAfua/SwlW94CtaTtdYhzizhpWJ1iWXahJrLG6r9pnzh+yjhvmYNP5emYOikn0uDoUZv7wiD4tDGwfeMSiq06ptZZgQK0x4mTvG87Bt8YsGSHDG1wnYj7rHMZd5p/sMd/zw48QbhfNW6r7vdJ1sVcQDY8dFWFwGCpElnQ1hD5ydY68lwHLLJ8G5i9Ux4pDCG16iUJpHnXkEM7ixCki5qvNC00SyY=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&SBybkNWdArVdsbXXItSILry7kHH9OSTWw/oahXoLF/d4++57FKF0e8p384SFqKRVbRmQF0v7K/RoennNNobbvYgqnuEthac5kY58XgulZEiBTG5Agdi3KRYTAfGsP209</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl//VVNNvl4XCgLv990U/48goLynvI3R0HlA6cCX4NWbPvgxNo07/siTbTm7cF2JruHzdoUrBQVHVwBFBFk1tHmXKBsrjujNuDwE4A8+ulXa69wh3f0gJoxkYDx8sfdV/QvelEwBn+NSnT34oeL6UacrKOjF9CgzjCt4uNGGncyBgQSB9iAnPJvfV9BoQzgPt2pe6Bs+daUSDg2y+XJwrvKoLc02RjbqFt49hI15+uj4a5KIZ4FgbWf+x4Qo1LpwRuEqR55NKFW5D7DAArB+8PpSFnfc0X5NOHzaHxPabBfGn5ruLTxFbKVFl3TUQmGs9YyGogAbi7Zgod7a6z4NoAyp9axdWGpaXJayLGrYu+sX3AOFgxMGsRyULeaK34HxLe/fsE01EJAN9JXUaqOFn1z2g+97zV5jEon1I7iW85CVzEIqsZ9/j9SW/ydZ+aI65JD8Rs7N0ecJxOGiFXtnv6X061hZMTFkXExc01H7t1DtjAaIVnYlEKI6iocWV886xovesCGRDw2EyuhCi7wdjipeGcMfNw2iNa+K9fYdabFTdRx18Aea1PBdP6ccpZVYtNKtsQTX837aaaFoHmzzc12yI=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3rOObb4GYbMQh3I9s9ieQaH/CtUuLy/hvt3u8Bvftrye0XvNf0rLnyjPSKspRBurHg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3h+SiKcLqRpRWTc4QsvVKis/VfRlByYlw+REdiKN5/NbLG+yA/meJtd3W6ZYIaEOSg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3rS4dIrGtn/zbuBqcIGW4sXaG6MOIyfQarKWuqjLzMOlptFUWubgnVIuYZablaQwaDu2vZhBKNSDt3Y3atSKS7c=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3rS4dIrGtn/zbuBqcIGW4sXXmc0A5aR4Ue0c5yMBfpkYMI+wQCzS/eN5T+O+drdLPN6Xc7JBt0RhMQlkoCcXpNw=</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="IDNumber">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5p1ONhnQ/dVeNDqmQY5tBTf9gniI5ZdZXG2dYHCvwCWNRE7oibOz15UAauBnUtmvG2plJ0n8VduM9zqgaRb4YlgHc2QW3PV5HfWGJB4RT7LQ==</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>