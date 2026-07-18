<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY Identification "rptFinancialRatioComparisonMultiPeriodsGeneral">

  <!ENTITY JavascriptGraphReportInit SYSTEM "..\Include\Javascript\GraphReportInit.txt">
  <!ENTITY defaultName "GridDetailFinancialRatioComparisonMultiPeriodsGeneral">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" code="ma_vt" valid="systotal = 1" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo so sánh chỉ số kế hoạch, bình quân ngành, công ty khác nhiều kỳ" e="Financial Ratio Comparison Report for Multiple Periods"></title>
  <subTitle v="Loại kỳ phân tích: %pt, số kỳ phân tích: %pNo, từ kỳ %pf năm %yf..." e="Analysed by: %pt, No. of Periods: %pNo, Period from %pf/%yf..."></subTitle>
  <pivot rowField="ma_so" columnField="xCycle" dataFields="gt" indexTable="2" indexColumn="1" indexHeader="2" indexView="2"/>
  <fields>
    <field name="ma_so" width="0" allowSorting="true" allowFilter="true" hidden="true">
      <header v="Mã số" e="Number"></header>
    </field>
    <field name="chi_tieu" width="300" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Chỉ số tài chính" e="Finalcial Ratio"></header>
    </field>
    <field name="gt" type="Decimal" width="120" dataFormatString="@analysisInputFormat" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Giá trị" e="Amount"></header>
      <items style="Numeric"></items>
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
      &JavascriptGraphReportInit;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22ciTfxXLWkc6njlqPxulQ8Q0LC8B5NMqT/jHhfrgr+Va</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaIXQCjDEFew4S6PdFrd/PtyWewH1ofEeZLkfVbksMlmLVC8pcBvau1r8VdUoqJGEubgGyBspZDpLna+RkckNNlS0Gv+TJMbJoX8lAG/InNdq7Cdhd8aYNKcr8iuinv1gyGti2UkKId6I7oS7yiyBRUfKmqBsPU7mg0J5J06A6CfBhSM5RRn/eHC8UQNfIrdxj80blhdHMajD0G4W/8yLyh8=</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyWFfZ3ooX5WXTcH/JdD10vFgHt0Wkrr5EDvvXHgXyQAXmyUvYdxSQxDNPWNyghZAEg==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyEd6dUhmivDwyzoqUODQrqdt3byG7xNPGVq72xvP8sHI6z1LQEqRXdJqp0I3uO9y1mqJWSZY1qnQu7VWYX0jU8F4=</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHUCothhCKotCSIkskECrMjjn5opeaWiLu4KoXCu5Qdt9aQ8GCxUA4U9gFdZbZXojOw==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaItNJRZcWQCiHBntvQLZfiU4+nwYEz9QuGU+eldDzqiF7PVald+UjA6Nn4LNOoZGfiTfqM5yNS7/ZNaOFjrjdjbrjwRqmD1z9vnPHmRVjTRJ</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyEb1jl9/X1Igzx5HILLjYLWW2CSp9iMjvLcA5ebzAYa9NGWR5wjqyOJdwI+Ir+0Rhbuhk6pBcoX7ladRqFMdgw+XBHZv4KjbvKij9qBCefV3l</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHQkYKiv2RxmCSbcGW8Ud97s0ZVURCG2jT/iN5KXaEM2qUd3BvNwlf/HCEZu77j4Sw2UsCfXjRlicwrYBoio9VtnRowxoC8ZR8zTT6fslCygY</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&hcr+MLFw0Cvi/MPLsquJlpy8hzcrxmMgYBphT3AArR0iDjTE6Oak1vOh61yOuJO7GQP1ZSsyklfeN6oJDHYrWA==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyETI2WiGOq6VNUevZE9pq357DcNxnQ9HSc0BB2LwNdOowd5xhuCTqWPlyeJGmutd9k7dwE8Gc4P4qPGxTeRj4bucx6M+d3F6FXNhcsgb9ftCYWg+H14jUjCv12RPy9rn0ko8SwfMbIq5OunKZ0p4msrCMm9f51kqx1l1vnQLf1iHDaiyiIyyvlw/OH2j+2sz2DeHy1dM3ENEawHBh4d2q0rTvoaWLg1Q9zqN01pdMc1rrLyQUgBEJVZ5YrCyJrkGV7fCLUdQucJVsfLgWndBraen7tcPadqpNpYfGZx/O0Bg4HJvTtPIhjCPyo5+yMW6dhsneGQB+VFagXd0+v33b8rL4HZPRJKkjTraC1TXnE4jGZmMuhhU4a3l/uFnlRoPkYpsXtX4xC84m0oi/UiZuRlt7sH6ysZqjSonXaM+xGhBsY3PWzj7HOd7MCLzdmQyGFpgf1NU+6PWlVu6Y7wlXmMbjZ3daFA19ExcZalgsqSjAPjYbkHB84cC9r3hfvAcgLKsrp68RTnOhGrZEMS56Ge6PsQEEGPBRBUDvosVeB2FRnpBGxc5zSso4geS87jb/50ON/fb2CqneR2MbKvMJWgOSZTxbE1wE2q2NvzAuFnfld86pMXxpHks92dCdhxk2mMQxI8v2Fk8Ry4HR75b51neLHJ88L4ElOM+apDMONIARMUkKL098qH6xU12hp//vyfkPi/b3DQT5hNi/UZQBjo1fPD7fC4jj3IL6uJAU6kFXvPKTu1K1MmnPmLNZ2fkFQ3Tb/q6O4KYiB/CstKljI3Zv0Qs1HXx3d5ab6mniqHqVs7Z3Z+tYQQiqnkCqTgQ0CNNoTOKv1hqB6tBi1CFHN2lcMgnccv30w5verVy+qei/5lrlQki8FTHiA5vi2QcETEYKXEq+41wFa+PTz4GZ0rkk+GwsQckcRvLpVkJLvfk8uz3NJFlPJLGDwYkiUSFmpBiG0yJsy8U3Uga7gd7fzTe8JllWWY5HhN/DLwT45F1luP1sE0GhhT5oYu/WF/4rHqpOBk5hk5YpGKVasL1xa1SzM/XueaNshoeAVqXljynqgyO/aitTvKMFrpDNzeO21bMyQ4EcN/DlaSKAtDb0td+Zpx3484TcEpH9s1aAMTJYFBfZfwjcwDvJ98/+1+c1AId6WrJN17yFxfr/0Pr6TX7IkBQBNLdLycIzdPu8Et48M6lyaFLueA3K8eB8bZNUjTFNgO2gvAdCOZa92Sq8+d+BO6I/pgKin6EQUa64psbgKJR1vclKaDF0D07P3tihV5jPy1grMzo7OgyrgjhwsWtPCVRZDf7hCvvfgjSi6lef1sM0RLhbrQWaT/iXw6JYvg==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&zRJIg4IrJ8FD8GxnZu9KjNhP7YUpqR+WwcM+pDXn9oc/1IPUteKc7EBjcmj+gcWw0JupSKvAlD1kGalgM18cT+BG7fX8NP8FLYZ84qfGu7khlupaE61K/ya8kgNV9FiLkbGVD9Oiznn5ubImCxfLJe0Sk3TSSHGYGKRITbaMLswLXE7Bb+jTS5qCAzw/tlL9GQ/U4YIzjsEZQYxuFCmdBY7Fizh7ulhBVKOHIJT+grf9V91o4LZT4WHEE8m9DFxVGUhoNTC+rMdZ1r8uHuLLTSOotGDmB9fC1Az2sOD05am6km6tMb0pmN/IFoiMBBh2t/XKGU82sQ/+etblVvlYG4QCPDvzEYvNuhnrFEAfgZCysoN3nLkroKjHMMrTXzzCE2cykE01qHnR4KoTSzJHPjS55Knwx4pl+4C7dSw1TE0=</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHc7X/84zX1ElDBQ0Oio9BYjYXYRYc0MA/fHbXj5R51/THLr4vqJR4aVL2yaCgOFpoqNtBnv/MOJOr6tRthqxxNdS9nIEhGzozzA9RfTYTN10TR95tDcGPVGTxPTpSHzqLUALvksl3OTwW4uS/MvASGCFMbOk11BtSISlY3Rb1sS2tLfD3aoK9C33EDGDL5v/s+7nY7jJhzMZTl0C5ky4zJ8vhdhSt7MdKd22fAskvrdZKTKV9i7PMMrZIok4AwSSm98yV/qhRCWyJWCl9tPUj5i/uxAa5xBXY/52HNkWhBl/sJwmIhwR1s8GvwUj7hWcU0E6RuBkDU8ju28+vWd501Y7qz4jAn7MP0zq5v3shMvgm8Mtf4NWHzUVFYgWR7Jmp07qyeXgHnDqd6VUfEFtaxqESPigAnl6LkBRU5IFB7xogliXmcy0zaTJD5sHldTJ7L7ZHfcBTbE1jOB3gc2PvkRmvqyPkNZOOrrMRDPT5/0HuJG3ZqMwIxtie6DwYF0kw0DgDvsjTzwFyguisgDKpXupK75lep3IYXIk7s6jkFyfrE5datFIBo1zOdKFXIS8YJO1PTrAo+gj4qeYgPtnsbNYedmC/deTQ/zz6e+RcNtKw6U64Sj5cHNM0J78SAN9FSZMoQfNKVDa1mff8CqGCRRhBZDAhkbUDYSasTC5urmT9PFk0sgGI6Comi7UbTOLbPttrnRoF3MGTi0b6MqC9fsqeVo/viI4X4BsB2K20Mn8yIpZjY6u5JKlc4gv5DKp4aZ8TnW02dNYJlONxnTvVjHS/cfCzt1QajMbPiud3Ej6</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaLrt0qMgl8Gj62Xp4gU1U4hPFg74nQhAk8y4DEF4jRx81+3lByeDk7qcZtuoV17ZktROiKPrOsbqU9MHgju/sAK79hVreX27JtK+m1gU49QDx6OEaVsTOdRSE9EdlnG55KH4Wpkz6tmRhyJ+zNzjgsHqV79SnqfguEW/E9Mr90BIAwjHRoi3hUxptCa2YI5c+gFCeZdVGsDEx+KkIxi/voMOnH4OUn6YK7ceHOozSAvmZ1xL+ywAyDeOPB852OI/PuK/gcnlnIdLsJ/0sYYZG0Hb45+YbZGOz25MY4/ijtmPmJ7PrTeDS8oKEY9r7RvMz700397d4HwD5xylO+bAx7XWJdiwpvU8p/8S3LX3GNCl1Rpsyw3ivr8+To3SZSI2PFSCPwn8S5Btszd1sBJThpcEki0CZRJv1cQ2NWy1O596dQHfVLb7r/MTXTogg+nyqHTGX4Ul33Q7UtfPWVh8xKhkzYvA+R4+4NaECsxjzyTb09+88yf5n/dgtiBfxxA736hFM5oKrfAp3qX/O1HbO7KlNxitvdXIZkZQhTqh+EMr7tkprmsginXJ5+EGmHu3TETvuYDfsa6pEk4I+nJCBmq3iGBiKKkFdBMcA0I1IiSr3VDfW8G0BT4zacQA0+kRLFhMc1N8+ZnBqHfm5ok9UF1Jini33/BfjQUIdhmbbG8IgDMw/CeaZ4Pj2CMWNOsrJyqXhiPQgDDnNmHEyk457HvoocZZRfURRmUQxfC34EUnG36ctVgFfSDZ5dByPe5QBOVoY5ArBHLx4LkxwnNA8dkaMjglhv69jkBCNxeQYFxt3sWgzZ9zpOmmlerQvYvn4tIIEHBEQOySynm91g0R0bUo2uNTVqrXAnzfzq2ChUiydU5TLsD5JXLYTR38SG7YFQ6CADkdSjHwlwWRnnu+QQBiGWrXSP5PSuVWQeGUKT4LJquILfEavoIUwDoxtcs8yjmBEUzruX7sak4/MXdpctCBFiJvDlyufbDWGqZS04ah1+U7wvvqivvorMTMswH+WEUYHDMowifYGAd40XSf+fqF7k7P/gj5WnvwOpDbxusfIVL0Bd8jtAQbtPA+8jm7TG5sIgVPppvc9glSWF4Kc6rKTPlcfx1fs4HTr+78/reDMiQrRUZZqv1rmMk5CHisIZRsTsUvFbCPXcVDuiylh/pVcnbxzkf7zPt+pN/cMAoaqGrTYztjDf5VV555uWJ7GJpnm8W8S5gUnHHwJ0c9BPKtpZiNzajLXRfZNjwsk4/t/P1PnlgmO44fh5VfdJtm2awFUB6Z/OELA9OmlLo+zgSauN9kXYMBxLROyhDsFWsVe1QLhTxkZJoKJ0on1VUJnZfuQRxFoebfO1FRZguhIvlftF88nyaKUHFmXw9wjGcrxkQwAVfmHhhDIaxCtCtBKTp/vnieLtF6lycQYo9JOY7mx2IZPOUsa6cVswmAEiCRTdyXDM0kji7q/hXvLcrEdHO1TVA2yINF8wMCprjvyR8XzKbyUmS7c+cDgdaRm5ES2Ppnwm57octd1Rbb9BmXZK5cC3ggKp/uSYjAcQoxcglGirKvvgLfNBrmM2fnX1HImqgdAySQIl542Ifq5DafLH/o1vGoeOkXUKedFQHmEfF+uMY0SlHFgsejZNIi5rRh</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Save">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9YOsGBbpE+Jo/Lj+o1uFoIXXx8nX5y+4CrJDQuH6DUi9v9+zNP8YgRHe+H9+tDdUdcx5oTGqY3H7WtqYQ3O821CQLXeolctoXZZFNh/AWRhkose04VYiO5wQye0VGU1oq8ukdZRJ6gPNUgHSmT15FIdCmuxEodzwiEi0hWf/CpDNqL5cERyA2lizna/ZN14MOPfKm/akgwKxGJxeBa2UwEH5l0OgOfJwJatZ9uv3OYoWC8mWKy8w0H5vO2xvcE3pQ39xzuyOFBy8hc3MahYADVWPx0V3S9m2mH9rlL9eVCIDDfI3X8J0iKT7XKh8d5uM5DokUubQx4vyBWnhBFNNq4=</Encrypted>]]>
      </text>
    </action>

    <action id="Reality">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9YOsGBbpE+Jo/Lj+o1uFoIXXx8nX5y+4CrJDQuH6DUi9v9+zNP8YgRHe+H9+tDdUdcx5oTGqY3H7WtqYQ3O823lyQErvpMGZJ68fXFTZisWth0OTGvWrZ5W6VR8TnyihQMf5NBtqM2QqmDnNL7ItbX3MMpMhL3JgwEXq+14za0OsPhThANyuFybepTE7rytHLkg5bnVGOG17yE9vSspwqDL81RsVmUQ59qL2myqWZodJvCO5Yp78VG9bu3ySgycd1DimUHIp5Z4IT6r8nkaIYS18EcmG6cDMuDEVOy5VPVW94bNR0SkWssAZmxq+61VywqZQG/T4Mmao/L0egkxa2g=</Encrypted>]]>
      </text>
    </action>

    <action id="Clear">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9YOsGBbpE+Jo/Lj+o1uFoIXXx8nX5y+4CrJDQuH6DUi9v9+zNP8YgRHe+H9+tDdUdcx5oTGqY3H7WtqYQ3O821CQLXeolctoXZZFNh/AWRhkose04VYiO5wQye0VGU1oq8ukdZRJ6gPNUgHSmT15FKUtqFgxVigDyfQx+tUQ04bd687gKFGvJc1s+BO1UyZGSDJx34+6BjpaG/OzZ2Gr2d8p0knrWNoYXJ4dI4O/UACVyuiBfC6wkDiwZSfqrX8HG4v4f7ZKmQQchIgMUT3XtQeOlUsO3Nnx0NkH4Dlvo0ecgWDnR5ZTtH66E2A3ALJBA==</Encrypted>]]>
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