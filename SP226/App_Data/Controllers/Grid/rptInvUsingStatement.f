<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY defaultName "rptInvUsingStatement">
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo tình hình sử dụng hóa đơn" e="Invoice Using Statement"></title>
  <subTitle v="Quý %q năm %y..." e="Quanrter %q Year %y..."></subTitle>
  <fields>
    <field name="stt" width="60" type="Int16" dataFormatString="### ### ###" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_nk" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã quyển" e="Serial Code"></header>
    </field>
    <field name="loai_hd" width="100" allowSorting="true" allowFilter="true">
      <header v="Loại hóa đơn" e="Invoice Type"></header>
    </field>
    <field name="ten_loai_hd%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên loại hóa đơn" e="Invoice Type Name"></header>
    </field>
    <field name="ky_hieu" width="100" allowSorting="true" allowFilter="true">
      <header v="Ký hiệu mẫu hóa đơn" e="Invoice Form"></header>
    </field>
    <field name="so_seri" width="100" allowSorting="true" allowFilter="true">
      <header v="Ký hiệu hóa đơn" e="Invoice Series"></header>
    </field>

    <field name="t_sl_td" type="Decimal" width="100" dataFormatString="### ### ### ### ###" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tổng số tồn đầu" e="Opening Quantity of Invoice"></header>
    </field>
    <field name="so_td" width="200" allowSorting="true" allowFilter="true">
      <header v="Số tồn đầu" e="Opening Number"></header>
    </field>
    <field name="so_ph" width="200" allowSorting="true" allowFilter="true">
      <header v="Số phát hành" e="Issued Number"></header>
    </field>

    <field name="t_sl_sd" type="Decimal" width="100" dataFormatString="### ### ### ### ###" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tổng sử dụng, xóa, mất, hủy" e="Total Quantity of Used"></header>
    </field>
    <field name="t_so_sd" width="200" allowSorting="true" allowFilter="true">
      <header v="Số sử dụng, xóa, mất, hủy" e="Used/Cancelled/Lost/Destroyed Number"></header>
    </field>

    <field name="sl_sd" type="Decimal" width="100" dataFormatString="### ### ### ### ###" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số lượng đã sử dụng" e="Used Quantity"></header>
    </field>
    <field name="so_sd" width="200" allowSorting="true" allowFilter="true">
      <header v="Số đã sử dụng" e="Used Number"></header>
    </field>
    <field name="sl_xoa" type="Decimal" width="100" dataFormatString="### ### ### ### ###" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số lượng xóa" e="Cancelled Quantity"></header>
    </field>
    <field name="so_xoa" width="200" allowSorting="true" allowFilter="true">
      <header v="Số xóa" e="Cancelled Number"></header>
    </field>
    <field name="sl_mat" type="Decimal" width="100" dataFormatString="### ### ### ### ###" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số lượng mất" e="Lost Quantity"></header>
    </field>
    <field name="so_mat" width="200" allowSorting="true" allowFilter="true">
      <header v="Số mất" e="Lost Number"></header>
    </field>
    <field name="sl_huy" type="Decimal" width="100" dataFormatString="### ### ### ### ###" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số lượng hủy" e="Destroyed Quantity"></header>
    </field>
    <field name="so_huy" width="200" allowSorting="true" allowFilter="true">
      <header v="Số hủy" e="Destroyed Number"></header>
    </field>


    <field name="sl_tc" type="Decimal" width="100" dataFormatString="### ### ### ### ###" allowSorting="true" aggregate="Sum" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số lượng tồn cuối" e="Closing Quantity of Invoice"></header>
    </field>
    <field name="so_tc" width="200" allowSorting="true" allowFilter="true">
      <header v="Số tồn cuối" e="Closing Number"></header>
    </field>

    <field name="so_min" width="100" allowSorting="true" allowFilter="true">
      <header v="Số nhỏ nhất" e="Minimum Number"></header>
    </field>
    <field name="so_max" width="100" allowSorting="true" allowFilter="true">
      <header v="Số lớn nhất" e="Maximum Number"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma_nk"/>
      <field name="loai_hd"/>
      <field name="ten_loai_hd%l"/>
      <field name="ky_hieu"/>
      <field name="so_seri"/>

      <field name="t_sl_td"/>
      <field name="so_td"/>
      <field name="so_ph"/>

      <field name="t_sl_sd"/>
      <field name="t_so_sd"/>

      <field name="sl_sd"/>
      <field name="so_sd"/>
      <field name="sl_xoa"/>
      <field name="so_xoa"/>
      <field name="sl_mat"/>
      <field name="so_mat"/>
      <field name="sl_huy"/>
      <field name="so_huy"/>

      <field name="sl_tc"/>
      <field name="so_tc"/>

      <field name="so_min"/>
      <field name="so_max"/>
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
  </commands>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22ciTfxXLWkc6njlqPxulQ8Q0LC8B5NMqT/jHhfrgr+Va</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaElPF94WC1H3TGLYynP7n9cn1++/Ugee5v9vIyP9P93evU31dNJ8Apw5n8R2v45qBA==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyEd6dUhmivDwyzoqUODQrqdt3byG7xNPGVq72xvP8sHI6z1LQEqRXdJqp0I3uO9y1mqJWSZY1qnQu7VWYX0jU8F4=</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHUCothhCKotCSIkskECrMjgMEFQ/se9YBmE98EHtb3RO+gkp+aF3P5ocopa1BqepGw==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaMyp/hoC3GEwJgXvvMGnnSUGj8ir0mjXFW0E+Qul8Dmw4TftN90FpnIQaK0s2jX0Uw==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaPucdgfa803QnzbtmPHCIIvqxP0hg3nAxtExBf5oNLp9DtOiPsYMx4DjDtJLfZwwgg==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyERnOvM4NG/oV2IoQpuvFNmPT8aFeXkqML0n58IyfPpyVJPSeqAr9CDMdp2coTBVvqu2lHuxmjkVCaSy+1KF7qJdjMycOlSdvOonHBsJv7YSH</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHXu8ejmCjlg4le7f8HVshRtBF4ioqKfyU4hfHFBUbM2ne2yibGCLdcD3oUKSmkDPATOxmvUiq16ou0ouKMNYLR0=</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyETI2WiGOq6VNUevZE9pq357DcNxnQ9HSc0BB2LwNdOowd5xhuCTqWPlyeJGmutd9k7dwE8Gc4P4qPGxTeRj4buerfqDCMF+LCufZ6vfLWtpFG+bpMQPKb/min+JyczVhUILDr8ME3dwYnmW/lLRzCdoFkLanWW8BD13yHnlDCUeHTQQGVk3wKdNVjxFtggML2fGME2PZAihAl+B9xs5dRgF+RxQNwiBwUN7jUeLY78hd5paGJGSgk6wsxAhcRZDJfa3ji2fWQ19CFvxrIM36WV/eGlFbJI1c3KhA9eHV2nA3WXOLn19IuXGnbmclalZlZj3P4oFKFHv7eT+XF5hLONtzlF8XXMDdso+RrJKm858bncpw1lB0fg5JKwk3t5YglYH2QKlaMQSMfWL7EQ/7us2BboBJbRdwvGT+fwoPOqkmqa/Ss96U6VaMeEnzW/r4Aq4pLSXnf4avebVQCkxA4ocZxBfTIiamv6ZREXrjzEdTBpuurDdjxyO5UCZX72PWps42w1nWaMVcgC9AICfvTt12mrS17mNP6LPov7itt1MZH2/gqjGulskHTnSjuB9e7Z3dF+1XhZzGs5isA6ZQ0gD0IcttRU0LhPNf+9ja443ITutQq00sze5x5DCdZfF2lg==</Encrypted>]]>&defaultName;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHc7X/84zX1ElDBQ0Oio9BYjYXYRYc0MA/fHbXj5R51/THLr4vqJR4aVL2yaCgOFpoqNtBnv/MOJOr6tRthqxxNeKKm32SaB99HKy6e6irdF1isWw3mX99s4LLxHbKzgndH3rBMCtT672DPoOqHr+wDBKa9HGSTKH6iN61zTADcd8QfRj/xqM3bKHbVlTsxFEmkI6ymrevtL9qBbzZfRARu8gp3ZOJOdzmGnZuJSmfok2s7HhCvx6Hn5DVJ20Gf48FoWQbuR3WreK9ObOF3NeNCoV5VSOzrfoR/nIA6xqrEmJ48IT6zMdiLkSf2Swq0OAAyGqs0aFFHrmGDkXKjfS3aYI3uobRc2UqKaER+3N409pDldHhq3brU44EQeGg7fdVMbdBrtLN9+9J2vNKlnzxDaLMHv87gxBPSHnj49JGBLHjbIUaurOVQMlKS0CwfgDaVlSxGtIscjPzPhAxEF/TsuZa3KGT7Zu5AbpZPWmeYUw1IeMLI5Q5+6VTne7eFclDucVhZViaOLOm7K4j+LnFK/kacxgVvsMhQT3YKg7Y5yEY30vqZolRmSEA1MTzuM/xA==</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Save">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Um8IsDYtnV5K0WWhzol1o3nU+gQ4dmpFb8+gDp3mA2R7Y4Ek2lv98CVxqojRAboTQP7AtS5beN0o15ogeWUvC7+phBJ4JVvbt31YzdtMMBrD9F1pSZFy+vLwtNX/tY0fKMFdwNAmq+d2/qOQmgU8xk=</Encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuwNJb7NU+Jv72TBsR/SB74QH6a//Flg9ThtbAxKXedJeJ88OOstDPP2iUxte5HWOgS5N0ocLtsUBsyksWya6czYAqcC4Ty1PsWfAbD7nx6BbdT5oP4PG1ywZeSpUtF0byH9Td8lM5B5epOtQZbwVaYUSs+ajXbFhF9g0UON721ZY</Encrypted>]]>
    </text>
  </css>
  <toolbar>
    <button command="Save">
      <title v="Cập nhật số lượng tồn hóa đơn$$90" e="Balance carried forward$Balance...$120"></title>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Print">
      <title v="Toolbar.Print" e="Toolbar.Print"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Aggregate">
      <title v="Toolbar.Aggregate" e="Toolbar.Aggregate"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>