<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY GetRandomKey "declare @rkey varchar(16)
select @rkey = lower(left(replace(newid(),'-',''), 16))
update @@sysDatabaseName..userinfo2 set rkey = @rkey where id = @@userID
">
  <!ENTITY UpdatePassword "
declare @invoke nvarchar(4000), @action char(1)
select @action = case when @@action = 'New' then '1' else '2' end
select @invoke = 'EInvoice.Account.UpdateAccount(' + rtrim(@ma_kn) + ', ' + rtrim(@$aes_mk_tk_hddt) + ', ' + rtrim(@$aes_pass_hddt) + ',' + @action + ')'
select '' as message, '*******' + char(255) as view_mk_tk_hddt, '*******' + char(255) as view_pass_hddt, @invoke as invoke
return
">
]>

<dir table="tkhddt" code="ma_kn" order="ma_kn" xmlns="urn:schemas-fast-com:data-dir">
  <title v="khai báo tài khoản kết nối" e="Account Profile"></title>
  <fields>
    <field name="ma_kn" isPrimaryKey="true" allowNulls="false" dataFormatString="@upperCaseFormat">
      <header v="Tài khoản kết nối" e="Account"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_kn" allowNulls="false">
      <header v="Tên tài khoản" e="Description"></header>
    </field>
    <field name="ten_kn2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="url_hddt1" allowNulls="false">
      <header v="Liên kết chính" e="Main Service Link"></header>
    </field>
    <field name="url_hddt2" allowNulls="false">
      <header v="Liên kết phụ" e="Sub Service Link"></header>
    </field>
    <field name="url_hddt3" allowNulls="false">
      <header v="Liên kết khác" e="Other Service Link"></header>
    </field>
    <field name="ten_tk_hddt" allowNulls="false">
      <header v="Tài khoản dịch vụ" e="Role Service User"></header>
    </field>
    <field name="view_mk_tk_hddt" allowNulls="false" external="true" defaultValue="'*******' + char(255)" maxLength="48">
      <header v="Mật khẩu" e="Password"></header>
      <clientScript><![CDATA[<encrypted>%/SjCqBsXcIoqRaqcL3p1tsRx1/cjsycNYxfWXh6BH4kErpkNwFreg//uLxIy4SU1</encrypted>]]></clientScript>
    </field>
    <field name="aes_mk_tk_hddt" external="true" defaultValue="''" allowContain="true" inactivate="true">
      <header v="" e=""></header>
    </field>
    <field name="user_hddt" allowNulls="false">
      <header v="Tài khoản hệ thống" e="System User"></header>
    </field>
    <field name="view_pass_hddt" allowNulls="false" external="true" defaultValue="'*******' + char(255)" maxLength="48">
      <header v="Mật khẩu" e="Password"></header>
      <clientScript><![CDATA[<encrypted>%/SjCqBsXcIoqRaqcL3p1tsRx1/cjsycNYxfWXh6BH4kErpkNwFreg//uLxIy4SU1</encrypted>]]></clientScript>
    </field>
    <field name="aes_pass_hddt" external="true" defaultValue="''" allowContain="true" inactivate="true">
      <header v="" e=""></header>
    </field>
    <field name="dich_vu_hddt" type="Int16" inactivate="true">
      <header v="Nhà cung cấp" e="Provider"></header>
      <items style="DropDownList">
        <item value="">
          <text v="" e=""/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="110: [ma_kn].Label, [ma_kn]"/>
      <item value="110000: [ten_kn].Label, [ten_kn]"/>
      <item value="110000: [ten_kn2].Label, [ten_kn2]"/>
      <item value="110000: [url_hddt1].Label, [url_hddt1]"/>
      <item value="110000: [url_hddt2].Label, [url_hddt2]"/>
      <item value="110000: [url_hddt3].Label, [url_hddt3]"/>
      <item value="1100: [ten_tk_hddt].Label, [ten_tk_hddt]"/>
      <item value="1100--1: [view_mk_tk_hddt].Label, [view_mk_tk_hddt], [aes_mk_tk_hddt]"/>
      <item value="1100: [user_hddt].Label, [user_hddt]"/>
      <item value="1100--1: [view_pass_hddt].Label, [view_pass_hddt], [aes_pass_hddt]"/>
      <item value="11000: [dich_vu_hddt].Label, [dich_vu_hddt]"/>
      <item value="111000: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VjWAjSs2gaGxZUXnJJ73ogD6bf+6LTuH2KmpJT9+DQtxQZpQHc1bDORiwJdywlr69wTjVIygH/rTyACEgVKpnOilnifGTQXx4INrPl2/1JrhC9cR1VKUayL3Hmi0Qz7XQD3DptGE84J7Puz9XKg1GgUWo6HZrqBuNN+o2qXGRuK9muU3AAU31/9nwm04CXdfYEFUqZJZGhJ9j7nzd4CCA9ccPCfWdzJa22C2h6DOpZjH/M7kq9YczlNTrdj8YWmDRkRcPED88cBwK73v5gmLWlGsaS8GGLegpE9UHi+IxmvepxF6wxrDRs3xFnGS8zgA5/erMDUaD3Lcr+FOwYqlwnMx7uEONBZGuvmsnNCk4SXEAB5zH3lS9Ye94VVnQHJDQ==</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        &GetRandomKey;
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6eu7hWstoWGkvEIrwoeVJex6Dzk1u3kYHu7I6RuoN0XtaoX6gbiDi1kxq3EU1dTabuQGty7l6z3Bm5W2Tf77BVn+ciYPG0k2azcjLVuGs1EFcNo1mvDSbMd3RzHTIDNu4Bc9PaTO6K+uQQTTsQ4V8vEv5kO4g2uHFnciOPnMYY+PtTQlf7sl8GxFs87u3fWzf0lQuOG79BCi+2bKAKcHkKVgv/04cH5QaGxKKzUeMC9aAu8kf3p8LFxt0vRJ1oYf8Q==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6eu7hWstoWGkvEIrwoeVJex6Dzk1u3kYHu7I6RuoN0XtaoX6gbiDi1kxq3EU1dTabuQGty7l6z3Bm5W2Tf77BVn+ciYPG0k2azcjLVuGs1EFoohs2moMMCI/dWhFgR4TEEZ5dlFwQEYOY6eV763QtRmJADE2SkmTl0Vpk/eLfr82MMpxX+QqDpyEK2bR4XE01jrp8w0GtNSS9qMxbGctu10=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf48ikxeB1o6VCTSqhc9KgfOUIpObrlgTzeyE+nmTM+BqZjQnTb1laYuFwlUcQdeCS0kN7Js4BaX1LY8Nh1l9fEw=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbTihtmGQDHec8XcoCrOAY8DXeeCi+ES4uYv5Q4DQ/vZaWddXCI7PWaotKgYu9/5x3qWhbzAvBAQoBg2bxbCPWRgkOmb02BNunT1w8oRonabOhzdEfcWjpJPWlZOp9tKbKgfKHC+u8qVoAnyQtXwPv/6SmC+pqxPSc1G61xrfhJ9UvXPOoKGoDXUSOW77xjH/1q3wDjlmnhwkvDWpZDvoWMTPrX3cn+oIzmxXyJmeGBsUqjcugIKWqdBorFuosdaO6SDIDS7CGFQTqXV9rTV30WlhyjoRfP8CKLTg6erN2Id3M3niIYWKocN4CGQqWIAKS97jm61sZjVF71nHzc9fPoGRmXNb3i58PjHeY3IdrYTnp5I2veF/9IB1Oo1PPdTd0IsFE7RIMqqNommwYnPfP363/DXOy5msecYflKs9b2wBjIL9TsqwP3b3EfDDXRfhcApcz+M00bBMFbbcIq/XKQVxkfz3hf+52x+8X9VzYRDWiRolx7w8anybPOO5OGyrNOV5Use1UBiKD3mbHeBcGXdnbBpSMujgZ9aU99DSNUph1s1i05PpiPGvdnym/NsRt0vrK8R1nyEXgwUWx/Kk/75lW4ntWRgotOg/ZSLWJe2SQ==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nqxnsQodNPkHWi8z6+3rL6faYLqFa/gumKLM3jhwHk2tcJhSXfJgqKvQ5B6tFOAjR8xlL+1f4+itaLpjghE2Cd71xxzJ/UDhGGYvZuRu0b1G68neGVlDmK/05aQZSklA9XSm5MdBlXX8NNsAl1cAss2FFc1TafmeEj+lG0yzQ90phHOXeWD7ehgsAFtWKyYdCT9ynF9LwAZYA8A4Z08x7qCKlLwYs2yivizMzm5853A8=</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        &UpdatePassword;
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%j1otayK5ACecpldW/VwtPBdclkeSZ2GTaquHeD5ySH/WTro/l23Vg1owSDkD5pl53+GVUUL6ODNjYEjwG1EuJjDWEcIcjtzXeIVL5kZ2EAnXaYOW5isJdYJIqmfsVO4ICXFkS3qGO0W3lf8JJOHKMBSnkWbGOtD3j5uD7Ah9whZ/KM3LOm/f9cZqRDit9z2sVAqBLzEOEKOzzdET35LzPV0v3b7BFmJas3070cB43NqmU4hAtgiT9PxZyil/J35iIRFiTYRrg5lI3+LM9P2rrg8Cefql7f2xQrtvJ+b9QTy/rAdRJrBa55wD1vwUkJ6wOqkZ1482WGAvf7L9fp3PanSmbusy6GbqH52LDr0eL40p8iYR4OZyvggFzDh1DzP+</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbes3+fT9Dvz6H9tLF6RcF/KUUn7TsLCnzpUB9nIH6DkJT</encrypted>]]>
        &UpdatePassword;
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IuT1dxST3nlSLlIaFoYa+56p/wKNdMyGoDp1hp44p4sflcc3pCF6Y/591OHK0vQWhmVESXB8vfLmZ8R08LaghZNBGqUXECyBXisiczrbTIWNjVC25bOPX6SYQwV1off/I4Ld3uPYX7DjzwP54hGgwzi</encrypted>]]>
      </text>
    </command>
    
    <command event="Deleted">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6bmcC9DnqVXSzDoHF38ZsCy2igONhO81rhLZvPBH/C16K4mrWRAcBGz41kdGZmaM/g8tnYCXQ6HAuP32JVeXtRMnb4yuZzsEBn4qODgQwA01EW0kDTkldXJH8vmy60QkO4izX+Hl823oeGj8iGEj5gNEDBkYFXP3cpFkh3cSaEqp</encrypted>]]>
      </text>
    </command>
    
    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf/EQqz85GO4GXM2yxBmYhbaIKmVwAMSN7xjvxjE63c2HhQ5RdvFs+0X3gcaWgAr3JSogUk8kSUWdFIpqz/dwty3jPHl88npK/RA4pbg2H2hJWkTHMsTD3rAisFln26sKnSyHtKM1T6S72/q8vlp7gtUhz5XjWH1kMPNRUw9yT/9OV/EM5BAFuuKy7xgeSX2ou7fPbSgS3WhhRCe4CobB9KyAnT6oXdIIcXvbWMTtuFCIT2EsVkuyZD7zhP0ow1ouS4TY0zQHx3UgiuD4hU4r8jRvbiRfVs1Qv9MS9EdAZl1JnTfakTHWJJHR6kJmYDJjvXJr5d1qaTCFFwM4cNnz7jTzUpBtBys+/ojmioGe+xCSqdBH/o3DtGZfscoTmwU/dp2cOsrRHOgAc+PJ475BDr7ij2LqKFYtH2AlomWDTve8</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70HjNkFMCMT+dFvazG+JBPLvo61O5K/4c0n8QtlAaokqxnMKqLEdnqH5xj9nHD4etzIWwNd4AokgewSGJHI/lvKHmTs+hKkzNJgEzAsWTJqdFWd8cbWv34tl1vjyoGWfM0u8XXlCRkA23BG9Bq63FufT51+zGL56nmTfIJM6Q5+etPdtdJjlJkJTtU1bbrZoQss+5/Lo54LLYfRjW+d0s07tHPmJXRpgnso+IT+VZK2lSZccxdH8MN2h/1IwmsyuVeKRXvQUGIpOBfVuaEE5okPmTDNX2neixplYtjKkiKFCtEIy0i6dUk0k2KQqyY9YdQWlRtUnEvYVtACuTABqOiHc36IBv2toEUFcB5tsxaDhbQfDPN6A5PbVomckNyNmU1X3zIovg6PLjnrVGDe8NFLBfgPMG+QNRC2oPhzwSAg3j1f6E3OUb5XIeSW1ll+rH3tDSEepmuVvAvOjgvybI8boJZucKpNjbmkIcOTY0oQfGVQnBadmG1ZECF8tWC6BYAKWmJGPiXtfNpso9EFB3qYjXRWSQXFLsYHpkJ8xoZvSlMGXoHYdh46j9Ak22pG9iCekmvzCqNyZktOPnZmrn7jjWi7aRhaT7aMPy3DnIz3onCtT/ALftWND5g99MlKNSbEjRECG65Kx3XnvUNPo6ThrwQ/sX5KDysHAKqLZxkN2Q9CM3OIE+6PPNNYBuE58FU6Zx4naGlwVeyR/IN7M7qE/2XoJ0tURKlcZtQaFV7cDE+Fomgz7pzQNNuanQ1SlgXaLQa2vGxUKZZ5RvuxQAGquGD2yGNs7Y83stghwQyM3M77f9pF9kfb2KpT65NmrmwmuQj9b926Nr8tBJc5YIuel9wNf88OBioq15U/DXrSACdCDLPi6VA6br/uf2hwPTJpRCAHzfgfOwWBXmW6kymw8si8d1Vy8Kjcx/DksT8DdRzGkfJTBuJ19SoAgSvYbV2ZmkkCP76Cg489j7nivhu2OgGarbsefMeRXUmbS4TF62Jy7w/FNvZfLwlpBfG/zzdhp9q5pfkPCwwtKEJsTP+G4=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

  &OutlineCss;
</dir>