<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY defaultName "hrTimekeepingAdjusting">

  <!ENTITY LockedDateJoin "cross join #t1 b">
  <!ENTITY LockedDateKey "a.ngay_ks >= b.data and b.data &lt;&gt; ''">
  <!ENTITY CheckLockedBeforeProcess SYSTEM "..\Include\Command\HRMCheckLockedBeforeProcess.txt">
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Điều chỉnh dữ liệu chấm công" e="Timekeeping Data Adjusting"></title>
  <subTitle v="Điều chỉnh dữ liệu chấm công: mới, sửa, xóa..." e="New, Edit, Delete Timekeeping Data Adjusting..."></subTitle>
  <fields>
    <field name="stt_rec" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" width="100" readOnly="true" allowFilter="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ten_nv" width="150" readOnly="true" allowFilter="true">
      <header v="Họ và tên" e="Employee Name"></header>
    </field>
    <field name="ngay" type="DateTime" dataFormatString="@datetimeFormat" width="100" readOnly="true" allowFilter="true">
      <header v="Ngày" e="Date"></header>
    </field>

    <field name="gio_vao" dataFormatString="HH:ss" width="60" align="center">
      <header v="Giờ vào" e="Time In"></header>
    </field>
    <field name="hs_vao" type="Boolean" width="60">
      <header v="Hôm sau" e="Next Day"></header>
    </field>
    <field name="gio_ra" dataFormatString="HH:ss" width="60" align="center">
      <header v="Giờ ra" e="Time Out"></header>
    </field>
    <field name="hs_ra" type="Boolean" width="60">
      <header v="Hôm sau" e="Next Day"></header>
    </field>
    <field name="xoa_yn" type="Boolean" width="60">
      <header v="Xóa" e="Delete"></header>
    </field>
    <field name="ghi_chu" width="300" maxLength="256">
      <header v="Ghi chú" e="Note"></header>
    </field>

    <field name="gio_vao0" dataFormatString="HH:ss" width="0" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="hs_vao0" type="Boolean" width="0" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="gio_ra0" dataFormatString="HH:ss" width="0" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="hs_ra0" type="Boolean" width="0" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="loai_dl" width="0" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="gio_vao_old" dataFormatString="HH:ss" width="0" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="hs_vao_old" type="Boolean" width="0" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="gio_ra_old" dataFormatString="HH:ss" width="0" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="hs_ra_old" type="Boolean" width="0" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ma_nv"/>
      <field name="ten_nv"/>
      <field name="ngay"/>

      <field name="gio_vao"/>
      <field name="hs_vao"/>
      <field name="gio_ra"/>
      <field name="hs_ra"/>
      <field name="xoa_yn"/>
      <field name="ghi_chu"/>

      <field name="gio_vao0"/>
      <field name="hs_vao0"/>
      <field name="gio_ra0"/>
      <field name="hs_ra0"/>
      <field name="loai_dl"/>

      <field name="gio_vao_old"/>
      <field name="hs_vao_old"/>
      <field name="gio_ra_old"/>
      <field name="hs_ra_old"/>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMjEitWCiBAWcopg6nypxirG22kVK4Mqm3+MnWVjVq0Q</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQuq7YTYRj0Z16Xs3Deqb2SnB3ocbZpz4VUnHYDFLGK+NF</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22ciTfxXLWkc6njlqPxulQ8Q0LC8B5NMqT/jHhfrgr+Va</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaJ+Qw9dwUB1GBEFrl9BEYsvyYDssdcgc25mC26iwMU5kBW69MScKdhFNYArHwGemJzenolq8jQf6IG7Z1sbs2hZEP2JNfmt1VCjRgHRmj1QAD4FWVW+CYsOg7lryd5Dh6yWA+I8lHlVOPGsQwe5e24ChQNn+Vjg6iFzZK4qfbxtLjiEeCavpWrCdMiyjaoYbTABZzFI+k5GxqqNUY5PQ5BudeDQ3xQmKBgdRpH7CHMD+AkmLq56wVBYKP2TAerpaQts1UnJPnJbk0Sm6MiEO3kOQD9y5BA49uol89bcXU8wn</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyWFfZ3ooX5WXTcH/JdD10vFgHt0Wkrr5EDvvXHgXyQAXmyUvYdxSQxDNPWNyghZAEg==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyEd6dUhmivDwyzoqUODQrqdt3byG7xNPGVq72xvP8sHI6z1LQEqRXdJqp0I3uO9y1mqJWSZY1qnQu7VWYX0jU8F4=</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHUCothhCKotCSIkskECrMjgMEFQ/se9YBmE98EHtb3RO+gkp+aF3P5ocopa1BqepGw==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaMyp/hoC3GEwJgXvvMGnnSUGj8ir0mjXFW0E+Qul8Dmw4TftN90FpnIQaK0s2jX0Uw==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaItNJRZcWQCiHBntvQLZfiVRtgw/+PAc+9xdcvCP8CoYLIi2jsP/IhUM9WdMIvDrIFmsONmqEKfL+mjjOcCuPEKLXM7L0U2pAyjjb6cBOUqs</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyERnOvM4NG/oV2IoQpuvFNmPT8aFeXkqML0n58IyfPpyVJPSeqAr9CDMdp2coTBVvqu2lHuxmjkVCaSy+1KF7qJdjMycOlSdvOonHBsJv7YSH</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHXu8ejmCjlg4le7f8HVshRvaPlJ+aSv++/oks9vAYMCvcJbZJZuPqPO838rut1VWC6dJIjjzmVr65eU9VHir6/McVY2SaMQE8qsTM+zOuazs</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFySG6TtBGaksaEw8ylGxrgDSW8ZvJL6y1t3xquCVXhiytHAK9rW4RNshsMno2ZSSOnEnB5q5GJh5058zGFw8lKME=</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&zRJIg4IrJ8FD8GxnZu9KjNhP7YUpqR+WwcM+pDXn9oc/1IPUteKc7EBjcmj+gcWw0JupSKvAlD1kGalgM18cT+BG7fX8NP8FLYZ84qfGu7khlupaE61K/ya8kgNV9FiLac3VfJeN1cxyG9kz4UukuZ4nZZo5Ce1RauZX1n8EupFrJr6N8WIYRbmzj349LY4naTl6vvkEhTrRBYLwEFYID0kjg/Nef4ckHAovSXbOrsQciK7AX//IWXcAssNZF9R0gHI5tLtFZ920zFy7DgI1j94lEIXU0Mmmvsxc5sXc/v0+xXxn6zjMU27dRbAljq4RW9CNU6MUQ6cV8tG2PYu7s8jOAl9YJupi5CBLzEJAjh8jgiTvbsn1DljeF4V2yK3VlQY/i0hUWVlqV1lmETtirg==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyETI2WiGOq6VNUevZE9pq357DcNxnQ9HSc0BB2LwNdOowd5xhuCTqWPlyeJGmutd9k7dwE8Gc4P4qPGxTeRj4bucx6M+d3F6FXNhcsgb9ftCYcwYs5bLSwVYaPw8EWDkpSy4Z0HwFcNXtdUs6/uWjT4n0vcZz3Toby21sskE+BQ4+Jcd1CH0TUV5vsb641THJmVSSY2Uc3rXy+nD8voa+3iLVMNADD/UqTFcjUKmV1HtML5tYUTc2+TdD59oYNwoiP0usuhfMuai6ou8XIszJwBy1eWCyDAQVWGGkWgn6hXFZQmOlMc/AVzlzjhmWUVoZHRGS45f6hwUD4bBKzbu7J2p3j6X8h0hIEiB98ZV/p9Lb0IbMP8SY65x+PRMW9L915VjO9oc557l+f78RQu6yVbtdxrYkYxJoyvhz15LJMfHv0/BFvogKFohR/JiEEzQrWLHsq9eimJoW+z5+p+DgJ/S72TK09nULgBjttgwYH+gwbfpmXMqFbX4dB7qQnKixRikxohA2wHejuPv7Jb6g/ageIwTlvG84NQ9AgOk+2KA/OsX2k9osNhUlAF8iI9Xilo5VPKKeP0JoENyry4gLQovvNL0zrBYScHpuxVqGgUX9g6/DdRHP3UGCUR3EZLIYpybCRQTPr1b434AF4vBp4KP8ZMp9Eat+UtZS1gJDdtllTiDbvF7DDurgUjw+oI0MO6eQSmBlRPjq5n3Qwy1BUORbE9Dh5pbgX0XWvsy5d+HHwjWG+1PmT5ia9nrTiJguSIZ9pcK2ly9ah1pgv01ugq2mr44yVjMy2qEuZZELt4/jI/+VMrmBOqiJZhrnx17u/wtqckDtcLhOmKHvu5NOfu9ExhS/1YMwsfJrqkdSYCjeDSpIsmM5D7O8PBtEjRbh9/pxgcoRv1jpUdRl8rOQJ2E6dZE6VGxBtwOFXnMtP4B51Ad8PnIsY/qR0+VUvsAZJfuMXRgRmgJ8UX/e2symDAUVZkrIXfxVzZQsIqDBiNem4b/3SHAsMLHseHW86wd9utspEA0tnnvH5TVxu9NG2BACYGL7qOO/tegSz+etQ0nS84uag0yS1ZVsZYM04i3RXL5ybHld8X9ijkqvWSTu1V8pgbIMOMIsLxV3p//RVBW5gD/Ufe6YrAnwvKW/TC/eTA/iIhx/t2/t+0SZCNiqEJV4EzAzNFXaEgy8uGknwXBD43N+XendPn/eJWzEXK1ivz57427qYLU3bAg3GVa7hwk3Uvv9vDVikLqrw3/fU0tK6HNMUhvIAcDBWTvFIdO63pdhpCfoWxbhVkcMca2OGtxBiJAKjlfnFTAvEmGV38TS68kiXnhObUoeV3xMK95IpngmxdfURTA6W+fNosZHn0jGM8wrABhkLtdHETN//k7AKxTtGEt9Hl6bNc9touFv0GwC8yYSEhqaqz4fB3jlQnk=</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHc7X/84zX1ElDBQ0Oio9BYjYXYRYc0MA/fHbXj5R51/THLr4vqJR4aVL2yaCgOFpoqNtBnv/MOJOr6tRthqxxNeKKm32SaB99HKy6e6irdF1isWw3mX99s4LLxHbKzgndOJudsTxAhzJIhcPrrLKr0Jto8Z6GDry8PBi8AAUQCdy/QLPeAH416q/9akhsfyRKmnC+HmnB6b2KRJjjrKk7mgwd1V616lSdr4jnkKS8TdlxBwS5otXxgInSG1FOBBOhCWhFLG4Sk/hl80VkXGIllYwWAp6GmIo4iYLUsNRt9y+alfzAjFGLAx2fM8vDYCoLizVk1LdPrzMR7I7gol7QKuy2/n9XFbCZk1FRSAI5b7JGgAVXtxBaB4Tl/6HVDKWXXkRsCxy9cY6YTztj4AL2HSbsaABtLY9L02NQySlt3WpFNyIvYoaqt4nqFYAfB/tBD6BIFtL/G32qqEy+8blF0siJeOpZyVArtuykGo9HHchL0W9C6MydGmfEFGa+eYkyrQ43D95KXahBpIoJzYPUQT3dH4pw0xn4QlLhfjhNibM1zdOpOlBHQm6X8n78b97YtMO/d+vw7hJMkteKFdURFn/9DQR2tRi5uL3uLq72BO4oC8ZWXNVdijNdFPXyn8X+nj7mRUP5fXB9vV5ecLtRLfSZiOBQtqKN1msUyLF2M8YIwccXM5p25OCMddtitYKCCD54W42tCxG2VCnB5yNwLu0aFXvqEvXU0By3BbQ5OfrrBt5Gmu22a/UNo4rXVW6BR/HFY5QkNLkGYgcFbU2HjQCliPdZcb/qBr7XU2XWIcLijqH4rfcwOm6j8edGgkShbvgZFsGq4JYAfmVn6d7ckqHV11Onc87GNlOL5Z3JgtUzwXMjD+kdR7kQlOpgrXCBv97RRdkMJHeTSigufuZxOJ/TLkmpD4VTmP36uWyCbJzECrPQBaMIBT1EJlyH+PnPQNPQtHC8rkZkF0hbdxBRIYGQ0BCV3ka4eUjlM2vQe8Rx++/XYiXPiv1lhKlDHm8um5AqSqCJ1HEmf2CiASQUQglI5DzJAMjI3bkmJB6HJW5T4k44eHvE6WKyFeWDhdbxq0a7j4PuVi3NPe95P+Ut6jdEezwkS1Vneym+bZdiqIBqCeattdd1nhOFSfXSe+S/cXO9HO6rxBu0TMbhvbmNNPhid9UtuIl74Kqjwpf2HkS1JXgVmSFgwDxl/yy9sCgxyzi9dso/08mqU4BXHL7nK4hugs03Do3+XIv5Tt8e9l80REnpz1bJQofw4Dstf4Xf0oGKf8EhvsnDMdh9LkBGvEVUnWd5/cpRA5IO5D5UaFCYQvEFsCv4x5q/MQLcXq83jyiLwDeUM/wFM2R46+h44sEMEfnlw//PYdG+LikxOSpi59F/T3WYPi53hgBek4bu99h0c+edkOSn6mMdsStBGfVgm0Cgg7Kz3DVn4tyn/nPhGLk7vWhMvG+wvkWTZCnsFKFwIWineVLIZX8ZRcsiaYiSpHZUuOXxB++GbLj4+pOhkTWBsCbZQnOmyJ/UIXEieRdrNLxNbrj6K6dmJC944e8nb6bCS2+VsB4SnmxZ3VJGcs7bwIWOoJT/P66MxuvIMJNcOtDXQcjNYs+AbLgspU=</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Save">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/Od/goVuhLMrED22GbgbTBY0TaCws0TH3pDtHqfg86Cr3AbckK7vqInydZY3FQwLuD83Rs8JKRlOlHpjl+kcoGpa2+93B/D+bJ60LOoYFhwBoJrB5bg3zKPWbmwJ6F7EAzJBRNAaP3lwxGCiS3NPACIdMyxWTz1T34C8j8aDdL7swXCjs+J9mGFgXZP8qPkWu3hrNpyLp9QQf02KjYVzQInbpO/rAmoc99sN6m4dQi4fYtuAAFDQSX1koGyf8GoahRJc+WfOs3GTnvHdZaRxto7l17ZK4LmmrllyPeZrk9WtYpamq3NNaOFaFIVyBSLwKGXcVzvIUmf13nAxI2n59tEbeuVkGyaEvsNst7ibqdoYtpqsRG+EIxiEAVXN2nqFuJXqvkXSS8C/Xvk4uX5gUhWv+XKbYDOxyb/UFh/wx6utC6H+Scfh+wHhmpK/gg4QJhwILfNExKFwFWriHKrD3KylHeJAf0+/mh2Y6vybQ6TorDxPaKIEu0ebGChv/ZOeYYP+otpfXzJOpkyh5IKs5TxG+H4BA4Uvuswn+CHE6m+RmN3028wuYZM9Ml2qU4baQwBebYRk477MnQzLLFEVwIHANfJOS+47vl5LErSrWr9I1Yl5HE4EQpxQMLe8O61GFZv6SjHNeqXLxImLJZKerP+tmptqbEc+p70CbJggwiVjM607Z41xRPHyC4fKHxogn2JCZcoSahWWO5yDn/3DwZ4WXmasDcepzeA5tLdWZ7OVRvFiafskBohz/PAPI57e9+pHcThVOHsxubvIxHE5FZewD6aJTNgmoJeDDLb4+t4Iyu3RH1+bsC1Wblvc+5LoE+Y0uT6QZvwDly1FegFw/GGdCsugZYVEVnAi4bGGxpvUihK/nO5EBFWUbcx8O1lZw==</Encrypted>]]>&CheckLockedBeforeProcess;<![CDATA[<Encrypted>&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</Encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4jO/RuWLAuEZ8ys9M6L1UIksWjjUcVDjeeRJ7VUVX4NnwAlaJfItGKCTK/5RUIB8/elMozRfm05IEQ9VSikHJbVdXIEHzQRXe1qTR68PQIHv6YqoeFHvWw4OpF6bAtCurD/EyoHTb22A30u0M7vSxLM3O+ctiE939FSng/N4/KQA4jvsw3SiKPp9q5taeNR6LJaIzwWny1IUnUmBDxnLCU=</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Add">
      <title v="Tạo mới$$75" e="Add Item$$75"></title>
    </button>
    <button command="Save">
      <title v="Lưu dữ liệu$$90" e="Save$"></title>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"/>
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