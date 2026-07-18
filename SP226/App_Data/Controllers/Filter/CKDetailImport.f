<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "CKDetailImportForm">
  <!ENTITY UploadButtonCss SYSTEM "..\Include\XML\ImageUploadForm.txt">

  <!ENTITY UploadCreateTicket SYSTEM "..\Include\XML\UploadCreateTicket.txt">
  <!ENTITY UploadField SYSTEM "..\Include\XML\UploadField.txt">
  <!ENTITY UploadScript SYSTEM "..\Include\Javascript\UploadScript.txt">

  <!ENTITY ImportUserDefinedFields "ma_vv, ma_bp, so_lsx, ma_sp, ma_hd, ma_phi, ma_ku">
  <!ENTITY % UserDefinedImport SYSTEM "..\Include\Javascript\UserDefinedImport.ent">
  %UserDefinedImport;
]>

<dir table="m58$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
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
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfwv3wLHXTDVbx2DdB9PPcGaDBXwbv0oh/z6PNxPtXBr0B91Yn0501vvwtUQ50sTOYA==</encrypted>]]>&Identity;<![CDATA[<encrypted>%yb3r8nYg0FPwFXMJ1/oFI7200INbRFwrRV1ygt8qMKFvYMS2nnkKHRJzehg/NGQyg5N95QkHSh1LGHn1Ue+VCg==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfwSZFYAj65RYzXb1/jCQS7LbKpA54gCakU+hnjiXOE3L</encrypted>]]>&Identity;<![CDATA[<encrypted>%yb3r8nYg0FPwFXMJ1/oFI7200INbRFwrRV1ygt8qMKFvYMS2nnkKHRJzehg/NGQyg5N95QkHSh1LGHn1Ue+VCg==</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OlhMzIHz1eI5IxL4pZUp0+1ZinyAG8T7kDc/L8uThKSQD70ZPMPLMQT9WlVUGrTVfV8TqcCujG4EACapTFShigX50sEXEPoPl4+r07y4sL9lrk53rmrTTavkE+UVkP/Pw==</encrypted>]]>&Identity;<![CDATA[<encrypted>%/vOP2em6Xhs7Z9GPyNAHjjBNhSB4n36RAHIrC3EsIUZOJpgG4hHoR/Q/8hBmCxWHSUmQylFesVOE3pC3Wxw6g6DMmVv1vBozKq0VnniMXHAQlO5NkMmzW4Blq17syK8lqKEVrosC7hOMH2nm8XIbGLDF0tPk94fmB0my8pW5Phdm7OgeBLKpCRVZNMEbvc2A0GnBa4TqTRcFhvL5+oacqMIa+VuBI+EHtVwf38yu5/ZGh6OxRMCZNBYirywQXFYPbnbPDGutXcEhqCPOhknF7jf28s76Y52dAeqRl/GFAnsQVS8FhzZpcFyzIzMe8K+UJbT/y6dZDTr7+i8gEZTSl/weX4RHRQcP+Pte0BCR/kd5b6frC5Q1STQGJogKoKbrB41LD3/qtHrtVzq+1iouug==</encrypted>]]>&Identity;<![CDATA[<encrypted>%tKdK3MWmxeikauzyRrII1ouiHwnF/5cGuyztb5FgU+/6lRK7YdRPkOz+ZOaCD9LFeFazobuKWl7vluiaaBKObKEJtKg979tEXAErnj37bqfwsYCJGpiaCHJXR+kuqzlxaLWvWbYEyY8r/gVbHl6cHirpvdxUSGvb3EYmQAo5tO0=</encrypted>]]>&Identity;<![CDATA[<encrypted>%/AfHL6YdajQfFcOwzqzJsHPCFLHOMub5jKaSv4gpZKzAmyibHTlLL9xWQSAUBr7JUvDOhBGg7kWbLaLSRy2LWaip8BA3EEgTCmytp45mvJOwTQ9vK7jMuYpJ4eLFp/UnVRL8JBsJQybdVrOBeBPfdz58xvmjfuNEDYmTGx1P83n6nNiq0c5rW7F0ly2OTCJSBs7Q7v9u09rMutyNYDJ9sf1iRLe8YQqdeiVmVJ9nBK2VwRDFhbtmmJBYVl6T1luJcadwZ1PZG3IlC+YFQnddl1Hhh6JqKGphhc+YqJQBVOJ3xHiKSICvhzdCSyrLqOrYxyPVpb8GIx/8ajAhLinlNNFbRIssKPHqhLxo6vt8EVzVMfQcdGy/dDyzAh8pQMkuMfBGCNj5UeCQBX8PP6b34xl7NQ3qF2/Q8MfHQvcuSOffullKl5gmZkSrEbksip5aRcl+YMXorIOYnKixt5Bq0xoMY2ZeQkyFaLLXwCC2HS/AJRRMmhTp129D+uXakuZjEoJrKyPcaETP2nQHjlinByf+DiZzZVXicwrCSGrmkDU=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &UploadScript;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70MgU3L9MV51GLhAC5KldzdIJNZ9RTQ5cy/QV/Zj/O55L</encrypted>]]>&Identity;<![CDATA[<encrypted>%rnZ922lNpfjaCeWsVZkA0WZiYw6XUQtQ2WPvtce3XMkAbvUh26+cM+Y6LHeeTBT66ltoDlSplfNkb+5A8FrLQlnK4FPFnqUpyAU4IeKFBysJuvmfDda46O8EczcRtmD0itwf8E9WbIHwLId2BMdi2Kma+eih+uabr+eiwrCYFxbWkMdoaxw/9UGUZWYMnrv6xgDS+7cETrnfSP7Gi9NyJD2rJKeWzSz1Zb8YnJDvugmwqkH9bvIhjA7je3lTJ/FKEnM28Kn4OyJDjcVfl6oM4w==</encrypted>]]>&Identity;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfMY+vxj5ddyyoutgGhLGg+wsbG4kDSfy9Br7CB81Z0C7Y8d+ocmYlcPxUdK5t6UahCErdMQpGylb9O/5okkAcaY9W5HHck54MnGXVjfbDE4ymhDUkl34azliBxi4OZbMgvLSdZ5wqBKouGmoCnhegmm2GWWTsOOWSJ3Tj9lduQjbaII2ftCq90T3jb2YF0Uaz7TXHm/iYyTebNi2W05cvtUbLgZI4ok+S3aanT//27PpnV4Y58A/TA/rk7MFPPzYh1c5NwyGtIqERRGcxeL0JkCgAqBNdpR8eQ7iwuFfFmgHgi7M6D3/+vnmrwwBGR59ftUyX6GtQ8MelSZ26UYrt03r6+stL/kKWgtWQpxJoL/yyg/JVEt2wR9EYG5cnlx04TiWleiXFAPaerxHDJPcy1lrxHLH+TmhssfkX8Q9tVWb</encrypted>]]>&ImportUserDefinedDeclare;<![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7KnlgkiUi6dBFu+VLE6q9940fpyVf+9QtMVekrQCWF18ip3S0KnEM0sMi62wGn/MnU5n5cIURGfqclGcRCeFc0dRouOwhoOPtFcV7b1FJUhA8BQhTbmPrC0hpigb63r5dBw==</encrypted>]]>&ImportUserDefinedFields;<![CDATA[<encrypted>%QFirECjU/RgLQ4k5nc6GM6rf0RaVPOyWt2SOJCSxB2rVIOXgPqvFKHkaafUzUoWScTLvz/1bpU0h0iCFdX6u3Vl3rB0yvqABv1pzC/jWBd71T2xw8VnSMiDHIsMipRdRbpdw31HGNySnh9g7s93jKu/dNOek4gL1leGFEKA61Zki6IBXuH3JjbnFoJm5cNKf3amz5FUBrc6L8PXWEiXSsGYD+0J8Q2Tzz63LuwQdFZGdtiahlGYbTryYGgHFRIYAUs2FIl1Dgst9P14N3z4kF7V2PvOL+IrFH7wvgR/vWvKVMfSAetFY1zwq0zkMO3/DU6A1sXOZrhDMaoFkhYq06+Lltinc0XFpfUqlskmKm4RdpGc4Pai0OhIZOo+6wz6hvs/F4p9OH1bYi4cQPXNGbMN6MGImaqUbiKbFNoJH2dUS/ufWoY+VRI+QocaIPYGVrwVIC5xHk1ndaRvLLJ+l8TEM+W8665PV74Spdhf0/myM4dAXZMUpr/TEf7UEZ+ecZtXE1kq8udQFqGOtdeUgxn8Y0QtPsZ57MXGwDr/5qoE=</encrypted>]]>&ImportUserDefinedSetItem;<![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70H4mWUFJWc30U4VsHNVKDRdeiX+9Jaa4QsJod+70SvVSGVqoaGJsAWgGwO1FxIfBt6kX9ksL6YLoSCuQwgllLSn0SjmdZWS+g7RcfAeL3SaMUglvD0XZ5zoEDqbZSw8shQmLbu2cI254bE5PoCjsQiedzHARTfxIR/Wl2jbMjGRLNCQpz8SWE+FaAKauZVXyKfvWY1brxN5vSifg4ow+GFLVgO8Mi8wcgHk6HjTBw7s15wy1PGC3cppxpAnAKyIsZPr9EUuOOqiDsoSkSLFivs9HE5Nuq10Iw1wxu4LSsW765mIKYAyc4/8buyuUcgcE9FXKTxWX6AVnwmRriuBV3mn4PjbHEqKxb9nguvAShaFJG6XfSft5BS6tGIr0i8y4xS15B3zn278xU3Qjd+kotzjZMLcv9p2rDzdbogM0QeTy04hEbEG7bUGjwVsbup54Quj8pCH3fsSbL/k3uyDLQ8M=</encrypted>]]>
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