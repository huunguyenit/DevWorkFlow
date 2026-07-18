<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">
  <!ENTITY Identity "PFReceipt">
  <!ENTITY ext "73">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'PFReceiptFilter', 'Filter', 'PFTran'">
  <!ENTITY CheckRelativeQuery "
    select 'so_ct' as field, @$none as message
    return
">
]>
<dir table="m73$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn phiếu nhập" e="Filter Condition"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Phiếu nhập từ ngày" e="Date From"></header>
      <footer v="Ngày nhập từ/đến" e="Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Phiếu nhập đến ngày" e="Date to"></header>
    </field>
    <field name="loai" dataFormatString="1, 2, 3" clientDefault="1" align="right">
      <header v="Loại" e="Type"></header>
      <footer v="1 - Hóa đơn trong nước, 2 - Nhập khẩu, 3 - Khác" e="1 - Domestic Invoice, 2 - Import, 3 - Other"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_kh" filterSource="master" allowNulls="false" operation="10">
      <header v="Mã nhà cung cấp" e="Supplier"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="so_ct" align="right" maxLength="-100" filterSource="voucherNumber" allowNulls="&FlowMultiVoucherNumberAllowNulls;">
      <header v="Số phiếu nhập" e="Receipt Number"></header>
      <items style="AutoComplete" controller="PFInvoiceLookup" reference="stt_rec_ct"/>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcEmcSYdxtUe+PSCBg6yibYyraQiOp/zqF5sxS9r6EbNtJUswWfbAW/LWyInNp5bWaZuFvrRTub9H+K2zKlidzHwwzrgaGMzV/ekfQcXFxTGfBr9JywUnDNnT2gVAPcbRcAvC+pQVCNXd6kuvEX6eem2OjNma/6mD2jzdfPQ5Eqoas68jg9CY+rMMcZY1hR+/e9VZFbOToAYeH8x79AHDTDPdttwo0EfKey4m2Y0JsP1Tq5He2lbtR5CXKrDSVKOc+k+mREj6QSedbgDtlUUdBaLnvVFBKNj4FyFL/6dnUusOvER+uDdKr4dnalgGzKWHq4mVVC71d7Py6zonTbKpxveR+bcf9onQ+FCzwpiDVE+qmgfbVdXkLD3BiyH0MTWZX4C4vnPJo1gSfwZ1PYKm+t9NrVTBx/bU3RRDe2e1ExJ885HgKv5aaj90MzcIisF30JnAnYMUV9pPOly9HQ7hSdEJZ4/fN4Nyovfwcd1AjGHanst96NKDe6yci/p/VgXZyQ==</Encrypted>]]>&CheckRelativeProcess;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cM0pVSo1qBx+Bjed9iMmo7n2emlL1eyVtMrbmjALrEf+IWpwenkMkexroejaR9vc4ogv5SEhqQ73mEo+bVZ6wMtw4O0ooYKmWRWUZQscxqTTXb416EJGGVEaKpBTDTAFtB2mp63cTjT81vSaYYSH4XRZTtUuih/92sU6/oHbFD2ZKfIHASI/NXa6+He+dKyGQbWAW1wZvV8gGjVEESVN8CNyAa4b8OnF498kYkXroJ8C6odiPLpeR5Ojn9iMT0xScdzhSAEJh4ifkgo9s05ox9zPQtPNHW7rbg1+gFdaLg8X+1WguAiU/bHsiSXsFcatP8u749omnFpZm7g5Wi6JfiVQxWIblV7tqe2K7gsNQJWWe/GF9MYsBAptKCxVM4RJwkAmqZ6xn6NgwLyack7sZsPkt6/yQwMJXdAW+Te4uBAVahy4obygTNss6zmuEIdVWDNJpFjPi97i9PvV+oIcQkv9s8eHPjroDeyRIWXqsX3O/SVRjCTqMeYdBl8kmi53vP/smHiXE57lGt4EOy5uU3EZiJuZx/4Ay4luSlBnGZnpqGI4VYm9ci16Hm53P+uMdzZJW41zRmcOEL/3CUL25SFUEot6bh031dF6wwPa+9cAMSTPdfl1ip7pgxnVnALrCswgYk13lzIzrj3YN+AHlL7FPspASh+v/ch/4aK6MTV</Encrypted>]]>&ext;<![CDATA[<Encrypted>&LTpabyia7LjFJgPs/FV63kLuRdzxNaIYiG9GEtKyhlK5Ls16CItgEgMFbYatQ+qKuVZ98tCAFLD4EzVaG0MqnkH/SsaAkUjF1iCAWLgcPMq3fWxiblT66LPpFE9gD39qN/ZZjtqC7Jm5QuntY3JnhvgwmnDdaulBALPjs87puL3C7GmltIee5Vw4+TVD2eNYxYMyAEkL2zXVz12pw11NWmSIgGCvhC4vA1WqO3NkqSwcT6HKEmFtkb9jYDRDurIJWOcGgfPJvA2Pv3ciVdAbVel5wMJ1mhYdjtO8dvNjrB40HvaanWgtpRtkAIqlNdQUCzYArUK6DsquJVx+vh+mJQuzcis3SP3HpEcXTNBZ5rcIzlcS2mgHwR6Hm+6y82m2tpufpgKbQ/EZrDcYPMlfU4iEycR7U9X0R3zJuU0mzo72uS4sHf6ILfs+GrZtrFaK0rHKMR5zdO3IsLaynWav8eAZvO7rUqUKCSDS7Zn44ItiTFOTOuSvKO6VLhT6hq2YUUzxlMiVJJns+X8qM3UvuNkkUxlFJ9svHXH4NGNaEwS8e1A6CLYrQxT1wmwQwjytOF3GfA93g9ZSpFTX9QnjCUiHGWJv+cFKLw5rWmLYD9iZWgYXU57fx3Pe5uZ+MFdW23Gg8tzvFspqrss0CqzshnQyOgfX7PjvRSB9gWyCBXgcjFk3Usfg2s7K1GzxZCiuTuY122n8k135A/pJSVcCC4R+4/xxJW3mbjucZkRVL1I+zF4dguQ8lxbYBp6FgO9Y</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&7e2+CD8Y1/FrAc68qhsPzLF7IjkjpR0/7eV7MXKM/f38mGRbMtLH72XBuekalNlNxI4Ny5RMCNuxqgPEU/xn6Tj9oRZsQYIJ4iRrRtQxfG/00fswzJIgxjOme+4BCV+2v3yLQEP+/Z9coeyU4W6D9HB7Mx4FKRF5npQEzeI8xmvV3IwnLb5kEoZKXY1FvzJA4MZ6mXWoQ8i/1UUP3/TvFiTGHNZvnamcmiG2PVXq3VkW3rw6kYj5d+ur8KNRLFOZ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&7e2+CD8Y1/FrAc68qhsPzGMs3a65IVAUg7SW4xtZX68iybo059kHzZa15w2NvWzP</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&Jl3E1PKXzK66ePUEZMCi8/qcujwKVF6jWLTpNH/gey7pY8SQWs9A5nbUAdv7oWjXRUjP+K+SON8lazouBd30jWjFaJrInml/ujZjUhJl9MXM5779Q2XI93KvIx7yGj6mVPfwc2tcabcVGPBKovEvLLW+gg2YAHgPLo+7t0jn5rJgtohUOzbOVYEX35YXNRJk</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UssBP7mLwPvpIyeVnFY1WGIFudObEg0WpytXvCOVW+K</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3jZH/Y+kmJHLG82qfV6ZYGzLXuPutwXI/+ZvAYz1FIj+RF0XtijdKglsDtySERQ3mQ==</Encrypted>]]>&IdleLookupFilter;<![CDATA[<Encrypted>&kC14wA3BGHJ+ACfBdPMa+cStN6w+4umYe5v0XnZqe6UyQlxYd38nmmMqZbDvJFJl</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3uXgOXXvjxA3dwhlTKHt0y5Q7e+utx8j0g9+ZssqVKn+TuBXnhcYK4I3XqpglqOq+/f29QSc3cS3xE2w/jYW9WhebEstxZ4h9jQiKS/BP+oFvyOOqo8qUL8/oS4Mt5mzrA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3nomwEaSRNKHy1Ip7Qfa9wkK7NhzI7v2OMeF8h6O0hDX2jKGnL2xso6YwndWkpqZP3Fn1uVNX0MVStQ8uZHsC5M=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWL1CUQtdL1UATCqPQxMUw/H6B2/A46ksSmNZVBogeFHLEm5kXeKTI8ZJ+EmgIkiwZIgDMujl/BE3oFwBSMiOpskXvgLiisuqiSweurpDDPNDA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3n7fMSXuy2bYhtxguM4Jm5kWeY6/iurjaNyV1uNgdYbtZwSFnqzz8dGMhV04oRPbCbF6yOneQi4uESf9zTxZSrk=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWLvVtIzZaYyscvaN2EfgqlNPYFlJSA13tHsIE/Q6nVptiQAU+0InkNVePrgPcqmD5Dp8RHRyb9t9PLd2qd73fCM</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3nomwEaSRNKHy1Ip7Qfa9wn11+1Z7HIZnBN6RItWNPZpb/Nno59gH9ylM85pVNc2nW2+0xT2ygBe+KpI+YQQAvM=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3nomwEaSRNKHy1Ip7Qfa9wkf70RhHfqKlwpnfRjXEsaMbwrwcwvTzMV8z1YoGw4/iYl7sUcsOTRxMQ9gzI56lQrLxXdrMxg2ORHLDfD9+192JP4YBk2Zm+HsEfX9zYtx+g108R6rIjPbGQQ/jxXYxNNAECJ5ACiu6GLnyBCUexTEgVcf/hLOe1f2YmFN4GqRKY3nfyPIxDC4lom/XyFlZs2Zinvr79+VnvJsbYxYbABCBOs/EwAtGXW46FoesBtyXQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWJU3Q/gxDYqfge8tsRmI8i84cnz3Wi/GNTfZnsrmecK6K4PlOMiTne8O7Fp3LkIovzffOx2G0Cv7F6PyHlc07cqRecwyaOnWnkTVHYXu1HzlZ5xN1D3NPuDPpcs8JrdC7pD20r6fhuPYVBQUrrE5jNbbFTVl9nSSeMGJyfbMW4vbOYxIcGsIxKYYg2tYCMRyLXb9AioWZpCbX65p88GrzFqf9YsUterNnhMrq/PXaSf56NZ2iGQtu6Sre6OPfuu3plHN6atobnROsCDOMw/TjwoThaUcuaHyGeBJpfv6MikI+SHIJTZZgakZ0nGy3iATqvj0nYW08P7zLAqPUNup0ntFDk8feHxwz8+08gnhXXsG6RlR5wjRWwLHW/rrk0517w916pEgZoOwVBY3krrkYbSWJ4ZZ4PLDhfvN0j/vDw5Zg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&7e2+CD8Y1/FrAc68qhsPzNtp2XVgUXNwqqw7+1DcHtEIlHP0RpcTv2LYzqcHNlEqdXXy4Lpgfqo0bEwOrZTUMmQW8zokm7712Z7v+7v01e6+zEpGQ70eKf88iv5gLG8NA+qigeb8yu69iIyONNwVT/ViCOC3p19rWX0ewGIvuhrqZVmrIkJ9SYIyT4xYBqv9/QTLTsmeCN3bZKLJzDnHd1I+P3YZQJkUFe/XSGf4j5V/r5Xe63lxKpvgMcJE4jzB</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3np6J+ljP/SfAMF0E8gMKEL7GYWhPgCRHTvzHCdupwmL7HndSLXhzqujOxiBm8lMTA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3np6J+ljP/SfAMF0E8gMKEKpkl3mc7tnqpM9dyOAChlkW+CHaEI4A2xcynH+q4H1jQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3rS4dIrGtn/zbuBqcIGW4sXFYYOZ8fG6mEwQ6CVZvpVQ63OMA3xSENwd2MZLsO+iICADniPRsAJ2EpyNctGD782ECWjr4fXm0pLPGqMFDXYq</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3rS4dIrGtn/zbuBqcIGW4sXrdsPmc3ai+oX3PXdd7hOyh43ufi1jNgLcfpFY7e4uWRkTkq6jdiuDye/sPedOcAfk1hkntMhODJ28PjefLiYe</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/3edCx6AYZ6rCiltb24POR1jvRegACj+rSMGtGpJz5wBQtHi/hFCXjORUjuZm/LFNA==</Encrypted>]]>
    </text>
  </script>

  &ScriptFlowFilterCss;
</dir>