<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmtthd" code="ma_dot" order="ma_dot" xmlns="urn:schemas-fast-com:data-dir">
  <title v="tiến độ thanh toán hợp đồng" e="Contract Payment Progress"></title>
  <fields>
    <field name="ma_dot" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã đợt" e="Phase Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_dot" allowNulls="false">
      <header v="Tên đợt" e="Description"></header>
    </field>
    <field name="ten_dot2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>

  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330"/>
      <item value="110-: [ma_dot].Label, [ma_dot]"/>
      <item value="1100: [ten_dot].Label, [ten_dot]"/>
      <item value="1100: [ten_dot2].Label, [ten_dot2]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5ekeHVq0dK92+Dnrd76xYZ7U42xK8LKscg/qdRdKQsO2iOMrPS5u3agaekwyWgGH65IusMIXQHTydNJzL6P4N4=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4VoMQaMr6luHdyhebPN8Zein7qFmPhwLU8Zqe4zIPHHa4NfBwZPaGHaybGiNR5602RTv7qeIgjh5vPLVBBGJIA=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliaaZ7lP5GMsQAn9UOKTX6jMHy+orKlcmzWtTDyNONxTTw/qWv7PAHfLHZ6rLD9kEamjShtpktFBgJ4MerlI2dCfB6t5AsmODjePZdUbP6zUC5HRK/gcEmj253e0ixy0N7KC2CepXdOU7RevkI3SRmpHRju2j8y5e5RYqeXduo3FUsIuuvdmzmJ01O+8F84/YLlHhMgD3U/3peehOJupig68RsCDg92IZJ3f3bpyku5cSzhTaUh0qWkb2e4duq7A0iJGMErE9qtSWXmN/80KUXJwsjZygjQNDbEaa6TworEAreB+kopJvWeBNgbqVxAn/fCU7Mw8M+6ky+aACnR2lLPJ1a5VXHxQwVKES67KBxCfsC6cD96x/bfRZ22hZ0kSxr</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4vZG8geyQX0pJ1qS7bKa3cVzECKQekIs7rynvReJ3sRpmg3iGDu/BypWIgs0WR54WLPhmhObWMnOOxU5txBA6noVCqH1PchMjgS2tsm2G/BiMZXeZ7dkB/UHFsYMZ83mIZe4plrc1prpqsGYNTTZZ7BZ76kZJSDQOpRpAkFdS1rfMe/ucUDXDS0NQcVY00k0tvNwpXSm88191D+I3m0CgeQ0+QRaWyxbfpTjcBmk9Wy67VS9WngXJIPeik+zF10LE=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jrfEZ+Gk/sVhXZg3QKcruHPNCaZV6y2YyZK1uAF8NfVhVbVASL6HTnWsJFxPDaxZt8Myt5+OefTAuOLlEo/Yu6d90PBMrRCsfUMUY56D3oEVzpYJm3L0CPxCRjsXPeY1E8BWXZeUzwGGsj9CKBSCylp8kVeAF/496mZn+aNRCt2JW8/8fRowNWOCLiUxfPgQggcMfMlZthhTno0bibWSFfF4cj+ZcysyI1U9gz21jqquXcvK4JCQNejTbBrh5vL10</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeqHBM2q9EBGTJ6Fir7zhXxvVP3rCwvqDIGHy9ibcB9wi</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70CSnquJuQVw1FOA3RXxOCAKx7pEaMUjyPmM6W+2UkXrA4dI+u3wVQf9xDYFcC1eb8Ds49pHrLkvQpOgIMurgn2nk5afcMrmX+01rvQLkoYAAr2gH3DK0SZxL3hO0PcSInGjH1n0j8VwxU4DLf78lZhbCzK1hp7cBtya9b+zA/iJvsIA+MJIFVZ5R59YbwpHuzHbUFzcnA1Q6vMujwS37P/dxaV3rFfDHAanfZ07YZ0NPBWK07hIbYW5HVIxy9CWvkEE/vebYeG0RL9p3u6MXDjnDix5DTldY3w/YmvsIt/B1E2kgiGJ0HDDTuChTC+UXgip7eey4af4CHpmcaGi6v/xvmw5kFm9OtTLIl7u2mhII</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>