<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\VAGrid.ent">
  %UserDefinedFields;

  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY ScriptEmptyExternalField SYSTEM "..\Include\Javascript\EmptyExternalField.txt">
  <!ENTITY ScriptInsertRetrieveItems SYSTEM "..\Include\Javascript\InsertRetrieveItems.txt">
  <!ENTITY ScriptCheckGridAction SYSTEM "..\Include\Javascript\CheckGridAction.txt">

  <!ENTITY % ValidFormula SYSTEM "..\Include\ValidFormula.ent">
  %ValidFormula;
]>

<grid table="d42$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="HD6" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="m42$000000" prime="d42$" inquiry="i42$" field="ngay_ct" expression="'000000'" increase="{0}" default="000000"/>
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
    <field name="tk_cn" type="Decimal" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0" aliasName="c">
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
    <field name="stt_rec_hd" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0hd" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="hd_so" width="80" readOnly="true" align="right" inactivate="true">
      <header v="Hóa đơn" e="Invoice"></header>
    </field>
    <field name="hd_ln" type="Int32" dataFormatString="#####" width="50" readOnly="true" inactivate="true">
      <header v="Dòng" e="Line Number"></header>
      <items style="Numeric"></items>
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

      <field name="stt_rec_hd"/>
      <field name="stt_rec0hd"/>
      <field name="hd_so"/>
      <field name="hd_ln"/>

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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ6AUMZqevdhU1w9/FmVctxKTEfy8nSMu+uMpM5NcrEaLT0P/tQz5GcPNIoVQeIOg3ppW6JASPSCsXNqUXhkbW1qJq1RlgxuJkKGVxeFKJqARoIUKRwSKujaHgIE6m4OTDCtb9YJrExnX+33mIFfqU1QHX3oIxjSSEKwiBdpVVAEmg7/Zel2N+9lQEBfos/3/HV7sh+yCscH4oONiKAQnNTwt6+fbLzNH7yu8C9Y2zdhM5xHDYTh36grpwY2JC/ZQSVdPQ5vHu+Px40WKuND4Vq7DbfQH8pJM1jGIf9EAFTUlKB3omxy08DQ1/YCIYBLBHa0gfHvxS6Ecsdr2fNm0GdujtGkpf8g0xwJx4fozIg6jRnACQwYwSl/cUPQBBh/ZUayp8VaogIXBpHidhnP5ASx7R8Lnv9rTIZ1AywEqQrXRy7tnkl201/jM5pqQp9hyTqw9Qgh4BW5FN6oiLuPwfDn8hmur/D86KGg31IJS8/QG/arMsOmJAbYjTOOF3l0n6ZiZ9gjBc4PwWOUVqI4KnF6DebPdxVhRirgqaGd1zUvuFOXa/1HIfTQNOAONS3Fcql3p263I/RXuf0CCZYadh+L81Tqkp5qm4kKcz/luoAtkk80WuTlgBrtq0B1pBa/m1/0lxl+5yhO5SRpkBdIJ4o5zjr1Zb96RyQ2uCXDxPSutlJtC0UqErKwl7RISsx8c31MFLC29ji4npFYB+MDQi/TYbAz1Og+fTOLZQYV7YCO/VxUVWdxrU6dI5eeQeoCy7l1KiiU/2TGoe/1jUn1Y/wN1bh6/of6Im48Es5zUq95cAuc9umAMt4yNed6Jyl9fIO30+X7DfR3yhrLI6Ww/wq0GzKR1laNZ36ZDGgqlRtcQStG/hfMUIzrYkEAELBkLbP4tGnRAnUcWgaOLQlgXAEUEshZGIQnL88Ps4UnI+FktEC+aUxqJfsU/Tcy7BVoG/C5S4ibgj9kG+Dr7RlnPgNx8Icb7DPVUW83gVBcxIJZp56GX8Tak9rvgkaSYC1+lwktvOQdkt4xSeMvX5KhWtAVtmh5y/8cwioUY1t7E5TyCxhGd+069mWASY5MaWTIb9lF7dIiQNFCsCVmsS7TVFS1DsFZtRSRGyV4xYST9MZZ1xQRcDr97vdA+S1NgEoVCz/UMg1EHqDikkLvkcvTb+wvQlopQH+ZroR9DEH7IFkRBX2hOeOcob8d0WrgQfXphliTgtJAodYfUm+qmhQdWC33</Encrypted>]]>&ScriptCheckGridAction;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4SXRt6K2/x1CNTDoT+g7gO1pVEzorBoI67f1e6ERpZH3lIBBjgWFsbhPWX0DhbWZNl1m5Ya6nTvvxt8y8PVTwNc/KV4mvG3svi3xxnylVCAbRqcq8ciiugqYLE2HXjHH40PSsA9L2I2oQAUZ+xpllwbiIDR66uGkSnuW/O+085l5z9eyLIFgkaF9Yqn9R/oynGx/7spy1h9vGdSY+G2rf80AycwamyKsnLvtj9arrzzsks4tAqKlT72BqxUnwsUpOyac6IAkonSyYd7m8875+gdvI6xDyImnm9MtY2H0yU59+cRpIUoVyLHTzW3quAIbi0mUfmCLKPHOeOZnPkFwz8NXp84ZlEtqfR/+P2bZ5Ufls7ReyYPtKmIiME9d4EjQy4zsD2B7TS2oTv1cCkvreP1rkUX7gS0O7CCcayqxiIwi6tWawpRQufQHSOF3/4H8tVKMWol5b2E2mUsNhhi2DYo0Xw9ibgcwm3cKOFHN6WVC+y4xeVwyOPkCyD2uGgMwsZTUFgZlLOH6H56EufuMjEadQwJBV8ZY7mqgI2x6iiXjbfJsfSA/HDdQjIX3fMxDEX/1o3Wkf/hEYJPI2MjqheF5uyTQ7T8I5SNxYuU3YJy7muz1Fj6pJIpic57BqvRX6CvE+exspmFV0kKklq61mib1GBoz5BScE/Ngs/UmIe7+W7uwoa4/ETU95i3F91/ww3gYc/CVkdKeNkUQisRMFslB7VXOPlxzHegwNNj/6ksPDXw+34HwBG5wiXUZt4jMYCC3beRBAU0Zu7xmioVuni5bCu2aVnDDXg304xVJpqa6TnWi6JBl1PKHii6DFi+Me0t9Wam/7KHDSFPxRB6xvLYCkh7/qLQtoW76bR316GXBoki2E/30BuEqfvZvxVAnwWfeGlomxISYqTOpV3VUDr8qsQqedjxYO5Vr5Xd111fwyeChHyJkKcYYYvoXSWHeSFcv4tsBHxsrXA3EnuaSW2DYsnQtmheK+jNaInlr7bW7BHSpsI3hBmMx3GFS6kroSRV6CAMhazhMA1d64znSob37DfmWlcDUXumI4hwSwZyiZ5iQiiiWzIGgSGks3W767Toz5HwItLv7QOR88KOmArZkKw2RYsf7loH0S27UerPTlcdMi2Ab0vb8mga4BXl5VVRcknIstCVZQ82WMjydMK/nJ+xMMosAjtRxOIZ1nYcOCoJPqkWMy4HkuC0zUPDiYwJ7srBpfCAi9n0lbU6ps4u+2/6TrEkYVxfsVJPQlKIBINxMic5dPAtx8czG1MJsRr8idGLrPCCaiJBvwJl2Iug=</Encrypted>]]>
      &ScriptInsertRetrieveItems;
      &ScriptEmptyExternalField;
    </text>
  </script>

  <response>
    <action id="GetTaxRate">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm571/REZW6SEdohQZWf/Ft/g03DzPbtCaIuoRiMHA2yF26X6YWXOgtRaDT9VEnisdRSpN7ilMX/Kqo+MmSJs983NCiuzaWxTlg5MslATVQZXcg9t66w7UAr9TQBPy2KllfWWgK86SQIUveg17AMBvXpLNQ563DyyP/UUSPJj2fqwI+klZ0dTOzgHLO4oxKDEpX+Vxuym8lr/2ACY8vuCX6N5SK7442bQvl+kcIxHeRevw==</Encrypted>]]>
      </text>
    </action>

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

  <toolbar>
    <button command="Insert">
      <title v="Toolbar.Insert" e="Toolbar.Insert"></title>
    </button>
    <button command="Grow">
      <title v="Toolbar.Grow" e="Toolbar.Grow"></title>
    </button>
    <button command="Down">
      <title v="Toolbar.Down" e="Toolbar.Down"></title>
    </button>
    <button command="Clone">
      <title v="Toolbar.Clone" e="Toolbar.Clone"></title>
    </button>
    <button command="Remove">
      <title v="Toolbar.Remove" e="Toolbar.Remove"></title>
    </button>

    <button command="Retrieve">
      <title v="Lấy số liệu từ hóa đơn$$90" e="Extract Data from Invoice$$120"></title>
    </button>
    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>