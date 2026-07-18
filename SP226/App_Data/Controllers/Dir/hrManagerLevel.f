<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrdmbql" code="ma_bac" order="ma_bac" xmlns="urn:schemas-fast-com:data-dir">
  <title v="bậc quản lý" e="Job Grade"></title>
  <fields>
    <field name="ma_bac" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã bậc" e="Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_bac" allowNulls="false">
      <header v="Tên bậc" e="Description"></header>
    </field>
    <field name="ten_bac2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="tinh_chat" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Tính chất" e="Type"></header>
      <footer v="1 - Nhân viên, 2 - Quản lý" e="1 - Employee, 2 - Manager"></footer>
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
      <item value="120, 30, 70, 330"/>
      <item value="110: [ma_bac].Label, [ma_bac]"/>
      <item value="1100: [ten_bac].Label, [ten_bac]"/>
      <item value="1100: [ten_bac2].Label, [ten_bac2]"/>
      <item value="1110: [tinh_chat].Label, [tinh_chat], [tinh_chat].Description"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwdVs+vqr7U5LmQqIt2M4LMgTHSydsh26RGBYiGkvqNl7ON/YJF02IDrboeBktWY3c0=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfx0TKzd6yL2BlhLuCXsLiYLqftQ3RQtbac+YOCgUBxca/xk//EzklJQAivl9UCxTYqQNPvvbJ+ym2JBFkuIfb2c=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuli5sORwP8XqxSUt7qYur0nMZIFTb72pshk2iJiTHHW+vf5x0nepUJR7etXqghqLYO5UqiJQ/4yT21gn9gxHhyhG0/N7WZYP25/Z0IgLVasUAzsmDKXOCD3Bpt1WjWFalA6JAjxbu4brYXxCV6AHTZoP81aTR3C4OMr1S1Z7UGmk7ehgCQpyG+fFBC/AHBEwvgdqqugYh8gemep0KAjGbqJDj4XjsHd9KS3WyOCx+o5A03di24a4LIFNMk7xyTC96HJddE1u8tX9Na61456OM4UOP/zW1UKYJ8QbzVOvdutd2DdqsOJeFEVC4866opLBo8rZ+xL7y5/Jjo79a3apxXqStZrAI+hNhHhv7bqc9/6+ws=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82n7lne9RFJSwAyf8KIDq4+3doJktvU5Qsph0joUYJfG42Rw/WmnQK5feV1WTDRSHCYkoaGICOBnaIvtbH/yxGJhz4szBNxrIJtAJu61Sgb0QdUhAntPiuS3OR/kTF58OA6afZnwyYxfhyMN83zZWpp1AwqGUbOApXiqi8K1t74NmZy5zskOQhlOD8ciIQdx66twccfPXymgYyLYmauD+S13FSa4nQfEcTlp/Cn7XNWJuk=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/j1bTMWIVgvXrlfLBVA5cmOJ7subQjHXwgA912pyrUtGbAyNLkH9+KxS94DsksaxocISd/u5A5Og2ggDRppQzXEG+JhmrtunWCevfgxP3mrMHvvKDi9q3tt7we1mWrHr7u72XgauEr/IFcyGo2EdS1Ygd3dl4t428CIqOpSQJqJ2JzMmh8atadUNLnt6FgrOIg1JRZxs8tottMkPnJo4D5R0RrR6sV7Q93KptKEdNwDrwTWMAocod3m4aSUXKwVzPh</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbelJ/55nACw2PERxBcSXpGqek9HbUF36JPrsdgf7/8EiA</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkZMzcYW3VSuWppx20Rw3LjdwcFTrla8IYNerhv6zUP6GLwdyJAoMgGMIssN9TGhHTdcp9nhAISlPUeHi/H+nGXh7XvuAh9myThb1+xiEbho9biTm+kQEIzl1Q7QVPJAgMIHImb0cNyLZ0Xx1qKqf9qQ8ybf6tZSET77RIC1ItoCM+EYz3l3FRrdpsXTYwsPA41LrIIGDJIBeILYI0MaHCaxFdoXc9DkLi7lqQMkuaOq/0Ki6GgBhUs6nVsl+DE6fx4XzlGlkg5pGJbeLe3r5i0m3MWeyJdmh198HLCVIFL51Zt/jDN72g8WyphzCSoYzZMVx0Re/JObu8915YWAxedj</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>