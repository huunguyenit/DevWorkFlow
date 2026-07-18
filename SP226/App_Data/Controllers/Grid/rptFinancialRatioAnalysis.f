<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY defaultName "GridDetailFinancialRatioAnalysis">
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Phân tích chỉ số tài chính kỳ" e="Financial Ratio Analysis"></title>
  <subTitle v="%f1, từ kỳ %pf năm %yf đến kỳ %pt năm %yt..." e="%f1, from Period %pf Year %yf to Period %pt Year %yt..."></subTitle>
  <fields>
    <field name="chi_tieu" width="300" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Chỉ tiêu" e="Financial Ratio"></header>
    </field>
    <field name="dien_giai" width="300" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="ma_so" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Mã số" e="Number"></header>
    </field>
    <field name="dvt" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="gt" type="Decimal" width="120" dataFormatString="@analysisInputFormat" allowSorting="true">
      <header v="Giá trị" e="Value"></header>
      <items style="Numeric"></items>
    </field>
    <field name="lk" type="Decimal" width="120" dataFormatString="@analysisInputFormat" allowSorting="true">
      <header v="Lũy kế" e="Accumulation"></header>
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
      <field name="chi_tieu"/>
      <field name="dien_giai"/>
      <field name="ma_so"/>
      <field name="dvt"/>
      <field name="gt"/>
      <field name="lk"/>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22ciTfxXLWkc6njlqPxulQ8Q0LC8B5NMqT/jHhfrgr+Va</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaIXQCjDEFew4S6PdFrd/PtyWewH1ofEeZLkfVbksMlmLVC8pcBvau1r8VdUoqJGEuZgDGfqAD82i5zRGyuqCL3fzXDWT8oiXpDrn7Qq1i2uwjPQv1rgBRYkg6excfwg/YJHK3iOexqFLQSSAv/ekirCQ/1UjzEsbjrbgpzVwTBzc7o1ZwBa3EtBAVgm/Q4+WNLFMwN7dfpusLFCdi9BerxV72kswcJ9S6ydabxpkh3O+</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyWFfZ3ooX5WXTcH/JdD10vFgHt0Wkrr5EDvvXHgXyQAXmyUvYdxSQxDNPWNyghZAEg==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyEd6dUhmivDwyzoqUODQrqdt3byG7xNPGVq72xvP8sHI6z1LQEqRXdJqp0I3uO9y1mqJWSZY1qnQu7VWYX0jU8F4=</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHUCothhCKotCSIkskECrMjjn5opeaWiLu4KoXCu5Qdt9aQ8GCxUA4U9gFdZbZXojOw==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaItNJRZcWQCiHBntvQLZfiV+Al6PUkpGH9CFWKIebRG7S/Romuk0DNyL0M/ymRss17xK4Bdu0ZgNnlAZJMg0M0/gZGcNuoTThJPOKT6DWBh8</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyEb1jl9/X1Igzx5HILLjYLWW2CSp9iMjvLcA5ebzAYa9NGWR5wjqyOJdwI+Ir+0Rhbuhk6pBcoX7ladRqFMdgw+XBHZv4KjbvKij9qBCefV3l</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHQkYKiv2RxmCSbcGW8Ud97s0ZVURCG2jT/iN5KXaEM2qUd3BvNwlf/HCEZu77j4Sw2UsCfXjRlicwrYBoio9VtnRowxoC8ZR8zTT6fslCygY</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&hcr+MLFw0Cvi/MPLsquJlpy8hzcrxmMgYBphT3AArR0iDjTE6Oak1vOh61yOuJO7GQP1ZSsyklfeN6oJDHYrWA==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyETI2WiGOq6VNUevZE9pq357DcNxnQ9HSc0BB2LwNdOowd5xhuCTqWPlyeJGmutd9k7dwE8Gc4P4qPGxTeRj4bucx6M+d3F6FXNhcsgb9ftCY73gHyAzJnykbbme6ALEcg6ISp/Iqpe7rR3QCKZblQD9uz/WudM8NK2OixOOpaa0WlR0E5uu0hz+//YuMwcwJ1FeCZgLfQpp2Mo5qbOCcDgGSKKfVZStmRWZ2WvlpvyytrMrdzZAXvKDa7q2KPvEwpmVI9u6pldVjubDDP+Kr0aNHSB+VqkxQNgsnUohW4AtwKmRliee1A9mj9f+C6DWNTnjXy0517HOXKjpoAxIL3mw8VoFAcxjBsxlKgLF//UBE0iZ5nJn+iboDPCERbhmg9R5/sAVL/raYcyuHoY0FQRDhQ1HPPKgQk7x1jqbkYYNDo1WlfPA9VJmRfG9JNJELfNYOujP4ZPRvDrugysivxzWXv9j9Ifz/qGPmax7e7z9xTbKKVA8oIujTKTpbjakiHy/tk7gcPS/KqdA/rzqyTqMR3Lli5ls+eUzF+cDUlJ/rrH1Otn5mD8eXzaLvr3+dd2TYA0GhW5lgWnZyVlKYEjLZbrXJSijg37DcRwgycfkAP3tpqlBbDZFymKRDxLXemBvY10fWxPFFXcoZ/Oo3ipo234q/gC5oxnf02SoeC2IgOQtKlqEm0mjv0Wk7rno2NA/8WmRVjxN5BpiDtK0Oxpx5FQrhTro/+O2KyxFkxNyzgUvfArNPmxXV4pctkhuOXIEvZun0roOPzImvCOpWpEZI1tdhI5soqxrFmOOAfbRrCAzejw8eYHNB0LH2/6tJX7NieJoIAxXMU5TiNp4s01TD0R7ebOkbK3LurTOZ594dlbOVNsQcWt/+evhpAXpC2nh80G5gia+KKrt2Gr4IjGnxv/+bNlYycQWTagDbkVQ/mQtpimih4qKeswTbXmc3GS6acLP8Jqz5sHpem9xoTvW5L6ZovgJ9UeSy/ZWafQMEvM8CbXaVeBC66wOXXktamp3+Xp6UKfYz/G5KQUh9KKMMtdtz0ZOslyoLug4II/LwEffMBzVqKhPu5cHj1QjyzWXvo0ykx3gCsa0YDYd1GJCkk1p6nX1SacN6gU3SaV4FkH56ao1zzNZLJodhBkIrYLW3bLK7gZxLPf01pdNGeWO2LHQkOd//TEcZaP+N8Ga2VHCse/Iak1w37j9IvsYm3bzRPX24RX+9UvmAid1yZheRuxTGXlDNO9OP97OcKDOW</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&zRJIg4IrJ8FD8GxnZu9KjNhP7YUpqR+WwcM+pDXn9oc/1IPUteKc7EBjcmj+gcWw0JupSKvAlD1kGalgM18cT+BG7fX8NP8FLYZ84qfGu7khlupaE61K/ya8kgNV9FiLHZeNFMu+jLeq39n+miuwl0Ujy2kakPx8or3Ewl6ooyRAoJm1vo6CtCoJ5eVvNWk4K8iMN9b33+Ngi08cEnS4LYYa/PxSyiliRh/G9G5FdwTwb7sQGc5UkZNaDh53p8gdbkL5j1rfsf/fLND9vEpOyA==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHc7X/84zX1ElDBQ0Oio9BYjYXYRYc0MA/fHbXj5R51/THLr4vqJR4aVL2yaCgOFpoqNtBnv/MOJOr6tRthqxxNdS9nIEhGzozzA9RfTYTN10TR95tDcGPVGTxPTpSHzqLfRVdfFkbfIjKlOicf/I/AdFh5kjO9kF4gsqjVv1liUuYuqyCbpu6Pg7s9iJijqR550YVGH1KtDbhzEU17UtJVRvHw3U49hOxg8lw1AheycMBhSIM7SpeJQR722GpHgNzHFVz9GHzPM/K95Gschu9p1SIkmpp29OT7DP7fG5/r5QRvuSlFnDMFbnYLiZrJCqCe7dNTJxZaZif4dNrl53i2bDuEHyxr88S/T6jJS2Z3QIUoW6iKFplUE8FvYgroEOLHbUVgs0eBgieGP685dHRvxBv5OuQQ1AvtbV640eTeoVCukgRg1DWH6wQubkjRuPCxQVGGXGOxUYcOA8byC0ZrnT5a3yCj0H6eFwfGPWoy6nVCgDzLrsLEcjcszjGXx57641XiQcOXEcB+1FBTE6RmrFeaEnAEp43pujviLo7sCxattlLFAASLN4yXRGqwVeZwasuQE9StKCUobkDdS+mOu38vWsmUifp8FFWTmSg7egyBIPWHL8FxSO5bCaWmYUsDFmL0RTGxUTxp94obhhTLs=</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaLrt0qMgl8Gj62Xp4gU1U4hPFg74nQhAk8y4DEF4jRx8sTnnEHVrYyDePKFPoto3G1Wsv+i0/W4Z3dIfK6jwWkC/dUMzrUYFom69h0C1evKHpk0NyrROCeQtQMYZMCXJ01mm8W30/JYIODlQhnEpmRKO36wLYHQ0VTA7qazq/1X3xJsAHbBZtF2rrn7KcKpj1KufeVAwJpxVc214rKbvX9FgYm8lcgdwE6iwea+5D5fVRbmab98Q7hSrd60zcsZZzXKPj2x4/H4pqDkTMx8x/Lrkgh0xhNlpECdW5U/o/dybUhCEI5EoTj3t+TN5WYSMC4TvNf8Lfxurq28WigXDC2O+8jnIIXtepopKzUYKOfZJ58lCc5Vx0o9AkmZez1S4IEeHuokkNWT5DimYllAFYlO5Tw06SA8NbshE8FX6CpiU0ZoLmXk4qksgVEI/OWa126qKrAFTCIu9QEfdPtiNMKwbm8UnlzbVWzvswq0EJ2jkstQaS43AehgBljNY2L7KIuMQ/OV4j9wqbo8p/7MHrIxB2Bmg6sIn+v7ol4owDHsb0ieW6bl6qp6qSdr2NkEckI47h9jLURz3E17SfEBuHTI2jcUo4plWvlzZpPvyM+sR1DqiGCYpRd38m9ssEPOpyixGNlaf87FHRaIibcno/xCoLNUVKYUozzagWO9BeBeHn3z+nwIcKLI4Tqy6OdbTtq/m5/EKA+It/mEiLLwVwJjribh343pcMyfNnFIjOghJy8dfijGOGPdelMA1EPEro8scEfEkA9UjrXRsZDc4k1K/JjUJ5ZY4hQ0gZJwCHkVDHKkT63IrsIGYGMeKRDhDpwyIIhgytGUI/WpY2PdRpHHQNB6EeRP1VZED0g2Y/7hmJghPGM8eqW2NLg5uP+sQFDeXULyAxfYYB0UqIFNJ74lqiFHq2oJNFDhhquGBKz9ef2BO1yn+KFYrpZ35mbOWK7gxGkYjMrhrgw1CJjWEQOclabhWsGvTRDLOvuFCSBvH80fAmFWIUJGQwXGbXzOGiucjYMJaC8bnzOXaFGlj1oOFeC6sdvUaza03iwewnSKdkvlht/fMl5dt4YAHQvb4HEN8xOogUNwrFL/qejqAf+QGQ4+1mngBdmd8TN2X4wn6RoANsDGpctAVTnVAJ8z3erzKfju7cVlb8bSc1s1wyzLnXU3lJ5aXA0XgWY1MPdFmEHwivCFAr9F6NBvVbIePsaUpUo6ipu8cYCDF4MLTp86AthrjnhCupjVi0Oot3cEpJBu9CyS8vgx/6N0O5gNPI5hN7ydH9mp3mEsvZjRAXMUMQZfLKl6A84Ba4+v0GuUspineLzPp2MSHY8lXI/oSe+dzhq5GRpY0XGUz28/wfLGlFm1PFtPBz4+NlIsKdh/9w790rSMqz3ZacsNgr8/1nQ==</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Save">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9YOsGBbpE+Jo/Lj+o1uFoIXXx8nX5y+4CrJDQuH6DUi9v9+zNP8YgRHe+H9+tDdUflf3VPaABFiCYWgSxAZSbPz+iedPKXp9YJ5YMfiGRjprlZaKjaO4cCKbUlqmv1CyQ2uyRqRLCKthP1TIGzqRJpQ+aDdKeJro6efQ3tLj5HRuQ5AjKCyl/g28wxfbqcl543hw3wYLqXwTSUux+G84fnZmIkD1iSv9rC5gAZZ6MS6uwFNQe5zmemiJs+5q6cOUW9tBSHXlGxddnp+IMNu5C4+P1rDB1kG/pIwU8DArN68qiGtG12dOP6+tFgt4PNg036VGdDxjje2zLeU8/rATOc=</Encrypted>]]>
      </text>
    </action>

    <action id="Clear">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9YOsGBbpE+Jo/Lj+o1uFoIXXx8nX5y+4CrJDQuH6DUi9v9+zNP8YgRHe+H9+tDdUflf3VPaABFiCYWgSxAZSbPz+iedPKXp9YJ5YMfiGRjprlZaKjaO4cCKbUlqmv1CyQ2uyRqRLCKthP1TIGzqRJrd6j+trVzASnwHgl6pqvNkrRZ0YbbccIpJgWkdEPShmUjXPpse8uPFHGETUXZJOrZFYxXuUBAvDZ92dM+PX+b8LvBahlWB/EBwe5SmnkRAg48Zp8kdV3PPiwRveR8CSJlTOLALRjl6BPBmnxRe73Qv</Encrypted>]]>
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