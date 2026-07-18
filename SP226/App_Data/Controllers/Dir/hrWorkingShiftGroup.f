<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrdmnhca" code="ma_nh" order="ma_nh" xmlns="urn:schemas-fast-com:data-dir">
  <title v="nhóm ca làm việc" e="Shift Group"></title>
  <fields>
    <field name="ma_nh" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã nhóm" e="Group Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_nh" allowNulls="false">
      <header v="Tên nhóm" e="Description"></header>
    </field>
    <field name="ten_nh2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="stt" type="Decimal" dataFormatString="###0">
      <header v="Stt sắp xếp" e="Ordinal Number"></header>
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
      <item value="120, 30, 10, 60, 330"/>
      <item value="1100: [ma_nh].Label, [ma_nh]"/>
      <item value="11000: [ten_nh].Label, [ten_nh]"/>
      <item value="11000: [ten_nh2].Label, [ten_nh2]"/>
      <item value="1100: [stt].Label, [stt]"/>
      <item value="11100: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2WPCxRVkP/aDs3axAEGjW3O2/sqK5FnN9Ek2Xk6Mc083TILbG+H2wIQald8ZrWIZzKtA+ru9xPctNW275qavQ4=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2iNU7F3qosiOwLnKtGnz9hM2JKg+JwJWp6C4e3rK7lHsHxSIJoGKN9OlplB+YzdNkdoL6jOynfCnudoWfYhsRg=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZulileQvo00sqc51Irv7p16Xo2QdEtG+d7LpQM4vR3ZzaejDMgZQT04wF5oS6rL1ZZ3ZxABO1oGUivpxxbakURKlQSM0+zjEySlsFgnFuKkZktu5Ka9dZFDYes4OnM3oywWk4jEAkaDs9E+8v3oWka9UQkcn2GvgS/Y/BxcHdn7ZFX0K+wp1PLO7ASWjDu2H3dRWTBkALPU4GtfsihWFXswWn3ECLvn9Kf7owR8Xj7SM+p69aTaF5Ru0Y7TDtETxV7SScBZTXk5TmItwRmLrY4v48JUMs99X+WF7Hk4ycksytleMgYUihYaf9wt24Iu1jSTtDgCCa+IyuKFWijN7Onb7syox0xh7dEW16HevPESeAQ8=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nmO7HEg6pdRyICA0emyDinOvgPt6yN1NuJeKazRV1qUC4AhSJzzbhKIlHhHsGf642TlWRnOAKfSLD7Fgxbp8qaLQlfMKqYSXWO/PGO8s31olUV54nL7UxNqyPbn8NBqfuO7W217d4rZPt47l4WE6DXK4GxxVmEGEDe4+C9PfGkj2Osw1U/YmlqFtO05ss6ZFqfTT9Ru81dfSsKb39YsNwOkPLjxc0mviZIai05V1dDuM=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jlUm+KYjerF4fyFdcFcgOgSfEh/Qiwd2pkXMUI6bMZasVqazxiUob6Fvj0TiSfsZZ91W/nTP5Hi4v8DTY4Lm6Dlrb2NnLPtkPr0FwD33Ue34pVMtt7NLuuMnOe1ca5uWnF0I6aJF8idcPsOfrDmv36TDLBeNh3Y93WyCrjibfJQHt8PC7oMXY2BqOkvBCp2uSzfhuvk11x/N/GqzCWi+itsJyKbj6M3avA9HFbE+rjdjCtKSFV/IBMv9g/QkFXNsKvYzNFrLKdPEnlOTcXomOZA==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbesgG9joAWjFtSRPOCAjSMfO0qGd8m52QOCxTlqRlPLBS</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70ESvQ1RDiki3qVL3ilMoxk29H2inJ4aavERx17XW5WDHvlDDTNGjXyUjRotJsnmzzGNPyjZivdNUy2MsEIZ0i9qArOWD5l1OoC5ywhyG/PKZKOvtxO1WNJb1WcBSjVepcWl+eux3nTMVYOdyPG2f0iAurb8CwKAgWJ5eveDp0pWtyCTgclUea+6iZwZF/abk7vJtU9ZmnYinD2noIR4JJ4+9kPycWNSST3RnQTd4wV6hJq90xtwkAelgEjZlKPwRBeZ/9OUK9Z+WrdCfS1s88msvLWZSbCH5DKwh3amjTytmFgf9GSgZKMODFjOogT+Q6sR7o2VZaBHJo9M/6+IyPrTBHezXH5I9KWBxGLH929Ha</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>