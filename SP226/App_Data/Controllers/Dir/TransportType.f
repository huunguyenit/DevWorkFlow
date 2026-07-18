<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmloaivc" code="ma_loai" order="ma_loai" xmlns="urn:schemas-fast-com:data-dir">
  <title v="loại vận chuyển" e="Transport Type"></title>
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

    <field name="ghi_chu" rows="2">
      <header v="Ghi chú" e="Note" />
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>

  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100,130"/>
      <item value="110: [ma_loai].Label, [ma_loai]"/>
      <item value="110000: [ten_loai].Label, [ten_loai]"/>
      <item value="110000: [ten_loai2].Label, [ten_loai2]"/>
      <item value="110000: [ghi_chu].Label, [ghi_chu]"/>
      <item value="111000: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxweExzSygRR463mME05GI8j3okpzM4XuMZ1E5kJdpdV3vORYabgzTnt3FeZ3DSosnrlON7XbV+q+kwF3N8SgUgAw</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5j0FqrM77GENhAy1dfNVYbap2uAiGtA+tSIyLGaM2/RQ6Pb58XRUVvtNW8qVHt7gWnvaoE5b533BrlEorR3W9c=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbTihtmGQDHec8XcoCrOAY8DXeeCi+ES4uYv5Q4DQ/vZaWddXCI7PWaotKgYu9/5x3oPW/cdNvYTpnxJYnWRCkGs3LipiwHlWCFLCQa1S26QcmBJ9vDxkrnU7ULlz2uPn02LcyioeYDfjU96WsZ6d9DrMJsH43KG2lu+xaUnpy05zpUyK+upuYjpSz2WIZ7RDq3oOPG3CFAXIvpEOgLr+lypGMv3Cdp8L/dhi1/c2CKzhbGnGUaykB+8yqrCEqrSFx250q4T85I2GQd0gqweBolAHgZMnLKrVzCp737bqEk6S0emLV7AdV/51aLYGTG3B5Pkn4uXAJlNSClWzb+54XQ8tIxZm07nH3cxcx83Si1SNQCHlV5LeshNri9LF2MliXZapTyHVQ+uCHIWrmyG0bN/BIoIlTzR9mah0jgm/GvL7aa3HS68d4sS85cbHtAvbHpN4N3xbGzyY1S+4YfOJUgdsqxXT1w1Z7L5uBdV3VxLel3Za1keo9wp0/PIHriu6rBdlkATr/VG7UzqvEayB9Fk6wsYYwCEIp3aZsDqg57caaURJS2YpiAD47DKnTwb3CE=</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkZbdTTozYjC9Bx7wP4C4Z5V29rR5/5k4c7e/BqJybTiuAbX4IpaPEQnSdNlej7NeCSnHcmR5R01twD0MH+027J0ZWvPgDS+UPd0NvO/drBPHpLDlH8/YicXYKyklLHOxnXp6helk8gIaN2o3fLx1zOXX/Ah5D5FqJfIEGIc7SFdagKjWkFw3TGizw7hapGdmx5APuLdU/K3QOdVkeOhIKCqAOELDraLKeGqWpzmJixkfKL9MnsYOGhzCA4DpQGn3hkqeV/dHTf9RLyKCJPjCl21+YtMcyUM2frFIKECbVLXXpEJBWHU83Fxb4EM6i6AeVh4q1afP8lxqRzso0pH7hL+</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>