<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "EmployeeRewardImport">
  <!ENTITY UploadButtonCss SYSTEM "..\Include\XML\ImageUploadForm.txt">

  <!ENTITY UploadCreateTicket SYSTEM "..\Include\XML\UploadCreateTicket.txt">
  <!ENTITY UploadField SYSTEM "..\Include\XML\UploadField.txt">
  <!ENTITY UploadCommand SYSTEM "..\Include\Command\UploadCommand.txt">
  <!ENTITY UploadScript SYSTEM "..\Include\Javascript\UploadScript.txt">
]>

<dir table="hrctloaikt" code="stt_rec, ky, nam" order="ma_nv" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lấy dữ liệu từ tệp" e="Import Data From File"></title>

  <fields>
    &UploadField;
    <field name="type" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Kiểu sao chép" e="Type"></header>
      <footer v="1 - Chép đè, 0 - Không" e="1 - Overwrite, 0 - No"></footer>
      <items style="Mask"/>
    </field>

    <field name="ky" type="Decimal" dataFormatString="#0" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_bp" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="bp_ref" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="ticket" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 100, 30, 0, 0, 0, 0, 0"/>
      <item value="110001011111: [upload].Label, [upload], [upload].Description, [ky], [nam], [ma_bp], [ma_nv], [bp_ref]"/>
      <item value="1110000----1: [type].Label, [type], [type].Description, [ticket]"/>
    </view>
  </views>

  <commands>
    &UploadCommand;

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OlhMzIHz1eI5IxL4pZUp0+Q+DFCAfaOCNukXyqVH7r2LzAuS4h5pM/64FNRT4Y+e4ZlApqQajNuchB6P7fGPHYYk0UL7QIm1eUU0NYrxALL</encrypted>]]>&Identity;<![CDATA[<encrypted>%/vOP2em6Xhs7Z9GPyNAHjjBNhSB4n36RAHIrC3EsIUZOJpgG4hHoR/Q/8hBmCxWHSUmQylFesVOE3pC3Wxw6g6DMmVv1vBozKq0VnniMXHAQlO5NkMmzW4Blq17syK8lqKEVrosC7hOMH2nm8XIbGLDF0tPk94fmB0my8pW5Phdm7OgeBLKpCRVZNMEbvc2A0GnBa4TqTRcFhvL5+oacqMIa+VuBI+EHtVwf38yu5/ZGh6OxRMCZNBYirywQXFYPbnbPDGutXcEhqCPOhknF7jf28s76Y52dAeqRl/GFAnsQVS8FhzZpcFyzIzMe8K+UJbT/y6dZDTr7+i8gEZTSl/weX4RHRQcP+Pte0BCR/kd5b6frC5Q1STQGJogKoKbrB41LD3/qtHrtVzq+1iouug==</encrypted>]]>&Identity;<![CDATA[<encrypted>%tKdK3MWmxeikauzyRrII1ltaSKHcSq5fw0xWV6wwcXnaNCOslut38Twlx96bEh9HnYwHnLik4y7hoB74KBf/TrKCOmsCeMrtZmxpQpCuwh9xxmKQ+7GWj9Rq+pGbAmKq</encrypted>]]>&Identity;<![CDATA[<encrypted>%/AfHL6YdajQfFcOwzqzJsL0aB2HS6JzT+xxTXg837PAs/57d3ftuVAI44t7XtZNhhYYwigeszy8s9reEOXYa6ArGvNNnrsZxCDoAl4+SKU5sF187AILKtTciFRR9JmNq2ShO2gEXviV5YGA+0kkePOQjbC2t6mFWkgzB5oLA+wGkq5i1ihBnFm2X9aurT0/9lF/0cM74deLsxvQhvyX2EDYXKoR2FG1ZjgFGWRJmexjMm0d1NTEZw4XzedL93/vgF+g48zQe6Htrvv9IMoQqHyhNoDejBlDJ4v2u11StMq5qJKkg91TpVW14X7uPA2j6tSgDLo/0uXYhl1cM1oDX+WOAQxGaCgt74ceIEj7JBSnn4aH64SzC2lYCGYtsxcgq40Lm40YmywxYE56IuLtd3gxW93Uv/G9pN9OoPt53HAuuNCSrYQbidGhE7ESIGO8Pxmmi3mDXSVw3lGk8859yjg+6rHS78bA8MvGrpY07kQKQxJpPn7gCyJ9rprowZslCGuVpW4d4m0eWyx1pd795OUj5iQj1B/mDliObn+qh4axbYAbkLZ3cQ1vnLPU6h2aC</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &UploadScript;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70MgU3L9MV51GLhAC5KldzdIJNZ9RTQ5cy/QV/Zj/O55L</encrypted>]]>&Identity;<![CDATA[<encrypted>%rnZ922lNpfjaCeWsVZkA0WZiYw6XUQtQ2WPvtce3XMkAbvUh26+cM+Y6LHeeTBT66ltoDlSplfNkb+5A8FrLQlnK4FPFnqUpyAU4IeKFBysJuvmfDda46O8EczcRtmD0itwf8E9WbIHwLId2BMdi2Kma+eih+uabr+eiwrCYFxbWkMdoaxw/9UGUZWYMnrv6jLe5GwY5qeq01lTF8LiYNYKsunN9PA3sTP95u/QelQ6DyuPIqLkXDiVHfcbxhkjP5MA5s0Zqq0MG0YzfJaX/w9PENpOn14FfH/7f2icYBHpuevxxEaK/mQq/fPKUUuehVtUyPhLa6jK1l+CDABr9BCAGKt9u5OkmC9iGSBKily4=</encrypted>]]>&Identity;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfMY+vxj5ddyyoutgGhLGg+wsbG4kDSfy9Br7CB81Z0C7Y8d+ocmYlcPxUdK5t6UahCErdMQpGylb9O/5okkAcaY9W5HHck54MnGXVjfbDE4ymhDUkl34azliBxi4OZbMgvLSdZ5wqBKouGmoCnhegmm2GWWTsOOWSJ3Tj9lduQjbaII2ftCq90T3jb2YF0Uazyxs2A0Q4JFMJfWe6LWDpd6r2KjoOWo51uoO1qkFe8PR</encrypted>]]>
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