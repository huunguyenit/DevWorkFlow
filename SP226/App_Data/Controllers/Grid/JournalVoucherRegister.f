<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY ScriptTag SYSTEM "..\Include\Javascript\Tag.txt">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="ctgs" code="nam, so_ctgs" order="ngay_ctgs, so_ctgs, tk" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Đăng ký số chứng từ ghi sổ" e="Journal Voucher Register"></title>
  <subTitle v="Từ ngày %s1 đến ngày %s2." e="Date from %s1 to %s2."></subTitle>
  <partition table="ctgs" prime="ctgs" inquiry="" field="" expression="''" increase="{0}" default=""/>

  <fields>
    <field name="nam" type="Int16" isPrimaryKey="true" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="tag" type="Boolean" width="60" external="true" aliasName="cast(0 as bit)" filterSource="Tag">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJbtHo3Q0hC+ZW+BSt29RDWP80Vcedfyf9uv/1yggap7nO4MFdA1VF5YBLaFiF/rXPQ==</Encrypted>]]></clientScript>
    </field>
    <field name="stt" type="Decimal" width="80" readOnly="true" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Stt ưu tiên" e="Priority"></header>
    </field>
    <field name="so_ctgs" isPrimaryKey="true" width="100" align="right" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Số ctgs" e="Batch Number"></header>
    </field>
    <field name="ngay_ctgs" type="DateTime" width ="80" dataFormatString="@datetimeFormat" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Ngày ctgs" e="Batch Date" />
    </field>
    <field name="dien_giai" width="300" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="ngay_ct1" type="DateTime" width ="80" dataFormatString="@datetimeFormat" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Từ ngày" e="Date From" />
    </field>
    <field name="ngay_ct2" type="DateTime" width ="80" dataFormatString="@datetimeFormat" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Đến ngày" e="Date To" />
    </field>
    <field name="ds_ct" width="150" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Ds chứng từ" e="VC Code"></header>
    </field>
    <field name="tk" width="150" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="no_co" type="Int16" width="60" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Nợ/Có" e="Dr/Cr"></header>
    </field>
    <field name="tk_du" width="150" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Tài khoản đối ứng" e="Reference Account"></header>
    </field>
    <field name="ma_bp" width="150" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="ma_vv" width="150" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Vụ việc" e="Job"></header>
    </field>
    <field name="tien" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" readOnly="true" allowSorting="true" allowFilter="&GridListAllowFilter.Number;" >
      <header v="Tiền" e="Amount"></header>
    </field>
    <field name="tien_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" readOnly="true" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tiền nt" e="FC Amount"></header>
    </field>
    <field name="ma_dvcs" width="0" hidden="true" readOnly="true">
      <header v="" e=""/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="nam"/>
      <field name="tag"/>
      <field name="stt"/>
      <field name="so_ctgs"/>
      <field name="ngay_ctgs"/>
      <field name="dien_giai"/>
      <field name="ngay_ct1"/>
      <field name="ngay_ct2"/>
      <field name="ds_ct"/>
      <field name="tk"/>
      <field name="no_co"/>
      <field name="tk_du"/>
      <field name="ma_bp"/>
      <field name="ma_vv"/>
      <field name="tien_nt"/>
      <field name="tien"/>
      <field name="ma_dvcs"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvnQ6JIJ0DAjKFJBEciny6nyvbflFD0u65L7R5eSSbe1reafHvFvFWjS9LVwPSidgMoCA0uxHPcKoJk+SfirHRfT9OwcEcXEQSxztlDm8b+z6nvg1XKmL+Q+KSFdn5snflAiG1g314y4UfoQmxchLDD5b6/qR1nq8iKaZqe0lS56bBoVSu+UBemojfY8+vbj0rtr1BuEBkZcjJ1p2vnPoTIFaipw7kc3IOkR2P71L4taUP+thxSODaC3g9D6zX2WE02oehMfQekuUDyPYL2V9ULLKuwZ229VYKU4jfEQiol0Ng==</Encrypted>]]>
      </text>
    </command>

    <command event ="Scattering">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL753W7sVkJn1qX8G5AYCGuxo27k7doDhOZ6XpLfnT0eqn9wQ+/VVs1oUSBRCadbvlPbYSzBcawku2T2vsU1Q3RHV8=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL753ZOxbIC+LxbnrSHSw7x7wObkPS2H/Bx4sZhA2uYq2nGvDFzd4RWXLmwgc3k4lAkrqBSb8y/ZKu8bw12Es+n/4c=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtXzbQrSh4yzrH2nmccB0eyq92EEXphGXZwaECQFoED6EPO7yI0pQXj/CUfAxT3iKGlWHU+Yz/LITXMt90VIL8Q7s0QlNPL+8RW+ID+mAy5kQud7Gdc6bLE7OMkrkoB6gA9bLJ8WZGDkpkd7NLfFmJZ4l2umAoD75qdpKHjHiywUnUOtoUeup4Lo+/GSrzjYkq3k0ph5G/v4NHkA/ZSTS0iN8EBYEpYSwIlLQ0GB0TiEd6naoFqTfjm24nvuH2OOYynTFUY5UNg9oxCYc+OoXH/XLOcur+dDMC9VDIZKzjbxvaOWe/1BQDvh7G+gAciLx5b1M/D/MWrNX9xREvAtfiTQ7u6b2Nox/Tjh9v6m14rHFIB8WjGjO0/3hKGgaul80jOvYiINWBVNEEgAvFNpl8yH4+LozdNECgdE6qzBE5FVATSWd9fLpE+21Hvhly0j5D7IKaC+EYgsoxG2f7wnft8cxB36iKShxjS2my9gP2XjzuUt+8+egH058LboP3NpeICcKFOp2u92HRtEXkojp7/WS433HXqXUicdgG/RJKcmuyper1WNqQyeIp4aGI48IvEhLUVlmhvZcyzHhvgIGG8AhZmjIAleG/zlY6OjeEDO5AoAyC/LljoHodxTBstr9sThG3EDxkVp/UG5Khm+ceqBZWW4aKnfwuFdJgxA4Ge93i5cMBD2NkKp0Nmt1z7Oz4WwfIgE8cCNy6X1CPDd9hYnsmu1RETOqkaWcqfTjoG+GQjXj9BuXRoVt7Ql4qtuERj8yS2LeGxFMPU+BDNpVzZj//DIl3nAfD3bdFWRX3MQU/pSkqjQmUYeNgGx+Cafhrqm5R6uDfW1lxrQELj6R9FJ2zsURY6ar1CtT03LygAxWgNGIH0nptYitVaf2x+lKf06UgbLSf/Vc3ehCwY2qXO6ogy98SgkTMmJrOqgTAuuqJymmWRYpSM7CRuLRCNq3GVKeAe+2BQvmHrkRfn0TK1Fghaj4SfOAOKbFNS6Thnv8KBGTWb1A18xVHNk4KmcJBZM3wiQT9E8hn7qG9aj6v/xU9EtU99e8nq3JPz2NJCXhgjE2DiYHOTKaDbbqWzjQpZs7fQ8g0Lj1dEnUY6+r4GBsEdKOi11ULKz6QHup/yTkkvgtHpEKjz7xMJ+b334kuD8EtIEG01RQrahopWjHDng5ZsXYdTms88W6PfFC3NSw7+T/+rh+iW6yeX6QSrdcun48W7zf/L8f7Z5SCP7LlPt2oed2lzYVZh1PWDEstnoibfNEYCMG5yC1lGYmSKlCWTSxZFhf/rGYWLDD9X7qciTjUCBH4C6vYsWCwE2aa1/r7CxWLG95TRIV5LIog2dRSyeuA3Lfk+OkOccSoAwR2IUl/WngDQMk/aDdVf+cxBlHW9W1PkEq8qOT+jDOiNotRtT/a4QrVbYQU8LkNzJA3wlQvPdR0VNLPXYQ8dHhfB6d4DyRDtIEp3yqqIn6cHYhksiHm4eaEKJ/JKh/BeCS9eCyysDm9GvS74G7EuXybd0+9ZuFhbp6h9SN+ePblA7ZDEexGHBEfOkI0P2jA7mdvqpAFlYt6cR1h3QdyHE4lagF7tSeSVfXaWk92pzepYzI5vitq0hFxSMx6VB7Utdxnm+t5oL2qOzMihSHF1LoDQWN/1y7H7nnhciA+pnV2KsrSuczur1S17utIkcgflLXR8OStALM8cpmrGPCMjDZTog28EYeOar449Qmmm68ecIcBg0LCO8sSsBVGtcm4rb3Sci3pi9eqpJzUmOf0cwMqB4DHqpor0LHfB1xR5kDczVvc8inALWxs8euoI3uJL2AjzjCMFB3omHcgyN9tkRA/OxD3Ht+LQthF2VxBWCv6qh824xhobJgOZ2XpBbLznuqVMNGA308it8lmq4KB22oNXbt</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Register">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5uurMa7aZLgeXESAcEXDtVC3eYWswK3tbWOgGoJVqCZuF8m9GuQenhNKeNUMvn623Z5F/F8GsPhxg1HAVVQ0w3cpv0VKZFm224MKCyuJwD/39/sAnkgnqR4W9fa8phNUZ4tI/VYXtmbDMlzXpUHp2bfQvyc5yLUVhhcLJ7HqT/F01ZV8yDFY61HS5K65xBjHffFKN0Mr7c1zgQ+li3/QmEFrdgWgMiVqWtGcESEmTaq5ZGMmMTzRHOtpQ6v7NLeC/b6GgQ2oUVgwBs5zfpjI/3cB2Vs8mq1ARWHFeo9ouX1n62Xb/FYtnO/d/NWJVm6o1wMvj33apOIb0pqk2bjloa2rA6O2qisyiq5kMdy08MUD+Ev3IdjF/uwSTAdhRy1mosnsA0MkMqzNGKZ1mANt3ze0gzc/uxToJ0DpP5znUbx5DJX/ufLugcvjWYfopF9wDmyGKsJ6X/znbqj21bdZZXGoQ+WQobDO+TjyJ6C2hzycgcdUTJUlbtEuGgf6IC9Fio7QGqt15d5czEBUrCWcC7NKq9r+Tl4BX+63MtbKk+d99mFCxjuT5NgT6EMZWxShH0Q+XU5XQVG8f9lgBvOEURGg/+TTvan3swfH8zV1YvX</Encrypted>]]>
      </text>
    </action>

    <action id="Truncate">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5uurMa7aZLgeXESAcEXDtVC3eYWswK3tbWOgGoJVqCZuF8m9GuQenhNKeNUMvn623Z5F/F8GsPhxg1HAVVQ0w3cpv0VKZFm224MKCyuJwD/39/sAnkgnqR4W9fa8phNUZ4tI/VYXtmbDMlzXpUHp2bfQvyc5yLUVhhcLJ7HqT/F01ZV8yDFY61HS5K65xBjHffFKN0Mr7c1zgQ+li3/QmEFrdgWgMiVqWtGcESEmTaq5ZGMmMTzRHOtpQ6v7NLeC/b6GgQ2oUVgwBs5zfpjI/3cB2Vs8mq1ARWHFeo9ouX1n62Xb/FYtnO/d/NWJVm6o1wMvj33apOIb0pqk2bjloa2rA6O2qisyiq5kMdy08MUD+Ev3IdjF/uwSTAdhRy1mosnsA0MkMqzNGKZ1mANt3ze0gzc/uxToJ0DpP5znUbx5DJX/ufLugcvjWYfopF9wDmyGKsJ6X/znbqj21bdZZXGoQ+WQobDO+TjyJ6C2hzy7iqIB5keYECw8gjUOpIbSNznvs/h8cyWfJ834Re/NN52iXxjHOYM8LLwveHwEXhD7YpJrR04XJtS6G1odocDAQ==</Encrypted>]]>
      </text>
    </action>

  </response>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuy8OFql9ak5+K1wPY1SjWoXZPEp8KZbJeXmX9U5h2TDrzqU/wnW8fdcABqf3ktEO7CTMFO0REL/n+h4qQskDmn9k+F7n+AMb0wE9BxfRrL3wlD1KK4PXusa5IB7qntXPmRZf6BQ7KoClRuFq0GddHsbeR7dhBuDR4S/rx8ahGbhZ5lhaUbIt1/7VU7f3chux7cSEM3FXziWcq/sJcRKeaNa+yuprUdDQ5aSSRmnFni958j6wFzyd5ZRgE4cabeVtfQ==</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="New">
      <title v="Toolbar.New" e="Toolbar.New"></title>
    </button>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"></title>
    </button>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"></title>
    </button>
    <button command="Search">
      <title v="Chọn kỳ$Chọn..." e="Filter$"></title>
    </button>

    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>

    <button command="Register">
      <title v="Đăng ký chứng từ ghi sổ$$120" e="Journal Voucher Register$$120"></title>
    </button>
    <button command="Truncate">
      <title v="Xóa đăng ký$$120" e="Cancel Register$"></title>
    </button>

    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>