<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrdmloaipc" code="ma_loai" order="ma_loai" xmlns="urn:schemas-fast-com:data-dir">
  <title v="loại phụ cấp" e="Allowance Type"></title>
  <fields>
    <field name="ma_loai" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Loại phụ cấp" e="Type"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_loai" allowNulls="false">
      <header v="Tên loại phụ cấp" e="Description"></header>
    </field>
    <field name="ten_loai2">
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
      <item value="120, 30, 20, 50, 330"/>
      <item value="1100: [ma_loai].Label, [ma_loai]"/>
      <item value="11000: [ten_loai].Label, [ten_loai]"/>
      <item value="11000: [ten_loai2].Label, [ten_loai2]"/>
      <item value="11100: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9EA73KXAz472j8BxCRLPsvO8Py0VeOndU+GbZi6dpt2np++90znTi/6q9O5+Fp/eHm/IB/q5RLK2ymV4JA3t8E=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1MpVFDKK00MnirxsgsajDdO8wvxz9xeQYL6dHH/Q4n+q/7RzWaXxVrQd2swB7iF9WcGdV230uozyJ39Seori/I=</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70I8cKshdMVFC4j1XKHyCocMeKHdQbkjXD1fCcgPhIpK3l+HxdBOGuGS4BjGspR3qeb57j/5aoDqev1+cS6U3mPlYpbINROaVYeKGW7CF9JRMmMcazL4CTbE3JqzqP9SqxANMdOzLSLuIDOXo42GqxM+Ifq7T0P2Hr+36MZA8d1bSPEzf7LKR8OLjiHZ0kMOJTgB4lUmW3/TLQ4+jWXY4Vp2FzwjFVwfIQoKmpAdA5KcZD+I+hLlw3VEvpH6YGPPRLIIr7XBKcQPGNvfboD7Rh1WIlQ5CuRLm0iPHCaeV/Uo5E0FZMBcytVVQCBYdsG5dnuqXPLYnsZ55t8aLYijuNvyOdx73+3hNEtunqAc9Aluh</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>