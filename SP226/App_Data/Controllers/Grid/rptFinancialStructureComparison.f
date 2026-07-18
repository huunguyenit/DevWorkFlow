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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22ciTfxXLWkc6njlqPxulQ8Q0LC8B5NMqT/jHhfrgr+Va</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaIXQCjDEFew4S6PdFrd/PtyWewH1ofEeZLkfVbksMlmLVC8pcBvau1r8VdUoqJGEubgGyBspZDpLna+RkckNNlS0Gv+TJMbJoX8lAG/InNdqamLTU2dkSDXcuZVHe3Fkw0szwaHnJ2o17eJtHc+4eGl/EswpH4HiVrZfCyvFfpgYHvRWIf5l6fcyK+QUgF/jb201vEKzvgHzZeBnh6YOahZx30KWSjVFApLp8NZQW1Anhopp3IWEjM0F0sneJsxSXQ==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyWFfZ3ooX5WXTcH/JdD10vFgHt0Wkrr5EDvvXHgXyQAXmyUvYdxSQxDNPWNyghZAEg==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyEd6dUhmivDwyzoqUODQrqdt3byG7xNPGVq72xvP8sHI6z1LQEqRXdJqp0I3uO9y1mqJWSZY1qnQu7VWYX0jU8F4=</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHUCothhCKotCSIkskECrMjjn5opeaWiLu4KoXCu5Qdt9aQ8GCxUA4U9gFdZbZXojOw==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaItNJRZcWQCiHBntvQLZfiU4+nwYEz9QuGU+eldDzqiF7PVald+UjA6Nn4LNOoZGfiTfqM5yNS7/ZNaOFjrjdjbrjwRqmD1z9vnPHmRVjTRJ</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyEb1jl9/X1Igzx5HILLjYLWW2CSp9iMjvLcA5ebzAYa9NGWR5wjqyOJdwI+Ir+0Rhbuhk6pBcoX7ladRqFMdgw+XBHZv4KjbvKij9qBCefV3l</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHQkYKiv2RxmCSbcGW8Ud97s0ZVURCG2jT/iN5KXaEM2qUd3BvNwlf/HCEZu77j4Sw2UsCfXjRlicwrYBoio9VtnRowxoC8ZR8zTT6fslCygY</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&hcr+MLFw0Cvi/MPLsquJlpy8hzcrxmMgYBphT3AArR0iDjTE6Oak1vOh61yOuJO7GQP1ZSsyklfeN6oJDHYrWA==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyETI2WiGOq6VNUevZE9pq357DcNxnQ9HSc0BB2LwNdOowd5xhuCTqWPlyeJGmutd9k7dwE8Gc4P4qPGxTeRj4bucx6M+d3F6FXNhcsgb9ftCYWg+H14jUjCv12RPy9rn0ko8SwfMbIq5OunKZ0p4msrCMm9f51kqx1l1vnQLf1iHDaiyiIyyvlw/OH2j+2sz2Ddi93D5tuEi9Wljbjupvky+5FSbH9dIXo9EQaO2V4bL3cKvIv0cb2YgRqjJyjDD+fov6hRZNPFzuAHXW6LaOQkeK2bh+kHMEmaF80iiMSXEULgs0N8qzTbEy0SvoKiygAN7Bdu/2/Ess6QDAlgxfsStq3pAKGhOcORrrsGqpvEKiKXrOkRfl8QG6coWzdV5UTAnTJL0z1IurupMEtD77PMx5spcFZvdjXa5Ybe8B5DBpWuwzWDRT47d2aTSgP0XgF0iTU6gfN0Ku+AdRbRrZURhvutw/XIdenWSd6opWkShigvI2ix0DUS/FTaiKymg9dEWuGl/tLrVU0mZjg3As5PevC19dAqgLZEYCKBKR49/Jw/MqoKVrb+DNAyCeBsvICRHYq9fQ36olWdJsQia4YCnb6hz2yOpgggJCoQka4pwdNtPncB6hrhPuq7N0sSUHzbzE83PO6rdeBSUF3IcjBT3xWRQ539Zl3WXwLLeEd259XMaNo95XRktZtv7OFxadqXiX3xxT95g8GeLvNUZCw5fKnV+lYDuWexSIpDE98IStbwNRzCmeKAWglnzR1Mtu+/5aYZZYSJtw3guJw9786Ej1bAzG491A6wWXzGHoAoCA33cYMGYpcsv5o/PDceOy2WgXjEDUEJ3NvW0YnOqUYRNSbKcKj7Ip7GFg+K8E084KWpLrUql6YjfpmOtu/OGyIfAjeprCSCq8xNK++qm8csJzeGsxLcFcj17BLFFka1bd2CMzrULI3eH6bok8SQPLvvH9sJv8zbdMdKp/neIFtbNyHr92hwvvkR70wscrPOdtZtVOc83jqm/kSRuTv60Z/ltkWy4r4fVi3EIHf+hK9YVg6pFVv80ObsAkvQPss0/lPN6Cz3PijdPc+XZ30XuGsk7GLMNNHx8bXexSoSSUBcyZn1gbHY4KqHf0eYavg+BiYOrpEAJMC/N2wCIm6xXikSEYyXgzAcwMI8LCUU8K/7xbhRHJkCwL5+SUPuB1Rl9mXS4/IO7DIcBzfSL8MWKc0wmsPiumWgz/+N8tjYhv0/0VbCDro8K4nnqlTyyPz1L1bH7K3xaLw8antMIDyiDeK+e7kjfHgNGs0V0FCjuOGzZ5UawUSVEimiG595gXHRNt</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&zRJIg4IrJ8FD8GxnZu9KjNhP7YUpqR+WwcM+pDXn9oc/1IPUteKc7EBjcmj+gcWw0JupSKvAlD1kGalgM18cT+BG7fX8NP8FLYZ84qfGu7kzW9m+8KOzPmeRZ/cjQvuAFSeNP64PbkLzwAeL+tdMQrsMEAnXR6C02CXUNPXj6tEjJZzqDt6da8ZBjX94wQbVYHTR1Zza+mBbdt16qxix+V85CO84IXh/UOTCXu14hxx3BG9Ar9DhRfm4m68APksMa4Wg4SRo1n6KwAso8FOw8w6GSZ+1a4CBqZNMXkwNHO5oKnb5K4sQJv4EhrgrPTTkws+qE9oDtpEKdekuAdzfCKzc2K7SFIM+pziXONjdhCySG8LtSRlqLqBPdpqvwNCQwa988pwKVl4yXmyKjfj346yrEHbeoiPeHffs1PsMDfEWs/GviW04DVj6owZYsd1m</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHc7X/84zX1ElDBQ0Oio9BYjYXYRYc0MA/fHbXj5R51/THLr4vqJR4aVL2yaCgOFpoqNtBnv/MOJOr6tRthqxxNdS9nIEhGzozzA9RfTYTN10TR95tDcGPVGTxPTpSHzqLUALvksl3OTwW4uS/MvASGCFMbOk11BtSISlY3Rb1sS2tLfD3aoK9C33EDGDL5v/s+7nY7jJhzMZTl0C5ky4zJ8vhdhSt7MdKd22fAskvrdZKTKV9i7PMMrZIok4AwSSm98yV/qhRCWyJWCl9tPUj5i/uxAa5xBXY/52HNkWhBl/sJwmIhwR1s8GvwUj7hWcU0E6RuBkDU8ju28+vWd501Y7qz4jAn7MP0zq5v3shMvgm8Mtf4NWHzUVFYgWR7Jmp07qyeXgHnDqd6VUfEFtaxqESPigAnl6LkBRU5IFB7xogliXmcy0zaTJD5sHldTJ7L7ZHfcBTbE1jOB3gc2PvkRmvqyPkNZOOrrMRDPT5/0HuJG3ZqMwIxtie6DwYF0kw0DgDvsjTzwFyguisgDKpXupK75lep3IYXIk7s6jkFyffDEkSWkBZbNiJo42cdB8Xy93gEYyec1t3+GzsTexIefHaYFqjkqr3KPy86mftlWvR0ciBx1vUTKX6vWyqvSzJqGXd4ep8tF9Ekti4CVJapcFrUEW1oljLtMW/BT5036X4QtcjnnDPBtYqZpb6VwTCJICMoD3Yj3HHqO/0+HkNZjRWCe15OIoCuPbHkhe6KqT7WeSo97vCFgyaltfP16epxuEd3fkywt0RmQOC28pYrDe9vajNRSPmLzE9krye9AB</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaLrt0qMgl8Gj62Xp4gU1U4hPFg74nQhAk8y4DEF4jRx81+3lByeDk7qcZtuoV17ZktROiKPrOsbqU9MHgju/sAK79hVreX27JtK+m1gU49QDx6OEaVsTOdRSE9EdlnG55KH4Wpkz6tmRhyJ+zNzjgsHqV79SnqfguEW/E9Mr90BIAwjHRoi3hUxptCa2YI5c+gFCeZdVGsDEx+KkIxi/voMOnH4OUn6YK7ceHOozSAvmZ1xL+ywAyDeOPB852OI/PuK/gcnlnIdLsJ/0sYYZG0Hb45+YbZGOz25MY4/ijtmPmJ7PrTeDS8oKEY9r7RvMz700397d4HwD5xylO+bAx7XWJdiwpvU8p/8S3LX3GNCl1Rpsyw3ivr8+To3SZSI2PFSCPwn8S5Btszd1sBJThpe79omH8dDfL5I0M01LPvV39spxGzFrgMcMwFi3CAjRAWiuZenewWmU6SxyvIcz3S/lFamsgEjIbvt8BnZ2fTEi3uw8S0m0IDPmAh10Ax0OIWzsUbPkV6Og7lLeeJjC8jPLLFxq+hV676e78LxpxeGwOBJcqm9mPnsbNVTKvO/siWJlpdPyJ8hlCFaEp+/WIITDqleD7YULTe2ipwiykhMOLaz71Iv+kpQEjtJb+NLps8RZbY/ANlnl6VYDyOQ6oLWnoft/iGCnoLf1Zs7A9sjsVDcmU8RMorb5YkxkTMtKlJIr/LtbTGzv/2GHA+unsNLuKxJHE8PZ1cTkjayIYmkqP0/dKDJDa26JUKH2kIW46yM6Zn3kyeN1k6f0tILr9c0ByYUy8SkhXQxm4+/zB634dh4BteImGy+com8nvPHfThhSyd9LNG4D/4ZqomLt06IkpnmvAHPxkoxxtKKJ0a2Cq5eON9QqPvWpw9gGZcVzIpZExJLPE4PgwxU/8xB7OnSMNGIUgViRGamhDAYROwiLMDWJTDu+EErpryylB7uq9UMIFXjrLgdjNa3BB1PDsFP7XoAgg4CM5KYigQxOfE3jBJEZk6LJsvLqwsc7GJfDoheRaOFTYdJ8xZEp3TneuT+Y/cxn3XeXoLAjoI6TcMicHUdzvSyOwlq/Oc1DgvQ12FIbhPEPuIzRTM8IcFarcsrTCxfPnpm+lOVUg2aRp/f/92DAMCY7EP/41iOkXhPFSJt5roRTZv4q6mv/cOohABKWklJk79P1phqZGmbFJGm2qErdP5HZcBYHq3E88FT4W+sAMJGh4KbSpyKLqwJTcddsVkjhKoMnRldl+kWnJhMqJNMAYbW1M1wDPX9hGBaA7FNm5gQ+Rudb03yE4br++a203TJl3d4mGFvS+yrKtx+3zWXR7CfjT2uuGoVxQcvze125RjolPTw2/TpTzpetpM/TA4amx+a8KeR0Kjri+ow+OkxHi5ZjJsFAfMPZLW3P6yZMupf2UFDL/aaFNKs/v5MuOmrTG6QI1yYd2xIg+kldyR7/ibG3pUBzpwywfraFqJxze69/Sl0ahUnNseiDGP48eAJeqFdJccRuprkU1uH+avZSpXrqRyKVPkOE8WYJOanYxB6xjw7CHHgXAT1lHV0EXHYg7JFsoGRpJ/+wBV5PQBbOm6P/tm/F7yqsiKnoVoXtczD4JIWXoXcRYNSpJoeeiVcWk3GPr/NABBuXIevftvbDU1wzkmngHHdp43SW6tvaaW1NUtSs4MoSbXNSSkk=</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Save">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9YOsGBbpE+Jo/Lj+o1uFoIXXx8nX5y+4CrJDQuH6DUi9v9+zNP8YgRHe+H9+tDdUflf3VPaABFiCYWgSxAZSbPTxVtJxcmrlOT1bJ8nLdIaRG53cowK/pzEi5nKBrbs0gWD+SHny+A0oZR5Hesd5h786oNpW9lVTksfZrG+eTVhbqrslnSveAhWPqXhakzS1RtNGjxGgt+lrTPYmOz1Ho2LqgPDLClZgziiSSkq44ZKTFkGB2Q5Vw8qqlk2DPaK/vH8NlFlWgaMDq8tjDuJkcbxNmOuNT9Neehy/StHcKgtHClymXqx0YYIN6iVzB6muvgbGZQif75lNixvGpb6LRc=</Encrypted>]]>
      </text>
    </action>

    <action id="Reality">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9YOsGBbpE+Jo/Lj+o1uFoIXXx8nX5y+4CrJDQuH6DUi9v9+zNP8YgRHe+H9+tDdUflf3VPaABFiCYWgSxAZSbOqAsWX1AtC58iGQ6MOilQXp7R24iFnqDqMH+DrtIMBc3Jg3/XoCquLpakXtizSQpygBi92NxCcRtexBRU7smAzAlCmc9jJgaEQ3GV/MBJu6CxTzv+0bZHl9X2cs/QFzry8Zy9LdyaKqlTbudpjPcSfi7lXVm0ASNn5Rlz/2ByBXMISXdzXmglSEuMoJtPED/7QiXG1f4l1QLN7xbZLdgnzKGiCVoNG1rnKonX03XjbyTtB3/XUMCF1Tf+MuDAA/EM=</Encrypted>]]>
      </text>
    </action>

    <action id="Clear">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9YOsGBbpE+Jo/Lj+o1uFoIXXx8nX5y+4CrJDQuH6DUi9v9+zNP8YgRHe+H9+tDdUflf3VPaABFiCYWgSxAZSbPTxVtJxcmrlOT1bJ8nLdIaRG53cowK/pzEi5nKBrbs0gWD+SHny+A0oZR5Hesd5h7bcURUNkjPO6836n3BA2/iwggKOIwrcFPoGnM1M/E/GgwLYGCw18rZcsWEzy0iIZ8tU5YsBPaGwwLKOBw+rmcBusE3tf7gInh8ebmqvKbyD/5tfnOdal2K6H9Tqn0sTOVPYZ20G0Mp1s57fWxZ4HnzJmZvQDcl1moS7DdJC+zKlg==</Encrypted>]]>
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