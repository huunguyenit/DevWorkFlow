<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY UploadButtonCss SYSTEM "..\Include\XML\ImageUploadForm.txt">
  <!ENTITY UploadField SYSTEM "..\Include\XML\TransferField.txt">
  <!ENTITY TransferID "rptInterpretationFinancialForInvestors">
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
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Am8Jvv1DRVW5XC9+pNe2Ne2jWQJbh0DEZ7N611nnGMAPMVaubpICQwIBwKxkBBdwGBT0jqRWHSwaw1+rXEwS0313gb8TWtxwkofblFfumVUipEEku6RU5WNoXoD1GvETDSDck5DUe5C+CllT9IVee0scVnTpfGzKiu1BIWDN8Qo7HI9ysVDUl1FIfMVT9OJi1uyPRIOqA6jznjsAs2SP6prQCvbrPXHDuEh2F8oYu1zPITL2GysjPU9c7UjZhaI/n/ZH1AQr7p1pNzrtxZujIX9pp1r1zI3+hSuSppxYXHsMilAXy7SU6tBBo10b9KKQvOm5+CUiMoYktzIYLx2GQ5dxhBpyN0OBdfbcYvsbLidk7SjGx79tADpqr9K4KUPpWnYF7q0DocwaAdeTjyYnnl2P7xGWVmRgvGgTYz9crdq</encrypted>]]>&TransferID;<![CDATA[<encrypted>%tQIWXAkmAd+Wv5oPcBmyV5ZgtmXlO4pn430lGj53OsXBExn5C1TziYLI5oFyQiyr0X/7SUlSL/vP3Y1Vr0A1G/46rgE2484iZ4D3p9joqWEqS6MQIYzyyj7ls6CBmMwXjmHPchgIcgfDM3i3RTExC1NsvpSg2J0yUD4HLpgu/KuswgRAPNrwrzXiJ7HW3oytMoUJk0NQNnM2yiJEDhbkJ7nTu8ar9LN7QjazadBbyPLY941eFFQcwKIWMz5+TllCKM0Y3GX45NNi1vbYPy+6k3vuJyEO7mOz0YlIJ9LJdR/lgijkJD1f35kowGKkoEMpNs2WQdJDY2wqCej5wLG601YqW4OzrxS7/gbNcTn/kIQ=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70BcWFv9N2Or9rvrs3U1r7fnrdgy/kbaa3W+xrf4t8bgLnEOI0TRZb3Tmo42HqJpF1r59T4CMBxmnETso6R0u/uEe7xtfIK52Q1/k4B5sMPn066dHefUG0TA8hLHUgNF274aV13xO/VCIskvjZHoQwUmHcIIWYU4YI2QMk293TzGqyj/juplE2ss83/L7d/RGMiYeNRSDof7u7oaYLanxGMkBbhKlghp0Ds7Mmancn2YlTgiW7c9/WcmfeZ17qb1Ymw82tGq/z+OquvYPcaFGgrXJtErcqudkD27nobLXTBBOxWVG5kQBRDg5aSV4ORyWNCnEEFy3MtQwouHgPqfMaQGSh0hzd6Br4dMwi8u4X0fT5qnQm2CuYsOb0ghfor7ZagVsZCKywbhGxV+vEZ3gKLSM3wPL9wtOtMBKdoN4BEOP8bA+E2i5Oy0otEfnthJKkPSAK9o0c3VuvKkHhvkZeJBpj8lPD9RIVpwMv7OV+jLGsSAuBunlyB7tUGa49ZtylXD2rxTrMXmG6EyfN6zcCdd/iOM75JIvLJdHMyCxRylh1OP0Dm8ZH55dXg1MKLMnpqAeQzYY4yNYYHJ+pFqifm7evT9TLFI7QtYe485p78HN+JEnCZMY7NMcQxp7JG0/etL/GZw7zAQwD0DClh/uTIJnDKE8Qb1xt4DORSYmCmJos0VVIkwwdT+CqUKw/Qs7zhRdOUQQc2kM8nwGgPDKCz+c/BGKydFITeZdCsiEv6kowzj6DvqNiJKPJryfHE5t2mobCCkt/IRNKayDkAUx85Bun6noAkzROwWGouPS85ntRFep7iWjZrMMiYp1gIDna3DH9X7GYXZXu6jHnt4BhveQuZHwUUFJ6PrOcbgFck6pk4a1wyoDx2D83DjCRgLH7sIl3kgdEgZ8EdhbLm3hZZ6DhmYpT5JOK7fHvNW7ke6NQco8IRfq7k0ScX0ON/mp9w==</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Upload">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6fy6sUzURmsO5tjzZvhg2qWduJUsyX/wPtoVh4ZB/IPWhBBfNkw6tmXibVQjMZuVyRPgrdfISWnxBpr4sCcUiIL8oCEVsT2mc+N8UW80/128yT/tOrNdV1gMNr97IdsmXqUXypx/9t0bOAef3uK+VtJR26+0cywJwHuZgYXJZ20fTkPcB4gJq3YQxQ90XnBln8Q0FdSfJO2PUeCkUQMvvXfGUKAarTzfWQz3Iq1d/Cpj63VTS93I+hPr2IK46leTOtJ3xMkF5OEFhauFPGVLKuieeAQ3Uxk6NQo3lRPYCJu69B3r8ZwAkznFIIPcVbK+AIGGC0Lb+udAGQsWxSHPiuI4TalPVxgVwLcoOZ59Ue2l5kGrlJaDI0rQhSpHVVrjFBI3yMtqa4fi3pNpcqWExL3AFBYgYI6byB8kEavTy7sx</encrypted>]]>'&TransferID;'<![CDATA[<encrypted>%fwt9cjxAdHhyb9nGJbndnGX63t6Yc3AGP5e9UjIGYu5EpCSfIy2vG6zq2v5Sl9z+bewhuIJB+fyYNuWxvltC+vxBJyqbQ9U6WB1Fa2CRtkgZIHkBL/0sc97xJPLtof+hFZuxZf4+/gOCDjCCriSefg==</encrypted>]]>
      </text>
    </action>
  </response>

  &UploadButtonCss;
</dir>