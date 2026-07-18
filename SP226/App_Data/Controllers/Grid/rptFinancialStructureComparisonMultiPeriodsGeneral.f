<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY defaultName "GridDetailFinancialStructureComparisonMultiPeriodsGeneral">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo so sánh cơ cấu kế hoạch, bình quân ngành, công ty khác nhiều kỳ" e="Financial Structure Comparison for Multiple Periods"></title>
  <subTitle v="Loại kỳ phân tích: %pt, số kỳ phân tích: %pNo, từ kỳ %pf năm %yf..." e="Analysed by: %pt, No. of Periods: %pNo, from period %pf/%yf..."></subTitle>
  <pivot rowField="ma_so" columnField="xCycle" dataFields="gt" indexTable="2" indexColumn="1" indexHeader="2" indexView="2"/>
  <fields>
    <field name="ma_so" width="0" allowSorting="true" allowFilter="true" hidden="true">
      <header v="Mã số" e="Number"></header>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22ciTfxXLWkc6njlqPxulQ8Q0LC8B5NMqT/jHhfrgr+Va</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaIXQCjDEFew4S6PdFrd/PtyWewH1ofEeZLkfVbksMlmLVC8pcBvau1r8VdUoqJGEubgGyBspZDpLna+RkckNNlS0Gv+TJMbJoX8lAG/InNdqK3NPjzwfCzUjvgq0Ta9nmBdShlRLq12zo5WmXKNeuQKvJ4JeZnEQLsD4H5D6vnKIP50gylta0O4qQHBryYb/H+L20HkSGkhYdKH29BXKJ/SKXjXOldc4JJY7bJqs/pZLGzZ4QO9/b2anxh5DxOgX/A==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyWFfZ3ooX5WXTcH/JdD10vFgHt0Wkrr5EDvvXHgXyQAXmyUvYdxSQxDNPWNyghZAEg==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyEd6dUhmivDwyzoqUODQrqdt3byG7xNPGVq72xvP8sHI6z1LQEqRXdJqp0I3uO9y1mqJWSZY1qnQu7VWYX0jU8F4=</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHUCothhCKotCSIkskECrMjjn5opeaWiLu4KoXCu5Qdt9aQ8GCxUA4U9gFdZbZXojOw==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaItNJRZcWQCiHBntvQLZfiU4+nwYEz9QuGU+eldDzqiF7PVald+UjA6Nn4LNOoZGfiTfqM5yNS7/ZNaOFjrjdjbrjwRqmD1z9vnPHmRVjTRJ</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyEb1jl9/X1Igzx5HILLjYLWW2CSp9iMjvLcA5ebzAYa9NGWR5wjqyOJdwI+Ir+0Rhbuhk6pBcoX7ladRqFMdgw+XBHZv4KjbvKij9qBCefV3l</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHQkYKiv2RxmCSbcGW8Ud97s0ZVURCG2jT/iN5KXaEM2qUd3BvNwlf/HCEZu77j4Sw2UsCfXjRlicwrYBoio9VtnRowxoC8ZR8zTT6fslCygY</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&hcr+MLFw0Cvi/MPLsquJlpy8hzcrxmMgYBphT3AArR0iDjTE6Oak1vOh61yOuJO7GQP1ZSsyklfeN6oJDHYrWA==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyETI2WiGOq6VNUevZE9pq357DcNxnQ9HSc0BB2LwNdOowd5xhuCTqWPlyeJGmutd9k7dwE8Gc4P4qPGxTeRj4bucx6M+d3F6FXNhcsgb9ftCYWg+H14jUjCv12RPy9rn0ko8SwfMbIq5OunKZ0p4msrCMm9f51kqx1l1vnQLf1iHDaiyiIyyvlw/OH2j+2sz2DeHy1dM3ENEawHBh4d2q0rTvoaWLg1Q9zqN01pdMc1rrLyQUgBEJVZ5YrCyJrkGV7fCLUdQucJVsfLgWndBraen7tcPadqpNpYfGZx/O0Bg4HJvTtPIhjCPyo5+yMW6dhsneGQB+VFagXd0+v33b8rL4HZPRJKkjTraC1TXnE4jGZmMuhhU4a3l/uFnlRoPkYpsXtX4xC84m0oi/UiZuRlt7sH6ysZqjSonXaM+xGhBsY3PWzj7HOd7MCLzdmQyGFpgf1NU+6PWlVu6Y7wlXmMbjZ3daFA19ExcZalgsqSjAPjYbkHB84cC9r3hfvAcgLKsrp68RTnOhGrZEMS56Ge6PsQEEGPBRBUDvosVeB2FRnpBGxc5zSso4geS87jb/50ON/fb2CqneR2MbKvMJWgOSZTxbE1wE2q2NvzAuFnfld86pMXxpHks92dCdhxk2mMQxI8v2Fk8Ry4HR75b51neLHJ88L4ElOM+apDMONIARMUkKL098qH6xU12hp//vyfkPi/b3DQT5hNi/UZQBjo1fPD7fC4jj3IL6uJAU6kFXvPKTu1K1MmnPmLNZ2fkFQ3Tb/q6O4KYiB/CstKljI3Zv0Qs1HXx3d5ab6mniqHqVs7Z3Z+tYQQiqnkCqTgQ0CNNoTOKv1hqB6tBi1CFHN2lcMgnccv30w5verVy+qei/5lrlQki8FTHiA5vi2QcETEYKXEq+41wFa+PTz4GZ0rkk+GwsQckcRvLpVkJLvfk8uz3NJFlPJLGDwYkiUSFmpBiG0yJsy8U3Uga7gd7fzTe8JllWWY5HhN/DLwT45F1luP1sE0GhhT5oYu/WF/4rHqpOBk5hk5YpGKVasL1xa1SzM/XueaNshoeAVqXljynqgyO/aitTvKMFrpDNzeO21bMyQ4EcN/DlaSKAtDb0td+Zpx3484TcEpH9s1aAMTJYFBfZfwjcwDvJ98/+1+c1AId6WrJN17yFxfr/0Pr6TX7IkBQBNLdLycIzdPu8Et48M6lyaFLueA3K8eB8bZNUjTFNgO2gvAdCOZa92Sq8+d+BO6I/pgKin6EQUa64psbgKJR1vclKaDF0D07P3tihV5jPy1grMzo7OgyrgjhwsWtPCVRZDf7hCvvfgjSi6lef1sM0RLhbrQWaT/iXw6JYvg==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&zRJIg4IrJ8FD8GxnZu9KjNhP7YUpqR+WwcM+pDXn9oc/1IPUteKc7EBjcmj+gcWw0JupSKvAlD1kGalgM18cT+BG7fX8NP8FLYZ84qfGu7kzW9m+8KOzPmeRZ/cjQvuAFSeNP64PbkLzwAeL+tdMQrsMEAnXR6C02CXUNPXj6tEjJZzqDt6da8ZBjX94wQbVYHTR1Zza+mBbdt16qxix+V85CO84IXh/UOTCXu14hxx3BG9Ar9DhRfm4m68APksMa4Wg4SRo1n6KwAso8FOw8w6GSZ+1a4CBqZNMXkwNHO4vluoA53CHx8gY0MKeaE8NY+u4xbIpl8SrqVA3RKS+1abSuj/W4d2FadEPZ0h8QnnLki644lYTwFJvBp1Lwb4K3mtuEQ52Jm/rJg9AG1gdepipa48Zcdf832N2/Qiqt+k=</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHc7X/84zX1ElDBQ0Oio9BYjYXYRYc0MA/fHbXj5R51/THLr4vqJR4aVL2yaCgOFpoqNtBnv/MOJOr6tRthqxxNdS9nIEhGzozzA9RfTYTN10TR95tDcGPVGTxPTpSHzqLUALvksl3OTwW4uS/MvASGCFMbOk11BtSISlY3Rb1sS2tLfD3aoK9C33EDGDL5v/s+7nY7jJhzMZTl0C5ky4zJ8vhdhSt7MdKd22fAskvrdZKTKV9i7PMMrZIok4AwSSm98yV/qhRCWyJWCl9tPUj5i/uxAa5xBXY/52HNkWhBl/sJwmIhwR1s8GvwUj7hWcU0E6RuBkDU8ju28+vWd501Y7qz4jAn7MP0zq5v3shMvgm8Mtf4NWHzUVFYgWR7Jmp07qyeXgHnDqd6VUfEFtaxqESPigAnl6LkBRU5IFB7xogliXmcy0zaTJD5sHldTJ7L7ZHfcBTbE1jOB3gc2PvkRmvqyPkNZOOrrMRDPT5/0HuJG3ZqMwIxtie6DwYF0kw0DgDvsjTzwFyguisgDKpXupK75lep3IYXIk7s6jkFyfrE5datFIBo1zOdKFXIS8YJO1PTrAo+gj4qeYgPtnsbNYedmC/deTQ/zz6e+RcNtKw6U64Sj5cHNM0J78SAN9FSZMoQfNKVDa1mff8CqGCRRhBZDAhkbUDYSasTC5urmT9PFk0sgGI6Comi7UbTOLbPttrnRoF3MGTi0b6MqC9fsqeVo/viI4X4BsB2K20Mn8yIpZjY6u5JKlc4gv5DKp4aZ8TnW02dNYJlONxnTvVjHS/cfCzt1QajMbPiud3Ej6</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaLrt0qMgl8Gj62Xp4gU1U4hPFg74nQhAk8y4DEF4jRx81+3lByeDk7qcZtuoV17ZktROiKPrOsbqU9MHgju/sAK79hVreX27JtK+m1gU49QDx6OEaVsTOdRSE9EdlnG55KH4Wpkz6tmRhyJ+zNzjgsHqV79SnqfguEW/E9Mr90BIAwjHRoi3hUxptCa2YI5c+gFCeZdVGsDEx+KkIxi/voMOnH4OUn6YK7ceHOozSAvmZ1xL+ywAyDeOPB852OI/PuK/gcnlnIdLsJ/0sYYZG0Hb45+YbZGOz25MY4/ijtmPmJ7PrTeDS8oKEY9r7RvMz700397d4HwD5xylO+bAx7XWJdiwpvU8p/8S3LX3GNCl1Rpsyw3ivr8+To3SZSI2PFSCPwn8S5Btszd1sBJThpdiUTLkHTJhJdHfKiNSBugiclNLSYPbg6/lFykNaF3lc7jSH0Xjs2IWcPUdVU44+Jd/KpF6ZgTK4Ji0ZsR0GMgyjXUUXdi3+2BtVEzMb9gepTpOsNCSda4M9v8LhyW3aRvmuBOE33KDfRJDFVcUgU0hsYC6soMXxB47uNWjmiU4oeXv7uDwA3CTS+Ekk5kdNY8ohgH+ixMr3lPXYa9ySkr7I2qFb6bS1VUrzLMtwPHSbHqc2wTknHdhhXxjfTh3v2pltj4mMHCcL0vANJ5QVnR6iim+CXerCHDMmLzcepZLjgl/nRnRz/yFeK4YzWui9tMtcSJgU7Cqf8vhClyczdXt4BDr6yti/zSRuTwINplYJvQ26xxbvj5oO+jfL3vAWAg801qFw89iJ4H0CuM1hoNQPIDZMMW0NyofoM1K6HZ9QE75HX+SwRupaiPwirKe6AgC61gc+kPs2hYdiGzFWpoSZeL4BJbzF+ETORvF6Je0cl4isN43/zw8QbVqX1JEFJuSgo6y9jFeyau1MDZiJRPkn47kZwgLiqgSg43FGj7suydTbo95jluw1dO6KtLQ4AIZPKbGQeJZM929BMfYtTFSV+NwwgCEzQtwYGKgNJgEObAL3mssr4fbVBGayIcajtipedI7QaReldGDu5eDenRsQGarvBjSP/yn/Y9yeoGPJltgfwzL5G8PKJPVaCQ817T2SrAdXSBU1nadKLTlYCCXwnzw2mL5zAzGNelEvVh5feIwbb8q0YWptyCCysXEX8niKaiF2htow3X7QM9g1SBSPPWIFFly0ScDywN3PGdqLw5DAKtBWv1jYPBdS97e0xXtO5IvsWzJvNAB5t7uM45oSUa142FYE38x2FGU2H9kFL7GNlvBsFTFAgzBDKRt7GIqFQI77V1k3v9nue3KQ86d+iqW8ENdlEBoYbIKygzBSAKnMeixm9ECQRW39QJXFY0r4kGXo/b+2wyrEXobwWXTKzhAOaGuUG1g+sVVBSwW78vWUuXbud/Qxp4dRloCjrT5FToBtJdWOHellIjRlmytr/Juwj7lp++sAtHMTBLU6X43oi4rtmtEWueazjYHub4iCEOgP8MW75ft7YiCiwxYOpgwBpfkFbBnJQbSwo5nApK1kehP1gZYlKTNKiL/qALePZLV2UR6iEFMzxSlNVDyeuhUjfO7H+uA///Hi1AU/r+YDubSNT/eaO4gbNM+7nQKO419G/CCeJ1VZFZta3w3/P7z0BxNTVebg9pxTzXsHcrsDRnr9iZ727PswkNX/vONsMJ7vUD2ssphaGFS8MnU/mYynnVMbOSsPKYi/ecsZnKUkdkR79IlfEwJ1QO47iE=</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Save">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9YOsGBbpE+Jo/Lj+o1uFoIXXx8nX5y+4CrJDQuH6DUi9v9+zNP8YgRHe+H9+tDdUdcx5oTGqY3H7WtqYQ3O822/ZYR5aCsmonnHk07eQFnuR+G31oFVHrOpVcajaNN/cV+QLVMC1VXHd0nhk5Sx2TZLetpR52+K2KSjXSsFnvqZ4n/0s/hXEOozPQ8cW8ZRKn7iwCNLVETRlArgpfy6t7oX4mb4W4PmhSw4fomVhsA6WPIhUE2YuqVsuPp19hu7m+wC8PpQIN5hM72syc1cAZO2bHtUb/RkLxYCAEN8xr+QBcKjosWLlBx4Hsgn/4ilzYyZblCd6WqLWu/i4kKPdww=</Encrypted>]]>
      </text>
    </action>

    <action id="Reality">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9YOsGBbpE+Jo/Lj+o1uFoIXXx8nX5y+4CrJDQuH6DUi9v9+zNP8YgRHe+H9+tDdUdcx5oTGqY3H7WtqYQ3O8233mm0+AZgYj3WCtyt6H2j7EANyDAR4aYkipu8Ml6/NlreI8cJCN+zwr0Ikn6FF2r3wbsm1jETLB5nQZhcmRbVgvCBba35tmLuAh71ZdOF3V8yYnm9tgTetLmqXo71B+QhooliKJFvd2aQCEMGIwy+qkBeFg46ebnJjNwgdieeoUvy80U9VayuM3o7zqw5Y6/P8JsdmJkW5IPJfJe902JSdgMf+AXWD39wZ/D1j64dOSGfao6sc8r7m5iv9KBSAFHU=</Encrypted>]]>
      </text>
    </action>

    <action id="Clear">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9YOsGBbpE+Jo/Lj+o1uFoIXXx8nX5y+4CrJDQuH6DUi9v9+zNP8YgRHe+H9+tDdUdcx5oTGqY3H7WtqYQ3O8233mm0+AZgYj3WCtyt6H2j7EANyDAR4aYkipu8Ml6/NlreI8cJCN+zwr0Ikn6FF2r29htE4RPjlx2jBIybFSZTcJ098qvZZ5oo9QGCTPZQX0vxnpbo42ZeZXh/Ip3Yz0iAsvr5Ltb7Nyip/zW09Btwe3ivPZ+UWYW1lp1SWxPsegqa1UPCDdVV4eJwjfXNPwqrUypOxsDcZrO4grz0YZfoL9q/3g4aJlvKDgCDqs6/39w==</Encrypted>]]>
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