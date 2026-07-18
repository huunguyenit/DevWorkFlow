<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY defaultName "GridFinancialStructureAnalysisGeneral">
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Phân tích cơ cấu tài chính kỳ" e="Financial Structure Analysis"></title>
  <subTitle v="%f1, từ kỳ %pf năm %yf đến kỳ %pt năm %yt..." e="%f1, from Period %pf Year %yf to Period %pt Year %yt..."></subTitle>
  <fields>
    <field name="ma_so" width="0" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="chi_tieu" width="300" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Chỉ tiêu" e="Norm"></header>
    </field>
    <field name="ts" type="Decimal" width="120" dataFormatString="@analysisInputFormat" allowSorting="true">
      <header v="Số tuyệt đối" e="Absolute Number"></header>
      <items style="Numeric"></items>
    </field>
    <field name="gt" type="Decimal" width="120" dataFormatString="@analysisInputFormat" allowSorting="true">
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
      <field name="ma_so"/>
      <field name="chi_tieu"/>
      <field name="ts"/>
      <field name="gt"/>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22ciTfxXLWkc6njlqPxulQ8Q0LC8B5NMqT/jHhfrgr+Va</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaIXQCjDEFew4S6PdFrd/PtyWewH1ofEeZLkfVbksMlmLVC8pcBvau1r8VdUoqJGEuVUDx3qu6eXTvpQlTBH75lUFOIO9kE0Nv7dcYYvUzCt8sdPIJgx/v8I5x3KDu7Duvn5vV8jXNDxQGnEY6bFTdO/lp/MwYEmpTpdLKw5yQ8syn3Gl05tkW8/VFZ6gu7dYtVJYyVWd7z0hOqyxmcgFTLLIDBJaVE9djkYNrByxsOmd</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyWFfZ3ooX5WXTcH/JdD10vFgHt0Wkrr5EDvvXHgXyQAXmyUvYdxSQxDNPWNyghZAEg==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyEd6dUhmivDwyzoqUODQrqdt3byG7xNPGVq72xvP8sHI6z1LQEqRXdJqp0I3uO9y1mqJWSZY1qnQu7VWYX0jU8F4=</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHUCothhCKotCSIkskECrMjjn5opeaWiLu4KoXCu5Qdt9aQ8GCxUA4U9gFdZbZXojOw==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaItNJRZcWQCiHBntvQLZfiV+Al6PUkpGH9CFWKIebRG7S/Romuk0DNyL0M/ymRss17xK4Bdu0ZgNnlAZJMg0M0/gZGcNuoTThJPOKT6DWBh8</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyEb1jl9/X1Igzx5HILLjYLWW2CSp9iMjvLcA5ebzAYa9NGWR5wjqyOJdwI+Ir+0Rhbuhk6pBcoX7ladRqFMdgw+XBHZv4KjbvKij9qBCefV3l</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHQkYKiv2RxmCSbcGW8Ud97s0ZVURCG2jT/iN5KXaEM2qUd3BvNwlf/HCEZu77j4Sw2UsCfXjRlicwrYBoio9VtnRowxoC8ZR8zTT6fslCygY</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&hcr+MLFw0Cvi/MPLsquJlpy8hzcrxmMgYBphT3AArR2LwT2VYZ0Pv94eiK6CW2W78Ib8motBYpaK/hjfutZDLQ==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyETI2WiGOq6VNUevZE9pq357DcNxnQ9HSc0BB2LwNdOowd5xhuCTqWPlyeJGmutd9k7dwE8Gc4P4qPGxTeRj4bucx6M+d3F6FXNhcsgb9ftCY73gHyAzJnykbbme6ALEcg6ISp/Iqpe7rR3QCKZblQD9uz/WudM8NK2OixOOpaa0WlR0E5uu0hz+//YuMwcwJ1FeCZgLfQpp2Mo5qbOCcDgGSKKfVZStmRWZ2WvlpvyytrMrdzZAXvKDa7q2KPvEwpmVI9u6pldVjubDDP+Kr0aNHSB+VqkxQNgsnUohW4AtwKmRliee1A9mj9f+C6DWNTnjXy0517HOXKjpoAxIL3mw8VoFAcxjBsxlKgLF//UBE0iZ5nJn+iboDPCERbhmg9R5/sAVL/raYcyuHoY0FQRDhQ1HPPKgQk7x1jqbkYYNDo1WlfPA9VJmRfG9JNJELfNYOujP4ZPRvDrugysivxzWXv9j9Ifz/qGPmax7e7z9xTbKKVA8oIujTKTpbjakiHy/tk7gcPS/KqdA/rzqyTqMR3Lli5ls+eUzF+cDUlJ/rrH1Otn5mD8eXzaLvr3+dd2TYA0GhW5lgWnZyVlKYEjLZbrXJSijg37DcRwgycfkAJCkwbcDN8Eru72zoPbWyJtl4aiVhBt+6xjoP2f9kjuQ21JYLF3YSSBEJcFSVJl9xZzVL/OlUNIrG4uJIzxF/ZKXC1Ci2BOH1pYwlup8Zj56cTVl2R9HJij+4GSnr9+I5bcc98n0HG85LYtmdriYnZ+bY3GeFXvRo65m7vE1VOGkpYN4fw3RG6gKHK3jgAD9ISjRqAG30RkYYi7010yn1cEnZujiJRgRpBdI0u3UXYdC/jcJer4Dmk7H28XGP37IdY9oMJDV9R7ihQoz6OTKPOtsnIW6zAnKYUlObTvwK02+CCgACNoRhaj6WEvuKXFPQKEiWGczlumDEw8W9GxQxUtKz9XR4VTWlxaimFCWa+EKD+CVXDispNqfy5eF+BBl7tYTZgl+zBiadJ7NptuQWdSvR7TtI+1iQmfY+HEcQk7wKfOqt06/qzlT59JtRqN8EBFUyBA9F13+0VgOoAQjXPttVgIvsVM9PX3HJRok8SZplJiYphjIpJBWuhK4tZkvNcyPS87PAWni/qdHD5gYzqsf6jhuUlCpOApgK3w0gw4cYziqBRWIlyDXLHFw5CdzAb9ezEyuAHbCRVA2ajbtRkNvVw01wuPHWG7CkhlSDTEZTRbXCXBggJxHYnGL0Cg0t</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&zRJIg4IrJ8FD8GxnZu9KjNhP7YUpqR+WwcM+pDXn9oc/1IPUteKc7EBjcmj+gcWw0JupSKvAlD1kGalgM18cT+BG7fX8NP8FLYZ84qfGu7khlupaE61K/ya8kgNV9FiLHZeNFMu+jLeq39n+miuwl0Ujy2kakPx8or3Ewl6ooyRC34/vfrs7wF9ra8UsWhWSkvjP0gXpxT7nIFZrmXNLuBw8cYDJfBFXsP2SK6uL3HRnJZCLqbKwP4B3vq2Ryyqfe39Fm9EGPUgQAJ0CdXi3KQ==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHc7X/84zX1ElDBQ0Oio9BYjYXYRYc0MA/fHbXj5R51/THLr4vqJR4aVL2yaCgOFpoqNtBnv/MOJOr6tRthqxxNdS9nIEhGzozzA9RfTYTN10TR95tDcGPVGTxPTpSHzqLfRVdfFkbfIjKlOicf/I/AdFh5kjO9kF4gsqjVv1liUuYuqyCbpu6Pg7s9iJijqR550YVGH1KtDbhzEU17UtJVRvHw3U49hOxg8lw1AheycMBhSIM7SpeJQR722GpHgNzHFVz9GHzPM/K95Gschu9p1SIkmpp29OT7DP7fG5/r5QRvuSlFnDMFbnYLiZrJCqCe7dNTJxZaZif4dNrl53i2bDuEHyxr88S/T6jJS2Z3QIUoW6iKFplUE8FvYgroEOLHbUVgs0eBgieGP685dHRvxBv5OuQQ1AvtbV640eTeoVCukgRg1DWH6wQubkjRuPCxQVGGXGOxUYcOA8byC0ZrnT5a3yCj0H6eFwfGPWoy6nVCgDzLrsLEcjcszjGXx57641XiQcOXEcB+1FBTE6RmrFeaEnAEp43pujviLo7sCxattlLFAASLN4yXRGqwVeZ2ooXaiGShbOrpna+dG+Bg8sxFNn5/IHf5XhUEmYmS1NnJdVnRHbXauEtFBksFMXRVs293xpdz8NrLMbfzPlNCA=</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaLrt0qMgl8Gj62Xp4gU1U4hPFg74nQhAk8y4DEF4jRx8sTnnEHVrYyDePKFPoto3G1Wsv+i0/W4Z3dIfK6jwWkC/dUMzrUYFom69h0C1evKHpk0NyrROCeQtQMYZMCXJ01mm8W30/JYIODlQhnEpmRKO36wLYHQ0VTA7qazq/1X3xJsAHbBZtF2rrn7KcKpj1KufeVAwJpxVc214rKbvX9FgYm8lcgdwE6iwea+5D5fVRbmab98Q7hSrd60zcsZZzXKPj2x4/H4pqDkTMx8x/Lrkgh0xhNlpECdW5U/o/dybUhCEI5EoTj3t+TN5WYSMC4TvNf8Lfxurq28WigXDC2O+8jnIIXtepopKzUYKOfZJjkXfm3ipUUXwqCMOsQUH7ur4ZwT1TaIgEvDiBnepwWA989/cEO/UJG/2zqVa4dJJIpV1sBYiG5y7zd/ynTGYGv/fEpwXTUzpkkFAV/PZVoZ5JLFpw34rr/Ay2SPhQCaQbdkknXnyLY5dT5RIjNgAwYVKNbIor/P7l+PY+uPZPtFnV++EuCukj99Yl7+E3xWaSmfAYHsXfCYa0mY4vZeJvdCfynWmpaOgL7v7Xpk1uW8tC8/5qUdjOa9jJyN6W8p64z9Syeyq0AIybxflf3wLnTx0VExeBDUEc41qaLlruSdEg36pSERVKc/2+Zg/dWn12amPdpKxuniY6RhUuSkXeQxIsAmOA7ztw5WSE7PjVYOzRcv/EZRqtQSLgdUaAmI0O2YvrN+FYupDE43JhI8aBI/RWJg+gQNSN2XNoMTJb7/ImsMaAfefwgrdhF/Qn6dpJmmAhC1kAxWWtEahL4rXT0rBmSzsJxtult5Eh3fHZmSGFEB+du21SXqZbQdwI+sVg/PKRJUAIY/zKBEUBihe/ypKU0NKQLbzEFyiIvViv3nh2o+veVWCFhTfTi31azs1nEVqAzwo8LALaunHgv+IXGkM3DVDJYsDMO1+3fLJFOH+1AqS60IhG+p9TDhLqz2twDgkabnT4sDolBc2vr10zZ6/66uZdUQgavmFfRseNnqoHkdBuLXPll0DkA+364wBES2Gih3ODBwJghV7S1vxk74BnJO2M0xGy9dadhwaoFIUIlLGueiacTUT2BUMz7fRuweTxLpiJialwUSev/10zAblfVXoijHEjHrm7en+HyiJ4ovHpomv+pXRK4mFXTyQPtgTKwXzB/0cdrlqIhlO1OKglbS3nKV/KjPcaly/15DeSaChrsOTIUE1IRQ+Ou+k4znNwc/FRPf09hVnTlZIWx2/u3A6COq1ekejTJH28ocj8jZLPoG3h0ouGZuMiXE65fEo8XkCtyMb6XHb0D4Uz2fpnFmkexJ5MG67T9t6iShrPHwzTPEX6kAsPS1m6FOe</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Save">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9YOsGBbpE+Jo/Lj+o1uFoIXXx8nX5y+4CrJDQuH6DUi9v9+zNP8YgRHe+H9+tDdUflf3VPaABFiCYWgSxAZSbOqAsWX1AtC58iGQ6MOilQXIn9wRuWwFC2/kb4cdU3zqfMfgAUwFNYE6tJaRkgdMktcRMb3460IqdhahE790aDTdex5orI8D0M4eVR2YShEgQwihCHJNTSp5FmUKkKswrjf9j6X41jpC+O9H4gYU9rYjcVIBW0ebPEJnFp3d7Sg8K/8CcS0fVm3sOtUHtnCn1jvqtVqdYM8bxGI+T4QKR+ITokkfFa+0XipdWltb7dO/li1F0W2RR578PxmzjjCCXE=</Encrypted>]]>
      </text>
    </action>

    <action id="Clear">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9YOsGBbpE+Jo/Lj+o1uFoIXXx8nX5y+4CrJDQuH6DUi9v9+zNP8YgRHe+H9+tDdUflf3VPaABFiCYWgSxAZSbOqAsWX1AtC58iGQ6MOilQXIn9wRuWwFC2/kb4cdU3zqfMfgAUwFNYE6tJaRkgdMkuPSgV6nUK0tuQ4fHBulCPn5RojIuIo4a0OHHPL1qb0Gn5NylYrj7k9EOEDihGoWkPG7eJ8SFRJrwdZ64JfCGJQzZlr9mc3CqyLv4CAv99BJE+nI97ksf3fQ2BMbzTot+Mkqp8utynhYhMtoOOIS131</Encrypted>]]>
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