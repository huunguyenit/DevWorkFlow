<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\CBGrid.ent">
  %UserDefinedFields;
]>

<grid table="f46$000000" code="stt_rec" order="line_nbr" type="Detail" freezeColumns="5" id="BC1" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c46$000000" prime="f46$" inquiry="i46$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="ma_cp" width="100" allowNulls="false" aliasName="a">
      <header v="Mã phí" e="Charge Code"></header>
      <items style="AutoComplete" controller="BankCharges" reference="ten_cp%l" key="1=1" check="1=1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQoULoe0e13iff6XY2gtEYDXU/4Prb7TvQW1aKAJwoy3zxSF7MwvGcKLJo7u1EPvxq0=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_cp%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b">
      <header v="Tên phí" e="Charge Name"></header>
    </field>
    <field name="tien_cp_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="120">
      <header v="Tiền nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="dien_giai" width="300" clientDefault="Default" aliasName="a">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="tien_cp" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="120">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tk_du" width="100" aliasName="a" clientDefault="Default">
      <header v="Tk đối ứng" e="Ref. Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_du%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_du%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="Default" width="100" aliasName="a">
      <header v="Tỷ giá gs" e="Book Exchange Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="hd_ln" type="Decimal" dataFormatString="### ###" width="50" aliasName="a">
      <header v="Số thứ tự hóa đơn" e="Invoice Line Number"></header>
      <items style="Numeric"></items>
    </field>

    <field name="ma_thue" width="80" readOnly="true" inactivate="true" allowNulls="false" aliasName="b">
      <header v="Mã thuế" e="Tax Code"></header>
    </field>
    <field name="thue_suat" type="Decimal" readOnly="true" hidden="true" width="0" aliasName="c">
      <header v="Thuế suất" e="Tax Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="120">
      <header v="Thuế nt" e="FC Tax"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_thue" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="120">
      <header v="Thuế" e="Tax"></header>
      <items style="Numeric"/>
    </field>

    <field name="so_ct0" width="80" clientDefault="Default" dataFormatString="@upperCaseFormat" align="right" aliasName="a">
      <header v="Số hóa đơn" e="Invoice Number"></header>
      <items style="Mask"/>
    </field>
    <field name="so_seri0" width="80" clientDefault="Default" dataFormatString="@upperCaseFormat" align="right">
      <header v="Ký hiệu" e="Serial Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_ct0" width="100" type="DateTime" clientDefault="Default" dataFormatString="@datetimeFormat" align="left" aliasName="a">
      <header v="Ngày hóa đơn" e="Invoice Date"></header>
    </field>

    <field name="ghi_chu" width="300" clientDefault="Default" aliasName="a">
      <header v="Ghi chú" e="Note"></header>
    </field>

    &XMLUserDefinedFields;

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true" width="0" aliasName="a">
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
      <field name="ma_cp"/>
      <field name="ten_cp%l"/>
      <field name="tien_cp_nt"/>
      <field name="ma_thue"/>
      <field name="t_thue_nt"/>
      <field name="dien_giai"/>
      <field name="tien_cp"/>
      <field name="t_thue"/>
      <field name="tk_du"/>
      <field name="ty_gia"/>
      <field name="hd_ln"/>
      <field name="so_ct0"/>
      <field name="so_seri0"/>
      <field name="ngay_ct0"/>
      <field name="ghi_chu"/>

      &XMLUserDefinedViews;

      <field name="thue_suat"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
      <field name="ten_tk_du%l"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcId2xB+L9A0FuJAQVgRyH0gM/L5jLwqjOegq/ugev0ANjImNx8r9VXemoKdxQSce7Ss5vCR8OouVtakUvSRzdh+EJ1I+cp/ekKNwuSxj/Hbd0H71vA3Vj0PHFQq2+iwAkA==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL756/JB6dPeVkwCfYuq8ju3IhVH4MbamCuBWKdRi3IXrfowhZSLuJC/2aZHiB+iVBTAvpB2QW+EqLV3PT022pvieE=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ5ySARacbIZhVX89+O2K2YztGFTKKsa6J2PjNLqF+H33ouZPZecvej+PUoQyPi/0GRGOizVIxmcZi7O4ypkC7ef0dflFg0yicMIf/igTUnKGfU5M6VxAJ36h4UqMlqrIZMp92EDIdVZmnDowGprNPDhOcL6ief/vTFOU8Xz4TbvUuCG0YTE76W9rHF4XmcQeb3HPl0Rn8zGSPZbMjZcHU2N01tnPWv9GDGDaCozios2oqMiZRyqCz/45Wkew5HFft99r0ajX87aWGwbmgUepac5j+HkW87hfoZxKJO4t2OyrKoUdZkw5xa7IShQOGXwzFNUw3dDUUDfjIibw9r6ntPTr+Mboc0IX7vWe2TwycL6cAsQeRlyAKnINd9zEbHa78Y1AeujETZBm5qH1gDWyQjePjm4vfwP0nCHGe3T8F3yo9EB8ivvMuLH+kh6cEA3WjqpZHHA0VtdvotUM5mn30rA0rJOBwMXXVV3cMtMTDSV2bCSn474HbU2a46j0XQoBUGmH9i5lM3f5jgSQucJggH/QbvaQjkmYvfkX1FWpRRdLlQFONTW5nlG3lgOnVtrL6C4jsiBcNb8p78iLOD7opP60gMffn5vdpUpnAxS58rvuXj0VGhZAYMf2rKqQel0lDA4PJvc6xu+SDdVQfGVh29PW+Y4NvKjIlYDZmGPRBTmKwRqvA+2S36YPdkztba1sfsr5hrqw3TETjGyRvOGkHv4njaf0BdrGOYR7UPMBzYjehXd3qJSusUzjetQYcbxd7R5ALCLzhEIlcd7uh6YiQlYP5Mn1BIjs691ZTOB6H8BZ/w6oprj82Tx8y+dQ/ZTB7q5/GI09gGXbGEzua1JKhnQb0Jmslld7uHuQdECKvbBQfg5RUDaKimKmLFoQCmwM08Om43WdXfr1n2tqZ4gvq8w5/IFNFYB3xd49+LPx/IOjIOh7Cfqam00dXGtjkNlJZDnD6wKBlD7QtrxnHi2xVonGaBdkxDcnUixkKMfA6KpURP5Xi19/wLm6xIjwrHfp9gA2/KMKYeajGv5z/scTKUKcJyzryRVqrJRpJiZcRKJ07t9hvtmF5YjpCMCyuAtFjAfIH+YneQVPLyvjUnQdqlbmvQAeuSnxo7UB1IPXt0VeM/r6bO/C8wCfIxTv1EPFI4n7SP5Q5cWLUqTIe++VQdlxvb3+fFAsnYb2vpVHyvy+KVA5iFDDIt3xyte6DkWWl8MMgtbjvsjWF64LThdAvjbecwTavnvQM4KW5gB7JseICZMGevWNJ+mPE/inqYiweBNoOxxKYtp5AUM+7n5tEonTsUjAbHIHfxhYJJlI62EsQ==</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Charge">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5U/TBodJhlP67gX7q15YPol/kJ9YXZCfOJiPSIrGBdwnLJpfnGzm2gnpu1ad9rdH6/w35q+kQt7MUjHM3AD+RopSICqBctP4BgiCVuurBBmakN5v1z6LmJFgRp6gnfvacoZ9oGGgAKxQId+++xQA/jBqcxQp6T7+/ixjn1P0ZptA==</Encrypted>]]>
      </text>
    </action>
  </response>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/KWW0H3wllwc+j4G03oLj1B66Jra2RsWCSZPM3/TkJSNFI5RZWpncPPaH9ehTYmmfF9ec78068goI8zndOswMM5VT9xbS7JEHaagz3vhweYg0YCbJHfQLRceNFHdV3yHG21M+nisN2aBaWXFS8rwLaLrCqauAYU/zZsgom6bo4Gw==</Encrypted>]]>
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
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>