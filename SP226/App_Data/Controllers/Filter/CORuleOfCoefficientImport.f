<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "CORuleOfCoefficientImportForm">
  <!ENTITY UploadButtonCss SYSTEM "..\Include\XML\ImageUploadForm.txt">

  <!ENTITY UploadCreateTicket SYSTEM "..\Include\XML\UploadCreateTicket.txt">
  <!ENTITY UploadField SYSTEM "..\Include\XML\UploadField.txt">
  <!ENTITY UploadCommand SYSTEM "..\Include\Command\UploadCommand.txt">
  <!ENTITY UploadScript SYSTEM "..\Include\Javascript\UploadScript.txt">
]>

<dir table="xdmcdsp" code="nam, ky, ma_yt, ma_bp0, ma_bp, so_lsx, ma_sp" order="nam, ky, ma_yt, ma_bp0, ma_bp, so_lsx, ma_sp" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lấy dữ liệu từ tệp" e="Import Data From File"></title>
  <fields>
    &UploadField;
    <field name="ticket" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 100, 30, 0"/>
      <item value="11000101: [upload].Label, [upload], [upload].Description, [ticket]"/>
    </view>
  </views>

  <commands>
    &UploadCommand;

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OlhMzIHz1eI5IxL4pZUp0+Q+DFCAfaOCNukXyqVH7r2LzAuS4h5pM/64FNRT4Y+e4ZlApqQajNuchB6P7fGPHYYk0UL7QIm1eUU0NYrxALL</encrypted>]]>&Identity;<![CDATA[<encrypted>%/vOP2em6Xhs7Z9GPyNAHjjBNhSB4n36RAHIrC3EsIUZOJpgG4hHoR/Q/8hBmCxWHSUmQylFesVOE3pC3Wxw6g6DMmVv1vBozKq0VnniMXHAQlO5NkMmzW4Blq17syK8lqKEVrosC7hOMH2nm8XIbGLDF0tPk94fmB0my8pW5Phdm7OgeBLKpCRVZNMEbvc2A0GnBa4TqTRcFhvL5+oacqMIa+VuBI+EHtVwf38yu5/ZGh6OxRMCZNBYirywQXFYPbnbPDGutXcEhqCPOhknF7jf28s76Y52dAeqRl/GFAnsQVS8FhzZpcFyzIzMe8K+UJbT/y6dZDTr7+i8gEZTSl/weX4RHRQcP+Pte0BCR/kd5b6frC5Q1STQGJogKoKbrB41LD3/qtHrtVzq+1iouug==</encrypted>]]>&Identity;<![CDATA[<encrypted>%tKdK3MWmxeikauzyRrII1ltaSKHcSq5fw0xWV6wwcXnaNCOslut38Twlx96bEh9HnYwHnLik4y7hoB74KBf/Tlo9wT+YXvaL64gE5ln+PxYt/roYqQOxpXlzEjQplSf4VZYaUTm32Y2yYEces40L6VynjHKrmRlUWsokCgBYxbm3hy4gzLMZK+P7c7Bj49a2cFE5u3nf7iOpGXC4GIIYIm+z2Pr47oCtuA/zWZ9SPUcrt2htHMC8/Z6Wz9LxkMQGUXb1NHdY67C7OecRAy6ejcwSxBy0T1TZaarrEpbxqHhvqBsmZkB2sVcDMlP2QmKytkWORf1jPcT5g5FDd7CFvMwFWXeW8OyjDtmC0XMbCVII4xhWpOzim+P+v3gDWIKNNylk02SNFgic0kTNvH+kALFUMag9Yi1tCYGbpriUUEoz1mZccEDO73hNcjaYu0YWAAoQKBsql5+jdj11gGIhDyamPowfam8vuldC982LDfUmV8E5pXzCvSO9lD3kHu5I+VIKAJ8U2TSCK3m4+Sae5k/1rs2g3dprRd1+ohlwt2RMTdiiTZW10jtyLb2gjA8J</encrypted>]]>
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