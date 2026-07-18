<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">
  <!ENTITY Identity "ReplacementInvoiceRegistrationFilter">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'ReplacementInvoiceRegistrationFilter', 'Filter', 'ReplacementInvoiceRegistration'">
  <!ENTITY CheckRelativeQuery "
    select 'so_ct' as field, @$none as message
    return
">
]>
<dir table="hddt01" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn hóa đơn" e="Filter Condition"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Hóa đơn từ ngày" e="Date From"></header>
      <footer v="Ngày hóa đơn từ/đến" e="Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Hóa đơn đến ngày" e="Date to"></header>
    </field>
    <field name="ma_kh" allowNulls="false">
      <header v="Mã khách hàng" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="so_ct" align="right" maxLength="-100" filterSource="voucherNumber" allowNulls="false">
      <header v="Số hóa đơn" e="Invoice Number"></header>
      <items style="AutoComplete" controller="ReplacementInvoiceLookup" reference="stt_rec_ct"/>
    </field>
    <field name="stt_rec_ct" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_ht" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_ct" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="typeInv" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="88">
      <item value="120, 30, 70, 100, 230, 0, 0"/>
      <item value="1101-11: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2], [ma_ct], [ma_dvcs]"/>
      <item value="110101: [ma_kh].Label, [ma_kh], [ten_kh%l], [typeInv]"/>
      <item value="110--11: [so_ct].Label, [so_ct], [stt_rec_ct], [stt_rec_ht]"/>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8KU3qC26YeKeL7edhfPrfpCg/YTTJdjFCOs/4qPMwV+caqeC9D3pFglUcmfxyD/mh1Rnamu7G+GQIuQH/2ose1DvhfOTlRo9jGHNwyDa5mry12r/hJurH6wCvwIE5jv+B5aAPF6GrHI6FTBoCLcXBfyqJZwkS6AqHtn5rCkQ++0UhnQW/AuxeHl9RLCmnSq6lo0QI4/VMR43lKGQpkvYrvc3qfcEJG3wIJBVx9GRyw2BP6RngMi+OPK2lNAccm8h8QsAyvHaeb8yC40y5he7FUz6nE9D/CYtPY4CJwnB185OWyQKFxw7TIZOTDZPXCHry0ZNBXzRuuYtwJnLuyATEnimic3fxVpxRk79L4r0dpkX2mE2JqSq8Yki78Gb8H7n/HfKuIc0+Q0mrGibDDXAIiksMWzT5C7FOFa+AgGEOaGgWliroNj29Ghl1sTeq/0LlDvUo2OATsUT+7oeKDHPOwvlBKtBBj1LI2GmSBXcR7jO33xwsE2KHehk19DZFbYHRazWrLa2EvqTCN9SkBfPjh2xlEIQZZqTS6/BNQYFDV2Eqj2+z863UZrciAn5+ftpMf1KkhJW75JC1pSQkiJS1vnTrYajMB9F3OrrAhqAiKO</Encrypted>]]>&CheckRelativeProcess;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22ZS+r+D4Cx7fvVIy9o8XRbTd/S/tHr2StdgMNLCU5YTcPSQgSyg/5kWedUjvnZzK071BgTQeu2dqmOvo6FMQmdZ7KLCLuH2HD2f0hKTCQmWKJmBpqW41iPLz5kGdIuortp84l5gdupmAuk5n6xMsqnPfvsX5DoRp0okG4vVRz09EJuJ20B9OpwOCtc017rRjJEIs9aO+RbO2XEmLqDODXFW3PNXat9uOEJ+KSgSNdmvMOG2aHVENSChiyc3gI6XC1hTW6NbpK0kD8KeU5F6EQnw5LJ52YgX76E02k/Su0jnVfYxeecikgkBtS0mnWwtdpBzJFSc0AGPmVpYZtSRn23x8ZzSiGwZcRix1m+wMm5bZ1sCiDPT+4H2iVIWfek5SrwmQQIwK+zlgDs6Emchcr9FUqgIM8bXqIGxMDJBLHTrKC1aK1OKG2iSGup7diSN1qD5Fny2+URK3kQyiXr6M4vHh99Hd6uBD9Ehr3sDYQt0H3m0Mx6/RcAIu2lhunaeTkGu2MNwSXwZoXAKTch2EsqCO0Jswa+CpXCLuZe3cY03WkPEcJMvk5SM0S4849AiQTLpo3O4FIDMYuamfSJnoSy363Gd79YCnscwkpI1KX4YiOXYIacD/VguMNnASP105d6u8C9mE5NL3twJeiz988tFBmfwib2FpqhVS/33rl37s4JRDlkYvZCk9jiTNg2TJ8svPX613/W6wEWY0SB2xqFdQVq1CSkQTvTfN6gnHGexORomMLC2gC4MyL6V03nxOFjbtFGVxhWkcB6JyeYWPIR1mfScecsXLBI65OXV5rKOc3pnrTblXmxR36ZdF1aybVCW1SrHCpcqZnAs4wDXVJMoWKTyEjuKTDKwpI+vXLXyiqkeurgN3d2QPgwaDY+RHqDftxg3TYhnZuqsr4gmh+/RadwaMI+hc3NRGOrUndzMB5BqWvus/OfyKbsYfcBBT2yh0BR5rWySd1vOpKTgYgiR0Br4lIA98AGE2og3y8bM1mlQE/zkiCUt6bR6GdIeadCWjpdGjJBg46BWpydFXvblcKl0Gm91ZkiWSKJ7u6Lb3Hnkx+IsVJ7pVJctxRibSFdwPIrYrVguMFFYf2mC3uq0ru94ih2B4iFc/GyWWfC+BRVvpcINoL4PpG8WUaxS+jJWd5yiozjgBWGVZnAYGDJqFrvU6GI72YPuPU4WR73djs/nynfeDMJvT71oMQrO7Vqy1u/bbDDLPaQohCHbs1k5tN3jvvmB98Sh8ewGrdgnTvp2afDd38bhXor+Qpco3l/q+0+F8HwGj8eudEJzhZ8HUOMfKVyLYicKxpVIHLr7UV3owC+7+kaNSaun0rs9cs6OEOzNzdwZpkmIgF7Vq2xqFy7nGLLg+ZYkZMtVyqzgEQgAw7vV8TSgncaxssXskHpXk2qjW51dJZOfFCzb3PKwvpF52rM5jk/VSaSF6z81MgTZuzBePeneBm32Di1YSa3voYdh4C+DmAvzUTN7kkCwc8sgVevfZxemxzQnuqgMF</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3rS4dIrGtn/zbuBqcIGW4sU7XOqyqTU5ULE/1+vcNka8RPSjktWa7946LWsn6AOMrHDyz+MN0ecxsBefTb3LAlumk0yYgvsDWLlQp7AqP0+zGNoU6KJKNOpvi95VfD0BwqzeCPdc7/v1lnuNqx2vX1lljEj2RFZMkk/aCMKejePD+uQ488eJDE4ijeQZ/aA68lVRP8qxIXUiRor1P0Z47XnuRkciK8kpabVxRn6LN63DUnp+cx98DjpcV2S4fwTf3iCpxp1vrXJLetMKFX95cM/uexnYzQmIuLP2K2Ad7MXkBA1mxWFBN6sYZ8z1/lwWxx43XytMKkEABigAMyaLIKQ=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UssBP7mLwPvpIyeVnFY1WGIFudObEg0WpytXvCOVW+K</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3jZH/Y+kmJHLG82qfV6ZYGzLXuPutwXI/+ZvAYz1FIj+RF0XtijdKglsDtySERQ3mQ==</Encrypted>]]>&IdleLookupFilter;<![CDATA[<Encrypted>&kC14wA3BGHJ+ACfBdPMa+cStN6w+4umYe5v0XnZqe6UyQlxYd38nmmMqZbDvJFJl</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3uXgOXXvjxA3dwhlTKHt0y5Q7e+utx8j0g9+ZssqVKn+TuBXnhcYK4I3XqpglqOq+6ySi4j/Tv4lCqcEL0MUAWaqAqBgbPm3rtnxCOElEBj8gGQPUuOsmMLrwv1manfBsA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWLr4OwaVqonpqVOmaTTqwmXdTwKuwY7r1CzI5PXIa58xoinRVojBSvrChE064Alnj56Fb17/m2SeQybjLkUcq3EhK17Mk8bTiz44rtu/K2eBWF1RQx/1PawoODA4ywAz49jyGdaRNideO3nKKjA0dYQApkuKSMkgvatoteH/kJxJWK4uDeJYf6TcJUHl+d6xsmVH1gc29hjNwYPzM+qj6QiTQcW3KKU6RYSZ8DPdfOV8ZKBICZq38lNivl3IzWJz/HT/RdR9spRoC6+LLFb7atPDuMN2NzFqDOxlG5hYrXMUp9o+UsrE/fju25l34W6Zyw=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3n7fMSXuy2bYhtxguM4Jm5kWeY6/iurjaNyV1uNgdYbtZwSFnqzz8dGMhV04oRPbCbF6yOneQi4uESf9zTxZSrk=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWLvVtIzZaYyscvaN2EfgqlNhFAQlGjp3f9PtLGTKBdUYOJh2R31q78aMfWrIlkbrlm+1KWdbEOU8bFEWQcA1pFZsW9hmC3ijqSCXxu4VavFYK6IzT6zowHDWlch8p5FdMkeWzLOs0eVXuw5YBrC1Uru/vIjRRbm962hClpkfNyxuO3jBMdCeIIp3/Cgb1J30vnNZxyfx7cKCr8Eenk6m6f3KNG/nbna6SoNWrIkZSsJb2llqqjQhJn0seR9wjq36AF/clBp5K/k5gli904IHQxt</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWJU3Q/gxDYqfge8tsRmI8i84cnz3Wi/GNTfZnsrmecK6CD8/6h/yl49v3RVI7klulZ7IfY+HrgFgIYuwCeaqmXA7KmI2J2LZQcPDykjGn7C7+NRuCHIm3tMZmUTWTqylgSVi0rjgKz33BkQaLRg3GLwi1eVMyfa6is8xLgwpZT0llx80QE45gCQatp/NYUCuEB2VpPmLz1QL3diMxAxk/IJFeNCeDqNsQDqNKKQ2izlvLTaV99z6uSpAFJwvYYkNXaqyZ9kMEFZ7f8oQVknfcQo92eo6R8DrZ4AXMXGV3K+HNtbUjmobbXNbffLAKmpYXNNeo1BAhbys/nszYXsM9x6xAoRV7iwy34eeuAY9GY7XuADkOj/rQ8XDSWSaL+cCaPkxgKF9Zd8O+4hXJ2QG0mO</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3rS4dIrGtn/zbuBqcIGW4sUhNlMym1m1c6ztUdH4GpHZXP3xVPoUKbGMQvTBRsDTZWRDAJkuruWi61+DSnKLIYuBrxw0FbvxqXS7lc9tPuVoZAUArIDAhqBB3G9lDTYIF339ceBuUF0qJZKXJcdClOFVS6Szsh7ag6nlgNRJlLx/tO0EuloHxcfvbxYebYvLktKoIt8s6nQCEnS41s8L2inV6kd269HUOMHI9VqecJfM1KyySXITmlplXvR5T+ExZEbFLGM1DFhnChjoDlqRG/2oElnQ2yuwk0KffM+kYXt4fDUXuK0xshdnRcxwwpaeZpLCjn8HRbTQQTlpgloNDdVraclF7AUKoXhATnWG0vHs+lXg4hYwCKUh4F80HKD3qNpAXL8KSgdOdgrqcwZeZSM=</Encrypted>]]>
    </text>
  </script>

  &ScriptFlowFilterCss;
</dir>