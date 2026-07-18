<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY UploadButtonCss SYSTEM "..\Include\XML\ImageUploadForm.txt">
  <!ENTITY UploadField SYSTEM "..\Include\XML\TransferField.txt">
  <!ENTITY TransferID "rptInterpretationFinancialGeneral">
]>

<dir type="Report" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Tải lên" e="Upload"></title>

  <fields>
    &UploadField;
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 100, 30"/>
      <item value="1100010: [upload].Label, [upload], [upload].Description"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfxSgbBAs+XmXw/t0aAMaVjSd9fke7BXR8vUWnmflF40zqBOoHL4MZYX5EZyAhmExoZfggLH2xR82FqgjNgaHKyc=</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfwz47O603c8IpzZmQRjLiWMoGdvH4dELNMCBon53Lfo5w5wuu25PV2C4wgcLP5SZbmNYbNxS+xR5hIHijDcTs4A=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf7XS+1q6xKoE6fxfv1CjspxCh6wEQKIfgycGn5NFz5nP5eooya2pYsIqCmYw42s4fpaS0XqxWcOa/qksLU3VZUo=</encrypted>]]>
      </text>

    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Am8Jvv1DRVW5XC9+pNe2Ne2jWQJbh0DEZ7N611nnGMAPMVaubpICQwIBwKxkBBdwGBT0jqRWHSwaw1+rXEwS0313gb8TWtxwkofblFfumVUipEEku6RU5WNoXoD1GvETDSDck5DUe5C+CllT9IVee0scVnTpfGzKiu1BIWDN8Qo7HI9ysVDUl1FIfMVT9OJi1uyPRIOqA6jznjsAs2SP6prQCvbrPXHDuEh2F8oYu1zPITL2GysjPU9c7UjZhaI/n/ZH1AQr7p1pNzrtxZujIX9pp1r1zI3+hSuSppxYXHsMilAXy7SU6tBBo10b9KKQvOm5+CUiMoYktzIYLx2GQ5dxhBpyN0OBdfbcYvsbLidk7SjGx79tADpqr9K4KUPpWnYF7q0DocwaAdeTjyYnnl2P7xGWVmRgvGgTYz9crdq</encrypted>]]>&TransferID;<![CDATA[<encrypted>%tQIWXAkmAd+Wv5oPcBmyV5ZgtmXlO4pn430lGj53OsXBExn5C1TziYLI5oFyQiyr0X/7SUlSL/vP3Y1Vr0A1G/46rgE2484iZ4D3p9joqWEqS6MQIYzyyj7ls6CBmMwXjmHPchgIcgfDM3i3RTExC1NsvpSg2J0yUD4HLpgu/KsqS2u21fZ9/3eBL/9B2m6VnF/eJgeE2Z4PutVlbDrWPdaTI8hnHhGPdzyYcw/DbVNUGwmvKuaVaMW+PwwHK8yH3eQZ12imfqwFIs3BfbTWmN9Qf3GJrZGNr6+sljEdm9j0JgWRVbKUwNfxTWbipYd3ZEzV1L6341aIb7ny0ErkBXNBm8oCvqk4jBTyXpNrfso=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70BcWFv9N2Or9rvrs3U1r7fnrdgy/kbaa3W+xrf4t8bgLnEOI0TRZb3Tmo42HqJpF1r59T4CMBxmnETso6R0u/uEe7xtfIK52Q1/k4B5sMPn066dHefUG0TA8hLHUgNF27yEwYJyEXlWO72TyCD2bKC2cxE5Z0OH+ZeoH0CWejfQ3Km1bMLRnbjkhLPVVP989ujwDUIBVcSuh1QRkV1/M+mQPdAg1E6we5MwmMZ4GYvc2Zw585qBX1GaCwufdFl2P0mw3GnAM/Otf7+B2iD+tYMPQBUGDB+584RtF5ahwe01elAnKNQgH05zwQquu5IJ1VNXU0DeOW6j25+EJiyuHOxplfZUIL66j5oShcZ/WnJtZ0cuACZNLksqhxDaiPYOPYGOIO6dr2Q3VgpcVAYCxs+1xd1Akp247CRAFCL7pfkRjI/yLErlzxCMta8BkZrCmjJT/6W89l3Qu1hv7RXhXUvOnAU+/RKri42xDPip9Uw+xFUBEF4vbXEPTMwYwbizh8zXSh9sI5dw/weXnXonEu9eBWGKeTGmEmLI6xzyzR/k6YDbI3ArE4MzW02VJaka+pUkbBTtGe9ssQcalZJN7P6FTK/VekDOKjJRikHsUGlt8VXulmGWue9zvwsdT2tvtiJ+HwYUy+MpfVNKOqsgTmFyxq9o06iqOlmAS0we1gUbUSHXzJ8lc5w2shpL5ZSgTOFrgvh9TxrXaNjg7XeZDvzLAP052DzQF20nVy+MrWCU46ov5ljByKVEIsYmoeJlp9fgf2kZ9oK98BtACvFAgX4uzeK5tb0orBNgaaXDo09XOGvpX9bu4OznGgFWfEHFciNkrARMR+XsTR4ZpaNKWwgpxHrc8T4A8q8Ia/MW3b8bgH5TpGSghXy68lkk18pYIFW2OGIhyTbJRf1M0Y8q7Ld2uRHk6IRA2RgsmFFTHzogpFIcXE49murxI6OPrTK9nZRvhvgwdz+yOX2kqZtQ40PA=</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Upload">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6fy6sUzURmsO5tjzZvhg2qWduJUsyX/wPtoVh4ZB/IPWhBBfNkw6tmXibVQjMZuVyZA/4toaW73JUU/sHLvG1D2Pe1iQOT14WwVumyUxkhi4BTSiSDaXFzMTrqnFweQ91FjnhpmGwno5y+xSsqyowsRELG2lYbihWf6Jjsm4P6kbO10t1K/fPyE3bPgxMvZ9hBCly7894TtUuysT41T53nNCVXIu2Xqv9lSn1tQoslyukt2EQ5qVqre26itSBU+0og2muLLkblxdreAv3AgGh89P31aiGqgZDxTyBBK/k7loTC9yPA+y3z3pCpxfvMsKxZPyPq3wAcu+s+0ULP0SBD2QWPlAPgMtM7c6tSWpiB96vquMq6nzZ7Zzg2v4aWxIT4OWzGq2tloqsCfyqmrg+EJlTTL6AZ514E+hZ5B0gl8E78pztDM6FDpu8MSOUA2OPSqIakwSbBNjyj83lPc6TSc=</encrypted>]]>'&TransferID;'<![CDATA[<encrypted>%fwt9cjxAdHhyb9nGJbndnGX63t6Yc3AGP5e9UjIGYu5EpCSfIy2vG6zq2v5Sl9z+bewhuIJB+fyYNuWxvltC+vxBJyqbQ9U6WB1Fa2CRtkgZIHkBL/0sc97xJPLtof+hFZuxZf4+/gOCDjCCriSefg==</encrypted>]]>
      </text>
    </action>
  </response>

  &UploadButtonCss;
</dir>