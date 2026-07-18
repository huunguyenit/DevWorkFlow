<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">
  <!ENTITY Identity "PAInvoice">
  <!ENTITY ext "83">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'PAInvoiceFilter', 'Filter', 'PATran'">
  <!ENTITY CheckRelativeQuery "
    select 'so_ct' as field, @$none as message
    return
">
]>
<dir table="m83$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn hóa đơn" e="Filter Condition"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Hóa đơn từ ngày" e="Invoice Date From"></header>
      <footer v="Ngày hóa đơn từ/đến" e="Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="loai" dataFormatString="1, 2, 3" clientDefault="1" align="right">
      <header v="Loại" e="Type"></header>
      <footer v="1 - Hóa đơn trong nước, 2 - Nhập khẩu, 3 - Khác" e="1 - Domestic Invoice, 2 - Import, 3 - Other"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_kh" filterSource="master" operation="10" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="so_ct" align="right" maxLength="-100" filterSource="voucherNumber" allowNulls="&FlowMultiVoucherNumberAllowNulls;">
      <header v="Số hóa đơn" e="Invoice Number"></header>
      <items style="AutoComplete" controller="PAInvoiceLookup" reference="stt_rec_ct"/>
    </field>
    <field name="stt_rec_ct" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="88">
      <item value="120, 30, 70, 100, 230, 0, 0"/>
      <item value="1101: [ngay_ct1].Label, [ngay_ct1], [ngay_ct2]"/>
      <item value="11100: [loai].Label, [loai], [loai].Description"/>
      <item value="1101111: [so_ct].Label, [so_ct], [stt_rec_ct], [ma_dvcs], [ma_kh], [ten_kh%l]"/>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcEmcSYdxtUe+PSCBg6yibYyraQiOp/zqF5sxS9r6EbNtJUswWfbAW/LWyInNp5bWaZuFvrRTub9H+K2zKlidzHzhc5/VqIEBn1NPB5DSQlodSd0Mxh3VkViPK43Hnz3KGIq41U+FQhWzjJlA/GEJz2unEY/dQykllblUQnzTi4ONrEpj+4aLwu5Y7IikA5EHk4BUgObidv8SKRfatEwO+vk3e2DJcBHNAgzcYzFIvtMZg/ALhASdHrZeTtrxxO1OeQM8zljX6UAkg/+HmKM74O2UU3g/AwRGAIQxWjAFH4XZrqEzihprFGQU4yvhwodq5rl0olN92VjGXlHnAwSMbbDrS6jqXhUd6gfye3KzXgrU8w+KQWBffobbsfv+VmOjcbeRYHhQzIc3RpMIGdkiV/mul34Ct8wdj6IpONLQGBNG3saDipyF71VKuKp3A895EqDlYz+jPPMMsxVG+84NgQw37+b7nUtSD+/ZdrxFmN+TuEmYstkr4B7PJXJnXbsqLrPwSDfBg1htEghh3jbT2pk=</Encrypted>]]>&CheckRelativeProcess;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cM0pVSo1qBx+Bjed9iMmo7n2emlL1eyVtMrbmjALrEf+IWpwenkMkexroejaR9vc4ogv5SEhqQ73mEo+bVZ6wMtw4O0ooYKmWRWUZQscxqTOGjyWJdQlwYVmiKKC15+znjYaNqWDye7Hnj7IK0E+RDx/8Kap+02emljGc2KG2UXVdR0xaFeNfYdj0cgBrUDY46R6P21/6K7vUDfbqlIDrH//g1j9ZpmYG2bUUfP92n4xQsXC+JhLNjn/NnmewwepP+KRbBupR5vS/hDZI+NHdmhcZPlaIfd37iLKH+gODm+3ezxfVj9fd1F/4ZGcyWigyMMmuFAHfUVxgjJD4om8b26tmVzC8k0zt2lkiqlONrqDU65yysWNIuuFwVppRTj9TidPJQQcOcDvmAbaUtxKLuYbEecIz80irrTV1Q28MZ1LC2RWRpLhpArmSFRmIrinXHwfUBe4U+h2emA3hHmwpNxvRRzty6hN47gu7cYLjmuaKDEAUako3SFEW8ilsYBOOJrv5t613HQ3fqT2LhqboJQDOm0mXHxQ67XpoN5DvzkFHPY461HXMf+tuRrJtOuH6RI6UwQmxOzAYRmuFKNEuU1f6yGv6ycSDZD5+wrwjKMiUkRtckhKZVmx3XVALGQNU5AfST74rOSiAa7Tc7iCG/0zd6bAgcljQvDOY4D8R7KwNiZwH6wd/MP5GGTaBJHLxRe8kkxR4HPDyeC5uBTbjQ=</Encrypted>]]>&ext;<![CDATA[<Encrypted>&LTpabyia7LjFJgPs/FV63kLuRdzxNaIYiG9GEtKyhlLuNZbfXB3ldIFT1N9Diwtx3p84DOz3IEwsIdo+QM9h43ZnergT45h1bfA4RdLt2dFvs3pBjfCJHeRSvwwP8wxy6BO6Ttj1YLinZbY14zsgXymHnGIx30RTOou+oBogiKBJoy8oaglDGq6rKDM40seE81TlI65xLrvAaeIpBCUbOvxqzbT3KzY6EcLYHEnl+auvSDfc6V1oeVMOo7CeckWTD+murpeKUGP9rtBC/mYLFFcg9zlsz5bAwPczTPTJM79kfzX1hJGFgfpL+xK8J1Hjr+v0+Vhn1QEMuOCCfm+x3bYy3NnGwEtnn8/HilMYnBJxE48EPOTEYYfMwVF1k06A8EX62RRaFrb2B4dQE/OWvBF3MFAv0qD0vhfG/tHfjldyraqlkvgVZoxZ5orlswd/VmsuuZQZ2zMYpSxYUjRTGfIqlpsfy41tbhQAosKo/xGvOkw2dqNR7xBe+FAw/xNZkE0/gP+x+eniqHfcFGk1PbY4iZa/f1lbAt+/czsV0EuLc2KloJyrEgrbhbBvFgStUMKUXwV2X/pBlZjH2vJDuP1vu4Oj18cheHq6Kj1ij7XsiyHoVlYFOiRFtdJbnxYaP78Cj9niSxL1IB7viOyreSwm/9lnoi8BidmIUrMQ605msfuDaFBmDtHX/9K2j3vH7MED9RNXmxtq3UqIbQVtIQU9UCE6RTumf6RE2bL3oQ7Lne3F9RCQSxHW0UtosuLZCcsV8cxPx3mD1URtnMUdkntMeMBr49Yk5or3ocPTF20/hKZLhNRcAbDMmHMnafuYSdJ56GWFIRr3MtkeKP026J15+1CBXCn4BfN1CyH66/s=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3hBvhiM3L1mWpQV78FCxGrIFuWhFfGwAduO+uG+CZheu7v8Md/DB/7K4gO10NsYIR6X9W2xD2NJwpLSOWpo8Eh+2FIAayFRyrpWJZRbELgftAy89tfkFORBYJrfaaWyr/x3Y4Wx0/RCGWCZBmeuCG9EW/6otJQEk/DzSfnva1LTdOjnE9JuSPR9h8sb8ANDJVx0srQkNXzYKIF9zt0nEpZBxodVk7UqnlinAkR7ovhY7cveYBcfiO6ZB8epAHH0AMg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3hBvhiM3L1mWpQV78FCxGrIOKv/wJibdMr9p2K3/W8sf2G6fJXz3PTxEUQNRDVWXgw==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&Jl3E1PKXzK66ePUEZMCi8/qcujwKVF6jWLTpNH/gey7pY8SQWs9A5nbUAdv7oWjXRUjP+K+SON8lazouBd30jS1lH0HZVwHwnqJ11DvsR9DOKOCGHPoF7VTMrE12R90jN2zygad7o29UhlZNyHw+JQy9cFUgJR3pER36xoezbqE=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UssBP7mLwPvpIyeVnFY1WGIFudObEg0WpytXvCOVW+K</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3jZH/Y+kmJHLG82qfV6ZYGzLXuPutwXI/+ZvAYz1FIj+RF0XtijdKglsDtySERQ3mQ==</Encrypted>]]>&IdleLookupFilter;<![CDATA[<Encrypted>&kC14wA3BGHJ+ACfBdPMa+cStN6w+4umYe5v0XnZqe6UyQlxYd38nmmMqZbDvJFJl</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3uXgOXXvjxA3dwhlTKHt0y5Q7e+utx8j0g9+ZssqVKn+TuBXnhcYK4I3XqpglqOq+/f29QSc3cS3xE2w/jYW9WhebEstxZ4h9jQiKS/BP+oFvyOOqo8qUL8/oS4Mt5mzrA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3nomwEaSRNKHy1Ip7Qfa9wkK7NhzI7v2OMeF8h6O0hDX2jKGnL2xso6YwndWkpqZP3Fn1uVNX0MVStQ8uZHsC5M=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWLGc3R/qUm/fdG83yyi1hCbqQ4Od4jG66bN/n2fXfoB0l5fmQCcUoPhzjn4VzMzlbhiV5sCmo7NanI/iFodwYCJxgPvPimjeNlBDk2eUGDvJ6t9tE5V/sAc2fsop+MzKW8RqQgiuTaUW0XSDvD3mu3RPAPo4mn+sopxZn4NpILrzEucx4arfQVlAedf5rwiOF8h1Gi+j6Nh/dW0ApjrBoY4LVunkZOpdgNzYg//nDmXQ0sSI1FCOB1ZOOsuoAIaQiY=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3n7fMSXuy2bYhtxguM4Jm5kWeY6/iurjaNyV1uNgdYbtZwSFnqzz8dGMhV04oRPbCbF6yOneQi4uESf9zTxZSrk=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWLvVtIzZaYyscvaN2EfgqlNPYFlJSA13tHsIE/Q6nVptiQAU+0InkNVePrgPcqmD5Dp8RHRyb9t9PLd2qd73fCM</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3nomwEaSRNKHy1Ip7Qfa9wn11+1Z7HIZnBN6RItWNPZpb/Nno59gH9ylM85pVNc2nW2+0xT2ygBe+KpI+YQQAvM=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3nomwEaSRNKHy1Ip7Qfa9wkf70RhHfqKlwpnfRjXEsaMbwrwcwvTzMV8z1YoGw4/iYl7sUcsOTRxMQ9gzI56lQrLxXdrMxg2ORHLDfD9+192JP4YBk2Zm+HsEfX9zYtx+g108R6rIjPbGQQ/jxXYxNNAECJ5ACiu6GLnyBCUexTEgVcf/hLOe1f2YmFN4GqRKY3nfyPIxDC4lom/XyFlZs2Zinvr79+VnvJsbYxYbABCBOs/EwAtGXW46FoesBtyXQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWJU3Q/gxDYqfge8tsRmI8i84cnz3Wi/GNTfZnsrmecK6K4PlOMiTne8O7Fp3LkIovzffOx2G0Cv7F6PyHlc07cqRecwyaOnWnkTVHYXu1HzlZ5xN1D3NPuDPpcs8JrdC7pD20r6fhuPYVBQUrrE5jNbERT5qwMF/aQbAvQVNdfn5Asg8dZvKZyKDoU7UCA+kSyRpCxl8/ICHx5yJA2ZFf/Ju211ixn5LkNdS5NeazSnDuZMErLWaz1iHFhtQnIsHFSgMAgXckmCsUtpK6hxPm6G4VHbb/xIB9xRjQMEvcIDrhxiZEbZqCESFe7NePzulbSOIOJZJGo3W7dPGXWHdSWU2yNIg8bYRn1c/jLlci2yNKIOkg9NTICePq96lbyqDAScQZkx5r8TQ3kAuNctgJhOa+Lyi+1cpfcJIV01wsVo97SbPS5YlJAziIk1fZLTZFM=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3hBvhiM3L1mWpQV78FCxGrLCYGdbGZRf6jwVwHsYDGcadjz/yaSxJj/y8vn00lHwW0hegmv+9kpZemOk5GXC6qgVmvpHZiiev3ytHMS+NUt3IGpedqXciRT9ul1hAHgH/CgJMYUrAklXXcIigYCWJjzJkqAgjBo/yltqD/671IUe0Dfz/DcnJn6jNfxj/ESOb99syHZqz0vRP7TPqAw2Pv7ivjFM4UeJRIZnjPsun6bTbtP5F+IMaVFLGUTrsM25XA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3np6J+ljP/SfAMF0E8gMKEL7GYWhPgCRHTvzHCdupwmL7HndSLXhzqujOxiBm8lMTA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3np6J+ljP/SfAMF0E8gMKEL9ltA3BUnGPzYX0Q2HnUqjiiG375SYY2iok/Xh1PgQ/g==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3rS4dIrGtn/zbuBqcIGW4sXFYYOZ8fG6mEwQ6CVZvpVQ63OMA3xSENwd2MZLsO+iICRFgfOqXvo4sb7CMkUFv1iYI7mQFBMQ7CtLiPzQQ0nK</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3rS4dIrGtn/zbuBqcIGW4sXrdsPmc3ai+oX3PXdd7hOyh43ufi1jNgLcfpFY7e4uWRkTkq6jdiuDye/sPedOcAfk1hkntMhODJ28PjefLiYe</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/3edCx6AYZ6rCiltb24POR1jvRegACj+rSMGtGpJz5wBQtHi/hFCXjORUjuZm/LFNA==</Encrypted>]]>
    </text>
  </script>

  &ScriptFlowFilterCss;
</dir>