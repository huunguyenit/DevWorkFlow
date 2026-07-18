<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmplcc" code="ma_loai" order="ma_loai" xmlns="urn:schemas-fast-com:data-dir">
  <title v="loại công cụ" e="Tool &#38; Supply Type"></title>
  <fields>
    <field name="ma_loai" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false" allowSorting="true">
      <header v="Mã loại" e="Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_loai" allowNulls="false">
      <header v="Tên loại" e="Description"></header>
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
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330"/>
      <item value="110: [ma_loai].Label, [ma_loai]"/>
      <item value="1100: [ten_loai].Label, [ten_loai]"/>
      <item value="1100: [ten_loai2].Label, [ten_loai2]"/>
      <item value="110: [ten_ngan].Label, [ten_ngan]"/>
      <item value="110: [ten_ngan2].Label, [ten_ngan2]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwfPXEYPxgkZl/ohANukJv7fpOUBKOtnDEQfDF4F6u2THglJmfOFxOxw5a/jyKVTE0E=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5j0FqrM77GENhAy1dfNVYbFwUKHe8Ecu78vihMRKRWUJzpLQj1uymBx00gQGW6M1Gu3vlUdef6Iu7Cr6iIXFg8=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbTihtmGQDHec8XcoCrOAY8DXeeCi+ES4uYv5Q4DQ/vZaWddXCI7PWaotKgYu9/5x3oPW/cdNvYTpnxJYnWRCkGs3LipiwHlWCFLCQa1S26QcmBJ9vDxkrnU7ULlz2uPn01KYh85+y6uAGJ1Z/jYHVQAbAJhYiWBgdsvFcVnnS4AEHbS5PPErgT4js/mZd7r1hRO72gR46Uj1oQSk1cS3KB6Kcy5hVN+On3RWu+qyDgEykoL3asaxAbdWerjPmo2/PE1gTuKjN1eQ4F1aXsb6C1QBtQYhCfQCYrOkGPB4FA7prrBaCPc8aWCQCZJ31XkNGlPkSsw6f5HP/V24+nbVD3FIQaj3n9UlSvoo4TgPnyvKi0yZNlWicQt9T7Wctf2DUkT4OUL5ckwdANsjWhkDHpkWr6Am/Ica+rsTbhF1FHLMB51Y6ssW2PBx0KqobEya5PvOoyG/b6RExM805ftxyQJEvI/s60TwAN6m3N6s2X5fdcx/Jks2jV9pFfylZPG27Vt+BpVV6iRQfNn2ZhP1L6GHnfohyVj51NpqIbT4n6Iqq2K1Npi0pODRzBKGLFVC/s=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82n2yWu9hjJFlfsBY3klD8tats3kDmCDyXhi3KEawqMkLKmuyoccBgx2d9B+fDq7/0kcMS3ojk+LBVBcQr93cZtSGKBPLGaFGNMc4EBmX5/4v4FtLuGdNiGui1ujPNm9pOeWcA8oo+6YW9Rg9ktbN8X5vWaD1f66eDujRJquydSPKOY+0/JE0ruxAEz1f4Wr45D2cSFH4GeGeTcOy4+yffdZ67yGaCWP2SGUzI7manIcEg=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jwMlrCDlMuk2ZBU7CprWOeKli8E4+/HFlWRu3RnyHwHg91B8DCGvf8bIWbs5DxD1atJsacaR78JQq7Dho8VSsO0eYF1ybd/uqkikhqWwU5uwrToxHsrl+nsKZHIfe+i9iQsrGQXy7oTOTsC9U0pTZIR0iYR+Da8VOhQWagqFsmOZ2SK9b3PsCq0XkhCB94tHAG+6Z/Mj7paR3Fs+sUxwQcK9/k+w4W5yhOitx93PKmPFuIVJ4/q+9l7wyajgVHOwGrTqXTQ7k6J3diTlDBnNEpw==</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkacH4gFBdP9ZNKLmXhna9RhWugAg1YZOFu+jNrBofzZYUc8xNMdAd/z40Wcwt6fwYtmu9MhL2PH4i9RyZbEbfgEgjH8WRQi0m0O0D83Sdz8UIlFrYPezCS85sAZZLsZaKCLvAuBExOM1oAj768GML94lzzhacOv33Xm4lE8EyRQIwGRv7yse1gbrF19iv+J3WX3gthyqBBVgchCp18/29w1BeXRSTFZsDaX2ChNXjDptgP3AS/lLE9gygpsPzZAhwhyQLASaaAmcaUdo+Nla/ZJD6+cISO/MqLs9YvrQp7e8m+XkBK4KvZThSBKdIsFOXM=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>