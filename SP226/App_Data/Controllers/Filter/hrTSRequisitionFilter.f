<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">

  <!ENTITY Identity "hrTSRequisition">
  <!ENTITY InquiryTable "hriccyccp">
  <!ENTITY c11 "Yêu cầu từ ngày">
  <!ENTITY c12 "Requisition Date from">
  <!ENTITY c21 "Số yêu cầu">
  <!ENTITY c22 "Requisition Number">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'hrTSRequisitionFilter', 'Filter', 'hrTSIssue'">
  <!ENTITY CheckRelativeQuery "
    select 'so_ct' as field, @$none as message
    return
">
]>

<dir table="hrccyccp" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn phiếu yêu cầu cấp phát công cụ, dụng cụ" e="Select Tool &#38; Supply Requisition Form"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="&c11;" e="&c12;"></header>
    </field>
    <field name="so_ct" align="right" maxLength="-100" filterSource="voucherNumber" allowNulls="&FlowMultiVoucherNumberAllowNulls;">
      <header v="&c21;" e="&c22;"></header>
      <items style="AutoComplete" controller="&Identity;Lookup" reference="stt_rec_yc"/>
    </field>
    <field name="stt_rec_yc" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="88">
      <item value="120, 30, 70, 100, 230"/>
      <item value="11011: [ngay_ct1].Label, [ngay_ct1], [ngay_ct2], [ma_bp]"/>
      <item value="11011: [so_ct].Label, [so_ct], [stt_rec_yc], [ma_dvcs]"/>
    </view>
  </views>

  <commands>
    <command event="Created">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcGC4wXbIV48PhkvsTtGPkVlij7kpDjHKz8xqvhz2dA3q</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3nefBIr1BdWaeXowPXKgZP+aWfAoW+/JzITmgw11l+81e4DwCZRrnqC+KLfXHp89Vw==</Encrypted>]]>
      </text>
    </command>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPS6o0FO4oa0V8ggf7RVJkjpvu5lLetaENfYXcCme6Jq</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3nefBIr1BdWaeXowPXKgZP+aWfAoW+/JzITmgw11l+81e4DwCZRrnqC+KLfXHp89Vw==</Encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcCLjOzEBOw7WLxwsZmNVIhdyKUhv/DDvGaGbpwHJkbqg</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3nefBIr1BdWaeXowPXKgZP+aWfAoW+/JzITmgw11l+81e4DwCZRrnqC+KLfXHp89Vw==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcEmcSYdxtUe+PSCBg6yibYyraQiOp/zqF5sxS9r6EbNtNyrLCilDT3R8TlXDOn5gFyc/xGuSalXl7byqi3cVJOItEWkEE70lmzCeWOgZ+ApPflJBISmgIDFqAD833fYyNpVIhBSufT2LqpC/ESn7L5hwUIrMfP+P/eWYc0tHuZhDtz7uyoS51FPvKoyH7xcKpplbH479lnCzq2Mb0DKq88zCk+Tj8/Wo1HGAfxC6E0BDgzMxea8c77qxGOWNbqonEyY26H9X9ccQCUN2ROaYeXBNgyry3Vn2r757b3JWmYkvzBbUuZ4rrB/wFgwqdwEOWxjlP2zrAXewRa7z0Qky/j9AYhoxgv3hHRGeYDp+jbDoqvywd9tXbHMuH7Xc1507BZ0KgkWVa4QZu66N3M+/TorTBZNxZrsScVQcYWLVBxYm8aXBDoaFlcdZZL6FCieaJRoWDhJWezmKXkibxmJSPpSiLDQMczon5nN/tQfo9W2EaRSWEF+Gb53hLnG4TMs3ZsGkNgiNl3J/3wH4VhfYgkc=</Encrypted>]]>&CheckRelativeProcess;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ed6tQ7Q2uNk/zbJipQ2rEiO1PlrwCug4lcFuQY6m2lqTZN2K/0HZmnepn8hnoSx9ban1CQOU7W5Soc2h8mp6n2hTDLPSbZh5F3/Z52H8H2Imu4dzx4rGsoycgNzDzHy/CLU6tRTLOYwkPlM1qUmT1Mx+zue8wvOcep5lykZByUbJ8PdsfVEiXhz/BEZs6o7MEGBbDbOo9nD7/ge9hD6MthXFdisswdAAE/Pgbz+sOGoBRyizsfAOvkLzklKGIyOzKCP/o8+VifuPzTYrFI7KimtJ9dFoOhat1goWxJHYXqfYj3S5+vXzhrgd6mdVgWaEnX3Jwrv4fy1YruM9L3jchHLXvIAyiZ7d0xfRndX3SGBLD5zNmWjVC++nG9QnCpisg==</Encrypted>]]>&InquiryTable;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4WQgvcHBaPeQOeNFKDgrFr5g1fqCRfHWi4IU12g0vPAZl+l5eu4eqXp3wnjBQnVvK3aLu3czG3maHYKiNkYNvYJxIzL5OIC+TVmYMB7D0UPX</Encrypted>]]>&InquiryTable;<![CDATA[<Encrypted>&g9eHRt2pDXV3uFXvmOAWwIvAYJJ75RBeH55a1zruxLJRBzvLOLnJLvMODmzgPJh87jRT0gdhOkhdJpQhZy9cg6RSOmc8YH1DORHF2G/uVzQ=</Encrypted>]]>&InquiryTable;<![CDATA[<Encrypted>&Yg5kCMHpRxVk0phZxDQR76Y8KaMVZLmSS+c447U021byZE0Pw23Jyv1D4QKxp9bS9oGFXTNgB7DEVzh9EtvT/rThRIzum39hLlZqfu/B6zOYlg2uwv1hIMj4silTN3y81gi/EV4Gk9GdDLyhRwunkyjwumDwZ0YeFZf7aO1Y2xg+r6d52/6q9mBLOhE9FlGkgLFlA5gwpvPPBptOG3pOiccVBlaXN82fluojo/9vRLcmLse5bnZPsg39BSu8LEAwIYLGvFBLlqsshPmwWZA/cnJQ5f2S+iLOBAJ+g5wLCDVYnjU7NJlykvFGmaKV+Bte+8pSS7vvEsH0SvVB4bnBcrpiBr59bu4OjHEbvZ7WyJ4fEx/dCo96JuwVX3JVafOX6DQKcaKQcYWqJnaWdj8oSFJ5wrbr4ijrSl+qBi0uxrJ8sSGyFhLZ/QOdInX6ODF+eoCXfSy7+U8IralT3me+RGEquCkXVo4IavTxDyCGPZCW/RrpfEUOsEb6QPfm6DA2LuZ7JpKStQ22CfJ9i9DZQO8Hu5TF81WrqZPfnFtHl7THzr+VQK5AswkEXWNjwsXPz9eO7hQIrK9n5v/v9i3wyTsrnThwYhju+xsdBMkM9Jl4bNG9ookYJ80GIrnlJYISdEbPypzoT1BAJUMl7V8tcrIGHNT6rp+JCWa5+5m+qms=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3hBvhiM3L1mWpQV78FCxGrIFuWhFfGwAduO+uG+CZheu7v8Md/DB/7K4gO10NsYIR6X9W2xD2NJwpLSOWpo8Eh/oQ0fCIypCm8IX8Y09pYeqeXJqyBKKyiEAMW/7RoZ8eE5dd1Cb0yGM2HeP/KfpmfxhYwuuM7/g+HQ2xI2Z50YujFQ6FCiRq0MOyLt4IHXUls9wOn2c3tmoosT1WDfkfDTI4lEkUDGqCjS9ZuHqNnFV7hiYJ17nDSoTGUeLYynPM+x1/mfobTNz9ZJSKdX1O+M=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3hBvhiM3L1mWpQV78FCxGrI8oQMfjAXkxMCc0Ft4t9DHiTmnbIFKg7HMiSg9g+8ziUdpCmfuaAJI+AstyOY9Bcg=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&Jl3E1PKXzK66ePUEZMCi8/qcujwKVF6jWLTpNH/gey7pY8SQWs9A5nbUAdv7oWjXRUjP+K+SON8lazouBd30je9kn7Id2/HrKcsYCb/76x3nLnI5LS9hnYXjo5GFDKv6/CKleygclxgroFtdFWgwCw==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UssBP7mLwPvpIyeVnFY1WGIFudObEg0WpytXvCOVW+K</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3jZH/Y+kmJHLG82qfV6ZYGzLXuPutwXI/+ZvAYz1FIj+RF0XtijdKglsDtySERQ3mQ==</Encrypted>]]>&IdleLookupFilter;<![CDATA[<Encrypted>&kC14wA3BGHJ+ACfBdPMa+cStN6w+4umYe5v0XnZqe6UyQlxYd38nmmMqZbDvJFJl</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3uXgOXXvjxA3dwhlTKHt0y5Q7e+utx8j0g9+ZssqVKn+TuBXnhcYK4I3XqpglqOq+6ySi4j/Tv4lCqcEL0MUAWaqAqBgbPm3rtnxCOElEBj8gGQPUuOsmMLrwv1manfBsA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWKciZtO3jhZffO9EJzsdj9EsiaBUE747e//3RnkUwb7Wp7g+V9Raf23CaYJ4oqqB8ywXXz7fWEI4+F4eKwQJqXAU6Ct664goOaS4tzD1aCwHeCvKd/zR8e24558SUpMAmHrczEM3KAbpYxSDPoN2ARyLPQOTGwoy5t+kbwO8MoqMlnqRXxzWl+TNxa24vwoPrA=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3qeBZQhxWm9N1jRkDfSC40OHkd2DXY0N0S9OSWHXjUiFW+QJt4fV8dVINzErNnhRZdgmMtp+5Wi+CtdIuC9Swcw=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWLvVtIzZaYyscvaN2EfgqlNzr5CBr8L6XnwsuxeQoiUffsWo+UJaxSPxz5Na+JgujI=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWJU3Q/gxDYqfge8tsRmI8i84cnz3Wi/GNTfZnsrmecK6K4PlOMiTne8O7Fp3LkIovzffOx2G0Cv7F6PyHlc07cq7zdDIHNFn6Ro5j8ECt/ahr99pG7IUuOkGR9qMvzfy4skecorHnD/Ja0MP/97+ZitolYBy7JPh0staIMZYiYRuQ0MrqzhuKjcIUHrbw6cSCOsJqzxLceRuHfo9D6kOT0XUF3JRC315cSbDFmqxdatWUYhqas/U8wTxCMdFmVZqOBiRdM3rGYa2AoUO4BBePaZtdplf0CP+3OUc+X/E51gMk5qDqWtYgs9sHGmSrvhfcKC3lUDt4aCGy4FZ+zB/MXkyU39PgcXBZQPXcFOgxSGEw==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3hBvhiM3L1mWpQV78FCxGrKMYCHssObkBLe1+DexzOpeDT5FBG8xaH1uyQFXsiyffbeGt0EriHyS/VKzn10EM4nNSBGdq+xgfRrzUs/6hYOU1vLbDYvVue0HcBrYmdnY18rkiWKi3tZeTH1QCOjgrRxFJVFAAGVAt6cohlG6Kbgqvw3sHmZbDoPEkOx7ur7g34pQQPHsUFDB7MCzx6atVRU/zdc4DomJKASuqEheHYz3</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3rOObb4GYbMQh3I9s9ieQaE9XVwXgsl7zP+QVcAaKgOJNBuP9wKgfpgxthOtUTNpSw==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3hBvhiM3L1mWpQV78FCxGrJHNTcm6vlgTGjOrRm4fLDchz55mmxJyNdSyEOmVQsIxUsOHzSOZIL0Ocpqrj1X7rHT7Z+qfEC+MOiVaDOGQ2MS/iZHbl65MMwu65jWQppdkhvyVJRfRJjW7z6NPlcQ2DQ=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3np6J+ljP/SfAMF0E8gMKEL7GYWhPgCRHTvzHCdupwmL7HndSLXhzqujOxiBm8lMTA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3np6J+ljP/SfAMF0E8gMKEKpkl3mc7tnqpM9dyOAChlkW+CHaEI4A2xcynH+q4H1jQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3rS4dIrGtn/zbuBqcIGW4sXFYYOZ8fG6mEwQ6CVZvpVQ63OMA3xSENwd2MZLsO+iICADniPRsAJ2EpyNctGD782ECWjr4fXm0pLPGqMFDXYq</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3rS4dIrGtn/zbuBqcIGW4sXrdsPmc3ai+oX3PXdd7hOyh43ufi1jNgLcfpFY7e4uWRkTkq6jdiuDye/sPedOcAfk1hkntMhODJ28PjefLiYe</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/3edCx6AYZ6rCiltb24POR1jvRegACj+rSMGtGpJz5wBQtHi/hFCXjORUjuZm/LFNA==</Encrypted>]]>
    </text>
  </script>

  &ScriptFlowFilterCss;
</dir>