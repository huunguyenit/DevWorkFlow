<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">
  <!ENTITY Identity "PXInvoice">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'PXDetail', 'Filter', 'PXTran'">
  <!ENTITY CheckRelativeQuery "
    select 'so_ct' as field, @$none as message
    return
">
]>
<dir table="m31$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn hóa đơn" e="Filter Condition"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Hóa đơn từ ngày" e="Invoice Date From"></header>
      <footer v="Ngày hóa đơn từ/đến" e="Invoice Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="hóa đơn đến ngày" e="VC Date to"></header>
    </field>
    <field name="ma_kh" filterSource="master" operation="10" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="so_ct" align="right" maxLength="-100" filterSource="voucherNumber" allowNulls="false">
      <header v="Số hóa đơn" e="Invoice Number"></header>
      <items style="AutoComplete" controller="PXInvoiceLookup" reference="stt_rec_ct"/>
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
      <item value="1101: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2VeBXrvz8mne6Qr8RsKX5kG3/IMkjtWOWOS8a35cVXYmlJVhW9laTKK9REZ/JCTg1hC3WrgN6BfA4rNgt5oySXMM28PijwJCjSZ5lkkMZnv1kPewF7p/NnbF7Y3xxTezwLVn1zfEHVQEcMUs21Sne6sOgOW2DmlKCD7nBCQ57qHZ6CmcqWBeCQ510a78B/REVHYr08PFt9XszIDjudHVRzRywWA94rbqETVIGLOpch+kulg28L/RTu+hcGuWm8nLOmh9OHSkCD8NFfWZwPWKcj8d6eq20iXJLN8uxj2R7fjnWmkwV4IZ6puLnPIhYWQ5CNDIsTbnJWRN6e9x7GPlrwAgrnk3NiUHQ8TVrRrry4Qwo9GvRJWn9VLUsSnAvAYmWWkD4AAdFc3co2NE9aZF2DMmrU5AV3HAcppsApc92OBYF7/RlGfSE5c5ot1H5A+Qgf5TL2WpW9g1qyvw9iVfCsYALb7CKhei5aHfUW3KeQVBp5e+zKPSUTk1Fbs56WZwg==</Encrypted>]]>&CheckRelativeProcess;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22TIEBSAA9iGLHS/9ncEisTiKo0AhZ/PhzrGfGOOkI0whilmOjiM503UpHjqC+lrlDbHbjm0tvwPCrLZhPVvtpTVgcJMXSw7J0vH6o546B9SwYLeYGXua+XeujX084sAgagFXiIOd6zJEOPJLCCB6DlEBMH10W1S3x4DrL78WAx4loKsrOvs958HknZTC3FTp8eJoHiT7XXR0tvCanj8FyPsr6JR5dK1cLiNI8ZZJggcbu9WoLccy4lqO4Qymy9UHAgZIiUc/UPO9xsspVh8fCJdSQQNVwWsEUCDc6vYlvb0oPbHE+2rcd2O7BBSZ9+tmMwpLHoPZM2Jv7wBNORxncbI7PFDFCiopHgTUU0fzFmfedApF8q2SQlvRSzTdufM1uamCNG0WG9Z6LDQE0sJbcnAZIsBSBVITQKij52BbR2vLU71B3ONEdj/A/XsjGjNEU7kFKkNEMxgfBLTnOVtZgFg1MmjB+ZfP1NwosYiAp3p7tqOBIrcN1nakEOfBd5W7M2qYtcr0XjHQHJIGbHp3R6FOkfpBJEu2iPhrSyQ7nLHfU9m83blJ5OrA36vOva7IGG2qZgDtCKR2NG+YMG8WnlMWTcVMbC16ImmJq5prUIVLoCwvNHhEorLqfvcd01oRkXbNaM8hac883HJ3GjuPM/Hzx83A0+gbHiC4wYJGKXhC4tOS+MI8TiFKIKH4Bz7dF+GeuQL+yWbelWcE+Hx7jQvCUWx8+SKklHGczIt1NPRdljp8owv65vMMAOq//c4rDvLZCpyLW6eL5nqgSEHJR8e+09q9OOZ2jWX0zSerdTl05TmiJoTsFTfbYlSYSLgustCHi5Y3/ngM21tZHaodx1gJrdpYIkXVek0SVjkmHtSC4RWgWMdtrYCmmwHlMGEVpy2JBxzz0GvSlu0jzlZcp2ik2YuLHQ26OuWkUyU68612z6SFA2KPoTOy5zYgMFEyIBD9hyMYxPMalthquUw1/6u5akwme0rea9Ox+9TyHP3vQkMEU5LUAu8ZJQly/79QCJx8LIwVDxkEENPrXKGZDqmBJaH+GY6+eNE9+5YIMyhB</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&7e2+CD8Y1/FrAc68qhsPzLF7IjkjpR0/7eV7MXKM/f38mGRbMtLH72XBuekalNlNxI4Ny5RMCNuxqgPEU/xn6Tj9oRZsQYIJ4iRrRtQxfG+YRoCT8gvHJN8yp9cBvuJEwzE4XIf+UIeqpRKJjs82d/k/TEBNxqvN2eYFlV83+7N2nuUT3pM7UFlh2L6FBOsN1ylHpdUHFMb1gUVrbwk0m7yzMG2bCRcEfomAqaHzSAZeu8imDs5nmJI3L6tRwejF</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UssBP7mLwPvpIyeVnFY1WGIFudObEg0WpytXvCOVW+K</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3jZH/Y+kmJHLG82qfV6ZYGzLXuPutwXI/+ZvAYz1FIj+RF0XtijdKglsDtySERQ3mQ==</Encrypted>]]>&IdleLookupFilter;<![CDATA[<Encrypted>&kC14wA3BGHJ+ACfBdPMa+cStN6w+4umYe5v0XnZqe6UyQlxYd38nmmMqZbDvJFJl</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3uXgOXXvjxA3dwhlTKHt0y5Q7e+utx8j0g9+ZssqVKn+TuBXnhcYK4I3XqpglqOq+/f29QSc3cS3xE2w/jYW9WhebEstxZ4h9jQiKS/BP+oFvyOOqo8qUL8/oS4Mt5mzrA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3nomwEaSRNKHy1Ip7Qfa9wkK7NhzI7v2OMeF8h6O0hDX2jKGnL2xso6YwndWkpqZP3Fn1uVNX0MVStQ8uZHsC5M=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWLGc3R/qUm/fdG83yyi1hCbqQ4Od4jG66bN/n2fXfoB0l5fmQCcUoPhzjn4VzMzlbj+ZDJ6Yi76L7gbuNtuU4wc3kyJro/+jhdN/GBOWLxaW7MsGO4QSEx4qpeEZ39NLCnfjVqGl6DweWgVyGESGkte81u2amPGj0WYqfk5X72OlVsdqSorFzATsHbyBOTP1j2pr9xvPDxqW5UYTOo3wCj0</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3n7fMSXuy2bYhtxguM4Jm5kWeY6/iurjaNyV1uNgdYbtZwSFnqzz8dGMhV04oRPbCbF6yOneQi4uESf9zTxZSrk=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWLvVtIzZaYyscvaN2EfgqlNPYFlJSA13tHsIE/Q6nVptiQAU+0InkNVePrgPcqmD5Dp8RHRyb9t9PLd2qd73fCM</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3nomwEaSRNKHy1Ip7Qfa9wn11+1Z7HIZnBN6RItWNPZpb/Nno59gH9ylM85pVNc2nW2+0xT2ygBe+KpI+YQQAvM=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3nomwEaSRNKHy1Ip7Qfa9wkf70RhHfqKlwpnfRjXEsaMbwrwcwvTzMV8z1YoGw4/iYl7sUcsOTRxMQ9gzI56lQrLxXdrMxg2ORHLDfD9+192JP4YBk2Zm+HsEfX9zYtx+g108R6rIjPbGQQ/jxXYxNNAECJ5ACiu6GLnyBCUexTEgVcf/hLOe1f2YmFN4GqRKY3nfyPIxDC4lom/XyFlZs2Zinvr79+VnvJsbYxYbABCBOs/EwAtGXW46FoesBtyXQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWJU3Q/gxDYqfge8tsRmI8i84cnz3Wi/GNTfZnsrmecK6K4PlOMiTne8O7Fp3LkIovzffOx2G0Cv7F6PyHlc07cqRecwyaOnWnkTVHYXu1HzlZ5xN1D3NPuDPpcs8JrdC7pD20r6fhuPYVBQUrrE5jNbbFTVl9nSSeMGJyfbMW4vbOYxIcGsIxKYYg2tYCMRyLVpONER1GaIrnr6HDsy+tlJWc3zsIwmtymke+K3VeSmFatCgWU0UXLyJH+XLxQxUxzlcLsawHW5aCPOAxp+ldA2MWuNYROx7LzeaoRD9pUKfF4GX/KO6z9GivWhceIMQVqNixPzKHod09nhRQ3efFZlsmjI+7+lY3qp/1ReYmYtUpEXhQuljhB7x7OI9kqm8CoFjhT+aDCAMThlQ37+4LHL</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&7e2+CD8Y1/FrAc68qhsPzNtp2XVgUXNwqqw7+1DcHtG4nI3Vfo+YvoOiQYrAf4XxrrfmaSzXk+zGmLWJRqj0E3nXiuhMgQtNmF1gIC7ABWUvJ6mjzVyfTlz/Kr7QyNm0TeBb2R5KE9g7bIGX6wmVwrrfZ0Oka1Zj4NyISNLZCjGipaIpCAc0Ujxy15XKvqsUE53enSvk8zM1LW874h/Vj2as36adLwiScLhex4my6BrHsWDco5T8vcmyafHy5a6RSWQ8z/ZxAgFY7se6ywHcoUIE6gNZFPgUV26+YVmB8pcDxmCOf7ZKLBzuIAuSTtJeQlihoQCMnYRk6j8A8fGU+h29smea8Tdlw8y08FmgwKlONsHY/Dp1aZsZydhokNVnHyoEjJ0r/33j7Voo5AuZlE/+eMd3/I9y+wf+G65kMjcBUVaNX7ErdGSb7p9Tfx4xpfvLGUD1mudTxtPkV/3uksjGawEuZ8JNqKYSjv5RCcKuhhTACVjZHUUrkb6wNnzWE41YyvUUDS8xiOx/kPtr2E/zqVhu/5GZiTp+wTrQiNOBc8CPOsxkPLZNvK1NhZL4KyOHf8qcn7rX/0dIqsZrwyLwgiJpG/bisnqwZanw8msEw9uUCBCZu0T2AytR85Rg</Encrypted>]]>
    </text>
  </script>

  &ScriptFlowFilterCss;
</dir>