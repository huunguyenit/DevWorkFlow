<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "DepartmentProductQuantityImportForm">
  <!ENTITY UploadButtonCss SYSTEM "..\Include\XML\ImageUploadForm.txt">

  <!ENTITY UploadCreateTicket SYSTEM "..\Include\XML\UploadCreateTicket.txt">
  <!ENTITY UploadField SYSTEM "..\Include\XML\UploadField.txt">
  <!ENTITY UploadCommand SYSTEM "..\Include\Command\UploadCommand.txt">
  <!ENTITY UploadScript SYSTEM "..\Include\Javascript\UploadScript.txt">
]>

<dir table="m04$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70MgU3L9MV51GLhAC5KldzdIJNZ9RTQ5cy/QV/Zj/O55L</encrypted>]]>&Identity;<![CDATA[<encrypted>%rnZ922lNpfjaCeWsVZkA0WZiYw6XUQtQ2WPvtce3XMlGCVlAJDgs/1deVciyyzY/qKqrtwBLN+Pl6w7EatUYQoMqku7cytgBpm4WKPbZnurHR+Es8TkIqPXbAD3bgqNmr1XH1ItynIh3YaZoYhei7fO2COxFfDew0DTlvtWm5yYqfFH0AAwuQZUMLGoTy/Jvq0W3SfwyBt1gtjHODq350djeMwg3tokLBhLWa6u36psrHJdzKDd2iniRXN4Yid6dz8hfHVHYrxq9Nyh9rNZS6bosYk3/H/g9xfmcTYS7qfI=</encrypted>]]>&Identity;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfMY+vxj5ddyyoutgGhLGg+wsbG4kDSfy9Br7CB81Z0C7Y8d+ocmYlcPxUdK5t6UahCErdMQpGylb9O/5okkAcaY9W5HHck54MnGXVjfbDE4ymhDUkl34azliBxi4OZbMgvLSdZ5wqBKouGmoCnhegmm2GWWTsOOWSJ3Tj9lduQjbaII2ftCq90T3jb2YF0Uaz7TXHm/iYyTebNi2W05cvtUbLgZI4ok+S3aanT//27PpnV4Y58A/TA/rk7MFPPzYh/PMJQw9odg5hrsOb+99IZZRCqFJI5RY8gTZvOfFgo4cNw8ujJ/gkTtolltrUTZI+Yey0mrY2VRCGFtNa1oO0//v9WtpqVxLmVv+THCwob5yXMSMwlluVgRRfdeI1uVbru+d2Ko+tgboqfhGCqxEyH/DR6hrbN6yhcCn0PJ8ovKaouzx/l/2wj58jquYoRmjxh6GmG7rCJ5SM6NWl0Olhdk7xh1SAfiRFOMpiu0WVXdsphTMwQyzKlOWYxMZ/WpMK6EkDy2uDtN3DFjKoqHa6RqVMds2JvMJnwqqjYsEHymE7r7+ud41myW6mp1dUxJcv5YCRFFFh4CiFULNReZxtAcgSBx/e/iM+YyHgJ3S0ic02rF6608ANhgdf2muJP7TBKXVq3cnHN5/4hsH7ZUje0+IyZRtKWh9n/KYIel9P08sZvoVtVZJJC72OZAoLff+Hw1me8XQDVDCts3CKTeisoJ/X1jcEkBf8K5K5btqy4lFpIss2+IO0XMZb9H04X8PqWpsPrviAyKdLnYtBZmXzycG8VGCkRVf57HVkzn+sDnmPMVR6o77JHuG86mu6Q3+WVXDCgtqoQtGUfh/qzq177k0IqMttu3llv7D5jHsI7qqkwA1f7vFiT382a9zb6y3OkNQRTrI8DTFVey5q00WBj0=</encrypted>]]>
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