<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY defaultName "GridFinancialStructureAnalysisCorrPeriods">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Phân tích cơ cấu tài chính cùng kỳ" e="Financial Structure Analysis for Corresponding Periods"></title>
  <subTitle v="%f1, số năm phân tích: %pNo, từ kỳ %pf năm %yf đến kỳ %pt năm %yt..." e="%f1, Number of Years: %pNo, Period from %pf/%yf to %pt/%yt..."></subTitle>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22ciTfxXLWkc6njlqPxulQ8Q0LC8B5NMqT/jHhfrgr+Va</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaIXQCjDEFew4S6PdFrd/PtzSvhyej/aeN4S7Eli+Fc0MK1JydTEI3HnKHv7hNowXgHmiZFy+L8UfxIJaVc2ehh5h/791JkdFnFiHN6WvUZ0ZnNYoQGeT8OV6JWBWJPXu22+2qjjfNhHFmpKCjt7Mg9RItfFPOBaH2z7+8/ibKoOkQQF7aHOqJxQals+JPkaR6zUMPEJTceojqU5/+CxRYqOhiBcywKu3wYoWjm18vLUN</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyWFfZ3ooX5WXTcH/JdD10vFgHt0Wkrr5EDvvXHgXyQAXmyUvYdxSQxDNPWNyghZAEg==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyEd6dUhmivDwyzoqUODQrqdt3byG7xNPGVq72xvP8sHI6z1LQEqRXdJqp0I3uO9y1mqJWSZY1qnQu7VWYX0jU8F4=</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHUCothhCKotCSIkskECrMjjn5opeaWiLu4KoXCu5Qdt9aQ8GCxUA4U9gFdZbZXojOw==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaItNJRZcWQCiHBntvQLZfiUrRoJJ7+0qiPIYn2hyM7cYKpLUlWZnM5DSIq/eLT/Pxg3/Q52b7YiskxnWRR+6w7a7mX2d1j0Lj97HbIQbMV1S</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyERnOvM4NG/oV2IoQpuvFNmPT8aFeXkqML0n58IyfPpyVJPSeqAr9CDMdp2coTBVvqu2lHuxmjkVCaSy+1KF7qJdjMycOlSdvOonHBsJv7YSH</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHXu8ejmCjlg4le7f8HVshRvaPlJ+aSv++/oks9vAYMCvcJbZJZuPqPO838rut1VWC6dJIjjzmVr65eU9VHir6/McVY2SaMQE8qsTM+zOuazs</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&JjwEvD9/bDKPJSKWr/Y3RpFum38JGD6+/2ip4K4YeIsHd5Xf1jjHqJLfnWAfmHtOHUz+CDot5D5qP4cZJyOrDA==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyETI2WiGOq6VNUevZE9pq357DcNxnQ9HSc0BB2LwNdOowd5xhuCTqWPlyeJGmutd9k7dwE8Gc4P4qPGxTeRj4bucx6M+d3F6FXNhcsgb9ftCY73gHyAzJnykbbme6ALEcg6ISp/Iqpe7rR3QCKZblQD9uz/WudM8NK2OixOOpaa0WlR0E5uu0hz+//YuMwcwJ1FeCZgLfQpp2Mo5qbOCcDgGSKKfVZStmRWZ2WvlpvyytrMrdzZAXvKDa7q2KPvEwpmVI9u6pldVjubDDP+Kr0aNHSB+VqkxQNgsnUohW4AtwKmRliee1A9mj9f+C6DWNTnjXy0517HOXKjpoAxIL3mw8VoFAcxjBsxlKgLF//UBE0iZ5nJn+iboDPCERbhmg9R5/sAVL/raYcyuHoY0FQRDhQ1HPPKgQk7x1jqbkYYNDo1WlfPA9VJmRfG9JNJELfNYOujP4ZPRvDrugysivxzWXv9j9Ifz/qGPmax7e7z9xTbKKVA8oIujTKTpbjakiHy/tk7gcPS/KqdA/rzqyTqMR3Lli5ls+eUzF+cDUlJ/rrH1Otn5mD8eXzaLvr3+dd2TYA0GhW5lgWnZyVlKYEjLZbrXJSijg37DcRwgycfkAP3tpqlBbDZFymKRDxLXemBvY10fWxPFFXcoZ/Oo3ipo234q/gC5oxnf02SoeC2IgOQtKlqEm0mjv0Wk7rno2NA/8WmRVjxN5BpiDtK0Oxpx5FQrhTro/+O2KyxFkxNyzgUvfArNPmxXV4pctkhuOXIEvZun0roOPzImvCOpWpEZI1tdhI5soqxrFmOOAfbRrCAzejw8eYHNB0LH2/6tJX7NieJoIAxXMU5TiNp4s01TD0R7ebOkbK3LurTOZ594dlbOVNsQcWt/+evhpAXpC2nh80G5gia+KKrt2Gr4IjGnxv/+bNlYycQWTagDbkVQ/mQtpimih4qKeswTbXmc3GS6acLP8Jqz5sHpem9xoTvW5L6ZovgJ9UeSy/ZWafQMEvM8CbXaVeBC66wOXXktamo8igU9dk16eLKRo6ZESg7f+TxKTpyyl6yjeX3UmdReBSrqb34i/CoBEzWoo4gMX3uBmWl/t8iSnPxz3QRDS1aFKdJLC29+iMBUmzqXbGGE8xAurtMSkHeSKrv5TXFcSGvTS2dRj0zMjWoC883h2F422WFV49paDQ5UJ5B5NR+s+GxQyqoyBj9Or8QhB8/NqT7OJa5KQWVZ8KMLfHI9namX0F6l3E6iHQ6q4XDDBEt/FjahpTzHH6/DhfndauzBjUA==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&zRJIg4IrJ8FD8GxnZu9KjNhP7YUpqR+WwcM+pDXn9oc/1IPUteKc7EBjcmj+gcWw0JupSKvAlD1kGalgM18cT+BG7fX8NP8FLYZ84qfGu7khlupaE61K/ya8kgNV9FiLkbGVD9Oiznn5ubImCxfLJe0Sk3TSSHGYGKRITbaMLsz2id+h6ILfoM8EX4zM6mD4IXjl3fdExOOHb+vpjTv/1QGUMtE0bNfOQeVpE6aWKuQwjm79CCaP32lZzb6I6m933mNyQLCYwIzF5RQYa9WHmw==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHc7X/84zX1ElDBQ0Oio9BYjYXYRYc0MA/fHbXj5R51/THLr4vqJR4aVL2yaCgOFpoqNtBnv/MOJOr6tRthqxxNdS9nIEhGzozzA9RfTYTN10TR95tDcGPVGTxPTpSHzqLfRVdfFkbfIjKlOicf/I/AdFh5kjO9kF4gsqjVv1liUuYuqyCbpu6Pg7s9iJijqR550YVGH1KtDbhzEU17UtJVRvHw3U49hOxg8lw1AheycMBhSIM7SpeJQR722GpHgNzHFVz9GHzPM/K95Gschu9p1SIkmpp29OT7DP7fG5/r5QRvuSlFnDMFbnYLiZrJCqCe7dNTJxZaZif4dNrl53i2bDuEHyxr88S/T6jJS2Z3QIUoW6iKFplUE8FvYgroEOLHbUVgs0eBgieGP685dHRvxBv5OuQQ1AvtbV640eTeoVCukgRg1DWH6wQubkjRuPCxQVGGXGOxUYcOA8byC0ZrnT5a3yCj0H6eFwfGPWoy6nVCgDzLrsLEcjcszjGXx57641XiQcOXEcB+1FBTE6RmrFeaEnAEp43pujviLo7sCxattlLFAASLN4yXRGqwVeZ2ooXaiGShbOrpna+dG+Bg8sxFNn5/IHf5XhUEmYmS1NnJdVnRHbXauEtFBksFMXRVs293xpdz8NrLMbfzPlNCA=</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaLrt0qMgl8Gj62Xp4gU1U4hPFg74nQhAk8y4DEF4jRx8sTnnEHVrYyDePKFPoto3G1Wsv+i0/W4Z3dIfK6jwWkC/dUMzrUYFom69h0C1evKHpk0NyrROCeQtQMYZMCXJ01mm8W30/JYIODlQhnEpmRKO36wLYHQ0VTA7qazq/1X3xJsAHbBZtF2rrn7KcKpj1KufeVAwJpxVc214rKbvX9G1eJdWyl1384zBtbVx1prqyBXZPU4hXM/fRUwYC0MMnSFOtQAh22SxmCsDunTuWIhgUmofpwBpA6B82zxRXNL5Ixlz/DsfcmHsXDcUmcTHQTYOy7aYSdj/ZzS7vz4DtIfaWkqegR3tDnUVtBQ7rO566ogNfZWuqIHqU7E+luZyWgo/5wO4USqYx44NjRByxlHAtorLKjhwI8dcB8FC5RmG38W5G7z8DPDUHLsKZhBvSGSpzZSntD+v7usDe69atTAyA7+sEaJ61ovnC9x3irR9ye7Bok4omRNbb3JcXiu9n5GlUvlvqimkfDfTdQqfYS8IXqY/5Lz66wIwSSJL+mRz+8xARHfCD7cPBT1kxTXdF65diH8tWQRDSvddHBulA/NDxW2EAfEObJwYiFbkRpgmqk64nz9sKvjm0Qsw68gqnoYkxnQQ02QQQ5KJwfsIw2C7rXtrc9Whdr8aKdYtvs8Zw1SlQYtrmA+CAW6rPg7YYSYD2JBhTzS1ONFOWsTLCg7qN96Fq6cKvpjNWK/QAm2FIzWDG4bbLggMxy7kwdmwduQmWaRpReYpYAO1jS00uITQox4zzTMkI8xkfs8o1MQUhKZpWD3YtYNEnD5C/UNwpLLBMDcxEqvxuRUrN7zY4E7osmA1gwWiSIgRw0RcCNaKEcE6o/fzvefYnq40zTtHOdGypRz8hOpVkp/4VOnuu/nUGyOZferCoIfj1a6ae1mb6joGD04/v0acXVsWzm67yjsHlSf9/XpLoSKa6BcL/0KHasSPc743wS6TLl4YqBE1njb+wg21RGFtLEIvLp8SwR1fn8THyWrAG1MiNCbTcsPcZvajjwcIuT7KCVfXqAjoYJfYEiPpBrsZAThmYD4vcUAx3qMzDbIGJiDObqELrnt/Gl//7T35iq61WdYlms/+f3YAJcI0ZxHhrzL09Zp789FccITPRNlppewipGZvm/apnSfYAneOPzzEROAx858WHvUetHXJtHHRwDZ6WxWRH7LO5qFTuib+HelkXzLugrZcr930meOFVa1gz13ACB4TIJSG5F+pOZHvyogTeuDeUUsejhoRy2VO0tzFpkVsP3L4dEnVY32yE+nosHQzyytyh+s8jwpS6GooqKjQtoA6UFDxA+HpG1NC6Q8HpRa5O5MQPqGjRJliOdtYDx9XhVhtj+bzBZsFPs/VmQmmp6QYvuSIOzzlb4Sg2Lxb2jEX3duLoCDivoiNuLimyRF5Yra0LxY3z6BfZ4ClYvI+jfIfuQ==</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Save">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9YOsGBbpE+Jo/Lj+o1uFoIXXx8nX5y+4CrJDQuH6DUi9v9+zNP8YgRHe+H9+tDdUdcx5oTGqY3H7WtqYQ3O8202+sAQO24TO7J+ZE7DFNCwZDcHXqxxNv8GvdHFpxogeNh9QBZ9RMPLcbYGq/qdwAnrtjQKnlS6GThjia4vFCJVsTaofW9c5/IWSVx75x47s/+bwB/o/qaY8T6O7zSkNUoGYqVVsqtg9I7sK9VMn+hpgfwslQz5GLCI/aHPCpo14b6xrK2dY7qYYBfhdGqx2iAnYvoVQ3KzussqeZvHGR2ZguOol0Cum238YGkaVyWl4kzJwoQU+T+U7BLdWRRPWN4=</Encrypted>]]>
      </text>
    </action>

    <action id="Clear">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9YOsGBbpE+Jo/Lj+o1uFoIXXx8nX5y+4CrJDQuH6DUi9v9+zNP8YgRHe+H9+tDdUdcx5oTGqY3H7WtqYQ3O8202+sAQO24TO7J+ZE7DFNCwZDcHXqxxNv8GvdHFpxogeNh9QBZ9RMPLcbYGq/qdwAl424A43VO4/r91C2duk3gHnn5rQdRMpTZEEfBGwk220rQUExIpo5Jjyu1kNvOSpiY5fKRYgWjN5dE5mggpxyo2cYvU2p/7Xw55hAk+S5prTlaN3tPi9qmjY49skQkyzsy33hXW1PcturI1gJZeGmvT</Encrypted>]]>
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