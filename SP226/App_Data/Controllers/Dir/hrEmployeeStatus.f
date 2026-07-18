<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrdmttnv" code="ma_ttnv" order="ma_ttnv" xmlns="urn:schemas-fast-com:data-dir">
  <title v="tình trạng nhân viên" e="Employee Status"></title>
  <fields>
    <field name="ma_ttnv" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã tình trạng" e="Employee Status"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_ttnv" allowNulls="false">
      <header v="Tên tình trạng" e="Description"></header>
    </field>
    <field name="ten_ttnv2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="stt" type="Decimal" dataFormatString="###0" defaultValue="0">
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
      <item value="120, 30, 10, 60, 50, 280"/>
      <item value="1100: [ma_ttnv].Label, [ma_ttnv]"/>
      <item value="110000: [ten_ttnv].Label, [ten_ttnv]"/>
      <item value="110000: [ten_ttnv2].Label, [ten_ttnv2]"/>
      <item value="1100: [stt].Label, [stt]"/>
      <item value="111000: [status].Label, [status], [status].Description"></item>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwc1v1Jh1fSMt4AMWmprmZ3eGshc6frKu+WPwPxuCVuwlBZYY7vVOJcnTck7SJfHWcToodbPMe+oZTzhNI+0PGA/</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9y8HfIACjlf89TMwV3NRN01+Hpq7RND8qIhkOf6Y+okZzAZEZGJoJVZ80cJL0d3nIRA7FTMX/HDQzS63RJG1T4=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZulivIou3e094Gnq/ZybzuLaX/YjRYzhgSwtNq3lGr34DkevZGzeGt7OMf/Ii/fjWpJwfBojIBCh9UmBToucKnXWZOGbj8TkltnH2jyHERjZ15T6bS/237PieX0ox60ApU70rBxJhF1jJakeU5+3Q51Ms3MKz9c1aPg+cADefUXrqd99DMpwAh7ICxhK7wfG/dWfL7LGHZYJRbkw9hocjELorltlpgwaz2AZeP7adcQWJZ6cyaNVxstPqMfJmFqX0zMcv0JzA+N5/QCoVPMSUEa/kSzas3Sjfuo8h3k4P9OiiCUF0z581KNYj3ONma5AI6Af57FY6la5uiUDagit1wv2IC3ArDtJwrDO5KNvaPtEhhDcctf8V8gfQDWA6ebUiatJ</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nplLEiEKynhIAQyr/TaGQpL+NmZC0g1+HCL4eTYIP21nMgo7sAUgROruHw9EWCqME4K3TQ6h3x+PndnFZxHT0850u6DlboWav5WvlDTN+pbmFjSj2ZfGH72AdaFxTFo3e7SzrDthBaBcTbGfgcC4wnNzn7Y1DhCjAW7l/v2VAWy2jDzHpTkPhtZVRbUXJOyO0rwQjMhQODqaZ5iCgomdMU2wUNi70W3ZHIIbBhlwL6XE=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jGl8P2gZmTiszWHX5PnnyYqJFnMIlrnIKeRuRBjimV8ard2lHOWtM89gAUHDSwi27MW+yGY8YhobKO+dfaqe4Al9PKqm2rA56u9DV9g1TMe1Ft1MdjM/6UrkWSfl7OGyGVM8CqIAJ0ALfNI5DNcuh7RFJPvY3aNkTYaLUW7Q4E3qgLQ+rBWvm5Hgrj8BREdtRtzxHnlWYz9v7RsivHvn4brSDr0+ms8C9tdR/6P1MRP++IYWpnhukoe1dIycE/UV/</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbesF9yTxYeeljeyUa9xHuQrnMqWqo6QyQYHZctAfXBqJj</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCka6APxCG3/yFgeseBLLbTaMIt43FKbJw11+eIoXgCbhpyljK+2YX8u17YC8x8DHli/ZX04ndOi9VFB+KLzKcnmMmtl8txqMQCJJVb7neoWSdQ/ikswA9/vyGP6/Ndfxc+Ct6O7Qhd53QeJ12IthOMiLR0Mtxr6R1dHw+by/elJ+0g0xxi+QZlbb6WtuYg/WojcOG/aWKp09Vegji8rmLZv6aQo17YHES+l4Q/M0OKlHeOQXLNupPWIoOG4Z6dmyX93TMz3WZGas0TyVJv8muK/NJUcNVc3bg7l1IeX39c5PL7o572Om//krJJnPGDrTIRwaqQ6dlQDULMdy8T2I3E51</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>