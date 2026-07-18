<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\TagReport.txt">
  <!ENTITY Tag "cast(0 as bit) as tag">
  <!ENTITY Controller "hrTSRequisitionApproval">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="hrccyccp" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="H13" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Duyệt phiếu yêu cầu cấp phát công cụ, dụng cụ" e="Tool &#38; Supply Requisition Approval"></title>
  <subTitle v="Duyệt phiếu yêu cầu cấp phát công cụ, dụng cụ: duyệt, hủy, bỏ duyệt..." e="Approve, Cancel, Undo..."></subTitle>
  <partition table="hriccyccp" prime="hrccyccp" inquiry="hriccyccp" field="ngay_ct" expression="''" increase="{0}" default=""/>

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
    <field name="ma_dvcs" width="100" aliasName="a" readOnly="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="Đơn vị" e="Unit"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="100" readOnly="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="Ngày yêu cầu" e="Date"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="so_ct" width="100" align="right" readOnly="true" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}" allowFilter="&GridVoucherAllowFilter;">
      <header v="Số yêu cầu" e="Number"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_bp" width="0" hidden="true" aliasName="a" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ten_bp%l" width="300" external="true" aliasName="b" readOnly="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="Bộ phận" e="Department"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="dien_giai" width="300" readOnly="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="Nội dung" e="Content"></header>
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
      <field name="ma_dvcs"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>
      <field name="ma_bp"/>
      <field name="ten_bp%l"/>
      <field name="dien_giai"/>
      <field name="ma_md"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75wyrblg9x/LWUjMXc68hO8lFoGROL73KN5o2AEhJRXylmpSfT4y33ZDwCpzZFr/G1bOwChISHFUsJNthpWr7XIZbiIl856ZMPm2xRzTa8IbTNjT1n0Up6HQS96P5kJ4kCe261FC9yVpOZ6PAeIU1+8E=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQuo0eS5b8e+DofV8FmhQ8f59GTBDNyXaR0fVtt+WvB9c6</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL751wZiTGtWeHzFQZhMwU6K2dxZTKcK8IzZ4gALgNH9xBQ</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQuo0eS5b8e+DofV8FmhQ8f59GTBDNyXaR0fVtt+WvB9c6</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75+i0ZKH2wHirB+ogDbZlW0aBktLPOBxnyAlNrxCsYXtb</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQuo0eS5b8e+DofV8FmhQ8f59GTBDNyXaR0fVtt+WvB9c6</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22ciTfxXLWkc6njlqPxulQ8Q0LC8B5NMqT/jHhfrgr+Va</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaOtLj9q0e0vQsYddq0deyM2F+Fj5oj/V131Fvzjqgfriz8F2tF0V13j+Xsbot6S9idtILJ8Sj8NYs2xOYofb8sIYZBym1rzHmBvDUUqRseY+V6MHfTFCtKkj5JH63ZIBlw==</Encrypted>]]>&Tag;'<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyQ4j2stgvIVVH8eyMVYSuAYZIo1unHaa7Dle6rjkuoGIzP8O3vwxBqupgcTIsX4UM1BmJV7MQL7Z1OuMDaWuuODs6/Jx97cBwe6mzZ0FONaj</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyEXiWUQ0H4vSWLEfZL3wtMAA9cvAXz3YyJErBlwgYgm+KJqn2j7wKdflbqAKLp8sGeg==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaPyUNH4vVNI/7IUQwyLsvCne1WnKACQFfw7d+fKG0VC2IYJCRT2CQIEyS5+6twdDjhPjv+7DVt05qvUf9Z0TAdZ/EMxpzZjFdDl8x/5bxenul4G2rHfm+xtVafNIiaxMiQ==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyERnOvM4NG/oV2IoQpuvFNmNJdsB6OMvyGDRDslybEqOXLNS/0Ollo4wucxE60wCPw+uy22/lVD22tf9Ndv60Zy0=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaK4iyriyzd7MrdeQoZKjrueBlQPZjJMYMfBU5pLKiQMNsQwPGMHhi4sKvRLYANjjgQ+A16PFCKsa2xfOI76PH5w=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyETI2WiGOq6VNUevZE9pq357DcNxnQ9HSc0BB2LwNdOowd5xhuCTqWPlyeJGmutd9kxF2kUcTHSh8q7Dt4Zlj2rFzi80on+Q/lL6Vmr6jT4mHbYyIsL/AWazbG+AHJJnkf+XYH/XHk4q9WnFMQXNs0C0gQCF6e2E8Zy6WPxdz2va+u+olxnW4rxUJEUg7W7tFpoM5koIOB3iJASqwz3TYSU0xphGh6upzxtuvcerVgDppyjAnGFWygYwsO25uRUJ6cl7wnFbMv/RCp1zXQ1e2UFSFzg2u7RSlnKoSc6RuCBpMHtUBEmqbXSn+ktxcvdmQ/gYPaUPF5TzIaP/VYiO1JPS7f/U0xGris9MDllQ3lZTjjwdWE1F98zuXpzox0EvyhAdBl0/R8F4wupnitAhti91lXyDga2b+hm2QWsEAAmheSskS5xKZu9BTr0TvOO8EGif/OpGL1ffMTEwj6zTwo2+Wvp2LcfUQzoROPtRcjr089E+zdm7/XRhP9Fxe7aw2+St/yZYAyegbfoheJuLVb4OYcimEyxbhR1YCr9lKPz1K</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&6y35OJkvzcigmdt1M9ccQjiUjCU+IZATqa5sakQlbeNfGK1pPB1ONmuUGw5LyR3iuTrbF6zKzoH76mLws11gUU1FzOMcnJCuZQ00qYalL/uoKjkRUxwG8FavsXNF/Dy69iXnyxvW86vTOXe6vwQw186skjbD6kv98uZtSggAykOrXzl5GUS3YOH2NlVDRCzZP+1piEGkvhSkQsB6QnGaVY7fa256TIn975nYRZ74BOA0/s89YrGhc5BP6+O/tEsYDAXno7EFHL3sqcrWpk+bNMVkDwsSmKcTcD1e9zYB0cjxioBQUiFxbfLgEEYQ6oqeVKaT4jiiGdBEmNyOjmqBW8X8aVZOqTsm1VJXukFYDCp2AMFRrJZH85nuREW8R2MElftSnNc5QMA3i/i0zYYoFd+WW4Mi+YOgwRW3NeCC0PEbejXlZm0jpdkvs+CKpXZLHiQlT3uR4HL/MSdJbg1EaW3cJkpG3gLR1niWzHuf297UZVKBH5voknOyP3H6m7jBlzRY/rwf9TPCHupjsCSQeUWyFt+s6ifO/dX+gY7kUUo=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&6y35OJkvzcigmdt1M9ccQjiUjCU+IZATqa5sakQlbeNfGK1pPB1ONmuUGw5LyR3iuTrbF6zKzoH76mLws11gUU1FzOMcnJCuZQ00qYalL/uoKjkRUxwG8FavsXNF/Dy6SMLgls/6FniAxCCvzU7p/xQOdzYrVNWWcMtYo3BiyyizImrfXNt0KaOAXT1RM+zQVYgAQzf8E+qaW8dkdayL9/RjbUTUZ2LFJds95qfp3UUTe3belDlkei/BUucIhOthBbQ9lMExgN1YqUEoKVCvxaAu3ztiYe1xYLRqYhnw5qux79I7LczU8Ws4GTcccnBNUaX3Bpu2GQU3fnXqDQEEkW1oPshtHgjEjwBIYnK/ov09z7wVJJ+YCxWWU7iyX5FrQS2f/ygkFVSlA1aN2IQRMNjMZDIFvjAEcRlYaNli5m9oAEzQAoRoVbEbWCH7atWhSbXmQOqGcaLUSlO7ahdAa0O5nB0JD1rSdvJEqZKLjHBxABepfcuROj/pVb30OnaNzjLojJeFNGWgcYhvb9X7u04jQshUS2bc+cLoF/hCZxCYbaSmX39cEV5CTx3cqkQZ</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&6y35OJkvzcigmdt1M9ccQjiUjCU+IZATqa5sakQlbeNfGK1pPB1ONmuUGw5LyR3iuTrbF6zKzoH76mLws11gUU1FzOMcnJCuZQ00qYalL/uoKjkRUxwG8FavsXNF/Dy6u6+nVpoHVH1FEkRk12x8zLWr/Z92hwDRCtDi8T2XoEjnqkOc6UwckVkQQwr9yuZjSJYEN6zqr895QHRdLjCaGA==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&ExC4VyevidizrIeD1rekt1pT0LLN75Zhg8EAGYl/vrAgdP2kYJuKYjp/Af4C51+UDXFYP1tDXqkLZpUfNO5/RmzqfRLmfu4rhKw7pzMH5+Y=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&+yRcV3XtE2MrYJ2A84tg6AmXFOX1wRu3cbFHv8/RLr+AWeg+sq1J7o+Pw3lj5wKLj57jqZHYbyWTQYQDB9KLFD055N+4vQ1TQg9qknkm5tZ4sm+mEhaO3TQ3h5zLtm9Hjncrzg/b5Mp+yJZgQ4o8FA==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&ExC4VyevidizrIeD1rekt8OnOupT9acPBpYK1QXcd+f4EkYWHK0BZnJ52jIL5XaCp+s3L1wLB488/kfxYbUF8+AzV/3PcHDItAnezp4TQCGE3dR5xkV8rDu9WwZzsigqO4uGBAG8I1ctcEZTcIKs+m+mLm+h+rHHxaXBbz7UeJD7/dtBHN/7BbAdcUK4lNn7fRFowrGZTpVRdKK5pNvk3ig1b9FfJmcTB15IryFQziVVZ8A3gqi2yZVyWEWhvRpyDPG0BXWsJg8OYORc/ZYA+g2cpIRasS3zLLyivGLEMnJ6+4RlZG8rkTPWH4j1JX0BzwfNvWmZ+/MnO0SozbpJtthOD9XyY4Ayi9kKGQwBw/VFOcWPRe7EwHTzaI9QzPZ15pY8bBnAzSJCTssoWkeqtfUA063JaU5VDW2OJGW6aeJkyjzXqmEjTr+7VH7yTM2rbk+xEIv4JIumcdQho7OlXy7IdBk+ZEgdzlYs6DdVLeFGz43xk1QxbnOriULbzbFSPMuaFczjNXb+usDsAbWyasK7O2QeUQbXdObrGKTxN7ihUwRHsZcDOCbPPXrhJUdOXy3tApoh5rwRR45YuLAVLs+G/SpXFH5BfBQ1cx6afksUA3+tj47BaJGTLxV9WfNgasVfrljyB2MT0DUBLwjKmpnhb9APwpVllno2hkWXyAq7ltiTllh+AHKbS+KIQrcJy8c7DzyIBdALpHSmw6jAsFqmY5s3lw2iQnX7bJZqTtt7TzkVag9zmBSfkEpgnQNsJeSzWorE0UGl2GHHJhlAAo/b5tRvMtHScRwqUl/ci2pA75OKN/HyhWrpZLe/1RIsUmiZPcHZFyHZEFnt8jukKN+GINB9oGS/cRKqwuenG+9HJWo2swGWbM2bJbI3np73RM3FvmkylOKqhYIBvfCt+0LeVqynXu28ALGrw/C5tK+ZofLxn7XiXbSlOiXYAnL0n5nUhF39OrEno1f9XR1/cUHmQH46JTvWEzbDkDCH7HvJh4s9hk/oebdbYgD+9OKFkPH65ps0FADMN9tUxoFgKANF+WxwQ/frFtMjTaxA06NhKRzGZuGtDJp80lQ6+wuzQyvZPABzioEY6Co4vg7Gd+b5ipuajE9dugSA4r2cOtL+IwpJoRZgfqjLNYF2Zk5TikoJMOMHCelzM8ukY1/D7FVcNAKUiN8E5ri4kn9BeNTRtMLS2zVTRMzXY367WhfuWqveBK4jcSiORSJfdtj9xuhSSgtlymh3YF1uBuurGhHOuH/g6A30lVieQA2PjqOfhUu3E0RRWkxp/Yr9qtarTOKO0ZkmSAhRffLWcVucD3m3etDGf+9OxctnoPpY8So4T9+e4xuxy4aBj3iM4DjAVPo+wr2ySVwrwwmG6adKkRvbBiLbU0ioIHSbZtTBR6oEgWD1fryLcdrIz+iR7T1mNOaFeK6+CCU1o2sVW6B9+rU5EdUC1BY1bJNS8DsQ9BRvTIVREZVMQ1a+NlDRVJqB8yqU9ZQes/P4ydbcKeY9EcuKmBMcLr9+frz12y7QNsGwgLI7Hy9LHxfVVT811SKQHwuvdx7inD8gTHr6UCmj0alK3csRpFVIdd3oHVgRefRubaNrk7oS71tdDfySA9HlHpq82DZLtxP5d4X3oT3eIrc=</Encrypted>]]>
      &JavascriptReportInit;
    </text>
  </script>

  <queries>
    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>

    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssSPEYXzPZ1oaRReIa4A7z5IViV5NMA7g9X11UZGYWQTlX7P+N9IaXPtswvPo3qhDI4Y2Et3IuxVA8yGOWPbXEhgvTStcahPREdZXKElpVBzvi1i6X4USm2nFRanUk9/feFFt9XvX+RiYSJMl3c5Efeeyh5e1lTK0wsGSxdSEtioIgplC5TCT1wdJFF1AIa9BydqcoxOgxBn1nXwDLul6c6Kz1HrMAga5yr+8nV1MbdY6RFVsN+gpUGQYdEQ6VTBMzQ=</Encrypted>]]>
      </text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5EZGzXsNOvxp2yZ6ySsJaaFKh7SqivlasRRMf7f02iaBckDu3/IFLf+6SnV5B9wP0HkEO3UqFY1huL70ByQmlz4vpOchZH8rdbtQZmJcI99Gq5Az4pEsW46Qn3ZoOrBWnIXE8CJapMYiQ3Zzw/24WXE5B+Dtt5DQEL+QNR+fWlXOTt7OUl7rvatDR4SrrCifLn8kYP719y0QdT3GnqUIDRTorxzCfwlqEYN4Kgohh2pcWqbtEv3rVaQgMWtjAjm/Ja7yYPol36uLrPsdPh5AF+OxF9h6DjRprcHe/FWF46wio0ukSbH7VAeWyLgTWbi71Hux6wiwXfxTI+QagRKAdnbjaqOi/exOGjN3K/xIb12D00UnvP+0xM9A3dEPo6Ux5chGYcEkdtAj8O//1f6NvwV5ZlM2rpEBBuB8B/QDqDdeMM1apz3n6J4TW19KwZKcMeeD9CrzD+wTH7EIsf4nwEknmpO6/1v5a9dzQ52JSD044MM7ENz1PqMg/4N/K+Votc6KZABW31jnF4yHP3hPj4kC+eIoLVYplpG0JAF/Z9o3sJYykCsQNngKZz39d1EbK4IxoLH6hVKlhR1aUNvLNrqKkY8gkyX7ZPHEHbBBCoPYXSHSoa2MPcM31l2rs3OzwzpZPdcHWWEv/YnoIHKIfFXdzDiSTSRy87W07h66IRA</Encrypted>]]>
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