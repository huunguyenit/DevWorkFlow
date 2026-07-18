<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY defaultName "GridDetailFinancialStructureComparison">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" code="ma_vt" valid="systotal = 1" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo so sánh cơ cấu kế hoạch, bình quân ngành, công ty khác" e="Financial Structure Comparison"></title>
  <subTitle v="Từ kỳ %pf năm %yf đến kỳ %pt năm %yt." e="From period %pf/%yf to %pt/%yt."></subTitle>
  <pivot rowField="ma_so" columnField="xCycle" dataFields="gt" indexTable="2" indexColumn="1" indexHeader="2" indexView="2"/>
  <fields>
    <field name="ma_so" width="0" allowSorting="true" allowFilter="true" hidden="true">
      <header v="Mã số" e="Number"></header>
    </field>
    <field name="chi_tieu" width="300" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Chỉ số tài chính" e="Norm"></header>
    </field>
    <field name="gt" type="Decimal" width="120" dataFormatString="@analysisInputFormat" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tỷ trọng (%)" e="Density (%)"></header>
      <items style="Numeric"/>
    </field>
    <field name="danh_gia" width="300" allowSorting="true" allowFilter="true">
      <header v="Đánh giá" e="Comment"></header>
    </field>

    <field name="kind" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_so"/>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22ciTfxXLWkc6njlqPxulQ8Q0LC8B5NMqT/jHhfrgr+Va</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaIXQCjDEFew4S6PdFrd/PtyWewH1ofEeZLkfVbksMlmLVC8pcBvau1r8VdUoqJGEubgGyBspZDpLna+RkckNNlS0Gv+TJMbJoX8lAG/InNdqamLTU2dkSDXcuZVHe3Fkw0szwaHnJ2o17eJtHc+4eGl/EswpH4HiVrZfCyvFfpgYHvRWIf5l6fcyK+QUgF/jb201vEKzvgHzZeBnh6YOahZx30KWSjVFApLp8NZQW1Anhopp3IWEjM0F0sneJsxSXQ==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyWFfZ3ooX5WXTcH/JdD10vFgHt0Wkrr5EDvvXHgXyQAXmyUvYdxSQxDNPWNyghZAEg==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyEd6dUhmivDwyzoqUODQrqdt3byG7xNPGVq72xvP8sHI6z1LQEqRXdJqp0I3uO9y1mqJWSZY1qnQu7VWYX0jU8F4=</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHUCothhCKotCSIkskECrMjjn5opeaWiLu4KoXCu5Qdt9aQ8GCxUA4U9gFdZbZXojOw==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaItNJRZcWQCiHBntvQLZfiU4+nwYEz9QuGU+eldDzqiF7PVald+UjA6Nn4LNOoZGfiTfqM5yNS7/ZNaOFjrjdjbrjwRqmD1z9vnPHmRVjTRJ</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyEb1jl9/X1Igzx5HILLjYLWW2CSp9iMjvLcA5ebzAYa9NGWR5wjqyOJdwI+Ir+0Rhbuhk6pBcoX7ladRqFMdgw+XBHZv4KjbvKij9qBCefV3l</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHQkYKiv2RxmCSbcGW8Ud97s0ZVURCG2jT/iN5KXaEM2qUd3BvNwlf/HCEZu77j4Sw2UsCfXjRlicwrYBoio9VtnRowxoC8ZR8zTT6fslCygY</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&hcr+MLFw0Cvi/MPLsquJlpy8hzcrxmMgYBphT3AArR0iDjTE6Oak1vOh61yOuJO7GQP1ZSsyklfeN6oJDHYrWA==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyETI2WiGOq6VNUevZE9pq357DcNxnQ9HSc0BB2LwNdOowd5xhuCTqWPlyeJGmutd9k7dwE8Gc4P4qPGxTeRj4bucx6M+d3F6FXNhcsgb9ftCYWg+H14jUjCv12RPy9rn0ko8SwfMbIq5OunKZ0p4msrCMm9f51kqx1l1vnQLf1iHDaiyiIyyvlw/OH2j+2sz2DeHy1dM3ENEawHBh4d2q0rTvoaWLg1Q9zqN01pdMc1rrLyQUgBEJVZ5YrCyJrkGV7fCLUdQucJVsfLgWndBraen7tcPadqpNpYfGZx/O0Bg4HJvTtPIhjCPyo5+yMW6dhsneGQB+VFagXd0+v33b8rL4HZPRJKkjTraC1TXnE4jGZmMuhhU4a3l/uFnlRoPkYpsXtX4xC84m0oi/UiZuRlt7sH6ysZqjSonXaM+xGhBsY3PWzj7HOd7MCLzdmQyGFpgf1NU+6PWlVu6Y7wlXmMbjZ3daFA19ExcZalgsqSjAPjYbkHB84cC9r3hfvAcgLKsrp68RTnOhGrZEMS56Ge6PsQEEGPBRBUDvosVeB2FRnpBGxc5zSso4geS87jb/50ON/fb2CqneR2MbKvMJWgOSZTxbE1wE2q2NvzAuFnfld86pMXxpHks92dCdhxk2mMQxI8v2Fk8Ry4HR75b51neLHJ88L4ElOM+apDMONIARMUkKL098qH6xU12hp//vyfkPi/b3DQT5hNi/UZQBjo1fPD7fC4jj3IL6uJAU6kFXvPKTu1K1MmnPmLNZ2fkFQ3Tb/q6O4KYiB/CstKljI3Zv0Qs1HXx3d5ab6mniqHqVs7Z3Z+tYQQiqnkCqTgQ0CNNoTOKv1hqB6tBi1CFHN2lcMgnccv30w5verVy+qei/5lrlQki8FTHiA5vi2QcETEYKXEq+41wFa+PTz4GZ0rkk+GwsQckcRvLpVkJLvfk8uz3NJFlPJLGDwYkiUSFmpBiG0yJsy8U3Uga7gd7fzTe8JllWWY5HhN/DLwT45F1luP1sE0GhhT5oYu/WF/4rHqpOBk5hk5YpGKVasL1xa1SzM/XueaNshoeAVqXljynqf3oHasw3lS8WykfREd4dyx/EJ7+Gzbfa7nd/J+qc3FiaLYOTPTzX/Yc96wbx3aM+sP1+m1r+KF5Obgv0yfopi45ZN3W//DhLy8bWWVjSteq2HMDgBIWKPSEp8UYY/bPMHqz2//JBOHZessFZBG/dcHKx47oAlz/AcX8yo4pxRXIG6a4eAyXoew6oAVnqXjp8Ait3pQFheblX1SVsXe3ZTBhrRc6fO1gSTjZT7t/B5cHnNKibh9gV48uI51L3G938</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&zRJIg4IrJ8FD8GxnZu9KjNhP7YUpqR+WwcM+pDXn9oc/1IPUteKc7EBjcmj+gcWw0JupSKvAlD1kGalgM18cT+BG7fX8NP8FLYZ84qfGu7kzW9m+8KOzPmeRZ/cjQvuAFSeNP64PbkLzwAeL+tdMQrsMEAnXR6C02CXUNPXj6tEjJZzqDt6da8ZBjX94wQbVYHTR1Zza+mBbdt16qxix+V85CO84IXh/UOTCXu14hxx3BG9Ar9DhRfm4m68APksMa4Wg4SRo1n6KwAso8FOw8w6GSZ+1a4CBqZNMXkwNHO5oKnb5K4sQJv4EhrgrPTTkws+qE9oDtpEKdekuAdzfCKzc2K7SFIM+pziXONjdhCySG8LtSRlqLqBPdpqvwNCQwa988pwKVl4yXmyKjfj346yrEHbeoiPeHffs1PsMDfEWs/GviW04DVj6owZYsd1m</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHc7X/84zX1ElDBQ0Oio9BYjYXYRYc0MA/fHbXj5R51/THLr4vqJR4aVL2yaCgOFpoqNtBnv/MOJOr6tRthqxxNdS9nIEhGzozzA9RfTYTN10TR95tDcGPVGTxPTpSHzqLUALvksl3OTwW4uS/MvASGCFMbOk11BtSISlY3Rb1sS2tLfD3aoK9C33EDGDL5v/s+7nY7jJhzMZTl0C5ky4zJ8vhdhSt7MdKd22fAskvrdZKTKV9i7PMMrZIok4AwSSm98yV/qhRCWyJWCl9tPUj5i/uxAa5xBXY/52HNkWhBl/sJwmIhwR1s8GvwUj7hWcU0E6RuBkDU8ju28+vWd501Y7qz4jAn7MP0zq5v3shMvgm8Mtf4NWHzUVFYgWR7Jmp07qyeXgHnDqd6VUfEFtaxqESPigAnl6LkBRU5IFB7xogliXmcy0zaTJD5sHldTJ7L7ZHfcBTbE1jOB3gc2PvkRmvqyPkNZOOrrMRDPT5/0HuJG3ZqMwIxtie6DwYF0kw0DgDvsjTzwFyguisgDKpXupK75lep3IYXIk7s6jkFyffDEkSWkBZbNiJo42cdB8Xy93gEYyec1t3+GzsTexIefHaYFqjkqr3KPy86mftlWvR0ciBx1vUTKX6vWyqvSzJqGXd4ep8tF9Ekti4CVJapcFrUEW1oljLtMW/BT5036X4QtcjnnDPBtYqZpb6VwTCJICMoD3Yj3HHqO/0+HkNZjRWCe15OIoCuPbHkhe6KqT7WeSo97vCFgyaltfP16epxuEd3fkywt0RmQOC28pYrDe9vajNRSPmLzE9krye9AB</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaLrt0qMgl8Gj62Xp4gU1U4hPFg74nQhAk8y4DEF4jRx81+3lByeDk7qcZtuoV17ZktROiKPrOsbqU9MHgju/sAK79hVreX27JtK+m1gU49QDx6OEaVsTOdRSE9EdlnG55KH4Wpkz6tmRhyJ+zNzjgsHqV79SnqfguEW/E9Mr90BIAwjHRoi3hUxptCa2YI5c+gFCeZdVGsDEx+KkIxi/voMOnH4OUn6YK7ceHOozSAvmZ1xL+ywAyDeOPB852OI/PuK/gcnlnIdLsJ/0sYYZG0Hb45+YbZGOz25MY4/ijtmPmJ7PrTeDS8oKEY9r7RvMz700397d4HwD5xylO+bAx7XWJdiwpvU8p/8S3LX3GNCl1Rpsyw3ivr8+To3SZSI2PFSCPwn8S5Btszd1sBJThpe79omH8dDfL5I0M01LPvV39spxGzFrgMcMwFi3CAjRAWiuZenewWmU6SxyvIcz3S/lFamsgEjIbvt8BnZ2fTEi3uw8S0m0IDPmAh10Ax0OIWzsUbPkV6Og7lLeeJjC8jPLLFxq+hV676e78LxpxeGwOBJcqm9mPnsbNVTKvO/siWJlpdPyJ8hlCFaEp+/WIITDqleD7YULTe2ipwiykhMOLaz71Iv+kpQEjtJb+NLps8RZbY/ANlnl6VYDyOQ6oLWnoft/iGCnoLf1Zs7A9sjsVDcmU8RMorb5YkxkTMtKlJIr/LtbTGzv/2GHA+unsNLuKxJHE8PZ1cTkjayIYmkqP0/dKDJDa26JUKH2kIW46yM6Zn3kyeN1k6f0tILr9c0ByYUy8SkhXQxm4+/zB634dh4BteImGy+com8nvPHfThhSyd9LNG4D/4ZqomLt06IkpnmvAHPxkoxxtKKJ0a2Cq5eON9QqPvWpw9gGZcVzIpZExJLPE4PgwxU/8xB7OnSMNGIUgViRGamhDAYROwiLMDWJTDu+EErpryylB7uq9UMIFXjrLgdjNa3BB1PDsFP7XoAgg4CM5KYigQxOfE3jBJEZk6LJsvLqwsc7GJfDoheRaOFTYdJ8xZEp3TneuT+Y/cxn3XeXoLAjoI6TcMicHUdzvSyOwlq/Oc1DgvQ12FIbhPEPuIzRTM8IcFarcsrTCxfPnpm+lOVUg2aRp/f/92DAMCY7EP/41iOkXhPFSJt5roRTZv4q6mv/cOohABKWklJk79P1phqZGmbFJGm2qErdP5HZcBYHq3E88FT4W+sAMJGh4KbSpyKLqwJTcddsVkjhKoMnRldl+kWnJhMqJNMAYbW1M1wDPX9hGBaA7FNm5gQ+Rudb03yE4br++a203TJl3d4mGFvS+yrKtx+3zWXR7CfjT2uuGoVxQcvze125RjolPTw2/TpTzpetpM/TA4amx+a8KeR0Kjri+ow+OkxHi5ZjJsFAfMPZLW3P6yZMupf2UFDL/aaFNKs/v5MuOmrTG6QI1yYd2xIg+kldyR7/ibG3pUBzpwywfraFqJxze69/Sl0ahUnNseiDGP48eAJeqFdJccRuprkU1uH+avZSpXrqRyKVPkOE8WYJOanYxB6xjw7CHHgXAT1lHV0EXHYg7JFsoGRpJ/+wBV5PQBbOm6P/tm/F7yqsiKnoVoXtczD4JIWXoXcRYNSpJoeeiVcWk3GPr/NABBuXIevftvbDU1wzkmngHHdp43SW6tvaaW1NUtSs4MoSbXNSSkk=</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Save">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9YOsGBbpE+Jo/Lj+o1uFoIXXx8nX5y+4CrJDQuH6DUi9v9+zNP8YgRHe+H9+tDdUflf3VPaABFiCYWgSxAZSbPTxVtJxcmrlOT1bJ8nLdIaSvBst157UAZlA1v7AA2N5ExocN5T22ePz7jz92CoYWB2iZcgjZaGguvGgbiNSxY3TC8kpKSIxGKNXZLo7XLUgoxmz+VFnt7E9/MPj0mI4xWbWqg1fG9DsHJVzqbdhZ29HBiMSo8p0SRasaJJosmhiZuj2ZLGXvQRCznVF/iNtBtGK8HULQXHzZtJIKdi3XdVQFi3w2GTOmqPA8WWSxAlhx51H1LBhvlE/MNjZYSbp7k=</Encrypted>]]>
      </text>
    </action>

    <action id="Reality">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9YOsGBbpE+Jo/Lj+o1uFoIXXx8nX5y+4CrJDQuH6DUi9v9+zNP8YgRHe+H9+tDdUflf3VPaABFiCYWgSxAZSbOqAsWX1AtC58iGQ6MOilQXIn9wRuWwFC2/kb4cdU3zqfMfgAUwFNYE6tJaRkgdMktcRMb3460IqdhahE790aDTdex5orI8D0M4eVR2YShEgQwihCHJNTSp5FmUKkKswrjf9j6X41jpC+O9H4gYU9rYjcVIBW0ebPEJnFp3d7Sg8K/8CcS0fVm3sOtUHtnCn1jvqtVqdYM8bxGI+T4QKR+ITokkfFa+0XipdWltb7dO/li1F0W2RR578PxmzjjCCXE=</Encrypted>]]>
      </text>
    </action>

    <action id="Clear">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9YOsGBbpE+Jo/Lj+o1uFoIXXx8nX5y+4CrJDQuH6DUi9v9+zNP8YgRHe+H9+tDdUflf3VPaABFiCYWgSxAZSbPTxVtJxcmrlOT1bJ8nLdIaSvBst157UAZlA1v7AA2N5ExocN5T22ePz7jz92CoYWDOwNkxR94ZnBeiefkXJxE7bMXUZO0NEBKppt+DL7LRj87s9A18Pq/zVilstzuV/iS01Q8zuQOtJ413Hi8/kzGu1OQJLr5LP9gb6q/WzIzKMq6TVjDX75eSALEtprRA+lxp0CP3Tf1/s/jo/LZar/HDSpgor5z6imYXJf9O1NVxYw==</Encrypted>]]>
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