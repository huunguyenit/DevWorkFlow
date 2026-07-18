<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="mpversion" code="loai, code" order="loai, code" xmlns="urn:schemas-fast-com:data-dir">
  <title v="phiên bản" e="MPS/MRP Version"></title>
  <fields>
    <field name="loai" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false" align="right">
      <header v="Mã loại" e="Type"></header>
    </field>
    <field name="ten_loai" readOnly="true" external="true" defaultValue="''">
      <header v="Tên loại" e="Type Name"></header>
    </field>
    <field name="code" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã phiên bản" e="Version Code"></header>
      <items style="Mask"/>
    </field>
    <field name="name" allowNulls="false">
      <header v="Tên phiên bản" e="Version Name"></header>
    </field>
    <field name="name2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="status" allowNulls="false" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330"/>
      <item value="111000: [loai].Label, [loai], [ten_loai]"/>
      <item value="110---: [code].Label, [code]"/>
      <item value="110000: [name].Label, [name]"/>
      <item value="110000: [name2].Label, [name2]"/>
      <item value="111000: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf/hmTZqOWvSawkSeQ30eXmfNT60+8fW8ol42cN6/wGxaMLfX3Yjy5sJP+QSeQWp+5yK0O/gwRvopIEyPH80sfYs=</encrypted>]]>
      </text>
    </command>
    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf8rWy5axjYhPsomHmFIEpIn60AA9pzLysRxgkkSjA40SAtbGzX8kQs74Ss5lMZS+jRGeXAUcLyKc4Wa0YLGgEqg=</encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2s5nbAU8wwv0NhwWxXGFNZ2gh0PJcQsNUEKVND9nbcKrRqj/TnlrIWFIF53eKS/qfCKsIFakGRZjaN0K9N1hGE=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuligwHUSXt9woXLQkFaPPVcT02WafYAp8c4GxLUSjehph2Vy1EPAKPuwfKrvrCr/uW0R2nNPhZKKVT7xWQgXCXHzY23dsoDrOI5vQMDnTbm27GlnuXEIU65GPoWXsJZkWBPdB+LhiZoAcU3B16smhEtVIrvWW4t4rLMGEGGo9Esjacy//MJfyLXWNYkkiJY3OM31M+zfsuqXBwRZW6pMNy9twntxTmk2iY/N9USTfMhPBU6V7+rqXWCSB6gywQpNKQPQ6aBWT3/ne94DDQVUVxEgiwQ6R93F5xpHPfQQYsk5SK+/au7hOv9giBIJgq8M2qGJY3QuFiR/IQUtQwUu8SRvOOV5RaKot2DIhan4tdTeBioUK4cMV6WsBe0S1ponu3M</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4vZG8geyQX0pJ1qS7bKa3c3Nap8+j88yh7udmvEulWBmy6u+OSgO97EU/aCOmufrKILXZRhiIFGCGlRK6E4Z8p64/qDPWhXXMCAFkiU7vhtD81ZHD25dTDUD3zNnIZEprL+q9Rc3SzlrKmecweOu4vrJsLfcR0ojtKdXd7l96baQCvQ0R18bmCGgrJKttE+y/v0r4TCf8vlsCP7hGE8xq84zRY+ojd4fwbQ+H/fXDb+drd5VE1goQLAThk0DibZME=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jjLoENKOtlwnSW1j6dreDsUgFHvH1ZmlHwz9iOZ2fSXhdd7ldTxwmDdK4bNdltuHVQmOGWm/1vEYwoxJEo23ycaROmMD9zGB4u+oueq67BGDBNxwIa1vEdBwYNg87V122EsYiBvAgITc6ei+m+gQnlzxKxu/4PeiCys/1L5l0cHGxkKYR577NUjKdDCGkoPB60OPwZiz/A9kDGDzq8hTqGQczwtUrzx3v/XE8N7lp6I0KK6wBk7DGHd06AP7YHLw2XLf3g82CV44zofUIniqU1dKjc1/S1BkzMU4gpXC/b+Y=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbevny+45tt2NV3XvqR9xQxLRer3q/C4tazZPnTVRsE9OW</encrypted>]]>
      </text>
    </command>

  </commands>
  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70CDhZqj5a9AxfRBWRbLDqK99oqw4yWF+rD62mCEH/urAt1Dx4+sSP9rKhkt/nckWlp1LStoCxNaRPDNe6Ltj0R7Zcpy0ZxXxM1nXtUyGmm6thhoENAX125cimT6fHzwZj6nt44FyvnBpCfY3u1fLA6udKBtrUb7KRB2iSVozIThZJ5/eJ4vleJE4ufRneKVa0nX9xQbDhwVXbw0bh/+vQQAS1kyL+ls+3cFNx24WoOtjhSyVN7tNyrZtnbl10x7uSurV1/QdCxplQsfpdC1jJoLXuzbyrhXYOh2R5+jCkzGfayeORaTcMK0ByijeuNM1px0Ef08gSJvBeEku12ww+b193ySkeprQITRSSXwNN9+B8fU7AWq64Igzru5YBRO3J52NdIluERHZ75cwP+RV1PCqDolQ1baFcT+HK8zWN7YVUyAjHKRhqhUnWRwDorWDc5FiTqou+LGiahVCc3qPXRPa3FjYmUtD1XgeGLSpQXrNPVvLeQI4iswxI+cb5ozhoA==</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>