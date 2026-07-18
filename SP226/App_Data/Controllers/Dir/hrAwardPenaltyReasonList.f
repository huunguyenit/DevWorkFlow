<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrdmloaitp" code="ma_loai" order="ma_loai" xmlns="urn:schemas-fast-com:data-dir">
  <title v="lý do thưởng, phạt" e="Award, Penalty Reason"></title>
  <fields>
    <field name="ma_loai" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã lý do" e="Reason"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_loai" allowNulls="false">
      <header v="Tên lý do" e="Description"></header>
    </field>
    <field name="ten_loai2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ten_ngan">
      <header v="Tên ngắn" e="Short Name"></header>
    </field>
    <field name="ten_ngan2">
      <header v="Tên ngắn khác" e="Other Short Name"></header>
    </field>
    <field name="stt" type="Decimal" dataFormatString="###0" defaultValue="0">
      <header v="Stt sắp xếp" e="Ordinal Number"></header>
      <items style="Numeric"/>
    </field>
    <field name="loai" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Loại" e="Type"></header>
      <footer v="1 - Thưởng, 2 - Phạt" e="1 - Award, 2 - Penalty"></footer>
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
      <item value="120, 30, 20, 50, 330"/>
      <item value="1100: [ma_loai].Label, [ma_loai]"/>
      <item value="11000: [ten_loai].Label, [ten_loai]"/>
      <item value="11000: [ten_loai2].Label, [ten_loai2]"/>
      <item value="1100: [ten_ngan].Label, [ten_ngan]"/>
      <item value="1100: [ten_ngan2].Label, [ten_ngan2]"/>
      <item value="1100: [stt].Label, [stt]"/>
      <item value="11100: [loai].Label, [loai], [loai].Description"/>
      <item value="11100: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzh9VBnL3Sc9uWcwAXvA3TcOcfUo9iRs4oSRbcCN03Aigi0oZrfkbfeF5KNAeXOHhIfqjkmqofuhah9bJ67Zq5l6kTaq5FLLgMjGh6UFX+v8</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf7ofypjYnBkSUjsaW332rdd5+x38KSONZhkAu/v2DkOqqSCLIUBLMDnbVjkBCpo6gen2RiD8XY2Q3lThh7cZ9zfNmykstEDETLbP9XOOSlUo</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliFs6a6Wd0T8TXYWCrKniQwRoD0Dx1mxXihSHtlnRe+M8Le9tdjYegBImdjWEqXwT8jwTIBT+bqEZWazkbtQuzDGGfVA7MVaTjLoAgY47KLGvQpyizEBD708RokRANxjDt7XzPe7WR7RquSzKwuQKcICRFfVQzqKSPiHP70IAslWJWANMEzIKtSv1fxaYur1jhsbiFC7Y6hF0yr8Qjxe0iFe8/SBTkioor0ZCPoP5EMm4iJOdcAv14n0scMc+4A5W3tN4ZiOmZcCvT3G3oxWmNELAUkbvK78eji0vmse4+jf47gGPPLBwQNB9Uxh8Z++lwjj8NaGpKQQwZL0CkKlSZDOIf4fnhc98uXIXIjQRWB8I=</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70KUda97fh/VgeRrMKrNykFq1Z7w0eBr5onjleBjF6qsj6uBsohc+9pn0AKKuDxqMhZ9yeooSOaH5w01UQDRrSSDif7l/+5FnJPQlW1s/UModiIt2B2BAoiq6wi5Z7CRQ7dZIrUKdwM1KdT4BjMW4VPs8MrJ0hi31izeZqknA7l/JNAiVCQG6Utwby6hKYiIL0JkVlx+c2WjTolwdpEk10B1e2swKuYYFxh9i9wA+fh8mepZWQ3vr8xQ15wJIjsummUah/qP8hn9yjek8PyCIS+OFdggXmEY8ctYLZIJkSzIDG9hSvELN/itgrl2cWMKnV8WSHb8eYtf/ibT2dNFOTKq4BX/uANS5c0f75Kg3+ODT</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>