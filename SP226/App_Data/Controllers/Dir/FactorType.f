<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="xdmloaiyt" code="ma_loai" order="ma_loai" xmlns="urn:schemas-fast-com:data-dir">
  <title v="loại yếu tố" e="Cost Factor Type"></title>
  <fields>
    <field name="ma_loai" isPrimaryKey="true" dataFormatString="@upperCaseFormat" clientDefault="" allowNulls="false">
      <header v="Mã loại" e="Type Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_loai" allowNulls="false">
      <header v="Tên loại" e="Description"></header>
    </field>
    <field name="ten_loai2" >
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
      <item value="120, 30, 70, 330"/>
      <item value="110: [ma_loai].Label, [ma_loai]"/>
      <item value="1100: [ten_loai].Label, [ten_loai]"/>
      <item value="1100: [ten_loai2].Label, [ten_loai2]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwdjrQZT9XBG6EwhdJW5SfZrb1ba0s5NmtptJi6wlRvHLjvbd67CvP3E6f+J1FZpoTY=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5j0FqrM77GENhAy1dfNVYZSHzUsNZy3eijY/jo/pJaZGx35WOzr0M4BUix9xeyIXpH/nAWFYZKvMpiHsdlOA7s=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbTihtmGQDHec8XcoCrOAY8DXeeCi+ES4uYv5Q4DQ/vZaWddXCI7PWaotKgYu9/5x3oPW/cdNvYTpnxJYnWRCkGs3LipiwHlWCFLCQa1S26QcouxuwCNSv9LJumkQ/bCl7eTcm0bzqdfJUw3PQ3uSWPOX+SuP5iXcIbG/Xb41e7PO91VnV8nDCiIB9Epqr2QqS1qxwhBxUKUl6GxccnF9jBJZicAdYx5InT0d0UShssjNZ0qpXg6w/MoM79yGER9+xPpYDpuIzTRZJEO+vLP/L2fd4fd0vQyZTjdDHD7ZcJ7ES6FBKKE6c2tAhg3MH+93sjxdJ+1YCBwW6i1ae8Kp/+LQi54fZVcalIAvLfkkvj6TRmruRclOWtd0Nx0gaX7iT9Z6JJ1JsXYuHNSC+vvTFSEvD4Vk43FMd+rsaCa/6vDQ+7yFNuix2WujnSbtT30K58a2oR/2K6G7vvoYCGHo4CAkq2hzAcNKA/jLTiEPSRFDtv6ykhHUMlFVsWs1wsLAZAn/Z15uwHafoLDuN6d4XlyNWIGWkrUtUEcIwy05LDO7/1gCYjXTdtbL5E8B4ara+Y=</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkbDTh8XMlLZCavGRNt7YAR9R89W+T2i3SdjUgx7s5BfNc9QJVNTAL01Sjtb+/WOsB3daGPmUBtcLMX2wQ/iIGwRBLFC+5WfemkdxRMo7mx+eJDFfCYugWZKdpp0+4/j9F+MkCi0BOuiCRjGBFUOh1aKRqk9h7GZ0TyFGDn/2VlQySy18hGlrsjpmHo4N6sIsFntRmyDLixeCkSpb9/qni8Zpa0nC1MYXVrAplPWUy7atWzVSwxGG6FvLeAPdtaqEUJ5x7/fKOlO4IuHgWp54FW5B88NEiZuiuzujtWlWv4iuatZwk5DNIzNAEy/jLVsztbWUML3o70iyOoUGQvLcv6x</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>