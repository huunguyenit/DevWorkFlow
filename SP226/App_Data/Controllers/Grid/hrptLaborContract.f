<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\TagReport.txt">
]>

<grid type="Report" code="stt_rec, ngay_ky_hd" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Hợp đồng lao động" e="Labor Contract"></title>
  <subTitle v="Ngày ký hợp đồng từ %d1 đến %d2..." e="Contract Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="tag" type="Boolean" width="60" filterSource="Tag">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<encrypted>%wLn1SXGDs39WFPeKEFTBo1TA/FPU50fQ+29BCE0grzmFl/iXXjQIk5UPIx/v1lcsr/fISeKKTbZbTjn5IGjl5A==</encrypted>]]></clientScript>
    </field>
    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ho_ten_nv" width="150" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Họ và tên" e="Full Name"/>
    </field>
    <field name="so_hdld" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Số hợp đồng" e="Contract No."></header>
    </field>
    <field name="loai_hd" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Loại hợp đồng" e="Contract Type"></header>
    </field>
    <field name="ngay_ky_hd" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Ngày ký" e="Date Signed"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="tag"/>
      <field name="stt_rec"/>
      <field name="ma_nv"/>
      <field name="ho_ten_nv"/>
      <field name="so_hdld"/>
      <field name="loai_hd"/>
      <field name="ngay_ky_hd"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiCVrdahzmlBsGZmj8Wi0bPRfIlOnqBamkUeXXwyMluAGlPUgumkeFumYOmgTuB0TWhQeIRG2Vf1wHW8hxTXww0bb0Hzmsxl1CGmXwitiqVfMAMBtLODe+mg2QG+Mf11+dLRp9D063TRH8zgzbKHZdfTjHPh5ruu+ee2VrLIYClcH</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiDw+aSIFSY6T3tgzVT/d0aY/se1CwG+YS7lL4/+7Pnzs1+y8GlY/syjSQrc6GaHC6Fn7WLdnXr4+uRr7cFRskjgwVXVXhzgK3Ruz391QGem+</encrypted>]]>
      </text>
    </command>
    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiKmTUTkOGngmMGuyruR/Y0WBhrdS65DIANVeKx6UyG3oHHk0CQ0QkKKdpIJRv1XXRfXkgp1HirSB+N3y3V5mTGw=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70PRghbr+9p1xCeuNkC36aW69l+7h9+9TFBW4nW0AaKEbyjCEzHj1yftZNIPW7z37eyqX1W3el/+pEyRK51rxojrpVE5TFmzAhSLX9hRGZSs3DNjZZlpm9RgD+BFBlPVYpOvL0kql4i6Gki8oXZEWGpdll8uPiQfp8ghkGNaswHSdv/fn1ythoby/nLBFQA7/RE5sf9dAhA1wQntGrrjtILYIeBU6A+M+JpXlhMJ3MNnAuUPukcNaIZfvBbKMt9h3tmO14fkEteM9hfawTpPvplobJXR7ApuJqafdupn7vY906pTBWdCYnBHMoxvsYPVNjg9HnR+FLDqPDKbZfwNfPsYfiWmHI4zyo0L58jAv4JqTWkk/nWA4QNfo7uw/HyuT3NwiNXzdZDMdGLn+btTRZYIDlUH8N8SVfPrpd0x7k5EfF80v8mqHilHUHeeVXDh8rc6w+4kJmJm6rXlzFvl7y5UG3aanpbDYGyZ0e29SEOvVhIOTNO9569pRavosqgzYQSDEa7nxYNwl6iUuU7AywVHJ1tPvadZFknTN957PNXi1</encrypted>]]>
      &JavascriptReportInit;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70CEM/CXNF0/iNCbHPk/fDnTbs6XhbnIxPW4u8mj6Ph8Qlj30PDAhCLVOgyC++DIsRWt1ZiLiFogoAfRiNer7ZJr4Cm0c+yxlK3XXr//A1YStQ1jKdhra2LuKpEz2BwWycEF7w9DgRHM2RGDHwVrZD4Uil4aCFl6QYjkbYms2KJOocCjuXA5w5c7DV3XhR7QAre3apw2zS1jYY86DewoNmWrBapgI7yxiyC4Q0Z4QBd2nlYYY+pK1GuCFXCj2GFOur/Irtue4xnTiMc0jmwFh8HDA3B4447nIwB8N2S57Tne1vbniLX6MlaVE3BT+QVLzsdLaJfOy7VaRTTK/cmMqaZS9ztPc0kULl5/TJyBm7w9T+B/RqD5RSYbCv69crPdCzh2UYWdxaapvOjRaQ0nQt+BNzcsbgsH3t+df5Pypa8o/nOWsPN0hpMPytToHwom3NCBTlIm221lUWsLuaB4kAM1Y9HvoX9pKMsuwPM+9FfDG3MTNo9TiyfOgWz05wz91/x0yGjg/BNPuEC6d0F+Ud8hxqwQ+qcz4Tnsx6gU8yjgxqBlQ9x9h0hC6fr8r+VMyEa2RLAS9BHWtnA1yQjtzS+4dOuZub9P2XL0s0zi8tTviw5dwzbxmu2p9Lkal2N0TetblLxBWy9DJKymkKU+7gkuF/ex2yrHQ347efZsPbWUxthdrxA2+BCO2P69WwfMICD4crBTus9Cbvz14ht8ebipUZSvU7k8RxWCXpSFg56R4InnF15zI9LtJuw/XHwWdj59iBuy3N1UIkW8PVNK35XuMkla7DAmRj76/wrYwz7/15NiSc+oUmjp6LyieAHp/2XiNY6wO/9e8UdbDmyKgNV1BPXfSH4ubtwORGdHxd7AFKCY+qIDn4+jiGsIBJtOjPniZ8al0utgPkDG+ZKTRr8a1W3Dk6rjFyl1Zbtg0MgdqfXlbyeCuLV9IAnznZipUK2NC/VqvyoIJ8MeSswzdjD1uAcknsvux2bVLJj7nrdi+4THDOj0O3OvSbuPO0ANKs7p6l6GpWPtvcw0Gb9SAjs8Cs4ZYTIyCm/IXEZ2bWRlz6b0MTrk3+0cZgmcCozpwdOroulOIJSMTRXgXZLJWj8/WAHEXsMUs4utUTpS3EQoL4jewIInlaMH+7kVlbG8/cm5P9X+h9tdF+HI0jNX/5zgsfseXUIYwzzbhTAdlphK+PolgxMx7oIMI0eZ89cPzpWB2SNCTnUUyYPkxDhQ5nr5C3zhfUJVGd+KcivMMWSUl947bLR1NWNJXvHvcUeYfE+eVKC4xlFQ2G7cadWIsNyzwIZN5TQ3Y5RLMtcL6LFvOGRIMbipW+mAqZ9HzFPG6Lw==</encrypted>]]>
    </text>
  </script>

  <toolbar>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
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