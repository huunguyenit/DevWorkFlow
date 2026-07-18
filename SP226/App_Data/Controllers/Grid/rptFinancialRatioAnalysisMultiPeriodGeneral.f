<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY Identification "rptFinancialRatioAnalysisMultiPeriodGeneral">

  <!ENTITY JavascriptGraphReportInit SYSTEM "..\Include\Javascript\GraphReportInit.txt">
  <!ENTITY defaultName "GridDetailFinancialRatioAnalysisMultiPeriodGeneral">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Phân tích chỉ số tài chính nhiều kỳ" e="Financial Ratio Analysis for Multiple Periods"></title>
  <subTitle v="%f1, phân tích %pt, số kỳ phân tích: %pNo, kỳ bắt đầu: từ kỳ %pf năm %yf..." e="%f1, Analysis %pt, Analysis Periods: %pNo, Start Period: Period %pf Year %yf..."></subTitle>
  <pivot rowField="ma_so" columnField="period" dataFields="gt" indexTable="2" indexColumn="1" indexHeader="2" indexView="5"/>
  <fields>
    <field name="kind" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_so" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="chi_tieu" width="300" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Chỉ tiêu" e="Norm"></header>
    </field>
    <field name="dien_giai" width="300" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="dvt" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="gt" type="Decimal" width="120" dataFormatString="@analysisInputFormat" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Giá trị" e="Amount"></header>
      <items style="Numeric"></items>
    </field>
    <field name="danh_gia" width="300" allowSorting="true" allowFilter="true">
      <header v="Đánh giá" e="Comment"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_so"/>
      <field name="kind"/>
      <field name="chi_tieu"/>
      <field name="dien_giai"/>
      <field name="dvt"/>
      <field name="danh_gia"/>
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
      &JavascriptGraphReportInit;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22ciTfxXLWkc6njlqPxulQ8Q0LC8B5NMqT/jHhfrgr+Va</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaIXQCjDEFew4S6PdFrd/PtyWewH1ofEeZLkfVbksMlmLVC8pcBvau1r8VdUoqJGEuQqpXT6agrDyNY90tovRjEU43kZ66Bra/msaOK1vsWjjdsyKQqdojZSiEIHBbymho+295OupjVnApodXnDUEdBwJsDoDoG3JSRXrJUtopGz5UCQFWuvnh5fgV6oDXbhJfKN85w2T3dWhivkvrKvcXtU=</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyWFfZ3ooX5WXTcH/JdD10vFgHt0Wkrr5EDvvXHgXyQAXmyUvYdxSQxDNPWNyghZAEg==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyEd6dUhmivDwyzoqUODQrqdt3byG7xNPGVq72xvP8sHI6z1LQEqRXdJqp0I3uO9y1mqJWSZY1qnQu7VWYX0jU8F4=</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHUCothhCKotCSIkskECrMjjn5opeaWiLu4KoXCu5Qdt9aQ8GCxUA4U9gFdZbZXojOw==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaItNJRZcWQCiHBntvQLZfiV+Al6PUkpGH9CFWKIebRG7S/Romuk0DNyL0M/ymRss17xK4Bdu0ZgNnlAZJMg0M0/gZGcNuoTThJPOKT6DWBh8</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyEb1jl9/X1Igzx5HILLjYLWW2CSp9iMjvLcA5ebzAYa9NGWR5wjqyOJdwI+Ir+0Rhbuhk6pBcoX7ladRqFMdgw+XBHZv4KjbvKij9qBCefV3l</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHQkYKiv2RxmCSbcGW8Ud97s0ZVURCG2jT/iN5KXaEM2qUd3BvNwlf/HCEZu77j4Sw2UsCfXjRlicwrYBoio9VtnRowxoC8ZR8zTT6fslCygY</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&hcr+MLFw0Cvi/MPLsquJlpy8hzcrxmMgYBphT3AArR0iDjTE6Oak1vOh61yOuJO7GQP1ZSsyklfeN6oJDHYrWA==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyETI2WiGOq6VNUevZE9pq357DcNxnQ9HSc0BB2LwNdOowd5xhuCTqWPlyeJGmutd9k7dwE8Gc4P4qPGxTeRj4bucx6M+d3F6FXNhcsgb9ftCY73gHyAzJnykbbme6ALEcg6ISp/Iqpe7rR3QCKZblQD9uz/WudM8NK2OixOOpaa0WlR0E5uu0hz+//YuMwcwJ1FeCZgLfQpp2Mo5qbOCcDgGSKKfVZStmRWZ2WvlpvyytrMrdzZAXvKDa7q2KPvEwpmVI9u6pldVjubDDP+Kr0aNHSB+VqkxQNgsnUohW4AtwKmRliee1A9mj9f+C6DWNTnjXy0517HOXKjpoAxIL3mw8VoFAcxjBsxlKgLF//UBE0iZ5nJn+iboDPCERbhmg9R5/sAVL/raYcyuHoY0FQRDhQ1HPPKgQk7x1jqbkYYNDo1WlfPA9VJmRfG9JNJELfNYOujP4ZPRvDrugysivxzWXv9j9Ifz/qGPmax7e7z9xTbKKVA8oIujTKTpbjakiHy/tk7gcPS/KqdA/rzqyTqMR3Lli5ls+eUzF+cDUlJ/rrH1Otn5mD8eXzaLvr3+dd2TYA0GhW5lgWnZyVlKYEjLZbrXJSijg37DcRwgycfkAP3tpqlBbDZFymKRDxLXemD0P+4wSHJBikgwTkN9HPHhPhhGkbS4XVov/0+EDdLFPMv037hXPJxa2+VZSBDZoAeY9abOxofbngjnrrtMdV6hhBDR+QIlgQKp+57RmJSrEmFkiJqVNMDxOdv6bBwbgOdJhHqiuQ1cy1Qgvy1fowGUP24l5+gG3/GmxjaSbfv+c/6CtuOjlcZHnGf6ys9qrFh0Wn25OzJG6pEdNkUZpXqftUCNZk4O1RLYbSPURf22uPYcZr6W8IPqvFTt8IJ8Uuyst3ODKuo0y9elHIUzOr7EKJC1pevRKcRNslXXf5KinoIlAsKzJT6qjrEZdQhHC/m5moC7s3Iv6vzZ2ZkCtwQO2ZM3fX4nvw6wnY/pQZL1oyvIelxoYDV9VnnswOXgNuMEyAyP1noFQDkyOe+USWwxUARyuvTbu+RHZsHCtJ7uzT8+zXXUF0JSArfL3oEvs/1K0hJJj1JNkVHn6YWqAPpNxRCJ7ID8K/y2vNW6aJIXM5xUIp2p9UK1IEkiPSFhDUNgxN5Jg8AhQLXMZo3/VurtZbvkYrGE1ZXgyXTJua688KG268JIaQonD6DWaZjVoYsYUkedQMccPQRwXkDK94fUHfKueF9YZKbPl6MPcX+Dv/CxQw7+5LWNeSZdohw4rHA==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&zRJIg4IrJ8FD8GxnZu9KjNhP7YUpqR+WwcM+pDXn9oc/1IPUteKc7EBjcmj+gcWw0JupSKvAlD1kGalgM18cT+BG7fX8NP8FLYZ84qfGu7khlupaE61K/ya8kgNV9FiLkbGVD9Oiznn5ubImCxfLJe0Sk3TSSHGYGKRITbaMLswmGaGZAkJCCU3rZCwetkDo/m4WVh0SO8erhdyQMU2wKHaNRYd2JWCbF9jqk/5g1Rouko7m/K9raAYJlKQpjgATT0/eUr+1oiYx9mc6jRM2dg==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHc7X/84zX1ElDBQ0Oio9BYjYXYRYc0MA/fHbXj5R51/THLr4vqJR4aVL2yaCgOFpoqNtBnv/MOJOr6tRthqxxNdS9nIEhGzozzA9RfTYTN10TR95tDcGPVGTxPTpSHzqLfRVdfFkbfIjKlOicf/I/AdFh5kjO9kF4gsqjVv1liUuYuqyCbpu6Pg7s9iJijqR550YVGH1KtDbhzEU17UtJVRvHw3U49hOxg8lw1AheycMBhSIM7SpeJQR722GpHgNzHFVz9GHzPM/K95Gschu9p1SIkmpp29OT7DP7fG5/r5QRvuSlFnDMFbnYLiZrJCqCe7dNTJxZaZif4dNrl53i2bDuEHyxr88S/T6jJS2Z3QIUoW6iKFplUE8FvYgroEOLHbUVgs0eBgieGP685dHRvxBv5OuQQ1AvtbV640eTeoVCukgRg1DWH6wQubkjRuPCxQVGGXGOxUYcOA8byC0ZrnT5a3yCj0H6eFwfGPWoy6nVCgDzLrsLEcjcszjGXx57641XiQcOXEcB+1FBTE6RmrFeaEnAEp43pujviLo7sCxattlLFAASLN4yXRGqwVeZwasuQE9StKCUobkDdS+mOu38vWsmUifp8FFWTmSg7egyBIPWHL8FxSO5bCaWmYUsDFmL0RTGxUTxp94obhhTLs=</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaLrt0qMgl8Gj62Xp4gU1U4hPFg74nQhAk8y4DEF4jRx8sTnnEHVrYyDePKFPoto3G1Wsv+i0/W4Z3dIfK6jwWkC/dUMzrUYFom69h0C1evKHpk0NyrROCeQtQMYZMCXJ01mm8W30/JYIODlQhnEpmRKO36wLYHQ0VTA7qazq/1X3xJsAHbBZtF2rrn7KcKpj1KufeVAwJpxVc214rKbvX9G1eJdWyl1384zBtbVx1prqyBXZPU4hXM/fRUwYC0MMnSFOtQAh22SxmCsDunTuWIhgUmofpwBpA6B82zxRXNL5Ixlz/DsfcmHsXDcUmcTHQTYOy7aYSdj/ZzS7vz4DtIfaWkqegR3tDnUVtBQ7rO566ogNfZWuqIHqU7E+luZyWkGIIunYbID27jLm4+HDVu46eS71+6j2c8ilaKSvXO/vIO+ipXqdjClqOmaKasEnRENtFFJDKpanNTTsQvFJ3VkZhe/DlAi/kzj9cRvefzlwjiwn5caXxob4Wzal3cXodBRB+twLZxXkSxn7QX106q0yoWrJu20+8qdW36edlc7RCftWvHkDutFVDx97pdAYZ7/hoUTO9z+3Ywgc/epIRA7aVfG4IXgH+oA/NYpIaH66vn3dzyYHGbycLD6+BpE8zlvM31sL0FeJa+zw4WDozeCqveaUZZORX0uuj0xvA3qCMzP/aM2RYPROgTRbtZ7tvwk7NHTMYCIQCs0yXC+CaN/y0mg2c336JFH0xyJl1IF5L9NxDtFA7q2OsYj3H2fevUyEstsmniSfVXrzORkqaf0VsL9SORfIIOg9KmSMPPwsxuaJosQonsdNsqoMnfcRzgtoJSmeu0rMMw52OW4989e5QGxawDIPHdHZNdAlxIAzZuFe441rLY8Iyj9GydIucK63UIym3ZX4CnD9eYLPjsqrmQs3wnA0a255xmpkuFIufOtZUfpUtZgTgjhZGbeBpvLI7TJwp7omArETwwrV6hjg5yRccgOTe96GMK/q5WNNP9YEinEOwTDZ4J3ihtk/DtYDzuYVDvksLOakKsZf33MIypfZm3yBPDOiGETKieM2t0I44y6TPXtx1ow6bauxtXk+MfY42YIlwIOdFpWogpZaZjXN58cxhTcY4gQJLY4OnGRV5Uj1VJNsVliPHyHLdvwNJNSEG1CJASK6qsNbsLWljdYOw47tu+YdsJnLLZzDn1bKoqOerRXFOqJNdCgbM1pq94ho6v7AWzXSWxm5EKcVg/zLaXo/rCSZfq4oTyxF7rcwzb9N2tWn3JfgXHF5mLya26RMdhrhqefGjpUD0QTKTV/p65QmTDF/CF9ZVNJcdY1OvM4D+1IACNGuiY0OcC+AWaQrpl3mO6felD5mEPCdb45ewmApz2daxytyMsMaMCgOoNbruOQtTtI9DpMwDA==</Encrypted>]]>
    </text>
  </script>
  <response>
    <action id="Save">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9YOsGBbpE+Jo/Lj+o1uFoIXXx8nX5y+4CrJDQuH6DUi9v9+zNP8YgRHe+H9+tDdUdcx5oTGqY3H7WtqYQ3O823lyQErvpMGZJ68fXFTZisWth0OTGvWrZ5W6VR8TnyihQMf5NBtqM2QqmDnNL7ItbX3MMpMhL3JgwEXq+14za0OsPhThANyuFybepTE7rytHLkg5bnVGOG17yE9vSspwqDL81RsVmUQ59qL2myqWZodJvCO5Yp78VG9bu3ySgycd1DimUHIp5Z4IT6r8nkaIYS18EcmG6cDMuDEVOy5VPVW94bNR0SkWssAZmxq+61VywqZQG/T4Mmao/L0egkxa2g=</Encrypted>]]>
      </text>
    </action>
    <action id="Clear">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9YOsGBbpE+Jo/Lj+o1uFoIXXx8nX5y+4CrJDQuH6DUi9v9+zNP8YgRHe+H9+tDdUdcx5oTGqY3H7WtqYQ3O823lyQErvpMGZJ68fXFTZisWth0OTGvWrZ5W6VR8TnyihQMf5NBtqM2QqmDnNL7ItbU4Qy3Y4SJlM98t4NCIJKG5gs4gC2lsmq35xMZzlbMHcGESBAd3WOMfHgZZTtFGj3VoXVsPZUBmyWRVj7k1kiZP5rM55gSXaf7lqgIkyVlcFH5qMfFsPYkbSs96m4z3YBnNp8J3+CYRm9Q08EGsyDHB</Encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuwNJb7NU+Jv72TBsR/SB74QH6a//Flg9ThtbAxKXedJeJ88OOstDPP2iUxte5HWOgS5N0ocLtsUBsyksWya6czYAqcC4Ty1PsWfAbD7nx6Bb+F9A40kZVAe8E1nHR+QLeKgovJlnslk7Bj77kQm+wvK4A6mrO5guU3AyBj0XF4k6mHRKsEf3IkNUXzoc7yHA0BxbSmCg+xJ4h1XYst9ImiBkUJ4MkEAWCOjKKjWDuVbusPvmohbW3mxgw9UL/mAnKA==</Encrypted>]]>
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
    <button command="Graph">
      <title v="Đồ thị$" e="Graph$"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>