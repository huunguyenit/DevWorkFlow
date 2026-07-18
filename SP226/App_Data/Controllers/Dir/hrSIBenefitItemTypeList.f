<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrdmloaitcbh" code="ma_loai" order="ma_loai" xmlns="urn:schemas-fast-com:data-dir">
  <title v="loại trợ cấp BHXH" e="SI Benefit Item Type"></title>
  <fields>
    <field name="ma_loai" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Loại trợ cấp" e="Type"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_loai" allowNulls="false">
      <header v="Tên loại trợ cấp" e="Description"></header>
    </field>
    <field name="ten_loai2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="tinh_chat" dataFormatString="1, 2, 3, 9" clientDefault="1" align="right">
      <header v="Tính chất" e="Category"></header>
      <footer v="1 - Ốm đau, 2 - Thai sản, 3 - Nghỉ dưỡng sức, 9 - Khác" e="1 - Sickness, 2 - Maternity, 3 - Convalescence, 9 - Other"></footer>
      <items style="Mask"/>
    </field>
    <field name="stt" type="Decimal" dataFormatString="##0">
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
      <item value="120, 30, 20, 50, 330"/>
      <item value="1100: [ma_loai].Label, [ma_loai]"/>
      <item value="11000: [ten_loai].Label, [ten_loai]"/>
      <item value="11000: [ten_loai2].Label, [ten_loai2]"/>
      <item value="11100: [tinh_chat].Label, [tinh_chat], [tinh_chat].Description"/>
      <item value="1100-: [stt].Label, [stt]"/>
      <item value="11100: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5vKUly8N+aIxz7MyYkom8VuTFsc7N3napK9twZ7w6MaCjwdxRglRG2f6R+z/+cAK77mSlZy+a+7bj35OiMqnS6w6wbgPE4hF+ci8LOiulhz</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzduyCh1+HTdvQeorr8RtPimAtoj1h1UJRmUbPbbyiqG3pmDMWJAIP+wsl6B/U3gkzB6/7pClxX8LUn7W4iZA/Y=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliX76DIsuS4GUIyUtwUQIeEMpqoBy6Fi6PBMJ2+1iV5hc5M/ssGZGeVmxZ9C15Gwx7eOwOYnIC83EUbzIkXKDl5L4DO1XvuEJ6Vm1meAyEoaJHnaVHwJz6HsrvkaXiKw4A7eJKkcaQnVCBDRVLdBBLIfGgs8ywvCz8Qa4wp5X9m4l9T+/L7YRc3ZBC0oBFoErmhV5GV450QTJjPAmhfoaEoT5qfKQ2dYWBjBp0gXGZ5wyREJUKm0JF28u0OBBZh+xAgmfm60rIft/B5Gd22RJuuyqPeq6/GJhV/MSeMeXiSiHiZZYXkY/XAxmwMdXOAlBl/nCsF4zNy5phzHB4/aO+oqhMfrdQSQQ2Cbh8teFoTNg=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82n2yWu9hjJFlfsBY3klD8tats3kDmCDyXhi3KEawqMkLJjEmgas7elA3cWsletFMJG3+ikghBWn7L9uXLnJw3YB4lL3x0gPDj2HEL34gPeSYTh8krYoJgcFNIfBcN/ndXlwFLkxlyF2/pCAVNTvpJz0+ttcdeCyFnJThNkyOmDp26qJyYqjGtz9yh4ov6WLQ7NkMXPJhf6WS7GNO2TEp7GYSZEKblp+7ptT6m1ZPDZbE4=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jwMlrCDlMuk2ZBU7CprWOeBQqJNNbL3cRPPtAK5XkyLEJq2svAsXCP7+LbQLrg4c2RwaxfRslgI020qRuS++u4NrmktKayefu3ipuW4+qsOZqqhSMXVr5QZOVtB4jUTslzm12GHiiSi0I/q4BGZyp1eF295uGZWb0oHuyYpa2Bz0UMRUdzyN3Tl1HuYmJNRBtRMvu3ftydnHDvkJDsN+m5e8Zn0T+BJlKoCwPN+thma1/X6YXLVao3leSCbPa/9QxIjGo574rOScuE7TnAj8RIg==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbetWfBl0hcG73VT+s/+ZHj2hznlozytuZ4Xiqd+p6WVUY</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Kv7PCtYth+P4oe1oZrZznJYD2JYJ6TLpUydf4GeBodAJGOKb1MyATpxpJFyl7juXX/YQ5gIhwYONBpUc++j9aYYNzLe+uzq3zRdUCjPmWbqh8lyoFOZPS3pLeapMxgj1WJHbnefYrqO3jl47n++zMdLl9z7+1WS+SJSET21d6Lje62TnfwJboBE5g/IE5K2fymk3e9XeOX/KuedAALXQZq7vU884yp2W99ORmp5rlr20WdIXtqXsDPGaBSTw5q/D6U7kEU+ACLkfEQPceTP6DiSheiXQBvOJBaKSovrlqGDEuSxUNGTuew8oaQY6xk4/gM8LpZ7dVTaWvsZ9R6gnC5qfW8vhjU4nzZov1m2nBbS</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>