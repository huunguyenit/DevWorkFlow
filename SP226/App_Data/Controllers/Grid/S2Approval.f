<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\TagReport.txt">
  <!ENTITY Tag "cast(0 as bit) as tag">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="ms2$000000" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="SF2" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Duyệt yêu cầu sản xuất" e="Work Order Approval"></title>
  <subTitle v="Duyệt yêu cầu sản xuất: duyệt, hủy, bỏ duyệt..." e="Approve, Cancel, Undo..."></subTitle>
  <partition table="cs2$000000" prime="ms2$" inquiry="is2$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_ct" width="80" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="&Tag;" type="Boolean" width="60" filterSource="Tag">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJbtHo3Q0hC+ZW+BSt29RDWP80Vcedfyf9uv/1yggap7nO4MFdA1VF5YBLaFiF/rXPQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="100" readOnly="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="Thời gian lập" e="Created Time"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="so_ct" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_lsx" width="100" readOnly="true" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}" allowFilter="&GridVoucherAllowFilter;">
      <header v="Yêu cầu sản xuất" e="Work Order"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_lsx%l" width="300" readOnly="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="Tên yêu cầu sản xuất" e="Work Order Name"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="sl_yc" type="Decimal" dataFormatString="@quantityViewFormat" width="100" clientDefault="0" aliasName="a" readOnly="true" allowFilter="&GridVoucherAllowFilter;" aggregate="Sum">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="dien_giai" width="300" readOnly="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="Diễn giải" e="Memo"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_md" width="0" external="true" hidden="true" readOnly="true" defaultValue="'1'">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ma_ct"/>
      <field name="&Tag;"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>
      <field name="ma_lsx"/>
      <field name="ten_lsx%l"/>
      <field name="sl_yc"/>
      <field name="dien_giai"/>
      <field name="ma_md"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75wyrblg9x/LWUjMXc68hO8lFoGROL73KN5o2AEhJRXylmpSfT4y33ZDwCpzZFr/G1bOwChISHFUsJNthpWr7XIZbiIl856ZMPm2xRzTa8IbTa49PadCV2Qn8pcFC6DqswfD9t6OuODmUVlstz/eToPRw1Ox7EfIZFKs/c8AVRJCH</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75xOmtVO/UwL3sPtoCIGHcCcxQblaTsEjRuKzd/RvOOn+6cT1Cw5hGGPHlhlLXdWpK2/fZRlekc4/qtc73337ivM=</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL752wZOsD7h712wfe6ZAIT7RagNfGlCYzcZfkZXiHFRCdob2wdyHVAEVwlYdBNaM3f0XU/ofDcCyjnMrT2hb4WbuQ=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UiYbssUniTb0Eq5Cfw62iyb4rO4nf2qm6ecSDnCrTJrrLP7mMlBi7wwE1C/2XvMR8vOSZFoT+Urgwh3umvO5xj9KwFbixcEUc9U6oeah0+mfGms1fse4GEiGt9Ya+aukH4cYS/9QY/7fWIBT41tXv8=</Encrypted>]]>&Tag;'<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyQ4j2stgvIVVH8eyMVYSuAYZIo1unHaa7Dle6rjkuoGIzP8O3vwxBqupgcTIsX4UMzc3KW5DGCH5/gbZuS/lR36I6uexbEZL/NojqkHYTMh24F7nMqOIIq2JYb9bBP7X8I9t5Jn/0tBPVnQLZuk5wAbouUnQ6CEtve29zeSjWkZeUQ1tV2QpyN/8KZNv1suV1pxFLGswIQARkOEFEGal8/u3MW5EUzY5LPDMRxItOiLn5Y0ocTo14yMDPcR8hXhQhNwb5cLZFWB4LEW/9VzEonGxPTx7l5958qG0mlH2L3ztDJCvZELdjI5HjP7RKoxPGcT9RpPhjPhz1G5zRt6p4cxKsEylG+od3c8V6NAuLlZEGftnQN1hFBHTcNRFebc+Z6q1TtauDuNsQ8ZuaA60v/SxJU1U5t+k+f7VTSDP8izG2bHT50mwMT7tjW0wi+gYn4NFM21DhuRGa9Hu8JyVvc/O7fNcZzVrfi0lrQS1B3amvX7ThkPvZCzlg8WvujPB0Yb+CrnUKAbSsAoEn4jzFcvicNaagzfohLO2+I7lItAIs5bI/NiCZ1ks5senkrR2s6Zsafjir2LkKZOxXuQcNMlIIrfWECVtGGQychzkPY/toVTLuJ/v8x48PJRlaQZlI6UDzq7zBXIdB8fvTkk/JUMIF82Ry/HUIJv2wrElOsZi1jEffVJobSxEOLqdhwK7tnUZ9BOjLplYlo4LHuMCDTv4vCU58Kbr5IyXChYNnSDah3jFn/mmvlzmELXgDh6FNhP4Gjm12nK5sjU9jO++c8KdgGk/in+QjAqTt/BiS0kCbfGN1Q913+ZWZuobY8P/ldv1TkfDRcgCdAgYTkIo9F16p21PH7d1lVnHlF5JbO7vHkrDgj0ipfzhAQJiJQYRET3j325G6R3QQL6cmTTzKDNY5aahYvOhIcAJjhzUOlEz52PJU9+GuwRsBIYwz9s2LiaqBAQ9/7hORivus3jjfy74tKlMGw5GmHh5UdWDBkwuiqUybGiWSqIv06xh8ejsYbfzTLPbPv6RzSu9Z2p3CSFHhVEf6fNqgNamzfmZNkTR5Hy1FLrzGhk8mdlJbvvW/s6j43/6oxTIy1gXH8dKE+rAVNWWyfilMdWKQdYpZOfD01QcR0Hrq2sqk8JHnl/21BxKp7M9QgtlK1HouEzS123Dgg3lc3xj3I80VGdg/SwMbMN01Yfdrz2CMpveT+WrU5JsNOjMIe8V7pJiK+x2dl+BlGIxpfWYTRC6Mv1tKhESYrBjUl8rBmKT9g2reJl3Ga/MrIek14nHZyUGLfpiBl05FbzOXMCzD/uRVcqEKRLjoGJmMqe/3hREvzF2So2B5sw3ajznySnmE7ufWzwv+Pl4R6r0aoZ0x/NZ1/PUVOgn4Xl2JTRVhlB4w7kvbrBsWipa8AZZLyXZYCJRsinThgXOvm8CK3UKnOGR/OIgQLcw/G123LmSGvxM52xfhuNnpUh7Sj99IdQWYUvp8DXxfTYrpf/ctHCvXbf+5V6vYR3ABZZfo7rs73rTObWInteag9VuCspudl7J5NM2h5FJDwgby2DwYrQx8zLD0FHLxI5lOvkuVL/xb0J7f3JzQ0t6q6h2oAXJqgJddXkNTkkuD1EjOhBYw+q/bz1GfXVAgwfU0+6oA0e7FH3Bf9O7Ro/urHlyxqBpW+QpTrrhw9eTDzZWX3hdcVUeVHeRpRkorxXUZeqtnfUNhiTjVJafs7BC4D4bdPNm6fNgfhJaWdZp1KWdlYzehslhZq9T8nVCNPCSdMRDMyjwB52mgcX2bf+iJV3AlAXxIeZRbaIsgBkXpg42ikjhZpvk+uGtkPlYLRpib7HL+SEPeX78vzRNsWLYPo2yc2BSyEeVOrZEHDkWPAOXv50fgIAbQFVcnqowdm2G7uOy6XUllX8gx0OkxkL0EIYRnhIgtH6fm5dUKF6saLNxipf2ZgjKA0qOs1s16xyEedvYpQrRhs/9UOfW6NHxMKZG+ds+TtbRadI1yxzdp/6QYoeh56XqUfIi/4pzrStVqbgmezEwTBa1vmsZc+ZgwDtHlpXqK/Pb8REzUkcV1JUoT7U8kV0lVIPFvAzdEaWImgWK8sPoLrrjO4sgbdjqULu2Mqx6/dyUN2kXFFyytoUvFDRX6JtxsQHgxT30eqDuikveGD43cQbXKXHtndFxZSjiBrXGChc2kORfNV8Bocc=</Encrypted>]]>
      &JavascriptReportInit;
    </text>
  </script>

  <queries>
    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>

    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&Er6kBCOukK5FxLFOw1tnB2vGUkwM2HPD6xtkeavVkj1QvpANIXg/vRXm05JpWT/a8Hs6IIsx2As5zGbAkCkRnYw1g6NKcVtBlB3+67tw5Ed+W6YAIl01MG/T7aayUzwMAWoK2H752GHJ0mCrteA3TBS595kFWwtB2/r1AXzbIbMyU7jQkP2pCVPtXXFwYeen8JIuzoryZPjiw363csfTpFBbZIH21vRDLFNl4SsFcaeeIvqN87qwMk6PepQZJusk</Encrypted>]]>
      </text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5EZGzXsNOvxp2yZ6ySsJabPsrTjvnx9z04VR7SBXt4S/jyzf7CTuD1556IRy0vtM7okNVZnNI5tUjgWFWJxnfhn9m2zTHfdH+8DI0+YYqDgkEhoDMIyLjIVvh6Vphp2F6XXTLKu2yQZIDSO/HYGbaGne69AGegpLvDaJeMhZETQsAeDiPjpl+wDJhka+fgAJEaSnBR1utt7gFQmRJo77LtLVPpmzXlqqsByF2eNSjSyYQHhlavUNoHKCD0DFuOyjLEBedzcFydWcLVJStJ4rL+P01NT9e10CKSKqBspFcdvTKkTKOlp521HRFzhT9481y2weo1oeI6OIwfO0Cr5usiAa23pLs/hkyQS8FxGwuUzkScf3sV72dKcMGvNUAD+W7pxPCJn/zPDybwximidkrTGNh0CcizymL2OcdI1cIo6c1dLWFRxrFfVI0w7q5RrsvtH+XkFLsmW7Ivu2dos+UROlEsRrIvCWOQzlpMAmL8bQH88W99Lz6rkkzq2gusZz6/kBEDHp5B0YpSQy3wLeGnN5aoelho0PCbWaraGTdCI5CxA3GbnaHfHwVuNPvyVCGDr6KkCTVzJUrVnuWb1jFYFUSr4RmXE2Jpr62BhYMhkbQBc+eY3n+OrvZkOpKvQ4/D/EYRgpOHxJ/denx1uFPqMLxBeY1fEhXOHccQJmzArxnEj7LJB9wVV2HpujjX9YrqagGXDZl76R0Gq/Ts7s/jBk+z67VijaPPo3ouyyAAOeM3mrxRUAQ1w+2WhiWqG3tVp1b2zT7oyEw3vMug42lm2gNVD1KZ023JSP21QbMAOiks7G39I1TrGpd1l91OAvVl8k70VoNyeeXo8WnyUhqbDFngiXK5ualllR6AgbXBn</Encrypted>]]>
      </text>
    </query>
  </queries>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5Ud+naG+CCdS8v1iq2JcN4vMJkRDJXTctMAmws4lyvXd1NcnhZELus15gHlXXymyQloxomyM2O7yGexgwdHImZMC99QKTLkNAeA178/w4ezlDQIn6bbJvULXXNhCVsof8vVEU2HqIrMIh5V70RNLa9WxO4EDRnNQZ5nAF6JQz0O2pVboXe/nj8av/xTTmWYocPQqaEKVvM1UevJCTsk69RK5OyMoQK/EuXOB7B/RUAQvcdYTyWHVN+2cmBCj5wU3dtF88aOOQfAGAOqm6FxS2Y=</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Approve">
      <title v="Duyệt$" e="Approve$$75"></title>
    </button>
    <button command="Cancel">
      <title v="Hủy$" e="Cancel$"></title>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Undo">
      <title v="Bỏ duyệt$$75" e="Undo$"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>