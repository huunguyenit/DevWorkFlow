<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrdmkydg" code="ma_ky" order="ma_ky" xmlns="urn:schemas-fast-com:data-dir">
  <title v="kỳ đánh giá" e="Appraisal Period"></title>
  <fields>
    <field name="ma_ky" isPrimaryKey="true" type="Decimal" dataFormatString="#0" allowNulls="false">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="ten_ky" allowNulls="false">
      <header v="Tên kỳ" e="Description"></header>
    </field>
    <field name="ten_ky2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày từ" e="Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày đến" e="Date to"></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="11: [ma_ky].Label, [ma_ky]"/>
      <item value="110000: [ten_ky].Label, [ten_ky]"/>
      <item value="110000: [ten_ky2].Label, [ten_ky2]"/>
      <item value="1101--: [ngay_tu].Label, [ngay_tu], [ngay_den]"/>
      <item value="111000: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfyWzqgNTJhH/yi8aBqTa/wom087j3Hy18TbVtv0+S6mGqmGQqcxH4TsFDQR8OSsLa2LbK9N/reMZ5W74X6QI7l8=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf75jiJqIQTrjZlnq9kvx3y9wY60+ZY/l6ZSHUbRniX+pPfXb5+vFxM6M9mBIsA7wW+2cDUN9ceJlaFASzV5Qhwc=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuli52/worYKaOAxfsrL3rqclYbHTfUOyUJUSXYTrj3hmlCFaLbXuiun71woxyVVXk0dL3DHoVMdUlo9Tnoid5o4PzE4ckTmw+3BZHezVAKBgwzwa3LTzc71uCc3arV2HvAbQ6op35j06aKuq1Ux26BjD0pk6MffCv2QhDTpkSJRmg6YlNOpZiVsa8cG/7jdPhncbPqZ7Jre9MICgnXmbAGwyF3RGTikwONIHRQZb0E+zIW5dJi45N3sz8Z6kBCxnOCSH43dn2IMnDw4eGIwsOSAYsuN7hzr2cEC+38OD+ZdQuLKeHee32fAOz6KZYdCfVlM</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nxqltyE2P6wzxxXBLa0hMLPdxtU0t0+P6PaR8HB7R9EO2qVy1KdvyvxERtmVsOGTEBgV9+Pxj3kBkGDjUDXtzHYI3oGsXDvLTG0UFgqQEdhr4iVv3kcdhyO7Wa4mwdewtOvM9xGa8MY1+9y5wHfVlMAnR+wQSRKwkB8EZlUcIXGn0Sn91bp6OCHMw1tajm6II</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jxzQLsveFE3z3hHd3mi/hY3SLhBCRTFf0ZWnIFUWM6GSk5oCKPqLAg+/QElfjjVY8QUQz4BS3e/u4UT/Tieoufx0QPQgEhUXm+CudHjLKeEDyg8R0+M+BLrzsur5bxo7fFdeWXftzUSSbamF2TyVJyCHF+Ic5eelhZIjVNh1/PC1fkhZqQmZu6mw/prUcqUgY6TBm9IorgVEZnPpK/NEceicFeHdqjcHwHqeIKm5GKC0=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkberhImNFdMxcrPrWIl0AJkuXkJ5tGetT3jR2efB1PI53A</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70JwrFIjALGeRBeUCbJGJFfPNn8502XUon1SqYmWAUYZlbfNmBLn3ah75jMuGe8c9hXxhtsECIFZupqCeO4KwBekc4+03zfmYrMPCjX9oYXoVxTs19xhXpWTA15lS2sgdEu4OQMdwEI053WyrztSwWkU6fGfUfyQnuviuElqW4yxfoLlPfmSaHpTOEK5B4fom70DuV0R1lv7iYVPWchmQhkmDvOoJwBg9DIRECTNwVai0E7o3wW7y3V8IG3SklFz/Iw8luyFOmDgDesnaaHgwVwTwYFLs5rLQ4D0zWnayMoMW</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>