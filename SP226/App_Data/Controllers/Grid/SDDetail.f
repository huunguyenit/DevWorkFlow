<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\SDGrid.ent">
  %UserDefinedFields;

  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY XMLGetTaxRate SYSTEM "..\Include\XML\GetDebitTaxRate.xml">
  <!ENTITY % ValidFormula SYSTEM "..\Include\ValidFormula.ent">
  %ValidFormula;
]>

<grid table="d22$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="HD2" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c22$000000" prime="d22$" inquiry="i22$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="tk_no" width="100" allowNulls="false" aliasName="a">
      <header v="Tk nợ" e="Debit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <handle source="dmtk.tk" foreward="true"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b">
      <header v="Tên tài khoản" e="Account Description"></header>
    </field>

    <field name="dvt" width="50" aliasName="a">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100">
      <header v="Giá nt" e="FC Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Tiền hàng nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_thue" width="80" allowNulls="false">
      <header v="Mã thuế" e="Tax Code"></header>
      <items style="AutoComplete" controller="Tax" reference="ten_thue%l" key="status = '1'" check="1 = 1" information="ma_thue$dmthue.ten_thue%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQqbVT1dYO7PgtiqoGqGgv7w4AFWAwQS26yo9pzYuhzkghzgz1yWWvv4ZnV/zjKFYik=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_thue%l" readOnly="true" external="true" defaultValue="''" hidden="true" >
      <header v="" e=""></header>
    </field>
    <field name="thue_suat" readOnly="true" type="Decimal" inactivate ="true" dataFormatString="#0.00" width="80">
      <header v="Thuế suất" e="Tax Rate"></header>
    </field>
    <field name="tk_thue" width="80" allowNulls="false">
      <header v="Tk thuế" e="Tax Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_thue%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <handle key="[ma_thue] != ''" field="ma_thue"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQqbVT1dYO7PgtiqoGqGgv7wQRIre2G6m8lJCLlDdwFkV/yU5bq4Taj04OwGRPhyeog=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_tk_thue%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Thuế nt" e="FC Tax Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_kh2" width="80" onDemand="true">
      <header v="Cục thuế" e="Tax Authority"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
      <handle key="[tk_cn]"/>
    </field>
    <field name="tk_cn" type="Decimal"  readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0" aliasName="c">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="dien_giai" width="300" clientDefault="Default">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="gia" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Giá" e="Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien2" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="thue" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Thuế" e="Tax Amount"></header>
      <items style="Numeric"/>
    </field>

    &XMLUserDefinedFields;

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="tk_no"/>
      <field name="ten_tk%l"/>

      <field name="dvt"/>
      <field name="so_luong"/>
      <field name="gia_nt"/>
      <field name="tien_nt2"/>

      <field name="ma_thue"/>
      <field name="thue_suat"/>
      <field name="tk_thue"/>
      <field name="ten_tk_thue%l"/>
      <field name="thue_nt"/>
      <field name="ma_kh2"/>
      <field name="ten_kh%l"/>
      <field name="tk_cn"/>

      <field name="dien_giai"/>
      <field name="gia"/>
      <field name="tien2"/>
      <field name="thue"/>

      &XMLUserDefinedViews;

      <field name="ten_thue%l"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1++DOikvGRLi64+GfSz1j4wRhjy08Csm+mEvX8yk4rer8GGgqVuSycAKuHOwvHqNrea5S5H5CdHW5+RIJ5BzTTPAtM5/ufDAl7Zk8s3mE+NurJ87sxlDtcYMnPb+5rest+Omug1dV5eIE3RD7R2SsRWOWV9BRmvsNi+xBemLAWe72MHakQC70kyk8eayOD0dc5wYr6d+wNFKudvLbEJ/jfFMhbJfk/pTX8UiOdeIX9NuWpluaFsRDuSoM0x45EoR+NhCryb4DeLOQFUBUcq+h5675QeMhNghBHKr8Jn8fnKfScOhof3IjnUO43lxhAPEfWxySUt+78DCFXfhJv9eT2o8el92vIF4ss/IvLwjAO06kC6d1P7MkFSnPy012YG3S4IbLrluujSxOz2S4P9MR//h7/LiO4q/BFQ5fDwXohmSAsBK8e+b9wNOXBu4ud1j8nfSU8JjQuQzB3D8In5bGI=</Encrypted>]]>&AmountFormula;<![CDATA[<Encrypted>&ANHEiKqthwbsi+Na3F+vkpgaVPUoFEx+EMnecxuCia1Uq+oOVsHT89rSC5hHspC8</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75/ghczbVOBPRwf1LYd+9YtJQHUieW+tEy684JH2Jeoh+wAlkGtb/hPuebcl1oNCq33Zb0g2EAqUE5R6pAjLXE/CmMsHlwhF8Q3AGgC0hPsRVJMhpYDQzcd4dxRxOFWlojA==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL756/JB6dPeVkwCfYuq8ju3IgTyvaYmP5SXM3CTuGAFlasExTxCBQbPEXIWZA/Ry229hH4j2n/gnYZn8ybEUcQSpI=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ6AUMZqevdhU1w9/FmVctxKTEfy8nSMu+uMpM5NcrEaLT0P/tQz5GcPNIoVQeIOg3ppW6JASPSCsXNqUXhkbW1qJq1RlgxuJkKGVxeFKJqARoIUKRwSKujaHgIE6m4OTDCtb9YJrExnX+33mIFfqU1QHX3oIxjSSEKwiBdpVVAEmg7/Zel2N+9lQEBfos/3/HV7sh+yCscH4oONiKAQnNTwt6+fbLzNH7yu8C9Y2zdhM5xHDYTh36grpwY2JC/ZQSVdPQ5vHu+Px40WKuND4Vq7DbfQH8pJM1jGIf9EAFTUlKB3omxy08DQ1/YCIYBLBHa0gfHvxS6Ecsdr2fNm0GdujtGkpf8g0xwJx4fozIg6jRnACQwYwSl/cUPQBBh/ZUayp8VaogIXBpHidhnP5ASx7R8Lnv9rTIZ1AywEqQrXRy7tnkl201/jM5pqQp9hyTqw9Qgh4BW5FN6oiLuPwfDn8hmur/D86KGg31IJS8/QG/arMsOmJAbYjTOOF3l0n6ZiZ9gjBc4PwWOUVqI4KnF6DebPdxVhRirgqaGd1zUvuFOXa/1HIfTQNOAONS3Fcql3p263I/RXuf0CCZYadh+L81Tqkp5qm4kKcz/luoAtkk80WuTlgBrtq0B1pBa/m1/0lxl+5yhO5SRpkBdIJ4o5zjr1Zb96RyQ2uCXDxPSutlJtC0UqErKwl7RISsx8c31MFLC29ji4npFYB+MDQi/TsuJr0n2ErqJk8CqyVBWWbYYudG5O6ZwE52b2OgzCZ+UmgPNbClqcFWQqCn+z0O6IvWSZ9FbEAPoQ0Oj+1WBVCkfs3sJ9CQAfdh3PewUpMyOkSNxrb9c2r+kEl+5ygA0YtwprOHBN1uRgKM2DMAi4i1xoViTHlji5zVynH8Ib7o1TjD97DYNsrMkh2W7t582qXWCGR2M2rkiFNsxNH7gyc6+xZCUVtJWjTHZcYGCwJsMFfuOi2u5NqnaY1sYWupsK7Tecoua8XVUxGZpGSl1NWBPYssnsyeyy5bCK3oSodmR81Ca9gm4thTno3fzVW/BexeKw8AQAztJ7GHbuxgYBqKHHxzKGSMdBAn31IiaCw0nnKaDdCo60s3qQs5zOuiDqkYxYqxKZiWl1QRmEev2iiT1oOpoSdZ2zFbbAik643BBDAKncu04f1Y8oh9xZhwqvZUjQH7WW1zc9qJISVu70SbGya1FOxCdxeEYeMh5+Q1Vh6rAOwsGT4GRoMZvhkOlTNhPBh9xLfWqhqSgBcS5nkZO/BzVEd/GvZf+6f0fuKv+5rTvOQL5U04ijNJbA2Q8+YgVMLDT2A37urg4OteeDVorjbYhIW7zXjLEKgwoR3NRa+x6jLB65ttofMZHQKoGs46EhuuJPRL/9O4xW1ZAQ91rE+8Ju1bqj+dLU/2GkjYIy566Rr7mJPj1cFpctXBLx+rWKUdKV0d80QPtRJPWCDj6GJHWtHlc5evyBa12mcCo9LLGw5kH1cMWIjzTu4g1aMKqofI82PS2EttjeGrx4wXvSQbvTTfJ48C1tH2wRpF0kRXIjlZybWzZarE8T2aKkIBLYn1DIs7qzUY5NA253CpK+sMpHoOokRJLoc+37tkRJ+IDhoce/T59azEfp8OAxqs8oHlWZBeOoXcMhAKGyXpVSwDykqAOdjvBHXnpY+l4NQRIkj705Od4nAJPHOw0vX9JlTYpFiZKrHtdcIiec8xdTQhnMco7BPc9koiWr+ZImv3HrfB5ZYGiNhg97s97wzxuiaF4Xwf3BwnYFiR5l1KSih5OIPatfI0cKq9W4b1POXlXc4BpZhkZHBRy/8QyAyOP8EQ4wph0qxQQgp5um0M5cgl6Om6VdSLiIVHwquxOJkAeDWTFuH/u1cKCJQyMs9fVLkBoqLPThKKZo8tvpfodfjktH09RETciFbSaAEbTqp4qKy3trx57+k63I9XPj</Encrypted>]]>
    </text>
  </script>

  <response>
    &XMLGetTaxRate;

    <action id="TaxAccount">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6G1ya6B6zTt88iIkDt35JcelMjUXjbsN66gI6cf7w0AxNedibGxE/xHU+oo5RmSTxzFygLBjuVkDfVn7wIxz3sGcSjzh8S3crd0maZFYO2Og==</Encrypted>]]>
      </text>
    </action>
  </response>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/KWW0H3wllwc+j4G03oLj1B66Jra2RsWCSZPM3/TkJSNKyrn0cM6jkbscC3QA5Estr6QxZUwkaJ49MDQzDGkfXR6Lf02R2oHY3FDjtKWpvM5jU6tScM/eIKQLcJ8PjXLnb7z7lGcecCtSJmzJ+onQScWB3SZckYRuNjnAmK8M1jQ==</Encrypted>]]>
      </text>
    </query>
  </queries>

  &XMLStandardDetailToolbar;

</grid>