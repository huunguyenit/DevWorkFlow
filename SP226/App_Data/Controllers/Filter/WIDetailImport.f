<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "ISDetailImportForm">
  <!ENTITY UploadButtonCss SYSTEM "..\Include\XML\ImageUploadForm.txt">

  <!ENTITY UploadCreateTicket SYSTEM "..\Include\XML\UploadCreateTicket.txt">
  <!ENTITY UploadField SYSTEM "..\Include\XML\UploadField.txt">
  <!ENTITY UploadCommand SYSTEM "..\Include\Command\UploadCommand.txt">
  <!ENTITY UploadScript SYSTEM "..\Include\Javascript\UploadScript.txt">

  <!ENTITY ImportUserDefinedFields "ma_vv, ma_bp, so_lsx, ma_sp, ma_hd, ma_phi, ma_ku">
  <!ENTITY % UserDefinedImport SYSTEM "..\Include\Javascript\UserDefinedImport.ent">
  %UserDefinedImport;
]>

<dir table="d74$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70MgU3L9MV51GLhAC5KldzdIJNZ9RTQ5cy/QV/Zj/O55L</encrypted>]]>&Identity;<![CDATA[<encrypted>%rnZ922lNpfjaCeWsVZkA0WZiYw6XUQtQ2WPvtce3XMkAbvUh26+cM+Y6LHeeTBT66ltoDlSplfNkb+5A8FrLQlnK4FPFnqUpyAU4IeKFBysJuvmfDda46O8EczcRtmD0itwf8E9WbIHwLId2BMdi2Kma+eih+uabr+eiwrCYFxbWkMdoaxw/9UGUZWYMnrv68or3FcNmj7ejuE5G5ZkszzD4U3nP63hi+G31CBzW5iO3bqQtYKSkO6dcHlSOgMg9uRxmA/nMRlm5k2mFDZ/owg==</encrypted>]]>&Identity;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfMY+vxj5ddyyoutgGhLGg+wsbG4kDSfy9Br7CB81Z0C7Y8d+ocmYlcPxUdK5t6UahCErdMQpGylb9O/5okkAcaY9W5HHck54MnGXVjfbDE4ymhDUkl34azliBxi4OZbMgvLSdZ5wqBKouGmoCnhegmm2GWWTsOOWSJ3Tj9lduQjbaII2ftCq90T3jb2YF0Uaz7TXHm/iYyTebNi2W05cvtUbLgZI4ok+S3aanT//27PpnV4Y58A/TA/rk7MFPPzYh1c5NwyGtIqERRGcxeL0JkCgAqBNdpR8eQ7iwuFfFmgHkhDgG6kTHpOi0QcUNguFBGxZ+mhWlNRiEKcXCWdB8SJp+FHwjq9Ftd2Bz2yN2Jd2Nhckezb5FyJ1+ORJsEWw19IRyrbBgcTZ4Noddf+aHa9BAA6wXHQjlg7P4ONIe8VOxnHGB9X34/J4RRzad4IFUXoGAXPjmS0RgUOx9bdTgTnNiDmSep5zXWuAZ8rc0pmogjsfQl4UWNinW2hFQSKv6McuqTCXbzjhHnlfrhlh3Ps7ccaZTP1/lI2kx7znRrVeLJfWURYiG8wgCh2v/0Z01d3hPlTo9n20xbUQBglv7Ro=</encrypted>]]>&ImportUserDefinedDeclare;<![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7KnlgkiUi6dBFu+VLE6q9940LpM4rU2kpvwV7r1ZE4DQjyDOHacP1W6q2V7b8wx0olkj78R060aIrMQNSObTjnk2kOG5vI7/ScUNl2tTra2YyGU1lknq80A7BVILC5iV38fZjva2AQyn4aQSsA7ndqEPmu0gcbdFEz1YNoagKXL28eLx7ta6j/eV8x+Xpkv1fKw==</encrypted>]]>&ImportUserDefinedFields;<![CDATA[<encrypted>%tQIWXAkmAd+Wv5oPcBmyVwfC1XEsjIFiFkY98ryx+qkv+s8wpPjrtojuMyHpQd8PB9ev+JyNMv3hbyCt2Ih1dmfw6hHGpQl3QPetCF5jBPWtWN1Jv/FlhGmWSEl7woqsjk4zX3U5psdHAXpxlaaaSKw7hkbONNrcp/PY39jXfqkAVutcukFo3RD6zMr1VC4L4x4+YlikcqdYDSYVgoWEeN/T35gUR0uLxNb1ctfiH4wIAmXDcZXEE5IQOHjxDx+4UbGOdruGWkUA9lw6KRMMUbNVEgkCSeGy9pgJM/5Zh5yUR7GQoErNDm0D24JxpMjSGg+Q8Xogf8jcNnKkB0CXrxismT1wzg4rX+1CWdwTwLpKrDDi0sZ7vz6C3PqiQImBuOccJHKLYqV8Hp5sHPy5JQlduAX58tkO+WdM8GBfQhMI6y0Gc9gJ6AXLxQ2Alfy70FJaP7gCeG1OPLZecXfih7RLj6lTo0aRTCjcGjAjMuJC2CWuuu4ySPnvcSuWUMhy47hxQUDgvFiGkUZT4IDqrM/NtNFRXrzR5c7ob80C+aNVlg30ano6ewDaqUnh2r40Y4pSiCUXJpl4vheg3p1aia0Gs/gIeDcX9WaCqlNfIpLJoCFwFa9dkp17il3QBBL3q1ktTLrLVUWkIsATe0LIUiqxa2pETNybG+bRAU4T4tRzXauIqlvDpuwcsFILBtW6</encrypted>]]>&ImportUserDefinedSetItem;<![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7KrOzUFTM7mblrjoJcJfdNQLDaH+l93zAJkmovyuTbfxzoDN6eOwrhFfD7jy8KgUsnYaA/UieSUlvCaSs8lbgT+MAkxRFrwFF1lG94fAYWeL6lCVN3BGfITXBao0jTD3nwd1eZBqVin01+yFnaoIvbP+U0ma6iZKK7yQ8Q/yTjMhRSTMm+jKrxYLh1yJEHsqF2fDPwHKqOw7rjSjJko2rv+YbTvQ5ZuYQRfdmMI23qrq/6UP8thkN4cL3Qxp78SfVoaDSPW2u7X5XQhWKKQgwqEAiUDh+HEN6FDiOl3uxDzUHE+v/GmwYTNsMvIfGiOsg4ISXszrcRJuB1EUntQLamtOjU4+9IG26+EYByZ+IEN3nZUl9IhTkoQjt+38olDH9eQiZL28xMZ4FrLO+jCmQzIQ76ww8+zbz5vo4Y7TKEE7I6kuPhd73WCjSutXUYZAlIHO1oA6345GIGYTk/B0E3pq9syQISMSk72usYsb+t6JVHAExxOH280X0HcLXl2uztaalEXa5s8P1JuQ3P5wSThk27da1D9F3qOfbEavT7lhgDCyhXMRQozVZ/IftwOaqzKfreoXVCbUMcjhbUHRBsMFaLbHI64oY77StGzrMGku1NeDGBKwXVO9Nqvmxnn2YLd1JqURJRqTa5XN0aBVsU+Znl63m27gVTW3KHRof5b8FAsWS+VKha/jtPIuDL1eWhZEOZL+/Wj2Z117x6zSgXIxHvl1Fj0K8lT0wmxDltyFT3sgJfR4akBa1DusTonKWBqn8q9+ER2JEgNBYz5GT6v07fBwW3LYLMb1LPxrWiAlN51xEs9NCm96rYuhZ13XemDSIqI5IPux5YI5QJTO59p0gkFpdNmESozUvBlGSXgeRXOGuRXsYyNN9PX8bO4z5aFaKV/jEsbku0rtwGXx4rE6LLy1vpT+WjbdtiWXbc531GbnXlu1uI94GREiaxrnLhwvC4UKoxoqtkN2FamkNs44CEI7DENwpRkvwVWoEcijrBApYmpMY/5qlEoxYKvBGSscAJ7yW3WoPDIs9rI0vLOc=</encrypted>]]>
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