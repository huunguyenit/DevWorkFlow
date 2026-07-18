<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrdmtn" code="ma_tn" order="ma_tn" xmlns="urn:schemas-fast-com:data-dir">
  <title v="tai nạn/thương tật" e="Accident/Injury"></title>
  <fields>
    <field name="ma_tn" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã tai nạn/thương tật" e="Accident/Injury"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_tn" allowNulls="false">
      <header v="Tên tai nạn/thương tật" e="Description"></header>
    </field>
    <field name="ten_tn2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="stt" type="Decimal" dataFormatString="###0" defaultValue="0">
      <header v="Stt sắp xếp" e="Ordinal Number"></header>
      <items style="Numeric"/>
    </field>
    <field name="muc_do" dataFormatString="1, 2, 3" clientDefault="1" align="right">
      <header v="Mức độ" e="Level"></header>
      <footer v="1 - Không trầm trọng, 2 - Trầm trọng, 3 - Nguy hiểm" e="1 - Not Serious, 2 - Serious, 3 - Dangerous"></footer>
      <items style="Mask"/>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 10, 60, 50, 280"/>
      <item value="1100: [ma_tn].Label, [ma_tn]"/>
      <item value="110000: [ten_tn].Label, [ten_tn]"/>
      <item value="110000: [ten_tn2].Label, [ten_tn2]"/>
      <item value="111000: [muc_do].Label, [muc_do], [muc_do].Description"/>
      <item value="1100: [stt].Label, [stt]"/>
      <item value="111000: [status].Label, [status], [status].Description"></item>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwcztGZ3ZZkLllVguPPVDwihFP43DS1wiKL9xVxURzoX8WQk8JxlyHLPEf7/T9WdZMKbTnfX5PDopAHTy2u90rv1</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9y8HfIACjlf89TMwV3NRN1U1jrFWZlUM+dLKBIj9fDVM2SUtG+iZLcQOujjp1CCCYgyIrInpJNBQgGTeA12HvFDZJVMZcQyUAUVp5z2xO2P</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZulia9xJpfIUT+a7ToUIu5bLIJbTa9ridC1BMOTxXRQPHmOGkHr5uUbxv/YJWrsJ3XW5Dy5zS0OcWuuiGR7LM0SL6muiR2h8/3wMbM516bj6+gaBYPSbINRLfG20n8RdmWgMhQ/xBVoc3AjD1bAqYtI5PM8gnzS1gm6sFtrgJ6fkM8KxwMzcGsDeibyC0GLW8MOpsnkGhWRTcLm1ZclcPiS/pLdCKTdPSiH41m+ZyEHx0l9jC/kfWhAIIWZr2yzRXMSKa927qYTp/RGX9vSGp+5RpbmVXA59eE6V8pdaTG7f/8zPKn2L95dTInkf0SDLjUKsGEh0VlbPtDGOkJcx8TM+AsMqy5piEBjmEsjqoJ39P+m3Czb5F9nQsNtKSTgfiEDS</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nv6WZAxKbd+/Zbl3xQc/mmJIu0Yk9LN3h7420BJPYTdvk+XKCShOPftvmBTGjrlIeI+XUQZn4mahSxpP2e1puJV3yOykq0CJOD6uOPIvaj46ETum1pPdlqzGrUEH0679bnMfNjKcI4SCpyO3kGOYJgUT7Db5adccYvqjeL145qsW7pDS53jvrYdXgINUyIto03sMa1hyIfAu8fU5ak+XRtA==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jX7R5sMuLc8bH2RaqWbbU3TGq8nwskhRSq6ZGXxHnP7QbZBYAx+P2APuPiq7BcdXC67O2Q0w5+eAO2tatBgSQhWcryfNqnOxlLIC3IXU02UsFjOHOjBniA+7rWRpibxPoO+eQsg8UhJ/f6CtXl3IFGCChozfFyei+Lhros/BN212UdS3ouioPxgaGRIu23DHl++f1qqSPsbfaQi7NebrRkU/IG6P7sOBvQX4PYZOJ1fBhfYn8f3haGaA9i3OQ7hsj</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeq8ISijILhioiUY7K5VIBm8njkzSPcWYsP8nlZMJ+sXe</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkaWT+S0CphMZg245c7V66GDV7XHLdvouzWyJIky/SwVdQPiduDLWNN1sNdXBP+CBf1G6oi87SUEy7BD6Qkw+6p96DF4Fu08/wVykScA4uHtsdRuL8U7cCh35YYmV6JM3GZIpXn6e9wyB/bGLXB/AOsVZxoBPI6SAeCjz7infBL58XA0KQ/kJX2ZuXItSkiqLYO9tTzzsJEglUVY6gLeAoOf8f/P21pfXvoamxrzghbNNsjNjnNYksEnLWrirxVQofrJ+0+6lZHncAou/MrDemKL9zSjoFTgSPluSrPJdRlOVHG038V11oCkhcw40xfPNdwuhf3INa9O5TIOshWTojsp</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>