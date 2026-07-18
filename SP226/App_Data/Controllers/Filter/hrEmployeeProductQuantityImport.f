<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "EmployeeProductQuantityImportForm">
  <!ENTITY UploadButtonCss SYSTEM "..\Include\XML\ImageUploadForm.txt">

  <!ENTITY UploadCreateTicket SYSTEM "..\Include\XML\UploadCreateTicket.txt">
  <!ENTITY UploadField SYSTEM "..\Include\XML\UploadField.txt">
  <!ENTITY UploadCommand SYSTEM "..\Include\Command\UploadCommand.txt">
  <!ENTITY UploadScript SYSTEM "..\Include\Javascript\UploadScript.txt">
]>

<dir table="m03$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
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
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OlhMzIHz1eI5IxL4pZUp0+1ZinyAG8T7kDc/L8uThKSQD70ZPMPLMQT9WlVUGrTVfV8TqcCujG4EACapTFShigX50sEXEPoPl4+r07y4sL9lrk53rmrTTavkE+UVkP/Pw==</encrypted>]]>&Identity;<![CDATA[<encrypted>%/vOP2em6Xhs7Z9GPyNAHjjBNhSB4n36RAHIrC3EsIUZOJpgG4hHoR/Q/8hBmCxWHSUmQylFesVOE3pC3Wxw6g6DMmVv1vBozKq0VnniMXHAQlO5NkMmzW4Blq17syK8lqKEVrosC7hOMH2nm8XIbGLDF0tPk94fmB0my8pW5Phdm7OgeBLKpCRVZNMEbvc2A0GnBa4TqTRcFhvL5+oacqMIa+VuBI+EHtVwf38yu5/ZGh6OxRMCZNBYirywQXFYPbnbPDGutXcEhqCPOhknF7jf28s76Y52dAeqRl/GFAnsQVS8FhzZpcFyzIzMe8K+UJbT/y6dZDTr7+i8gEZTSl/weX4RHRQcP+Pte0BCR/kd5b6frC5Q1STQGJogKoKbrB41LD3/qtHrtVzq+1iouug==</encrypted>]]>&Identity;<![CDATA[<encrypted>%tKdK3MWmxeikauzyRrII1ouiHwnF/5cGuyztb5FgU+/6lRK7YdRPkOz+ZOaCD9LFeFazobuKWl7vluiaaBKObKEJtKg979tEXAErnj37bqfwsYCJGpiaCHJXR+kuqzlxaLWvWbYEyY8r/gVbHl6cHirpvdxUSGvb3EYmQAo5tO0=</encrypted>]]>&Identity;<![CDATA[<encrypted>%/AfHL6YdajQfFcOwzqzJsHPCFLHOMub5jKaSv4gpZKzAmyibHTlLL9xWQSAUBr7JUvDOhBGg7kWbLaLSRy2LWaip8BA3EEgTCmytp45mvJOwTQ9vK7jMuYpJ4eLFp/UnVRL8JBsJQybdVrOBeBPfd1NRaZt8O4Pctrb0jzPtvhTo/GYDO1vn3QgHoHrQWBO37UNdlFLogEVriuAEvUoboAlbhlJBFrazhi9ZZVPf0Wa80cDafjWebSp5yE320iS/WVY6+9CT562qQMtbECFgoFFPMkMs/GB17FYsnNnPmhp/TQGuAuNE4X5ECzC6ppy1w9FPNMGgTrwCFkdRvH5qtDS9/lVVuzEfr5jhchVwIuSJRHSboyrpiP07VVnBV/D1l3YTI2UpX8fy5WBqdxOhBrWF6dQ0mRX8mZK8UhcbqNX1ENiCrR/8xbDN8n5/XADOroVBcBzgW+60SOpuhV/lIIcmXxAySwSyTF5WUz0B8ciCxqGL+aO9h0p/CwJ8dTvKosbo1Z6RA0Bq5mC3IlIHmEYgrvU6XisRhcUFeZOkCz+vwQkf9B3X7PqmR5ojnXve</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &UploadScript;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70MgU3L9MV51GLhAC5KldzdIJNZ9RTQ5cy/QV/Zj/O55L</encrypted>]]>&Identity;<![CDATA[<encrypted>%rnZ922lNpfjaCeWsVZkA0WZiYw6XUQtQ2WPvtce3XMlGCVlAJDgs/1deVciyyzY/qKqrtwBLN+Pl6w7EatUYQoMqku7cytgBpm4WKPbZnurHR+Es8TkIqPXbAD3bgqNmr1XH1ItynIh3YaZoYhei7fO2COxFfDew0DTlvtWm5yYqfFH0AAwuQZUMLGoTy/Jvq0W3SfwyBt1gtjHODq350QkRT7zHTu6yLfDCoJC9MXS03SMWX/hpBbikneP9c0v5lnj0HX+ZjDftehTZdRQX7sXvBEO9MWnlqtrUx2ZUILrJ659L9WqOzuhw389+pHou</encrypted>]]>&Identity;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfMY+vxj5ddyyoutgGhLGg+wsbG4kDSfy9Br7CB81Z0C7Y8d+ocmYlcPxUdK5t6UahCErdMQpGylb9O/5okkAcaY9W5HHck54MnGXVjfbDE4ymhDUkl34azliBxi4OZbMgvLSdZ5wqBKouGmoCnhegmm2GWWTsOOWSJ3Tj9lduQjbaII2ftCq90T3jb2YF0Uaz7TXHm/iYyTebNi2W05cvtUbLgZI4ok+S3aanT//27PpnV4Y58A/TA/rk7MFPPzYh/PMJQw9odg5hrsOb+99IZZRCqFJI5RY8gTZvOfFgo4coeGd4tT/IqGjZri2V1zljUDVd9/bYoS6DbT8e9zugXKueyZ3H8gJkkHospNs3joMzh2sF5ctLg71+8+iqzCRxLEnADV7OccDpZ7Slc3ihdNiirJyUdKlV6N15rr7mXqmF06q6XT/BLySK3N3H8V89H0DkEq5Y02tfP1PI6AVhZwPTtos/Y2sr1m9iy6zgWSG5USJIx1DFQ7VaKUQaYEzp0G9lzZmVr7FNfNUFiBBP6r48FjzEjv++oi+VV8aIl6YGSlT2FIg+j0EUh7c8K4hRzuSj7MUn3clc+YKjRPNyvhuwrkif97Qz3NAEbD3nG0Ap64M6XMym2j2K4IDGv+9DC87ZLKt68RY6KMgb69kdSND90w6NQxfAxkFPKnLNUYbIJW1+2a8oi9PYsfotIX004HKtqsSSHVoStXTaaePiL9Ao/D+WhYViJyc0UOtz5rY4qY3fesYEVIHJRboOLU1v9n0JS1+fetEBp44zS+DZbCt1NysklQlIDJFknQxw7uqINeUZ9qcc0b6ft2dB4EtwOJljIQlgHx5XO+NoSbn4fGIKy9x+8QiL2NGRBz9ZLSiqtvf1bj6fuwpu249dumuAMzhpmeXN3jwWyNdeUUPR6s=</encrypted>]]>
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