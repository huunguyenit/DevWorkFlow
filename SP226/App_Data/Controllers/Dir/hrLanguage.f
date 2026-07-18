<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrdmnn" code="ma_nn" order="ma_nn" xmlns="urn:schemas-fast-com:data-dir">
  <title v="ngoại ngữ" e="Language"></title>
  <fields>
    <field name="ma_nn" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã ngoại ngữ" e="Language"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_nn" allowNulls="false">
      <header v="Tên ngoại ngữ" e="Description"></header>
    </field>
    <field name="ten_nn2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="stt" type="Decimal" dataFormatString="###0">
      <header v="Stt sắp xếp" e="Ordinal Number"/>
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
      <item value="1100: [ma_nn].Label, [ma_nn]"/>
      <item value="11000: [ten_nn].Label, [ten_nn]"/>
      <item value="11000: [ten_nn2].Label, [ten_nn2]"/>
      <item value="1100: [stt].Label, [stt]"/>
      <item value="11100: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwcuRJ/tl1+mnRx02ZGa4eG5kyh/NIpU5NFbv7iMHlK0JZUosAVwuvX+zNLl7aL5fVc=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2pV7rSVorM9mBSZMH148hbi2sBPIrwFEWHC+BYcFap5wnCcXpslfx/Z57ut8jmu0AbtgBu2KP47ZkqFsXTYWF0=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliuAwnQkdvQV/23f2KqHQMJ7VdueDk03jPXjIzQqAZkUGAWlzNLfHw76PANXyt/+2Ps1IBjjkvMAEOqlqtpO+Wf4B5sAFKjUFLcbjr8FwUy4STLQ75GSZckaQjXGDxt+ap1eGvlA8Hg1OfqzKrNj3MtLXAeE1U6LeCb3eHJdytA8DnCmFhrdu9P4pyjwIrPqEwyxss8Q+NTmRPJB9nVmpGly0ZktVDpVZJCxHpkOLXTu84L54r2XHM6XGiaHJx5uHUAbXqD3U6vUpX2vK7W+b6osdr7KFjHOnMMqBxhLmDECrvqiuzrmUDM8Ya5arriqhDzB2R/vM5Q/eyZMdJVQP9gg==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nviugvMsfP6OWLih63lQ6XciA53V97rzAht2otQDlgWl7a40fGWy4SZHkbFVOmWyjw5FRCnoXkSTN4vpTwxG066SO7Zo5oi7fzPl+Fb6Lsh6Elq7FMVYfxFGqEDZNaw5//L9frTu7tw6qjCbIqoHVCWnNvla9+c+izmMtK9hmHqnWsES6AjhGDQgtRudQoXPyEZOvk/6d7dcvJZ7lzD719XOf+9K+s78Kvq6igmh57m0=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/j6tIbNB8wRWN/q1eiAu9xW/m0vI560fhxGY52C14Z3LWeY0KAPc3Wlx8GuJHOj8aRF1bHwV3wLQxSzNRblwNUyk2In4xGKsN1FPE//gNm00YvAJJ76eRmfJXqMH9XKGZ7A9xdEHFrS41mVZ0oHcXXP0oI2mw0CWm8HfGnri/rhcOg4gDugMYpbZame8ZrbD2DF/moffmI4Z1rwJkm7avGqGOAienkLunKXlP0codpT0j0v8I0fxgXEmls5RxuXgDdAohEF2lkcT+LIS0GAJYaWA==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeqNGaiCqoeD5AeQVCWvPzpsc7kESlzFifjZuG1WQXupk</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkY3zVRaUfx20jqds+k8y4ABkC3p01xk6Ufja2IArN37Uj+4dWgvBHi2diALqAV+Mkmc2O0QXNOm4G09f4al9s/5b5jAOaOGlCG2MwrmMgoWLWC5PfbmeulZdS/dxQIDWuRG33Prp8I37t0IozUgmOYHHdSiOPyNoG6n76ztgf3jcBpt+uqHzxu7nJ1RK6kFI2jeP46ufVnXy41LCVkE7w/58Nxu0u1hbel1dBNo+LdX7oXIZ9K3BOfkVPylfokugnGRyNbZlQ3V8IZkRj0W04afqwRrYrTJwtbntFLj3T0+OL3vEF3rv3FeqqCJKfXYtOxw6U6lJYEu8Jb4Gn5Psk3z</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>