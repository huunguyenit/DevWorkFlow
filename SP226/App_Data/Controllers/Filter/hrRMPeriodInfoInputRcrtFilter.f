<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">

  <!ENTITY Identity "hrRMPeriodInfoInputRcrt">
  <!ENTITY c11 "Yêu cầu từ ngày">
  <!ENTITY c12 "Request Date from">
  <!ENTITY c21 "Số yêu cầu">
  <!ENTITY c22 "Request Number">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'hrRMPeriodInfoInputRcrt', 'Filter', 'hrRMPeriodInfoInput'">
  <!ENTITY CheckRelativeQuery "
    select 'so_ct' as field, @$none as message
    return
">
]>

<dir table="hrrmyc" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn phiếu yêu cầu tuyển dụng" e="Select Recruitment Request Form"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="&c11;" e="&c12;"></header>
    </field>
    <field name="so_ct" align="right" maxLength="-100" filterSource="voucherNumber" allowNulls="false">
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5ouhRwVDXfM701d7VDswpeWAIPmqLrh5K8vWYTJHH+uYHmNFJSjilb77qWdmnjXYn4cUauBCi3zgUDnup5CAwbrU6e1pVR0CgJm452ad2/KP4j2zDRQmSrOuUldmabvN/ILBUGMYXQ1acAQXpq+LHdopTgDJmypEmFz27pstv8ZZmuSr+efftEy/aAPwYF6p+ykpjtQzV3nL2qvOnWFCnO3wfUjwjpU0UEXk0pmVi3wBMNNhcSXs64qnsMTQ2USzcyPJinABsk/qVFD2aFK3xGdN4Xwxon/kjwzlXb/rvslmA6GklFOZmUWxqMGZXbJcNC7zmY3io8JFiI1ebwvFK/4AHKrggEnEmk9PFIHJc+dwLN78gGSSkdgMYFM13fkL7aGKBddNh24WEnEy854iNcqjBrR0GleKegKo6eKlF+6WFtPzyA5MWfoLw6Rf+A01ZAqDkw2En8yiiC5JhiHwOU=</Encrypted>]]>&CheckRelativeProcess;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHjV4Z3IWLjEvCQZ4JeVWtGSnpizjCiLo+GK1x8EienKu/nqdtsBD0GQBmSO12DwtYeAxx8N8XyWlI40dysDZc6s8rvKHy6h3IAAFYY4zDl0gqjGLmbgK+lLvWaKr/3CO8Fx1DL4pzRUoQ+0zL0K+kxgntGwepfEL0WfeyZmLzo8bfBgCRmQ8VDLbs5vm+xxYWdyndv3wlln8jua4Nk/2NYrfE56G1G7VJmi1FllFGrANGvw6wDqhS7W10PLFBpAt0Iz0cKPDQHNS/PlS758IkzEqh77oRqwiRzVdTeGvLGJ36w8re6vmQR63FP/bCv69NuazsZrnca374SPaPfD+sjKhsizD+nxuloq8ZJMw5RcPBLRq6wpEWmz82+pBmCWHTG9p99aWac9tifPV67t8qZSUOm22JfRIxEl0YWMal4Q+5PvpCYhq5ekAZVlV0psXgSBd5NssHIfGjga2PCW8FeMr0BsY+PiLcgfEV01gEmw5l0kUh+WVbnpIGrlDXjZa7Djke2uQyETF866t4cmfKFj84MPepsejRouC1l741mD7x0/m7rM5H+0yoezkpMUsGrtp0b4ybzbQCsB2Jg6+IQGKZVT6JdaVT4Cu/ommveziAn5rJye8q4BTDIEVr0/hX49U810tsHkgQP0BFVpkuYj8C1NRas18RK6iNVkpG+gbB20pQGdX9USSZ+dgzIJPTJex8iwYSGj9HGnwrfAxTUUV4rZzyWQuDaG4+o4tmMVOZPCQsVVYDSfh9VJIZJcKImc7uoOxbwigjNNXR7AJU61RaLAUNX/IuThFRHTSMHpXJxvgrHuMnlcuQ+rhT6A7XnKsNxJI2SqJZ8KNWhsUBsEVdAkhEJSOaSn/dYgFGNoBtvjMAm03ApbgjJ4bT3xyfyMWWrF9wUg3ugiSGVrNzTFEZFbKphTxtZ19ueR+1G5</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3hBvhiM3L1mWpQV78FCxGrIFuWhFfGwAduO+uG+CZheu7v8Md/DB/7K4gO10NsYIR6X9W2xD2NJwpLSOWpo8Eh/oQ0fCIypCm8IX8Y09pYeqeXJqyBKKyiEAMW/7RoZ8eE5dd1Cb0yGM2HeP/KfpmfxhYwuuM7/g+HQ2xI2Z50YujFQ6FCiRq0MOyLt4IHXUlt9BH1bHSUx1gB7BsZXQg4dE/t/0RQnyPKg8WNeWNFyv</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UssBP7mLwPvpIyeVnFY1WGIFudObEg0WpytXvCOVW+K</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3jZH/Y+kmJHLG82qfV6ZYGzLXuPutwXI/+ZvAYz1FIj+RF0XtijdKglsDtySERQ3mQ==</Encrypted>]]>&IdleLookupFilter;<![CDATA[<Encrypted>&kC14wA3BGHJ+ACfBdPMa+cStN6w+4umYe5v0XnZqe6UyQlxYd38nmmMqZbDvJFJl</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3uXgOXXvjxA3dwhlTKHt0y5Q7e+utx8j0g9+ZssqVKn+TuBXnhcYK4I3XqpglqOq+6ySi4j/Tv4lCqcEL0MUAWaqAqBgbPm3rtnxCOElEBj8gGQPUuOsmMLrwv1manfBsA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWKciZtO3jhZffO9EJzsdj9EsiaBUE747e//3RnkUwb7Wp7g+V9Raf23CaYJ4oqqB8ywXXz7fWEI4+F4eKwQJqXAU6Ct664goOaS4tzD1aCwHeCvKd/zR8e24558SUpMAmHrczEM3KAbpYxSDPoN2ARyLPQOTGwoy5t+kbwO8MoqMlnqRXxzWl+TNxa24vwoPrA=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3qeBZQhxWm9N1jRkDfSC40OHkd2DXY0N0S9OSWHXjUiFW+QJt4fV8dVINzErNnhRZdgmMtp+5Wi+CtdIuC9Swcw=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWLvVtIzZaYyscvaN2EfgqlNzr5CBr8L6XnwsuxeQoiUffsWo+UJaxSPxz5Na+JgujI=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWJU3Q/gxDYqfge8tsRmI8i84cnz3Wi/GNTfZnsrmecK6K4PlOMiTne8O7Fp3LkIovzffOx2G0Cv7F6PyHlc07cq7zdDIHNFn6Ro5j8ECt/ahr99pG7IUuOkGR9qMvzfy4skecorHnD/Ja0MP/97+ZitolYBy7JPh0staIMZYiYRuQ0MrqzhuKjcIUHrbw6cSCOsJqzxLceRuHfo9D6kOT0XUF3JRC315cSbDFmqxdatWUYhqas/U8wTxCMdFmVZqOBiRdM3rGYa2AoUO4BBePaZtdplf0CP+3OUc+X/E51gMk5qDqWtYgs9sHGmSrvhfcKC3lUDt4aCGy4FZ+zB/MXkyU39PgcXBZQPXcFOgxSGEw==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3hBvhiM3L1mWpQV78FCxGrKMYCHssObkBLe1+DexzOpeDT5FBG8xaH1uyQFXsiyffbeGt0EriHyS/VKzn10EM4nNSBGdq+xgfRrzUs/6hYOU1vLbDYvVue0HcBrYmdnY18rkiWKi3tZeTH1QCOjgrRxFJVFAAGVAt6cohlG6Kbgqvw3sHmZbDoPEkOx7ur7g34pQQPHsUFDB7MCzx6atVRU/zdc4DomJKASuqEheHYz3</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3rOObb4GYbMQh3I9s9ieQaH/CtUuLy/hvt3u8Bvftrye0XvNf0rLnyjPSKspRBurHg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3h+SiKcLqRpRWTc4QsvVKis/VfRlByYlw+REdiKN5/NbLG+yA/meJtd3W6ZYIaEOSg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3rS4dIrGtn/zbuBqcIGW4sXaG6MOIyfQarKWuqjLzMOlptFUWubgnVIuYZablaQwaDu2vZhBKNSDt3Y3atSKS7c=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3rS4dIrGtn/zbuBqcIGW4sVpitp0+hFILyKfrnwQpCmVQKG08UnmtL+roi6QO9FKOA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/ymZ9l54qC/L2yU4fowjEL9nmGanANZheBzn+KFNsg/pYOoPyLmPCpOM6hxBX+OXtw==</Encrypted>]]>
    </text>
  </script>

  &ScriptFlowFilterCss;
</dir>