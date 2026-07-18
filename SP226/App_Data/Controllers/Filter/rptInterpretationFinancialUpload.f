<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY UploadButtonCss SYSTEM "..\Include\XML\ImageUploadForm.txt">
  <!ENTITY UploadField SYSTEM "..\Include\XML\TransferField.txt">
  <!ENTITY TransferID "rptInterpretationFinancial">
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
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Am8Jvv1DRVW5XC9+pNe2Ne2jWQJbh0DEZ7N611nnGMAPMVaubpICQwIBwKxkBBdwGBT0jqRWHSwaw1+rXEwS0313gb8TWtxwkofblFfumVUipEEku6RU5WNoXoD1GvETDSDck5DUe5C+CllT9IVee0scVnTpfGzKiu1BIWDN8Qo7HI9ysVDUl1FIfMVT9OJi1uyPRIOqA6jznjsAs2SP6prQCvbrPXHDuEh2F8oYu1zPITL2GysjPU9c7UjZhaI/n/ZH1AQr7p1pNzrtxZujIX9pp1r1zI3+hSuSppxYXHsMilAXy7SU6tBBo10b9KKQvOm5+CUiMoYktzIYLx2GQ5dxhBpyN0OBdfbcYvsbLidk7SjGx79tADpqr9K4KUPpWnYF7q0DocwaAdeTjyYnnl2P7xGWVmRgvGgTYz9crdq</encrypted>]]>&TransferID;<![CDATA[<encrypted>%tQIWXAkmAd+Wv5oPcBmyV5ZgtmXlO4pn430lGj53OsXBExn5C1TziYLI5oFyQiyr0X/7SUlSL/vP3Y1Vr0A1G/46rgE2484iZ4D3p9joqWEqS6MQIYzyyj7ls6CBmMwXjmHPchgIcgfDM3i3RTExC1NsvpSg2J0yUD4HLpgu/KuswgRAPNrwrzXiJ7HW3oytqqMEwsQ35rukfQ+nTi7Uhu/lWnnh/O6G0aE4dZ9QDLDpNCmwixTY8mN4FwCWZ2+zbZVLfkMfBD5qo9jcsdZ3Hn7IRb7YXPsunw+iE8RL8MyEUAKvQJJEvRDXy/T0B4KO5uW4Ymp39L2qw1i7ZTs8250uzLVMGciq1XBhAX7Dgfg=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70BcWFv9N2Or9rvrs3U1r7fnrdgy/kbaa3W+xrf4t8bgLnEOI0TRZb3Tmo42HqJpF1r59T4CMBxmnETso6R0u/uEe7xtfIK52Q1/k4B5sMPn066dHefUG0TA8hLHUgNF274aV13xO/VCIskvjZHoQwUm1Kki+d/D9ylNnO5zlNLUUDv1S661FE+RnCe2HhHYPBn26YORFhw2Uke8UHa5Gyt93T/PN51svoCfkEjR3CHMGEM0J54Ih3BN8KkAlw9UX+RjEsHn9ObySWcsg449rxrhHn2hqjzcjrirBHqowPigs2JnZ36f9vCl44OwJDfy7KVfXENBh2ClZxRFbC1iZG4aIyGAnVcX849gDDmN/CYw5hjqm1CeI8XoFpWtUA9eVw+OAIwDbReKBu8m783f51FSUkXYTYhY4UBiA3sHajR5oRnWqg6uNV2BgdCdeUJ8ZEFZppSxTWulw1aUwsghARBpp/F/7TfWIv/9VmInvxQJWXvg/ywO2oNKR/OoqxbKtYUUNzq0DRniBoCDhGjjcaDnwpvpjcQILMeC317E2jYUZul1bhknT+3eNdIh/vwHVsWgJQ5XlhbJBjAuoh+6CeWOlfTUNC0bQF/UreYbr+4D5gfC1TvQAFLvDWGCqYOsih8rgfrIaky1Ppi9X/stDNWktyHMWB/Gv0Wb39HUMet+0/f1WdE1N4nR3KbrztOze7Yo0MlvXam05dBkrDyApz5wwjI9NqiHDEeWPrGyS7SjDaFDteBy19wfJ6qaCN959v18fJbT4lokzqSWOpjKk1CmOl7wp1M8MvnW94FPsyLMWjcCGIFGJ26gSOGGO/N+yiXlMkunrE8JdNTVCBFrjwABWEU7Xmgv5C11im0Hz2jjgdUj+BvvLGO/kOBDapd2CvrcchZT6FrWwAydv2BTryVHoUH4xOQQHd4T9jUk6Z59xNSWDUyuAG1N9tMeg0NEGoqFBwfOo/Mtu1VENVmkY7PM=</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Upload">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6fy6sUzURmsO5tjzZvhg2qWduJUsyX/wPtoVh4ZB/IPWhBBfNkw6tmXibVQjMZuVyZA/4toaW73JUU/sHLvG1D2Pe1iQOT14WwVumyUxkhi4BTSiSDaXFzMTrqnFweQ91FjnhpmGwno5y+xSsqyowsRELG2lYbihWf6Jjsm4P6kbO10t1K/fPyE3bPgxMvZ9hOV/aDpReYIFm0zaqLiUJWGpV4l38VQfL3UsF17rc+rJWSeCMmXURm+JJ5y/ejN1W4BUJGkg2wpIPUokXFdkeH1gQp0EjE0zj4YxBoxXRS6KQkD5K3DfVHoDmY0KmJ/f/2dDqHaQimNb4kAhPWOG1DmbNmRkAB1Q0fU7OYgpIyGCfDfPl/tPJyE4z8OlEbHXjzAfDTAh503MbfWKlRTHYs0ecBo1FNbZIXNzJsI5ftX8QPKNepE5o+po8kgrIsns1jByexBcH6l5XtE3GlqSczan6TZTXZelj/yZdC1++N6o</encrypted>]]>'&TransferID;'<![CDATA[<encrypted>%fwt9cjxAdHhyb9nGJbndnGX63t6Yc3AGP5e9UjIGYu5EpCSfIy2vG6zq2v5Sl9z+bewhuIJB+fyYNuWxvltC+vxBJyqbQ9U6WB1Fa2CRtkgZIHkBL/0sc97xJPLtof+hFZuxZf4+/gOCDjCCriSefg==</encrypted>]]>
      </text>
    </action>
  </response>

  &UploadButtonCss;
</dir>