<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "COAdjustOpeningWIPBalanceItemImportForm">
  <!ENTITY UploadButtonCss SYSTEM "..\Include\XML\ImageUploadForm.txt">

  <!ENTITY UploadCreateTicket SYSTEM "..\Include\XML\UploadCreateTicket.txt">
  <!ENTITY UploadField SYSTEM "..\Include\XML\UploadField.txt">
  <!ENTITY UploadCommand SYSTEM "..\Include\Command\UploadCommand.txt">
  <!ENTITY UploadScript SYSTEM "..\Include\Javascript\UploadScript.txt">
]>

<dir table="xcdvtdd" code="ky, nam, ma_yt, ma_sp, ma_bp, so_lsx, ma_vt" order="nam, ky, ma_yt, ma_sp, ma_bp, so_lsx, ma_vt" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lấy dữ liệu từ tệp" e="Import Data From File"></title>

  <fields>
    &UploadField;
    <field name="type" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Kiểu sao chép" e="Type"></header>
      <footer v="1 - Chép đè, 0 - Không" e="1 - Overwrite, 0 - No"></footer>
      <items style="Mask"/>
    </field>

    <field name="ticket" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 100, 30"/>
      <item value="1100010: [upload].Label, [upload], [upload].Description"/>
      <item value="1110001: [type].Label, [type], [type].Description, [ticket]"/>
    </view>
  </views>

  <commands>
    &UploadCommand;

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OlhMzIHz1eI5IxL4pZUp0+Q+DFCAfaOCNukXyqVH7r2tUVkQ8y3uliMiKEQ6HucGu120j0ae/lpaSoz3kdG9lgkiJZC8GZlsdXnEoJhgE0JAqDiyCdPTRupZGp1I6w/SA==</encrypted>]]>&Identity;<![CDATA[<encrypted>%/vOP2em6Xhs7Z9GPyNAHjjBNhSB4n36RAHIrC3EsIUZOJpgG4hHoR/Q/8hBmCxWHSUmQylFesVOE3pC3Wxw6g6DMmVv1vBozKq0VnniMXHAQlO5NkMmzW4Blq17syK8lqKEVrosC7hOMH2nm8XIbGLDF0tPk94fmB0my8pW5Phdm7OgeBLKpCRVZNMEbvc2A0GnBa4TqTRcFhvL5+oacqMIa+VuBI+EHtVwf38yu5/ZGh6OxRMCZNBYirywQXFYPbnbPDGutXcEhqCPOhknF7jf28s76Y52dAeqRl/GFAnsQVS8FhzZpcFyzIzMe8K+UJbT/y6dZDTr7+i8gEZTSl/weX4RHRQcP+Pte0BCR/kd5b6frC5Q1STQGJogKoKbrB41LD3/qtHrtVzq+1iouug==</encrypted>]]>&Identity;<![CDATA[<encrypted>%tKdK3MWmxeikauzyRrII1ju/dG7jbYcjCdHA4BXbxE6NWIrlRAEQvtS3U3P3O0JvYJOQkbyZ0d6aoTOWt8qHgZNkhI3hleKTuRPutfBorSo=</encrypted>]]>&Identity;<![CDATA[<encrypted>%/AfHL6YdajQfFcOwzqzJsKTM/8DDf6O4KbK1Iik3KDb+nYh4Hnc3NpoRl3CJlLGKAOcfdaRlHLustSUMjFK7/F2XwUYW0HSLpQBdgzKhOlRi58fyPDa8bL4CsuZxfqIYRCUluqFB5CJOih1EYe6IiEV6Ldb+DlsBlghGUdHe5hT0wz2Hdy8ruWNllmGLFOK/Dg4h+Bu2z2kDVGmqGtEtroWoXVJcbJ6p3XGyUCyEYeHAeVEyu2DWb5JqP6ZsW3tl3pGxr9imdUX4igs3FWXhqgGQvKSBzd6r3agfExZPDL5b0cC6hptjNERUXuvpg/iFGWPe54cZvdyTnXcjbEXzfepPePwqyy07sMpeXScPw+0qpAxIBObg1OvVi9JUuPrccHaw2Sa0DtoX/NcJ267DtfJxLJIVuNhmPmglPV5mUeKDQlk68b7qJ7HB/jLQuXfKzs88l8+FLj5cCacZjxtEiagCH3tn9CPffGkn1L02VbLrlwcrBhNlYU5yC8CsQw+J4qO5Ek8mgYn3aRvTdTzN03g1cqnnYCJM6x8dpm65hkdpbj2iFaeWWBfx6J2JGHPN</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &UploadScript;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70MgU3L9MV51GLhAC5KldzdIJNZ9RTQ5cy/QV/Zj/O55L</encrypted>]]>&Identity;<![CDATA[<encrypted>%rnZ922lNpfjaCeWsVZkA0WZiYw6XUQtQ2WPvtce3XMkAbvUh26+cM+Y6LHeeTBT66ltoDlSplfNkb+5A8FrLQlnK4FPFnqUpyAU4IeKFBysJuvmfDda46O8EczcRtmD0itwf8E9WbIHwLId2BMdi2Kma+eih+uabr+eiwrCYFxbWkMdoaxw/9UGUZWYMnrv6mYGUWk+L3bpEy4pWstS3L/Ir6gXmypy3NnLIYnKAS1jkZnR1v5JVX0zOR4WXrmzAXBF7MvXiJXtYx4QWcraV6w==</encrypted>]]>&Identity;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfMY+vxj5ddyyoutgGhLGg+wsbG4kDSfy9Br7CB81Z0C7Y8d+ocmYlcPxUdK5t6UahCErdMQpGylb9O/5okkAcaY9W5HHck54MnGXVjfbDE4ymhDUkl34azliBxi4OZbMgvLSdZ5wqBKouGmoCnhegmm2GWWTsOOWSJ3Tj9lduQjbaII2ftCq90T3jb2YF0Uazyxs2A0Q4JFMJfWe6LWDpd6r2KjoOWo51uoO1qkFe8PR</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetTicket">
      <text>
        &UploadCreateTicket;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfz6e414K5THbJPKTpTCXK/0Soy/gsPLzbDunHmOYjOYz5znFkiGNhRte4WM40R4ZHA==</encrypted>]]>
      </text>
    </action>
  </response>

  &UploadButtonCss;
</dir>