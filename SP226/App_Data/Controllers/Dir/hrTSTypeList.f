<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrloaicc" code="ma_loai" order="ma_loai" xmlns="urn:schemas-fast-com:data-dir">
  <title v="loại công cụ, dụng cụ" e="Tool &#38; Supply Type"></title>
  <fields>
    <field name="ma_loai" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã loại" e="Code"></header>
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
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfx5ygYUqBflFA7N7aGadDr6AhuLvK9X6Q4Zy/v9VPQVhVLcm3MzXvjbVZ51TbUMJGnvmGyCsdCwL1aZxGRwFYUg=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzEp+Wwpz9WFbS9qn2vXwT1yKBp3J0yEwZn5cWeWmmBY5GMnibFqtBrac3qltX30CQpy9IZmq49BiJcTSqKTuxU=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliX76DIsuS4GUIyUtwUQIeEN9eCLvKT5BGDbOHHTQ9s46GbYrE8WuT7CTR2CdJCLZQC/3VQm9ehz6YetGaXALwkX8AF6JaCUSM1HH2LWUED7PsHWUqYCC1HbM/upAPmNgpdpa7rVZmBsO1MyI+oBHIjMzvm+HFF+pEANqNNm8CQLD9gRlR93a3NrRFrf0qXIh8iq3YN9U3jEoNIs6D/AIixmh6ZSr3epqJDnzulCF2FWmDDA5M2knh3vJb7bIYD45WOrLF+NSba/GygEGs4N0F4kAEsWuAmOsYu4zuM7GWTGMoKHWutitgDI+puY75LwlOk1dG4nQ9Yi8W25Awxtt0RmNTnSqfPfrseIjEbWV9kBg=</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Oc0QJdCnkoxRoPQPeia/JX73aY83Z60IQgLHGGKECC4XbPpF+OWLR3TFgV1H8neSWVVRN9T0dEDPhRB6DRXTHPWUFoFHChzjPghRU+bxXy9XLBN5tAKR9rFBDb3DSOMOit0nNfdf/d66PktME8JtSa2DseYLqU1nEF0VM46oYC1InO4pwlnIaKh48gDokjcieHY0av620e4TYFFj2/uSzVs7OWemzgq+t+mFgjgLUI4p+ILke95ndLa40gu8S1rbmU7lty36aMeMSGQAuaCjtla1V1ZVo7MHyr3ev0TRnm5n9waLKGcG10iclU5e7eYkRdb4whcO5kLMXUWrjUjU0JSSMl8/6KE3V3HAlfLC4Y5</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>