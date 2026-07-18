<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY defaultName "GridDetailFinancialStructureAnalysisMultiPeriodGeneral">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Phân tích cơ cấu tài chính nhiều kỳ" e="Financial Structure Analysis for Multiple Periods"></title>
  <subTitle v="%f1, phân tích: %pt, số kỳ phân tích: %pNo, từ kỳ %pf năm %yf..." e="%f1, Analysis: %pt, Analysis Periods: %pNo, Period from %pf Year %yf..."></subTitle>
  <pivot rowField="xRow" columnField="xColumn" dataFields="gt" indexTable="2" indexColumn="1" indexHeader="2" indexView="2"/>
  <fields>
    <field name="xRow" width="0" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="chi_tieu" width="300" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Chỉ tiêu" e="Norm"></header>
    </field>
    <field name="gt" type="Decimal" width="120" dataFormatString="@analysisInputFormat" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tỷ trọng (%)" e="Density (%)"></header>
      <items style="Numeric"></items>
    </field>
    <field name="danh_gia" width="300" allowSorting="true" allowFilter="true">
      <header v="Đánh giá" e="Comment"></header>
    </field>
    <field name="kind" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="xRow"/>
      <field name="chi_tieu"/>
      <field name="danh_gia"/>
      <field name="kind"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcBHwD6V3UunWN6aIVgRxH54Ser3yo3rPUE97UIbCsaIZjB2y7MNuBpOQoynSZ97lfw==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQuq7YTYRj0Z16Xs3Deqb2SnB3ocbZpz4VUnHYDFLGK+NF</Encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPaSX9peRH2nRZu+rKDurKXoDhppNgodsWkWZTnT9GGgq69vk1rInH+6kHrUmJ4Iaw==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQuo0eS5b8e+DofV8FmhQ8f5+a3+Ekd+oxpqkqpDJ7hyMpfe1mwKYr3xhUriBcXoM1kw==</Encrypted>]]>
      </text>
    </command>
    <command event ="Scattering">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPGgJrHvnYsH1poMOiP3rgXKxogIoXaNHNuqpPH/d6cI8vHSlK/A3pNIlc/DJ+YCFg==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQuq7YTYRj0Z16Xs3Deqb2SnB3ocbZpz4VUnHYDFLGK+NF</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22ciTfxXLWkc6njlqPxulQ8Q0LC8B5NMqT/jHhfrgr+Va</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaIXQCjDEFew4S6PdFrd/PtzSvhyej/aeN4S7Eli+Fc0MK1JydTEI3HnKHv7hNowXgNz4kIZPscMCCzykclJKpDQLLxvzxMk/qdm+5AmlUOrQatBvVa5gjMNB7AmRD+XuvlrCzZjYriuAWcM38k+dyTh0sR3aKFbGwIkMlN2e6QKEPON2s72H/GgkS1kb0cPu8Bf7BBy6E337p/k9kZm+m/U=</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyWFfZ3ooX5WXTcH/JdD10vFgHt0Wkrr5EDvvXHgXyQAXmyUvYdxSQxDNPWNyghZAEg==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyEd6dUhmivDwyzoqUODQrqdt3byG7xNPGVq72xvP8sHI6z1LQEqRXdJqp0I3uO9y1mqJWSZY1qnQu7VWYX0jU8F4=</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHUCothhCKotCSIkskECrMjjn5opeaWiLu4KoXCu5Qdt9aQ8GCxUA4U9gFdZbZXojOw==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaItNJRZcWQCiHBntvQLZfiV+Al6PUkpGH9CFWKIebRG7S/Romuk0DNyL0M/ymRss17xK4Bdu0ZgNnlAZJMg0M0/gZGcNuoTThJPOKT6DWBh8</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyEb1jl9/X1Igzx5HILLjYLWW2CSp9iMjvLcA5ebzAYa9NGWR5wjqyOJdwI+Ir+0Rhbuhk6pBcoX7ladRqFMdgw+XBHZv4KjbvKij9qBCefV3l</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHQkYKiv2RxmCSbcGW8Ud97s0ZVURCG2jT/iN5KXaEM2qUd3BvNwlf/HCEZu77j4Sw2UsCfXjRlicwrYBoio9VtnRowxoC8ZR8zTT6fslCygY</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&hcr+MLFw0Cvi/MPLsquJlpy8hzcrxmMgYBphT3AArR0iDjTE6Oak1vOh61yOuJO7GQP1ZSsyklfeN6oJDHYrWA==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyETI2WiGOq6VNUevZE9pq357DcNxnQ9HSc0BB2LwNdOowd5xhuCTqWPlyeJGmutd9k7dwE8Gc4P4qPGxTeRj4bucx6M+d3F6FXNhcsgb9ftCY73gHyAzJnykbbme6ALEcg6ISp/Iqpe7rR3QCKZblQD9uz/WudM8NK2OixOOpaa0WlR0E5uu0hz+//YuMwcwJ1FeCZgLfQpp2Mo5qbOCcDgGSKKfVZStmRWZ2WvlpvyytrMrdzZAXvKDa7q2KPvEwpmVI9u6pldVjubDDP+Kr0aNHSB+VqkxQNgsnUohW4AtwKmRliee1A9mj9f+C6DWNTnjXy0517HOXKjpoAxIL3mw8VoFAcxjBsxlKgLF//UBE0iZ5nJn+iboDPCERbhmg9R5/sAVL/raYcyuHoY0FQRDhQ1HPPKgQk7x1jqbkYYNDo1WlfPA9VJmRfG9JNJELfNYOujP4ZPRvDrugysivxzWXv9j9Ifz/qGPmax7e7z9xTbKKVA8oIujTKTpbjakiHy/tk7gcPS/KqdA/rzqyTqMR3Lli5ls+eUzF+cDUlJ/rrH1Otn5mD8eXzaLvr3+dd2TYA0GhW5lgWnZyVlKYEjLZbrXJSijg37DcRwgycfkAJCkwbcDN8Eru72zoPbWyJtHaIFa6NrwufojYc9QmCrg29m2j+IHolFSiOsGR5OwjAdxPqhnC0PEi6sR84hnZemGjhiACaLPlhevuB7t6aH83durwPXImaWDTc3Cr5+CtVDb1lo9VQjSm4heav26QYV1776nsOxOr8BG9WocWvo15G6tYu2/O4HCEvvUUhrn2XHraSAKu64juPTBoXxT5PurZ9ES39EOR/LaNOWczFg2Mt5prYGX7HktpBuZvJim3cPFdJ4W79q6UKJWSbrydOI7jSjdVDRdvJKJwpeDbaYcjdLgx8vI+Uv2myXgFCvtyrXWMvNOvUMc98W/N9I14qbkWQgKTatm4WlqkmkX9B7LSTyKkRpTn5K92zOd5US4qrOL1yeLe0IrcHYt6iSHV4VaVfdut7Qkzu8qHJNsNuy+BEtnRw/Y6j6w/wuXMK0dvkLgINhR7yWJ1bIJ24xTEObx+j0Kjyh7BiBKy01EqQ7+7pTx4kESArCuVrqjQ+Yktl3M1MRzFi20qTYE0oHJat66dMr5Z1Kl3dQQsrxnpKLSZxjsO2rCpSaFS3RWsSIP0CWX+dUIRrDwzlanLtRKLI9j+MISPklLwBdSABlJpr4MHIT7XaHasDGeYWJP0iWrOvBeU9xjSNoduOEHWVSiUtWwcMbbicU4Vw4jpO0LzTBA=</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&zRJIg4IrJ8FD8GxnZu9KjNhP7YUpqR+WwcM+pDXn9oc/1IPUteKc7EBjcmj+gcWw0JupSKvAlD1kGalgM18cT+BG7fX8NP8FLYZ84qfGu7khlupaE61K/ya8kgNV9FiLkbGVD9Oiznn5ubImCxfLJe0Sk3TSSHGYGKRITbaMLswmGaGZAkJCCU3rZCwetkDo/m4WVh0SO8erhdyQMU2wKHaNRYd2JWCbF9jqk/5g1Rouko7m/K9raAYJlKQpjgATT0/eUr+1oiYx9mc6jRM2dg==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHc7X/84zX1ElDBQ0Oio9BYjYXYRYc0MA/fHbXj5R51/THLr4vqJR4aVL2yaCgOFpoqNtBnv/MOJOr6tRthqxxNdS9nIEhGzozzA9RfTYTN10TR95tDcGPVGTxPTpSHzqLfRVdfFkbfIjKlOicf/I/AdFh5kjO9kF4gsqjVv1liUuYuqyCbpu6Pg7s9iJijqR550YVGH1KtDbhzEU17UtJVRvHw3U49hOxg8lw1AheycMBhSIM7SpeJQR722GpHgNzHFVz9GHzPM/K95Gschu9p1SIkmpp29OT7DP7fG5/r5QRvuSlFnDMFbnYLiZrJCqCe7dNTJxZaZif4dNrl53i2bDuEHyxr88S/T6jJS2Z3QIUoW6iKFplUE8FvYgroEOLHbUVgs0eBgieGP685dHRvxBv5OuQQ1AvtbV640eTeoVCukgRg1DWH6wQubkjRuPCxQVGGXGOxUYcOA8byC0ZrnT5a3yCj0H6eFwfGPWoy6nVCgDzLrsLEcjcszjGXx57641XiQcOXEcB+1FBTE6RmrFeaEnAEp43pujviLo7sCxattlLFAASLN4yXRGqwVeZwasuQE9StKCUobkDdS+mOu38vWsmUifp8FFWTmSg7egyBIPWHL8FxSO5bCaWmYUsDFmL0RTGxUTxp94obhhTLs=</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaLrt0qMgl8Gj62Xp4gU1U4hPFg74nQhAk8y4DEF4jRx8sTnnEHVrYyDePKFPoto3G1Wsv+i0/W4Z3dIfK6jwWkC/dUMzrUYFom69h0C1evKHpk0NyrROCeQtQMYZMCXJ01mm8W30/JYIODlQhnEpmRKO36wLYHQ0VTA7qazq/1X3xJsAHbBZtF2rrn7KcKpj1KufeVAwJpxVc214rKbvX9G1eJdWyl1384zBtbVx1prqyBXZPU4hXM/fRUwYC0MMnSFOtQAh22SxmCsDunTuWIhgUmofpwBpA6B82zxRXNL5Ixlz/DsfcmHsXDcUmcTHQTYOy7aYSdj/ZzS7vz4DtIfaWkqegR3tDnUVtBQ7rO56CCXCWm+jKBsUnYkPGc0ks0nJWbrbYKRDiFpmR9DcexI4xfjj5orghVr+4yNzZOUxRZ8t/iULb+bEJrQoqfDlLzN6M+tgMp4xBLYL+cvh1DRQNMZK+s39ltcYX+6bb3dqtVEkarD6Lj0iuYFI+GRuugTY1W6vBeljXrezKEw65100Nn96EYOOWUU3ppECMJgdZTqIdsjJ3LObx2HrE4waEeI6wvoBsT59P/rY6W4gdPv6p3NETPvjwSH2xhigCupP6BhAgvXDU1RZcDV63qZKTIMe7LUU/P+NiFSBq8SVHoCZ/1haJYnln1NQtm1BolzjN+IHlwRh3ve9vnkOlrGg2p84qTH8PTcLbqhGX2KOe1AI8LETTqxh9LtlSPTW+iADBWGcm0wsPy/PTHiMPARf8tZ8YNNPhEtmYHiqhOPYfC+zZhkcz9KWePkAetJhvT35WmxXiekQto+oVcP1AweGxYXCGAX37PPSTOUdpB1fYVky5TRDNe+8xBNxEVg9dz7pXLg6w69Z3B5+TZN+GNkM49mAn4UZxDn0S4vnLOkKb6xtQQ/v2UJdm18eY8k6hj/qyphaH2v4wtj7CeeGZbzPXUxIrTgNH3rpbrmGXB2gY06oe9lucWFMzOsCiXJAb6Udr0OYt6bP/hpaqUgo9p36r3VW+e7Ip95OC3xiBjYqQHn3y5sYaE2Zahv6nvAgMUYataIcOOCjSebv/aEnJAMfJ8EV9HhiG/55RMncj0kTO1W7alygwKwSIcvwdyYS5Uk0ap1UKAi9JX3zGBLF13qAAfRVT445H4W4D8J8IMEAFGaAof1uGbswf8w+8y3K1ucydgFeQx6ngYvmXOHqDAtZIwzw1lk17cavOiL+wPGzmm6WV/57hxb10uk2EjiWqBK7VKWVJUbnAqKZ8I+Q3DLDKuh3kJPtFAwMiIfa79+YeEr3av87GEChfim5rcdeGls2ocjh+xEJGT1+b85iiWyoyriTcxbK72oECqMhkZ+aSUtFhrsLiOp0YrtloOY17Dsp0Lv6mf5/LJZhC3PFzZMlGdGfF+vgnvWi8l2SaDzZDh33aITh4VESUxzrtheLURz7mj3/YBRlrb7qMHmVvmT69A==</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Save">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9YOsGBbpE+Jo/Lj+o1uFoIXXx8nX5y+4CrJDQuH6DUi9v9+zNP8YgRHe+H9+tDdUdcx5oTGqY3H7WtqYQ3O8233mm0+AZgYj3WCtyt6H2j7EANyDAR4aYkipu8Ml6/NlreI8cJCN+zwr0Ikn6FF2r3wbsm1jETLB5nQZhcmRbVgvCBba35tmLuAh71ZdOF3V8yYnm9tgTetLmqXo71B+QhooliKJFvd2aQCEMGIwy+qkBeFg46ebnJjNwgdieeoUvy80U9VayuM3o7zqw5Y6/P8JsdmJkW5IPJfJe902JSdgMf+AXWD39wZ/D1j64dOSGfao6sc8r7m5iv9KBSAFHU=</Encrypted>]]>
      </text>
    </action>
    <action id="Clear">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9YOsGBbpE+Jo/Lj+o1uFoIXXx8nX5y+4CrJDQuH6DUi9v9+zNP8YgRHe+H9+tDdUdcx5oTGqY3H7WtqYQ3O8233mm0+AZgYj3WCtyt6H2j7EANyDAR4aYkipu8Ml6/NlreI8cJCN+zwr0Ikn6FF2r29htE4RPjlx2jBIybFSZTcJ098qvZZ5oo9QGCTPZQX0vxnpbo42ZeZXh/Ip3Yz0iAsvr5Ltb7Nyip/zW09BtweEJp+JqwLOCN677riVfGXNE29MR9HSNQmbOZkBozn5TI1T72nkEf6tKmBJUlSuaiu</Encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuzvebe92IBjc/IjBbj8wIcBkGKVnowp3pKwc8uqPSQa9x4QCeeUkFg/4DIhxbGZCT8Sko4Om2ofOaE3305TV6VbHmegZU0+2L5DwCPcxmp4fmCt3ZiBGcDzDxmfFUit5B57LTxmkBY8/b96zO7wyCUgPO9vEMJyYVUVzDHKeYGRmZvWaC4PH9kl29wFdJKmc1RF6nQfzp8+NKwrWGKwJS88=</Encrypted>]]>
    </text>
  </css>
  <toolbar>
    <button command="Save">
      <title v="Lưu giá trị chỉ tiêu$$90" e="Save$"></title>
    </button>
    <button command="Clear">
      <title v="Xóa dữ liệu tự nhập$$90" e="Delete all manually enter data$Delete...$120"></title>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"/>
    </button>
    <button command="Print">
      <title v="Toolbar.Print" e="Toolbar.Print"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>