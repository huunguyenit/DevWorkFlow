<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">
  <!ENTITY Identity "GRInvoice">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'GRDetail', 'Filter', 'GRTran'">
  <!ENTITY CheckRelativeQuery "
    select 'so_ct' as field, @$none as message
    return
">
]>
<dir table="m21$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
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
      <items style="AutoComplete" controller="GRInvoiceLookup" reference="stt_rec_ct"/>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2VeBXrvz8mne6Qr8RsKX5kG3/IMkjtWOWOS8a35cVXYmlJVhW9laTKK9REZ/JCTg1hC3WrgN6BfA4rNgt5oySXMM28PijwJCjSZ5lkkMZnv1kPewF7p/NnbF7Y3xxTezwLVn1zfEHVQEcMUs21Sne6sOgOW2DmlKCD7nBCQ57qHZ6CmcqWBeCQ510a78B/REVHYr08PFt9XszIDjudHVRzRywWA94rbqETVIGLOpch+nShqgyRMS+eYswjeGRxL9f/YfjodFzDwYOuTXeCKKiHaq+GU5P9sCrTEsbrp6Q+ST7DGh0HJ5P0mksONOp0J8mymyMZ4asjg47f/j24lG1ZXmzBBlNbQjaZ3oaJi3UWVw4LnGwhiTo0v/vl+Yn5BAL17GfCKKAcSwS7M1OyUIjlBCXnPsiccG6ul6qkNHX9XW5XK+O1oW7JjL2se6alHdt9pNcHQ01KHtBuOTIbCymjQEun0P93pGTxnrIpOWZ3Fr8T+nxdqKbHYviv+86pmtAJKy3jSGNNXRlA/bvZZjRs=</Encrypted>]]>&CheckRelativeProcess;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22TIEBSAA9iGLHS/9ncEisTiKo0AhZ/PhzrGfGOOkI0whilmOjiM503UpHjqC+lrlDbHbjm0tvwPCrLZhPVvtpTVgcJMXSw7J0vH6o546B9SwYLeYGXua+XeujX084sAgagFXiIOd6zJEOPJLCCB6DlHfpduQuYM6d/xT+daepnTw3olu/cSq1ry2iXyZYNuDVEnOsbh3lTzh9O12Q7pWA4EZ+tMwFD5kB2OubxYCT82xywIU5cSAFNSNobYA+NgjG7Jcq4zSKOaJ1b/FBE2Lemyr//intFsF9rCG5uEKFsHSeR2nvxg+ReSlhzyl88AY8zM45/eKPYkaBiz0kj1Dpv+FWkf7C6P6yFT5AwHKvzbJ5RhVsbYyfuEbFUXlHQWI7ng3CchFrz8s9xXsdj+UhHO92pKpxY4XFnnQVf3H8RseTGkBAPkqzl+0xrI+c9Dkr+i2KP36sH3InNRCUBIptYynJPMXe53YG2j0eYu2rNfw5yOCTpJ408s3H9TsUgHfZI8QP4ScX0dO659X5opGCeEQVVAhFaayPUVpmFgVVYBL6+x/GLr3O3eMJtUX7w6j1yZ+UZAeRxSgWvRb6Q6ADbNnzYadBiLxf2Ai7NK8bbJfdliR7qqJwfGPwt8lZ8J5/FpOrpZnkUVrdBmwDF7XqKFzYZ4p8UUPw64neLR9qe0YcjZxsnHyzs+ZyjM//O1LrD9fMdmAMPDHxLAwuTrTUHJknAMx1CTlvFUjkF29Wh35wbLJb1wpLl2dWlmQR+GFJDjRzN3WB/X478yQeriI8IoGmsjIFd/mhFYtv9Tb8wu3arnEWZ5BIdN6rCkBUvnQm++iNfuHRh8DxctvOocC5kei3GwmFC1SkJkNM9h8cVY+fpgLhhOjoYX9MIQ06hHh90K/lVMNs7Y1Xyn3j49N8k0Jz0HR6UfXXvZ+xikhBMvoJY3oXtI5t4JX/ZIaS/9dHHBZvPNIhG39kYWU8GdCdiFwWRo7GH4p4RbjviICFD4a8CN8kGYEFxufjkket1TH8ghk1gli2lqJJa9uqGD/GAImx0udWpiBw9iDXuvyquQOYVOC7E5QprUgcCTy4Lme+5ILB2jl4O1EBoSYyH3Wsj4=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&7e2+CD8Y1/FrAc68qhsPzLF7IjkjpR0/7eV7MXKM/f38mGRbMtLH72XBuekalNlNxI4Ny5RMCNuxqgPEU/xn6Tj9oRZsQYIJ4iRrRtQxfG+YRoCT8gvHJN8yp9cBvuJEwzE4XIf+UIeqpRKJjs82d/k/TEBNxqvN2eYFlV83+7Od9h7PDmFKNApESo5asESWlOgG0QpAfKpHURx4uxheF8GJ5RMl5dxINJZ2I2Wlef3wYyhi07anTGZmQzG0p9mxw7m280APz9xKMkxvtnPkwA==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UssBP7mLwPvpIyeVnFY1WGIFudObEg0WpytXvCOVW+K</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3jZH/Y+kmJHLG82qfV6ZYGzLXuPutwXI/+ZvAYz1FIj+RF0XtijdKglsDtySERQ3mQ==</Encrypted>]]>&IdleLookupFilter;<![CDATA[<Encrypted>&kC14wA3BGHJ+ACfBdPMa+cStN6w+4umYe5v0XnZqe6UyQlxYd38nmmMqZbDvJFJl</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3uXgOXXvjxA3dwhlTKHt0y5Q7e+utx8j0g9+ZssqVKn+TuBXnhcYK4I3XqpglqOq+/f29QSc3cS3xE2w/jYW9WhebEstxZ4h9jQiKS/BP+oFvyOOqo8qUL8/oS4Mt5mzrA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3nomwEaSRNKHy1Ip7Qfa9wkK7NhzI7v2OMeF8h6O0hDX2jKGnL2xso6YwndWkpqZP3Fn1uVNX0MVStQ8uZHsC5M=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWLGc3R/qUm/fdG83yyi1hCbqQ4Od4jG66bN/n2fXfoB0l5fmQCcUoPhzjn4VzMzlbj+ZDJ6Yi76L7gbuNtuU4wc3kyJro/+jhdN/GBOWLxaW7MsGO4QSEx4qpeEZ39NLCnfjVqGl6DweWgVyGESGkte81u2amPGj0WYqfk5X72OlVsdqSorFzATsHbyBOTP1j2pr9xvPDxqW5UYTOo3wCj0</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3n7fMSXuy2bYhtxguM4Jm5kWeY6/iurjaNyV1uNgdYbtZwSFnqzz8dGMhV04oRPbCbF6yOneQi4uESf9zTxZSrk=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWLvVtIzZaYyscvaN2EfgqlNPYFlJSA13tHsIE/Q6nVptiQAU+0InkNVePrgPcqmD5Dp8RHRyb9t9PLd2qd73fCM</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3nomwEaSRNKHy1Ip7Qfa9wn11+1Z7HIZnBN6RItWNPZpb/Nno59gH9ylM85pVNc2nW2+0xT2ygBe+KpI+YQQAvM=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3nomwEaSRNKHy1Ip7Qfa9wkf70RhHfqKlwpnfRjXEsaMbwrwcwvTzMV8z1YoGw4/iYl7sUcsOTRxMQ9gzI56lQrLxXdrMxg2ORHLDfD9+192JP4YBk2Zm+HsEfX9zYtx+g108R6rIjPbGQQ/jxXYxNNAECJ5ACiu6GLnyBCUexTEgVcf/hLOe1f2YmFN4GqRKY3nfyPIxDC4lom/XyFlZs2Zinvr79+VnvJsbYxYbABCBOs/EwAtGXW46FoesBtyXQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWJU3Q/gxDYqfge8tsRmI8i84cnz3Wi/GNTfZnsrmecK6K4PlOMiTne8O7Fp3LkIovzffOx2G0Cv7F6PyHlc07cqRecwyaOnWnkTVHYXu1HzlZ5xN1D3NPuDPpcs8JrdC7pD20r6fhuPYVBQUrrE5jNbbFTVl9nSSeMGJyfbMW4vbOYxIcGsIxKYYg2tYCMRyLVpONER1GaIrnr6HDsy+tlJWc3zsIwmtymke+K3VeSmFatCgWU0UXLyJH+XLxQxUxzlcLsawHW5aCPOAxp+ldA2MWuNYROx7LzeaoRD9pUKfF4GX/KO6z9GivWhceIMQVqNixPzKHod09nhRQ3efFZlsmjI+7+lY3qp/1ReYmYtUpEXhQuljhB7x7OI9kqm8CoFjhT+aDCAMThlQ37+4LHL</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&7e2+CD8Y1/FrAc68qhsPzNtp2XVgUXNwqqw7+1DcHtG4nI3Vfo+YvoOiQYrAf4XxgO70Y7o+4ZTsoIqUukDy/2SsVMpsmNBWWwWd2CbmKVZ+WJydY0+2QW46koOCf/CFK0pmAKKhOnBmVdnr7MhWJUdx7cyzbhJBY5ZDlpaTFxejBoN6dtEVun9uFYzhIQsUuePO3CfQKUT9LPVv7wiZL5XMHumbLBK1jW9S0gGng5FNNvVgE2p2x6Yf0WaJ2AOiqI4O44NYek85q+znTiZxFlDPVmdIvkIzLRNtfcwPjPpu7exPn75+73S2P29EgNLII6CsNqF/qLFueNrzmcG5vUuybjPDy8JTmlxtZssFWZV9j8AJASy1ikKACXySKTp292xjmW+ZifAIuqZjdlyEH5IzWJaxT/BO4H6/6tnNmyZ7XruPY+WaidTMWK5Fi8FOktMWe8fy1bFlqzTEcJ+tzz5OYZ32CUKGsPzoX3nPIpXQW//twUQhR/uIXFZb+FhVDQGc9s8GpUNm8fvbl7geLMjJA2j/AN/Sv5W2fdPfm2dgEoVLM0PnQY2RHecQl3q3HaMPnc/3Et8uXKVc96HbjEdC6r3LfEw1SDoNqNnI9Bth84VMXTXE1+rFN61OzUZ02aazczzR8+tF1/cBQmAg5A==</Encrypted>]]>
    </text>
  </script>

  &ScriptFlowFilterCss;
</dir>