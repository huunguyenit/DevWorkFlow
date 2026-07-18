<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">
  <!ENTITY Identity "GCVoucher">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'GCDetail', 'Filter', 'GCTran'">
  <!ENTITY CheckRelativeQuery "
    select 'so_ct' as field, @$none as message
    return
">
]>
<dir table="m12$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn chứng từ" e="Filter Condition"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Chứng từ từ ngày" e="VC Date From"></header>
      <footer v="Ngày chứng từ từ/đến" e="VC Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Chứng từ đến ngày" e="VC Date to"></header>
    </field>
    <field name="loai" dataFormatString="1, 2, 3" clientDefault="1" align="right">
      <header v="Loại" e="Type"></header>
      <footer v="1 - Phiếu kế toán, 2 - Chứng từ phải thu khác, 3 - Chứng từ phải trả khác" e="1 - General Voucher, 2 - Misc. Receivable Trans., 3 - Misc. Payable Trans."></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_kh" filterSource="detail" operation="20">
      <header v="Mã khách hàng" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="so_ct" align="right" maxLength="-100" filterSource="voucherNumber" allowNulls="false">
      <header v="Số chứng từ" e="Voucher Number"></header>
      <items style="AutoComplete" controller="GCInvoiceLookup" reference="stt_rec_ct"/>
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
      <item value="120, 30, 70, 100, 230"/>
      <item value="1101: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="11100: [loai].Label, [loai], [loai].Description"/>
      <item value="11010: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="11011: [so_ct].Label, [so_ct], [stt_rec_ct], [ma_dvcs]"/>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2VeBXrvz8mne6Qr8RsKX5kG3/IMkjtWOWOS8a35cVXYmlJVhW9laTKK9REZ/JCTg1hC3WrgN6BfA4rNgt5oySXMM28PijwJCjSZ5lkkMZnv1kPewF7p/NnbF7Y3xxTezwLVn1zfEHVQEcMUs21Sne6jC0S2KkExdGeKjHAV542/3/5vCLSVUvpPifkXKDRz4QHw/nHwkbXwoDRSkkcRc28Q0wNcCYyOAFUnvJW1Qs5LTH1L+Ow+kTphMfKDBLfgF1kHbNsDI/1XhnbUfLVfdvfR2AlgjBrJGGaY2mCmxZg6s7ls/uKUWvvqaaqWrNMvZ0RBEvIb/TKsE2iCfAtPh3n8q4g/RTj+14V/ZZ/B1pGhPES23JOfdvXJWiQ3Pj8BIfNjKeLCxpJjF+MFNxgc2dRH6H8HZdkMe/DAcUJgs3ULdU+TBV+MLJ8kESv2RW01ZQ==</Encrypted>]]>&CheckRelativeProcess;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22SFci3MGFhkFuyPcY+xCqhQt4NEay1Nr5uiTFe5JFX1c7+A5kbC/MDZMjTh9PIMdtQgslaDZPUn+qg8ffJaLvh3zHkfKWKVtE5f+jnI9bjjm7hBNTdZezTRwy1OsPUwwmn+ORU2HGiEUMhSPyNvTRGwH1Xtxy9F7CqPhNZ/2S5illo08/BTwfr+wJokS2PjlU/5P/O/CQTsvUtRgaEqxuMyvQEQVlDX9zZCTjl1FqdqAtC1xjgemiGCs6RO6wu+CJB095vpb/I86MQe7wzu5xPPUHtEuo86WWu23/eB5l4JgmN7d7Q3l13EAf2QL1eckx46SXZa47EBTjdn5/eokLswmKNaIwIKA9bbJhRFRaqAmBClGk9pGoCbWtGLjjrVeUxgk3RKSd5zlrL5gYb2tt15k1WgCrkk9qevTuvwHY/SsblWDL0W6HrZVQw5T+ybjmIFP37hyIpcSATosRAuCcW6UBVMzG1TZgtEQUKUW/NN4UOgMG9Bb+kA5AxTa0gHTIlD5X2CAlAVlv3TkcFUBd/4PZHtrlgejJNdufahEF/5CC0YpLqRad4S7aQkqt5QcFxQIBe/3NUBepfAqHOKjx4xUn5XThzulWohA/yyER8qOZwcXRYd/OuSxv+J5zE2ddD4ZBUcqvkUsbadceEHT+AQOQayDB5KhREyrYcb6ACmZ6GJ8fzz7gaMFZ125ZwxQreIyVvciGjr5Z8hCwkEBYqdIZ3PMPBHoq/Y1ieQjavGhR3xLOK15+YhKC8rfh/lMhztH2in58vkQZ3MJeXWfA3M7o/Yn4ibgl+Ow2Vi/UYrbQVSNrPvU3Bt1KtzJ3BpTAyYTdgSvPv6h1/3gDQMZCLgFTe462iKYs6Ux3KyXo2Oj7e8gJkPkyH0Ly7LWpy37tMjbK9gGEKGzJs8EfKiN8PosBOtaoPK9lB1aiXoKDKKQ5wBGkuv6IJFi5HWfhH95R+jLGmymtYLOMp+ptxSSXmL4pdz3Rg+/Pu41CXVCUFLbHEVSi2/ukQ9wEnlB8ht2rHohr+G8mT/aa7fPN0veFPYBF52UTTpBY+gxyPmk2JM2bzSIn684s4PP5mf7JmRhJvDYVIbfoM+FaHZW8VkXQ10DugeVLmkwrWsjzzGcTQMhl7tbZhsIPd+Bvbwn4BGQdg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&7e2+CD8Y1/FrAc68qhsPzLF7IjkjpR0/7eV7MXKM/f38mGRbMtLH72XBuekalNlNxI4Ny5RMCNuxqgPEU/xn6Tj9oRZsQYIJ4iRrRtQxfG+YRoCT8gvHJN8yp9cBvuJEwzE4XIf+UIeqpRKJjs82d63B/2i7ADbuf5GSPPgyP2VTDUNVoxcYv9l3WQ1lD7TPHw3xrif4i4dcI/HE48AnsHuKOnsRCQ7pA8Tqv/6tKzc=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UssBP7mLwPvpIyeVnFY1WGIFudObEg0WpytXvCOVW+K</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3jZH/Y+kmJHLG82qfV6ZYGzLXuPutwXI/+ZvAYz1FIj+RF0XtijdKglsDtySERQ3mQ==</Encrypted>]]>&IdleLookupFilter;<![CDATA[<Encrypted>&kC14wA3BGHJ+ACfBdPMa+cStN6w+4umYe5v0XnZqe6UyQlxYd38nmmMqZbDvJFJl</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3uXgOXXvjxA3dwhlTKHt0y5Q7e+utx8j0g9+ZssqVKn+TuBXnhcYK4I3XqpglqOq+/f29QSc3cS3xE2w/jYW9WhebEstxZ4h9jQiKS/BP+oFvyOOqo8qUL8/oS4Mt5mzrA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3nomwEaSRNKHy1Ip7Qfa9wkK7NhzI7v2OMeF8h6O0hDX2jKGnL2xso6YwndWkpqZP3Fn1uVNX0MVStQ8uZHsC5M=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWKIH1zCA4T2q3CfRZC5SbhUu9LLT4nw2oEq39U1c+bijk7QrFVl2DlOhFUbwOqNV7I=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3n7fMSXuy2bYhtxguM4Jm5kWeY6/iurjaNyV1uNgdYbtZwSFnqzz8dGMhV04oRPbCbF6yOneQi4uESf9zTxZSrk=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWLvVtIzZaYyscvaN2EfgqlNPYFlJSA13tHsIE/Q6nVptiQAU+0InkNVePrgPcqmD5Dp8RHRyb9t9PLd2qd73fCM</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3nomwEaSRNKHy1Ip7Qfa9wn11+1Z7HIZnBN6RItWNPZpb/Nno59gH9ylM85pVNc2nW2+0xT2ygBe+KpI+YQQAvM=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3nomwEaSRNKHy1Ip7Qfa9wkf70RhHfqKlwpnfRjXEsaMbwrwcwvTzMV8z1YoGw4/iYl7sUcsOTRxMQ9gzI56lQrLxXdrMxg2ORHLDfD9+192JP4YBk2Zm+HsEfX9zYtx+g108R6rIjPbGQQ/jxXYxNNAECJ5ACiu6GLnyBCUexTEgVcf/hLOe1f2YmFN4GqRKY3nfyPIxDC4lom/XyFlZs2Zinvr79+VnvJsbYxYbABCBOs/EwAtGXW46FoesBtyXQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWJU3Q/gxDYqfge8tsRmI8i84cnz3Wi/GNTfZnsrmecK6K4PlOMiTne8O7Fp3LkIovzffOx2G0Cv7F6PyHlc07cq8jZ/DeuzKwczS25H1OB50wIkiayds6lEc7godGGVeyOGaTEKoUXiS2BR4O385xztR4GQwFrQ77aKKfaiBrokOEp1rZ3Tn76w68o0TM2uEs2KJDzewR6VDwVvjA8jX9MGX7QiQNaei6nkVTOa831RZyizaiTs1JpJrCNtf/lhhNmzsVLInz0hgOdFR1V9AwOowESyXpVHOw/DL4oPUdlmDwHoZECwjgDDWS90Y3QFjF7Oi6urH+K7vaQxou+quJRbLc/9QX3cyjcQjbA4aOTCn6d9mq84mclE8LldLGYs8ukOOMDvSBkOvnJT3gjGSK9Y</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&7e2+CD8Y1/FrAc68qhsPzNtp2XVgUXNwqqw7+1DcHtFExKYx1+Auc4MaDCTFz/GEys9/SSzfUUQGW5/wq0fBS0YrkgjCY2kVGs6ZBKxW+IHo9ZBYTQfEL0tCn7Y40bHYEm2Kr/V4umH0Aj1VrG5NFT3hrUqHbswWgLmV2jIhe5ooJt8FuzWdFDYlJfv3BJH4sVPEqUe0hkwj2WAK2fhZCzI/zEDWW3OTH7mgwgPNpyN9hjBQ+TnWTelbRuBmA9Mle+7nnN2On5zuOMWEYHLYuTFs2DE3rv/kWoGysT3hk0O6SAnWElSm3N/bSsFB0t/8RGjFcbUdLnkMXQCsZYN80gc9gV+gQhyfJj7yxna+D+Pe68AyrwnMQU5oLblG9V3MkMxCe88y8tK0HDgiO57OaMzehuTVNvjRCXMMsOxsAZJ0JYiNcsAY4YHN6QmuFfSzUvoI81N3ygdx7VaIJY02Wc+H6OD7KQ5+HcBQddDHsG9YH/v1+FpvyG5RbJZSCHJb</Encrypted>]]>
    </text>
  </script>

  &ScriptFlowFilterCss;
</dir>