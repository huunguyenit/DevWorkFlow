<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY SysID "AutoGenerationExchangeRate">
  <!ENTITY Controller "UpdateExchangeRateTran">
]>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Tạo tỷ giá đánh giá tự động" e="Generate Revaluation Exchange Rate"/>
  <fields>
    <field name="ds_dvcs" allowNulls="false" dataFormatString="X">
      <header v="Đơn vị" e="Unit(s)"/>
      <items style="Lookup" controller="Unit" key="((@@admin = 1) or (ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1))) and status = '1'" check="((@@admin = 1) or (ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1)))"/>
    </field>
    <field name="ma_nt" clientDefault="Default" allowNulls="false">
      <header v="Mã nt" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="ma_nt not in(select isnull(val,'') from options where name = 'm_ma_nt0') and status = '1'" check="ma_nt not in(select isnull(val,'') from options where name = 'm_ma_nt0')" information="ma_nt$dmnt.ten_nt%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PDvdTvJOEgRcT99dbkFNK7EOXWzm++jrRim2d/a5RnX</Encrypted>]]>&SysID;<![CDATA[<Encrypted>&eQDg7Nv1ZPcHTYx4U3adqKZVQEGkLlZT8wq7O4Xpypl4WoadpMupI1URUcHhOG4y</Encrypted>]]></clientScript>
    </field>
    <field name="ten_nt%l" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="Default" defaultValue="1">
      <header v="Tỷ giá" e="Ex. Rate"></header>
      <items style="Numeric"/>
    </field>

    <field name="ds_tk" allowNulls="false" dataFormatString="X">
      <header v="Tài khoản" e="Account(s)"/>
      <items style="Lookup" controller="Account" key="tk in (select tk from dmcltg where status = '1') and ma_nt = '{$%c[ma_nt]}' and loai_tk = 1 and status = '1'" check="tk in (select tk from dmcltg where status = '1') and ma_nt = '{$%c[ma_nt]}'"/>
    </field>

    <field name="type" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Kiểu cập nhật" e="Type"></header>
      <footer v="1 - Chép đè, 0 - Không" e="1 - Overwrite, 0 - No"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 200, 130"/>
      <item value="1100-: [ds_dvcs].Label, [ds_dvcs]"/>
      <item value="11010: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="110-: [ty_gia].Label, [ty_gia]"/>
      <item value="1100-: [ds_tk].Label, [ds_tk]"/>
      <item value="11100: [type].Label, [type], [type].Description"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcGC4wXbIV48PhkvsTtGPkVlij7kpDjHKz8xqvhz2dA3q</Encrypted>]]>&SysID;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQuo0eS5b8e+DofV8FmhQ8f5+a3+Ekd+oxpqkqpDJ7hyMpfe1mwKYr3xhUriBcXoM1kw==</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPS6o0FO4oa0V8ggf7RVJkjpvu5lLetaENfYXcCme6Jq</Encrypted>]]>&SysID;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l16dCzkPCkdKPBNy4yMInqhFbmGwKKj7TWl9MVMGdvkN3lhjYoeyS5Lm5OCloznxTnQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMq6Xh7xds9o+3oCl00TufVGLE78mW1GUKVnWVD5XSrl</Encrypted>]]>&SysID;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l16dCzkPCkdKPBNy4yMInqhFbmGwKKj7TWl9MVMGdvkN3lhjYoeyS5Lm5OCloznxTnQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2EQmJBK1F6ijRFWHgVUicNsoCZBqyk4+3lK04r8r/uiK5mvN82jXPRQ9KuKanHK5ltS7e82Gl6u1qVWX8fuNOwmmJy2MFjNOBt+3KWQmbaekeaN/wb5V7NeYAhBXOkcUOfNr74XmFI6FRQAyPXmGBLYqfG03HCyaKBVVkLc8wuYBfsatB2H5cPFtU47iOmrk/ig==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UssBP7mLwPvpIyeVnFY1WGIFudObEg0WpytXvCOVW+K</Encrypted>]]>&SysID;<![CDATA[<Encrypted>&XBj6YDSBZrE7ldnLBomYrSxwArwbRx6xJ64RqQuObwSBNQzkR44X4xOY04DsJQgAaehpAJ0Cfa4HPHw6AiV0fg==</Encrypted>]]>&SysID;<![CDATA[<Encrypted>&XBj6YDSBZrE7ldnLBomYraWk1puRRmoNTnTG2cUDrmNwjMvzts+P9kaBZ/2MaLOK</Encrypted>]]>&SysID;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l1+QE5+824HsdlLYDaZfqrNdg22zIeL2+lacyL0eUcOyjx5pBOeNdIdiqW/GW2NhyUg==</Encrypted>]]>&SysID;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHVIL7HkouhE65bfnddYX6NAmRTm1NSekoNeqRvtNwaEIan4joT7vr+ZoFanfm5DaQA==</Encrypted>]]>&SysID;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l1zmcirVXzLesCZci/PpW2Wm4ojpV3CJiN+mVYQO2L2MTUQLpZp0sgq7UqjxftOviFQ==</Encrypted>]]>&SysID;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHXu8ejmCjlg4le7f8HVshRv/MctzvTJT9MrMoXn9GkHpGGDGCO4/WAVhqjSWXbU8hA1In9UxfBTjCS71iwoDKBo=</Encrypted>]]>&SysID;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHc7X/84zX1ElDBQ0Oio9BYhpU71ALmfk5ffMVXbbEaC95FDNPuPVyyo0paJ5AWSXOQ/onvbV5bNXYdtHuIDX7H8tJCMPycHNw70HyHGT5sC32Cls+hyXMqVFgstjqHWOf9CGG1O3a4vJpavWfIern5HY2PUuzG1eHjg5dGa19bxY4PzT3SAixu78NyD8ADheuQ==</Encrypted>]]>&SysID;<![CDATA[<Encrypted>&zUpOjW5SsWLifX9NoDzKgh3sdd90n91j4EGP9gqMl+yPlDp0L6MYaL9o5BcTmbg1SQPa8/jxLT2gvUeR/Tg4xQc6nFa8GWfoThz4gq67lrZp/sVweAns9uza3xSVkS7Cb8wBFy1XvlN851tLvEoex+2jF9auoz5frF3RuXIl2lHUC4Ds8EKYI9iPoObL9SbEc3JhajYIa5GeMlrdXu+opYD5KO9ujIHgOjmzoeN7kTJuEkEpFFux06m9T7Jlcf9YaIVFqDjYt8XqdtqANEEvmw==</Encrypted>]]>&SysID;<![CDATA[<Encrypted>&eQDg7Nv1ZPcHTYx4U3adqKFJTIPGNIAurjKOgBhPhvbpusSmjSqaNWq6a/afFIHTEDcEZRqPcbr7HzcrnLhYs6icwe+J71y1Nb6ycMrP9n2XGk15H9x1gV30Zjfjb02ntV+wux1LVJeXvdsYlGU7mwxQPy4gL6WESVIl1iq4OiFujTI5osPQgs2CKWcRdNXWju5P9rqW5SGXLmOGZrNq+8zsTfjn70gvgXUfFZueiDLKIJQVZQJ89gV5FxKy0hUljbhJ7FOcNoVPDhW/+DiZ1kNQAiTuuY+Wpn1S8TmSKWc=</Encrypted>]]>&SysID;<![CDATA[<Encrypted>&zUpOjW5SsWLifX9NoDzKgh3sdd90n91j4EGP9gqMl+yX75Q0p6Lhlh/V40AAFFhqBHva0SKGk2Bx8pUeRM3U9UfXaFAceiPQePY1g+fku0Zzp3R6Zxee6idKkP2KkhZ+qeQusTnnXyue+BGdK4kQygkHwxbrQQRxHpnHSBKGtWtyJtnG+5nkuC5617IaSKTqTjWLJdlIblG2GM/4U59cztRE+UTV8UwucMBCAWd8NjCEz9Fap4TK11U3B/5XqZBux76SHqFjAkrfdI+j4pkOIN9TaSjV6vZj479W13GuuQageaAVufp+uDgyBGQskDaHPHzlNh8OSFhozploBHDECyTgKh1hvn5OUM0hDkjH7Eu8+vwQboU2JY5/0Rl7COYW3lqMQOn8o4kUOa8VfuZnq/fdlaXlkZHWc7Ykkhzbmjs/2Nr+d14hSYdTK75iYq/rc6Ic68TFORr4GzCqH58yzCxlO3GCaJRlPQYR7z8dpC6qS8ChRSAbE/qu4AJcOnMHaJiDmZ6s1cJ99XJrPeYXCMqVMus3yNg26LuiPAJa4WhM2io8f9Enahm/cAgB5/7LenHdfjTuh1JCXhl2A5owiQ5Yl4t+2HHpMSdROlxY9I06+wZKHv+k08PTpOTbMwZnveTj15GcjBjvW92DA6JPog86aohgmB8s3uA4//C+8WN9ryG70Wito/ZSzqvyNUnrKVthG8SVD6TybNDAMuzzangUjLFn9sGCxJGCig+XGn68UkX8jJMaXdT8FpuO1TkD</Encrypted>]]>&SysID;<![CDATA[<Encrypted>&XBj6YDSBZrE7ldnLBomYreNKsjgckYcHSS8UJEOGS1OArbEUB2j0POLGR9r9CkMQl/s8F9bLSlzuJ4P6yuRGeSqysHMGsAV3wVLdHez601i0kveamzKYbWTQs2rOBS8F1RjMX7Sg8xF5uwWvAPlJkJt2wioVSH8JAdX2fg69D8uHydEZx8qDlwU4+K1eT7EDfaz9YCyJOdrpuPmW61mpmod7YRzn4oq1qbbo9jBO+og=</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetExchangeRate">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9Ge+QSms2Uij978RkGV9Tlp8CnuqRQn1xMobDogEo7DkgYxScAEUVhmm/ixIQyZLlUjQu2qlVIk7fLhljtoDYD8AQGfiQaDmRftY5WVbwK8mR7p+/qg3nig7QeQB7u51Tg7CMbPj4rBf51gQ9twdiKpRSCnfrwtp0bqD7HSHqGFB4LkpMYZJuNazRN84cwxkXXcuu6UlkpkBkL4YcKa2Yk2O/Wuyw3ndeLJ2i7OIDS54G9slssi0CvLNIIjw6aW5hL72aJVzPA7oyS/ZrEtAr0elCMDo5/laNxcrZ4EJb+3sZYYb8Vwn71hqXtDCQNrxetiG8HdOH108m4vgMVbzYoHGjwaNapB6fP1xmPAVIZMCA9ynP4c8yosdcatCW8jLugyLWCIzLlkObc7uNysuLlHvPhM99osm2KOoGF/Qx7k</Encrypted>]]>
      </text>
    </action>

    <action id="AutoGeneration">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcBjEyMR6f1S5vvj5A2s4YHDU1F6uLxlDEY+fK7HtXiRKs6HI79kyYgcpMN6C6gEN7bfgQuIDaMjqmMh58G5mCGGt4xQulyLPpKsoh3+RENhOBaUfhv/ukkk3FadRi2bdcHOCkJUGUYrPVxRylb+QK2I=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFDpCWk166cXF7sQ7IGr4aQx6TlQsEwfFBSd8NyNc2dAAjn5LEAstk+ZB5YJnvzoiFImMMh+NymeLqNSC+H6AYnze1eTM8pfZxi4zASoC+oDisQEobASNcknL+4A2rTUAnmpEfwGaxV+OboqNnnQ5+LoFXrAQxubzKYaSW9nM3NWnT6JcIQElGfVX9PUlNKaTyX9hB+qIsGVSDnfIb7vqL9c/s3w+5zoEI/MQgDFWxl2p0A3fj+Ns9uqaOuNFbczVI49lovpj6xs/aVN2ilcjrj17sqtyc5IUoXDISoJJgRSeI1OP6OqX3Zuzj5lll2lM1lmBfF01cHN0ixVGzA64+FwexBWvIkUvEnYNMnFN+o1CLhAnWfxEjiT1NmG7CYJ/etpdPQ6Fp/B+LwPsvrZLEa1YrCBbP5kwpubUEMe881fzVwM6tdJIC28E1OcikVAGbVpQddzeUtDRLEcnRZK9YjaTkghvYVc/SZ6MDsq72xxBKvuFcFP/xs6KlzAJDxO4coPo7MKNT1CdhwwskixpPtICYv0YICPRb2QyJaVGv/BcEZNKiyrKJijuh/tffKKusDAogdXhh7qeoXqNv1Vs5BEvnpjy4p9q40ZHvtquqrVTgOm5Vd0fbHqdrva3vPlQsHwrMgghGf+vwmMCLwgZZvFDLXe1TA2TFQ/ybj7USY6id7sDLrlDIEgG8+ETjmFovAs8E4BsWZz/6Mcm1eDxMTIQ8K+KIv5OPTqTOG6wBVeKEI74Xt4jellQ4ZYAdmrAWfJU986JISMlEsz5IQ07R7y24ZwB04rhFCONJqsz0OERoTUCeNZPIROPp48ayRBHq1tBuvaJ07Xqm/m8J71vijNIr5k5a7NgUgR+DwpHWHC5</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>