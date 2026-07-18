<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="sodmquyen" code="loai_duyet, ma_quyen" order="loai_duyet, ma_quyen" xmlns="urn:schemas-fast-com:data-dir">
  <title v="quyền duyệt" e="Approval Roles"></title>
  <fields>
    <field name="loai_duyet" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_quyen" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã quyền" e="Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_quyen" allowNulls="false">
      <header v="Tên quyền" e="Description"></header>
    </field>
    <field name="ten_quyen2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="sodmquyenct" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="266" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết quyền" e="Approval Roles Detail"></label >
      <items style="Grid" controller="SOApprovalRolesDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: ma_quyen, ma_quyen" e="String: ma_quyen, ma_quyen"></text>
        </item>
        <item value="ForeignKey">
          <text v ="String: loai_duyet, loai_duyet" e="String: loai_duyet, loai_duyet"></text>
        </item>
      </items>
    </field>

    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" categoryIndex="-1">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="326" anchor="4">
      <item value="100, 30, 70, 100, 453"/>
      <item value="110--1: [ma_quyen].Label, [ma_quyen], [loai_duyet]"/>
      <item value="11000: [ten_quyen].Label, [ten_quyen]"/>
      <item value="11000: [ten_quyen2].Label, [ten_quyen2]"/>
      <item value="1: [sodmquyenct]"/>
      <item value="11100: [status].Label, [status], [status].Description"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDHwyWdnnAsOePGxNOFkX1dwhFu0f/VomjDIQG8VzJeUQ1SDnCd7Qi6Bw1XYKlQbBZhhVVxP6onNRrUIP5ffZdod9a66CwQ8wXV5j+hy6ZBj</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDk7V+WCQCbTf5mLypqZov+fJGYFlovT/gSqzWPhpn9oZN/2rG6IQmn2a2F281XQxbbn9lsezsMKWtlP59sGB+kBpzkyfGt5yiVS6/v8qDi1</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFLTtxwxLS0qUVnguBBCPvO58M5A+K9FesJpRmlZBqVG3gm2oOGSGizbqwdn/slvoX8UdgAPggt17TwITGfDD7iFF3CeICp6SGKSTUkcEmq5</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2IFUTeYgCI+m73yMqsqvhVfK/NCPDhMSW1bAIXdU+QckZVgeFDw1lvwzbW4aQLPjIwaS6ACvBtbFKkH8K44onDq//wP9L6RECYZlDoAlCwfOUGHFll+gIMQ8mqjrVnfW597/0tFQErN2FRSG6hAnsCi9XoJsQiGXjv4IN3mJS/nm4eywPclIk74A2OH5UMZS8atekmmZkCMgVKfBOEfBbWHVWTczQwQcAvN0llIdUZRzO+iYjp8sQLK45P+JZHN2BDDVYTW6isMSi3wcbEtUZCDS19mYMNnH5Q7uijpKX927t8BVeYpTmW+c9L+2MZYcgRp64TN03RgpHZ+Gb8OX9bIlFlC3Qg8JO9VYS1E1Otz3Uz4GOLAMIUc1WunQL+ywebI2CHnO9DcRhFUr7ham+aZfGpJndOVY/7hMvbudZ5iDhafe22zl5qnc0KdjUa9SvH4DzgIrXA5vI19zkPPCTINS99iCKmLnklJCBT3/HsY4LvnycF/6XHK7dcJJ/NqjIkQCveRclKTO1zNFYU9M7MI4Ow40D0XNZdVGgSCYk65QwLCwtQ5g/hlF6mayYnFgY=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN2JKxKAnBFch6SwKc9HgayuYbj8YcwZjqrfsqeBUDwUoHpiwUE8gKYV+tD2zMqvS+nRIuHho4cXefASSJWbosoBjK4495O5PcYEbWXrKGBv+CYocgUhuc36SmVWYneqC2KouRPntZhY3J3NKjp08RlD6SVq1xnPuHLeWsyHVkqvhcoiHx++m4+nw0K53dSCrw6qdVDG71WcI8FPDGfYWHtU1FRdFsXEYnkigujazL23sKXiEaS5CPj6z3Av/JtY0rpDk9OTz72wQZ6FmgQE4FlTZx24vMOEPHOAMrjHkKNHWwDsMvDzjgnMq4/Exeny0Q==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIFe6vvbXRkzkrNWkiknOPME9o4TNVl6LdqFgzbQPJHqze92WXajPy0+Jal6Cvy2fw==</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8Ubfvq2dXTvAvl4Z841iZLN/Hc3cuxwrgSOy29svtw1KIPl61DmAUCiPIyPh25eYpMrvlSQDA5P86Auu1gLO96msY4G/RNhcLJFCLg/zfu7m4VsTHqdbjKL5pu9fi8nyFLUqO/ZfRnSJllH9NysOvgy0COQto399L8Ucv3CKKXtu8FDFuyl90T16o/H8sc9L7T/+CmCwOciw1QcLXj4K1G2EuWTfhd3zTsxK0ugZGeWDSOLTJrxGvb5XjlngBo11obP8nz89XdA+vOuCD7PK7RcOX8XjaElN6lB7yd+YZznpthQiMZnZWETgpmrt8ZqEgc7qQBnhC2qaz28W9F777aaqzLVZTPTw4gf1u/XH4jf8vEdq7ayH+QALv+fzlKNgjzV/UDiXoULv/7UQtHQDaEaWwLE5PvCX4OOIawaFX7eQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMiXeD5SjAm6SPqm8rTEuHVwUEmxZOEYXNf+BHyjTN4BsDkv93ExpWegrmtKEiOSmyUjvX56i4uLbg6764FiT1kKAi1uqchKdSlcoMKCbwEY1Y1neCDxOvWzQY2oO6Ase1eQtFOZeKvgvYCJZ5QA0easIIphAiCPKE7I54lBxs9ckYCFPOhagYyDGGK8xGE6BpbbmptISZf3PpCOJxv9ZWo=</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu0BJvOSjIycBlg8Q+CrsY4B7//CgYm8RBuYUYX6SxTaRBxr0rDNbvMAuDBgO9fL1J/QT7iFx68NQPy88U0+F+ks=</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&irH/Guq+c+xo5Lumk85DTLuRqas6Nx6jSt96pJBFnPIOkYLUmIOUG6cyjsQb126cnWt1MBZ2v+47exT56V+bWgOg+IMgit3FEWwTg0hz4BJaldNZgmqsIncE+99gkjsKLlqlFEvrkFvfCbK6sOX0GjygDeQ8DgCh8naK5x6EkYV1BD7AJt419eMB4x9m0BH/ZsVg9l/TP8KIPiHoxGu+aLFUg4QR5Xoy7vKSmSOgEq6mr76VkMP9x7+9Cro030+ojRHZP4Mmyc24I++TceVupKVB+tYG03lJGDPrH1BU5bjOXKLgxk2PtRQeGmuRAQQvhGD/8uf/1c0cp5TZRjtSv/oFZX1J/FyRtMhZxZt+R94tHk34MbhwB3T59+/xKuE4JtpWM90BNVCol6f/Q4+WsPWEpz6dKME7KAhE1gQstY9P82PoUb9KNFLNL0iv4jkWpHLpG9AZUAtcIaHS6OzVdHYzfHqrzZoUGxiM7mmJdH6g8KZ8gTron5HWrsDNJRKlKw5t+Id+TqtGGa8TpPaC6laj3tUlw8PKv0MNYX8/HrOnE9xOSYPJB8mg6V1RxUSWL3y0Q/RO3g5eFommNZC+MIB5cM74pKR3G+Bbpc4EMXEvl9+tJy8qWLdUbk7U8p8iY6coYe2PzqgKYfE2n+0/iEBsPwO6ataV2R2EQmqvHHS1NmyBWL7oTjhTSCRZ+IgYkMHTKaaiO4V8+mf29hZpfQfitYCI8FnOj0S9NNYmuA9axESwI1WJcQKKBvNgjnsMlKRAHNbS1yyP79byz3yXQWOBrBPLU5E01ODvkX+WcN0=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtRd25QiDVn5uBx8KwXVb2AQ6Dy8PHrWqgwmuOr295agzkdyHxr+E20o+gH7p+Nk/Xc15g2FyEcGqurSZGwpc+b/rNj3xCCGVQGWHs1ek8Gnbzv3OWHhIlE2YMoKgkginRhFNBWyFG6CQBMn2XVVMEWYRlQZ4VEI6YcfJD5P6uLTCW7zZF1nGqNl2RDygv/9tYhxJwHO5M+AXeik0cVxoyYunTIdTs3qB3FPl9sOFnrwkAa7LzFirtEfoilk6rvpTFbGp159wS5AHTP5KABMNfuesPMIvIvIYQOKyYRMfs79evlMF6HebYn3QHr+mopXU8aSELKiMv2UQ7fx5TfIQ2uyDtBKBJZdn70IGCe/zMz3KPlJUMiA79sQtnf8zU5erwXnRiAwISgN2pGYS3Od4TkP/3k6kt2KiwxSBfHqzCUMeSiPJ3eoaL0FgdpkOHpamYf8IjedUt2Qr7fpLbX/n7EV6jfMcJ2arUr/QuZoKrvYgOxE2PmPBWtvgowB65ym3dsL4HNq3Du10+ZIaRqOab4JMe1Tp1MRRju/Y27JeECd5</Encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>