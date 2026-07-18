<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrdmlkn" code="ma_loai" order="ma_loai" xmlns="urn:schemas-fast-com:data-dir">
  <title v="loại kỹ năng" e="Skill Type"></title>
  <fields>
    <field name="ma_loai" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã loại" e="Type Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_loai" allowNulls="false">
      <header v="Tên loại" e="Description"></header>
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
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110: [ma_loai].Label, [ma_loai]"/>
      <item value="110000: [ten_loai].Label, [ten_loai]"/>
      <item value="110000: [ten_loai2].Label, [ten_loai2]"/>
      <item value="111000: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfx5ygYUqBflFA7N7aGadDr7BtwZOGI6knISmAxMGjz2jcgabTblu5liaNY4bAVM8YQPO2SbAeclKcBxsjBPkVjgzDCLrvRY1lj3VU+Ttcy8G</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfxo9sadXlwFLP/JrHDWSfC5LLPTvGKmrgtW0kftrpfWKsgIXa1KnL8paXu25XMWDxtfuPerQyPclwocRAKaySz7JZP45yft6q6yO71cmbunr</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbTihtmGQDHec8XcoCrOAY8DXeeCi+ES4uYv5Q4DQ/vZaWddXCI7PWaotKgYu9/5x3oPW/cdNvYTpnxJYnWRCkGs3LipiwHlWCFLCQa1S26QcouxuwCNSv9LJumkQ/bCl7eTcm0bzqdfJUw3PQ3uSWPOX+SuP5iXcIbG/Xb41e7PO91VnV8nDCiIB9Epqr2QqS1qxwhBxUKUl6GxccnF9jBJZicAdYx5InT0d0UShssjNaQ3mwOP8tdhk7ISK5h8MTBKHdmr85xDl6TaCtjfRQNvZom/8Jy3ZMvXU7JTOd7zsn4v3oCimlNi6oJuzZjsdZj0FEq6YAjhn9+v3avHuIwxxQ59SbzXT2f+1VarPW3thGASfZH97tYfGDScOqBJDSGHgRbsI0gMIywUXA9Jsz3RU0RHzLWysAte3x/D9xyAfSomP+KN6oJEEFbazX0V4/ygRag8UWrcrhi75XnL8h8ezUO+916nyXivcGYlrRnE9KL4FDqD/DIvfRihh+ECcS+HshjTcaQz1xYUhtXZQ7RwMakuuKO2yay1/1R7RIoUvw==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82n2yWu9hjJFlfsBY3klD8tats3kDmCDyXhi3KEawqMkLJjEmgas7elA3cWsletFMJG3+ikghBWn7L9uXLnJw3YB4lL3x0gPDj2HEL34gPeSYTh8krYoJgcFNIfBcN/ndXlwFLkxlyF2/pCAVNTvpJz0+ttcdeCyFnJThNkyOmDp26qJyYqjGtz9yh4ov6WLQ7NkMXPJhf6WS7GNO2TEp7GYSZEKblp+7ptT6m1ZPDZbE4=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jwMlrCDlMuk2ZBU7CprWOeBQqJNNbL3cRPPtAK5XkyLEJq2svAsXCP7+LbQLrg4c2RwaxfRslgI020qRuS++u4NrmktKayefu3ipuW4+qsOZqqhSMXVr5QZOVtB4jUTslzm12GHiiSi0I/q4BGZyp1eF295uGZWb0oHuyYpa2Bz0UMRUdzyN3Tl1HuYmJNRBtRMvu3ftydnHDvkJDsN+m5e8Zn0T+BJlKoCwPN+thma1e5YMV/qVRmzJ1s8FisLP2TGjNNiiLm3bW0kjezM2MTAYC0SKllpeYHKnweT3wZz2AhPggY+YxdIQTe1JeqYbd</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbetWfBl0hcG73VT+s/+ZHj2hznlozytuZ4Xiqd+p6WVUY</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IvSjR6yj+SBb0N/niGOepHnepBzHxGljlTn9zzOVVMIRIIyNoO+4T0etlmsi4hM4nslY9oGWZu+tPoqb2xEb2w56zhgYOCbWMjMl5Yw0TK9rcSeRquoc8aQ9d+FgJS0bJQpTXm81nLJy3pQF9It52nn</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Oc0QJdCnkoxRoPQPeia/JVQDhu6pf1jXRvyCAhJPnjYKHdoGYsX9fbsEb7ZP5kqS8qBhHj7FSbYBb0En6HBzrCnHC9jcHiuajw2M6BrmQ1UjidKCfEfZYFkuPe3Yhj3+s+G1iujWNPom7QkiGrXdL6+/CuVt9bYpkJVsXUkNXSzRJvct6mWp22/rMxTdzGYDbC9+VSIZ0oWgh+vyef4SKis2mtWrtkr0WPzQxruMTDEotcwMQn2DUcj3a9Tk4kCTVlfx4eo4aVkNQ8sxw8Bf0vD/j0qK+H/eKRCOZb0X9tejwj8Zogn7Elm6Fy7HZkbC7fDmw8JDuh940C3rSZrFnvyy1vjDbZEHxJmCKZ+ppy9</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>