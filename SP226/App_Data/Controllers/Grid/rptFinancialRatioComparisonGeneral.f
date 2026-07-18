<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY defaultName "GridDetailFinancialRatioComparisonGeneral">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" code="ma_vt" valid="systotal = 1" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo so sánh chỉ số kế hoạch, bình quân ngành, công ty khác" e="Financial Ratio Comparison"></title>
  <subTitle v="Từ kỳ %pf năm %yf đến kỳ %pt năm %yt." e="Period from %pf/%yf to %pt/%yt."></subTitle>
  <pivot rowField="ma_so" columnField="xPivot" dataFields="gt" indexTable="2" indexColumn="1" indexHeader="2" indexView="4"/>
  <fields>
    <field name="ma_so" width="0" allowSorting="true" allowFilter="true" hidden="true">
      <header v="Mã số" e="Number"></header>
    </field>
    <field name="chi_tieu" width="300" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Chỉ số tài chính" e="Finalcial Ratio"></header>
    </field>
    <field name="dien_giai" width="300" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="dvt" width="50" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="gt" type="Decimal" width="120" dataFormatString="@analysisInputFormat" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Giá trị" e="Value"></header>
      <items style="Numeric"/>
    </field>
    <field name="danh_gia" width="300" allowSorting="true" allowFilter="true">
      <header v="Đánh giá" e="Comment"></header>
    </field>
    <field name="sysprint" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="kind" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_so"/>
      <field name="chi_tieu"/>
      <field name="dien_giai"/>
      <field name="dvt"/>
      <field name="danh_gia"/>
      <field name="sysprint"/>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22ciTfxXLWkc6njlqPxulQ8Q0LC8B5NMqT/jHhfrgr+Va</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaIXQCjDEFew4S6PdFrd/PtyWewH1ofEeZLkfVbksMlmLVC8pcBvau1r8VdUoqJGEubgGyBspZDpLna+RkckNNlS0Gv+TJMbJoX8lAG/InNdq7Cdhd8aYNKcr8iuinv1gyGti2UkKId6I7oS7yiyBRUfKmqBsPU7mg0J5J06A6CfBhSM5RRn/eHC8UQNfIrdxj80blhdHMajD0G4W/8yLyh8=</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyWFfZ3ooX5WXTcH/JdD10vFgHt0Wkrr5EDvvXHgXyQAXmyUvYdxSQxDNPWNyghZAEg==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyEd6dUhmivDwyzoqUODQrqdt3byG7xNPGVq72xvP8sHI6z1LQEqRXdJqp0I3uO9y1mqJWSZY1qnQu7VWYX0jU8F4=</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHUCothhCKotCSIkskECrMjjn5opeaWiLu4KoXCu5Qdt9aQ8GCxUA4U9gFdZbZXojOw==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaItNJRZcWQCiHBntvQLZfiU4+nwYEz9QuGU+eldDzqiF7PVald+UjA6Nn4LNOoZGfiTfqM5yNS7/ZNaOFjrjdjbrjwRqmD1z9vnPHmRVjTRJ</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyEb1jl9/X1Igzx5HILLjYLWW2CSp9iMjvLcA5ebzAYa9NGWR5wjqyOJdwI+Ir+0Rhbuhk6pBcoX7ladRqFMdgw+XBHZv4KjbvKij9qBCefV3l</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHQkYKiv2RxmCSbcGW8Ud97s0ZVURCG2jT/iN5KXaEM2qUd3BvNwlf/HCEZu77j4Sw2UsCfXjRlicwrYBoio9VtnRowxoC8ZR8zTT6fslCygY</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&hcr+MLFw0Cvi/MPLsquJlpy8hzcrxmMgYBphT3AArR0iDjTE6Oak1vOh61yOuJO7GQP1ZSsyklfeN6oJDHYrWA==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyETI2WiGOq6VNUevZE9pq357DcNxnQ9HSc0BB2LwNdOowd5xhuCTqWPlyeJGmutd9k7dwE8Gc4P4qPGxTeRj4bucx6M+d3F6FXNhcsgb9ftCYWg+H14jUjCv12RPy9rn0ko8SwfMbIq5OunKZ0p4msrCMm9f51kqx1l1vnQLf1iHDaiyiIyyvlw/OH2j+2sz2DeHy1dM3ENEawHBh4d2q0rTvoaWLg1Q9zqN01pdMc1rrLyQUgBEJVZ5YrCyJrkGV7fCLUdQucJVsfLgWndBraen7tcPadqpNpYfGZx/O0Bg4HJvTtPIhjCPyo5+yMW6dhsneGQB+VFagXd0+v33b8rL4HZPRJKkjTraC1TXnE4jGZmMuhhU4a3l/uFnlRoPkYpsXtX4xC84m0oi/UiZuRlt7sH6ysZqjSonXaM+xGhBsY3PWzj7HOd7MCLzdmQyGFpgf1NU+6PWlVu6Y7wlXmMbjZ3daFA19ExcZalgsqSjAPjYbkHB84cC9r3hfvAcgLKsrp68RTnOhGrZEMS56Ge6PsQEEGPBRBUDvosVeB2FRnpBGxc5zSso4geS87jb/50ON/fb2CqneR2MbKvMJWgOSZTxbE1wE2q2NvzAuFnfld86pMXxpHks92dCdhxk2mMQxI8v2Fk8Ry4HR75b51neLHJ88L4ElOM+apDMONIARMUkKL098qH6xU12hp//vyfkPi/b3DQT5hNi/UZQBjo1fPD7fC4jj3IL6uJAU6kFXvPKTu1K1MmnPmLNZ2fkFQ3Tb/q6O4KYiB/CstKljI3Zv0Qs1HXx3d5ab6mniqHqVs7Z3Z+tYQQiqnkCqTgQ0CNNoTOKv1hqB6tBi1CFHN2lcMgnccv30w5verVy+qei/5lrlQki8FTHiA5vi2QcETEYKXEq+41wFa+PTz4GZ0rkk+GwsQckcRvLpVkJLvfk8uz3NJFlPJLGDwYkiUSFmpBiG0yJsy8U3Uga7gd7fzTe8JllWWY5HhN/DLwT45F1luP1sE0GhhT5oYu/WF/4rHqpOBk5hk5YpGKVasL1xa1SzM/XueaNshoeAVqXljynqf3oHasw3lS8WykfREd4dyx/EJ7+Gzbfa7nd/J+qc3FiaLYOTPTzX/Yc96wbx3aM+sP1+m1r+KF5Obgv0yfopi45ZN3W//DhLy8bWWVjSteq2HMDgBIWKPSEp8UYY/bPMHqz2//JBOHZessFZBG/dcHKx47oAlz/AcX8yo4pxRXIG6a4eAyXoew6oAVnqXjp8Ait3pQFheblX1SVsXe3ZTBhrRc6fO1gSTjZT7t/B5cHnNKibh9gV48uI51L3G938</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&zRJIg4IrJ8FD8GxnZu9KjNhP7YUpqR+WwcM+pDXn9oc/1IPUteKc7EBjcmj+gcWw0JupSKvAlD1kGalgM18cT+BG7fX8NP8FLYZ84qfGu7kzW9m+8KOzPmeRZ/cjQvuAFSeNP64PbkLzwAeL+tdMQrsMEAnXR6C02CXUNPXj6tEjJZzqDt6da8ZBjX94wQbVN73IJYDW07DmVOHPPwM55xYrOlmO6JMEU6XVtWQ2Xh54mVfOZe0T1kAikrvN/ZDk91m+mGbFjNRImD5mMghaU9CNFef9n2Rj3EjXiGbdamJcr7l8/VfVEQTIowaidszYIDwfw04g3c8i2XTSiGJVSw==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHc7X/84zX1ElDBQ0Oio9BYjYXYRYc0MA/fHbXj5R51/THLr4vqJR4aVL2yaCgOFpoqNtBnv/MOJOr6tRthqxxNdS9nIEhGzozzA9RfTYTN10TR95tDcGPVGTxPTpSHzqLUALvksl3OTwW4uS/MvASGCFMbOk11BtSISlY3Rb1sS2tLfD3aoK9C33EDGDL5v/s+7nY7jJhzMZTl0C5ky4zJ8vhdhSt7MdKd22fAskvrdZKTKV9i7PMMrZIok4AwSSm98yV/qhRCWyJWCl9tPUj5gCkMChZgUcrHiQECjliEJ16E3QxhjYGXTx5tIqK88KakL37aFRrle8tMeOSZqsKUahqGsZLtQIa6bGh2kM+rDZpV1f2O2QRbxbCipg9Q90THcHhCZKgeesUCrVZRB+Jn7I/6hbtBqTUJ5sagJr9J211mZHC1B0RUUAemH3HnwFbjkmUrWezaVU9M3MkwWHghH/9lMZNtf5HoTlOf9QeX/AdI/IcuVNeHEkhY3fhZN/1FL8rSge3fvqr2V06uaCpV8y0H0jVtsiFsobVgfwDrr1bAE8FMP3sTpXtmhTeraVongttcLVINqoixTTJw3Ro4atpiLuoWcAPmfp2ukCaUC5OFbx+lHcmskmRCQKPnzzX3QxCGUbnaIw0Irfys9Wi5ScK70Bryf6b2pMmyFa+3hyQFLJgwAUqemJ7hKBfoKwY6vuzaCXsEGm0ENUaEpjAwP4VuJJ7FwXpiRIV9vV1OcjCHtrfwvDPv9UUl8/VqGaka2IOerlfm+qIOh0EUKSshvu4xYc1vTbXixSVP/EUHb/</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaLrt0qMgl8Gj62Xp4gU1U4hPFg74nQhAk8y4DEF4jRx81+3lByeDk7qcZtuoV17ZktROiKPrOsbqU9MHgju/sAK79hVreX27JtK+m1gU49QDx6OEaVsTOdRSE9EdlnG55KH4Wpkz6tmRhyJ+zNzjgsHqV79SnqfguEW/E9Mr90BIAwjHRoi3hUxptCa2YI5c+gFCeZdVGsDEx+KkIxi/voMOnH4OUn6YK7ceHOozSAvmZ1xL+ywAyDeOPB852OI/PuK/gcnlnIdLsJ/0sYYZG0Hb45+YbZGOz25MY4/ijtmPmJ7PrTeDS8oKEY9r7RvMz700397d4HwD5xylO+bAx7XWJdiwpvU8p/8S3LX3GNCl1Rpsyw3ivr8+To3SZSI2PFSCPwn8S5Btszd1sBJThpcEki0CZRJv1cQ2NWy1O596dQHfVLb7r/MTXTogg+nyqHTGX4Ul33Q7UtfPWVh8xKhkzYvA+R4+4NaECsxjzyTb09+88yf5n/dgtiBfxxA736hFM5oKrfAp3qX/O1HbO7KlNxitvdXIZkZQhTqh+EMr7tkprmsginXJ5+EGmHu3TETvuYDfsa6pEk4I+nJCBmq3iGBiKKkFdBMcA0I1IiSr3VDfW8G0BT4zacQA0+kRLFhMc1N8+ZnBqHfm5ok9UF1Jini33/BfjQUIdhmbbG8IgDMw/CeaZ4Pj2CMWNOsrJyqXhiPQgDDnNmHEyk457HvoocZZRfURRmUQxfC34EUnG36ctVgFfSDZ5dByPe5QBOVoY5ArBHLx4LkxwnNA8dkaMjglhv69jkBCNxeQYFxt3sWgzZ9zpOmmlerQvYvn4tIIEHBEQOySynm91g0R0bUo2uNTVqrXAnzfzq2ChUiydU5TLsD5JXLYTR38SG7YFQ6CADkdSjHwlwWRnnu+QQBiGWrXSP5PSuVWQeGUKT4LJquILfEavoIUwDoxtcs8yjmBEUzruX7sak4/MXdpctCBFiJvDlyufbDWGqZS04ah1+U7wvvqivvorMTMswH+WEUYHDMowifYGAd40XSf+fqF7k7P/gj5WnvwOpDbxusfIVL0Bd8jtAQbtPA+8jm7TG5sIgVPppvc9glSWF4Kc6rKTPlcfx1fs4HTr+78/reDMiQrRUZZqv1rmMk5CHisIZRsTsUvFbCPXcVDuiylh/pVcnbxzkf7zPt+pN/cMAoazZlPckOuo+OxtczV/MlGU/iw1+4sJ7MFwzF9CVilCPMGvnWtVtQfOEIMu1ULrj5MGobyk2RITki4HU+wqW2wx8SwE/xZ7hwr3mC+TG++iq0URgtcwoJ2QPzsUczJGoMamILlCcYOikDVVdQHHcI9xsESkWeJ7/XGt4xmPaUxI26oLdjevWm0r1NBxiiIS6QLHttWN9gK5NWeGNxylZHNqaDLDwwuwUtebjWKXGaIikaqDVVr0awksOE1lJo/PJpHugU6IZRudPe+faB/H1o6z7lmQ3Bt47qRgfzH1u5YZHP6/PywX9EHaRInaZxqFGHA0NX+9is8Gkqy2/wHAkIRXDl33Fjy1AQzAoDIZ2am/Is=</Encrypted>]]>
    </text>
  </script>
  <response>
    <action id="Save">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9YOsGBbpE+Jo/Lj+o1uFoIXXx8nX5y+4CrJDQuH6DUi9v9+zNP8YgRHe+H9+tDdUflf3VPaABFiCYWgSxAZSbOyqJ3+95k7hZVXDE0QqQMUDXLlr7tlvUjfUaaNn9a2imP3tiI4zM52YqRZ34qMPgW8PUox3r6q2Q9KC28jnfwS/oazT1qONgyBkDA/XSJ7b04LcilN/AU1aduJtkKCoUph+E+VPva/FIxzy5zNn+0ohLuZuBTdErNaBpRcrpknBlY57YoEKVuEdxdjZtuHB4RAQu71WYIs6GLg3LCYRXdx+Yg36kJ4PaRc3JsotHlvI7DcP0VR/QpuSTZmlWoCwpE=</Encrypted>]]>
      </text>
    </action>

    <action id="Reality">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9YOsGBbpE+Jo/Lj+o1uFoIXXx8nX5y+4CrJDQuH6DUi9v9+zNP8YgRHe+H9+tDdUflf3VPaABFiCYWgSxAZSbPz+iedPKXp9YJ5YMfiGRjpoSMu4iZAjAfPWvAxMaJCEr2bM9X+XUwf3nnj0SRconqOk/EG4ZCZx/JNvkxmWfVqITDRpnGIeK9Tnrp+oISteVkdhWvtMIqa5MTDy+OWJu+xxkXbnsfEecjjxUH24qGJAG/YhrkI9a6AcVnkZBDjJG5BRL+rERLF4SuIyszd+Q+QR4qViP6IHP2/8f3W39aB4kbwj1S0p12XQTzpOmM/9Bl1XkDkkCKHKsLL0Kto+Fo=</Encrypted>]]>
      </text>
    </action>

    <action id="Clear">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9YOsGBbpE+Jo/Lj+o1uFoIXXx8nX5y+4CrJDQuH6DUi9v9+zNP8YgRHe+H9+tDdUflf3VPaABFiCYWgSxAZSbOyqJ3+95k7hZVXDE0QqQMUDXLlr7tlvUjfUaaNn9a2imP3tiI4zM52YqRZ34qMPgUYfHiWq03gcHSNXK29D+/GjpH9Hy3S/8M/xICTRfKnHkZcH9A6Uy6LCkSQ3Iqk8V9QC08Jg3k/XazkkNOIRC2AhA3L8504zTZog7NuNKvUgX49hq2oMB7zYh2/wOtEDNf1y5u9Uq4yJn9npnxiXohAxJEZuLIxv7yz0bEKIn1X0Q==</Encrypted>]]>
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