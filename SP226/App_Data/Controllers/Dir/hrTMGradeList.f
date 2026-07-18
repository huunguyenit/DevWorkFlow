<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrdmxldt" code="ma_loai" order="ma_loai" xmlns="urn:schemas-fast-com:data-dir">
  <title v="xếp loại" e="Grade"></title>
  <fields>
    <field name="ma_loai" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã loại" e="Grade Code"></header>
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
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfx5ygYUqBflFA7N7aGadDr4wbFN1FRf2gjnW3uMIR2OHGAWEQvu5VBYfEqUOBIzCpRAvKoVIqetgLXusVszpQuE=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfxo9sadXlwFLP/JrHDWSfC7j6tBYPGI9bBslajL+zsNshRELHd7n406cLeBTkLXtVRLtA/XCPSg2JlXtny27Nso=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZulitBK3ezEyT+gb+riBolOrDannoifrmxxRy1yDferwVmTaV8+swE8Pdknl1t7y/INznrtue/hJ4tFxce9e8xC1LjlhwJLyDP/Ko1a+hfg6O8lvhmIOiNAnJ6AOR57ZMYPNbCN21OG9nK/r9vBImjUsFCcEX4g09sQ02bNu4Z4GiBr7U/rKrwL21h6HlsSFCBV0nhvq5IJyMbV9GZ34xGO10827as7RcPRxGUg5L2DvWpVONvJbt59ESzz2PRFGE0BEHDK7861x0cOHNqgNNlYz4M4QLrl/Jag4rell5fZyhn+2yvLtWBT+2EYJDkTkpmvdA7Se1q4MVJPi9MDFL4BABA==</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Oc0QJdCnkoxRoPQPeia/JVbSPc8kQHgqhtmQF7qeIi9V6HJiqOeWtE5Cg1I50LcAhg2dG0b31jo4W962I1/okOchpeU0nzGvHK/Xia541hDMO61us8nNLA9BhbL/K69sdSTTtKwbWYaHk3EbVDK0YwpS7C4PH9yOXwR5XbNUDX5fOorJ6G//XjxLd4wC57tO8jiIuU/n2x2hnxIn1Obf752lcdtZY2hKXfzZmHHeDdh9G8HoOrvWCsEUlk8/nKpDF18Ouloci9b5twq6qE9EWxEfDXZIykY5qUWKMQG171DteyMALG1GNAubuLCS2g1Xg3oxSiyC4WyKjxYH/C39MlJscf3KEToGwtyduTBYRG9</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>