<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\CPGrid.ent">
  %UserDefinedFields;
]>

<grid table="f56$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="5" id="BN1" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c56$000000" prime="f56$" inquiry="i56$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="Default" defaultValue="1" width="100" aliasName="a">
      <header v="TGGD" e="Ex. Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_thue" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="120">
      <header v="Thuế" e="Tax"></header>
      <items style="Numeric"/>
    </field>

    <field name="so_ct0" width="80" clientDefault="Default" dataFormatString="@upperCaseFormat" align="right">
      <header v="Số hóa đơn" e="Invoice Number"></header>
      <items style="Mask"/>
    </field>
    <field name="so_seri0" width="80" clientDefault="Default" dataFormatString="@upperCaseFormat" align="right">
      <header v="Ký hiệu" e="Serial Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_ct0" width="100" type="DateTime" clientDefault="Default" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày hóa đơn" e="Invoice Date"></header>
    </field>

    <field name="ghi_chu" width="300" clientDefault="Default" aliasName="a">
      <header v="Ghi chú" e="Note"></header>
    </field>

    &XMLUserDefinedFields;

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true" width="0">
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
      <field name="ty_gia"/>
      <field name="dien_giai"/>
      <field name="tien_cp"/>
      <field name="t_thue"/>
      <field name="so_ct0"/>
      <field name="so_seri0"/>
      <field name="ngay_ct0"/>
      <field name="ghi_chu"/>

      &XMLUserDefinedViews;

      <field name="thue_suat"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtTElG1hN6LKG0Vp8Y9kWhG/bqssLRpMzApHefd8sXUQyz0GRFPykIB2j2OZMgAaCZIiOym+1x72Lj00HtqxDmdN/8W8ZBoEg5v/MrO+Mu67Mzj0kVzpC0NBiegqazIqoalMk08f5NW3udUdhfMRZft5EaLOL22n06pgxXIuzW0tWY6JE8ycWVSR9nsmclqPAAgtpr0zPzG40AFGJJjqil8oXiVEZ+zKtzOYIIDgUsVtwnigePjJUUbEpFXQUlPCH9PzmkidRdU9CtxJg/d5uqfMH3GQTkOTi5rqewhLmVDG/+xXfEEbLfVfn66BHQkhkVEVODWfIukUOg3xK628G2obYOZ3z4Qvo9vWz7uE1tGQatzGn+J9cc34kvRWUXek0+4+457lRMnGGoEKW++laM1HPhMcKPU1itI7mY9baSja4GNGR7qlTC3qu4hZHShj7f5Hy4Vhx9FUBIdnQ0RhHgNv7Vfad2pCtIZxzUspP2xH3/39cFKyz46eJFT0BHrUaNKO+p4jDsXmAvA9liBKdphv/70Q7BaK/qq7ddIqC40a0dL7tE06zyplfJ0maWXAG73xWI7v7JKrGGuRkBr11Lzqh3kCjW92YzDys9DfSQtMn3sCVvsl8+/Lbq4GLDjp2w8cCJAlbDIMUKZ8/C/FV5TOqW/eeb4ydJ2rpgMOn8Ku7QFhX296QliaC3goYBUshoTtwFu3OXckuP9HQIt+IdKaQpzmbDxlx+ccMp0dDiVUVQJkziRySbVLkxdzU9johkw5n9tWMlb8a9vgBzuMVa1ISkSxAcZlp4dS6gVuUMD+/qnb3NmmvVFn9Oe1oHGxM4YDzdB13RKohHmaAAoQJHhl4vKbP4U2e8m06kPNUqGzlYd1TYKjAgQPZVbG5pCsKqie9fqwvDTEVRgvxP06cftgXqydSqUm82eDm2z+BJNvE9aCp21kYhaWn7eMevO2XtoMYg99bv7y1PJZrM+9kW70FUUfmf8A3fxxvfndjc4TIOEfQ9NgRmO3jFP1+QK9oocGA3fouYQF54g+bcohK2cV9THSyQEHrxeReJAKRmdHS8WbRhzooG08RHe4wFXUNqHC06TrkskoFocl/1wuMT+31qzCflDrkpSxx92kOuvNuP1bm9JhPgOSV35Vpf0TZrBAMGVKRuDkfW8wp9+hJnzjAZbqCFcUpt/W03khA1gMHkYXoE0mb11LL8zIUSU79sg==</Encrypted>]]>
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