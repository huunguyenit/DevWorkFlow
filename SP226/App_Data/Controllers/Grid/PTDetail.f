<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\PTGrid.ent">
  %UserDefinedFields;

  <!ENTITY XMLGetUOMConversion SYSTEM "..\Include\XML\GetUOMConversion.xml">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY ScriptInsertRetrieveItems SYSTEM "..\Include\Javascript\InsertRetrieveItems.txt">
  <!ENTITY ScriptCheckGridAction SYSTEM "..\Include\Javascript\CheckGridAction.txt">
]>

<grid table="d97$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="PD2" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c97$000000" prime="d97$" inquiry="i97$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

  <fields>
    <field name="ma_vt" readOnly="true" width="100" aliasName="a">
      <header v="Mã hàng" e="Item Code"></header>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''" width="300" aliasName="b">
      <header v="Tên mặt hàng" e="Item Description"></header>
    </field>
    <field name="dvt" readOnly="true" width="50" aliasName="a">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="he_so" type="Decimal" width="0" hidden="true" dataFormatString="&CoefficientInputFormat;" clientDefault="0">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_kho" width="80" readOnly="true" clientDefault="Default" aliasName="a">
      <header v="Mã kho" e="Site"></header>
    </field>
    <field name="ma_vi_tri" width="80" readOnly="true" clientDefault="Default" aliasName="a" inactivate="true">
      <header v="Mã vị trí" e="Location"></header>
    </field>
    <field name="ma_lo" width="80" readOnly="true">
      <header v="Mã lô" e="Lot"></header>
    </field>
    <field name="ma_kt" width="80" allowNulls="false" aliasName="a">
      <header v="Kết quả kiểm định" e="QC Result"></header>
      <items style="AutoComplete" controller="QCType" reference="ten_kt%l" key="status = '1'" check="1 = 1" information="ma_kt$dmloaikt.ten_kt%l"/>
    </field>
    <field name="ten_kt%l" width="150" external="true" defaultValue="''" readOnly="true" aliasName="c">
      <header v="Nội dung" e="Description"></header>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nx" width="80" allowNulls="false" aliasName="a">
      <header v="Lý do" e="Reason"></header>
      <items style="AutoComplete" controller="Reason" reference="ten_nx%l" check="1 = 1" information="ma_nx$dmnx.ten_nx%l"/>
    </field>
    <field name="ten_nx%l" readOnly="true" external="true" defaultValue="''" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ghi_chu" width="300" aliasName="a">
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="0" hidden="true">
      <header v="Giá bán nt" e="FC Sales Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" allowContain="true" width="0" hidden="true">
      <header v="Giá bán" e="Sales Price"></header>
      <items style="Numeric"/>
    </field>

    &XMLUserDefinedFields;

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_pn" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0pn" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="pn_so" align="right" readOnly="true" inactivate="true" width="0" aliasName="a" hidden="true">
      <header v="Hóa đơn" e="Invoice"></header>
    </field>
    <field name="pn_ln" type="Int32" dataFormatString="#####" readOnly="true" inactivate="true" width="0" aliasName="a" hidden="true">
      <header v="Dòng" e="Line Number"></header>
      <items style="Numeric"></items>
    </field>
    <field name="stt_rec_ct" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0ct" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>

    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>
      <field name="he_so"/>

      <field name="ma_kho"/>
      <field name="ma_vi_tri"/>
      <field name="ma_lo"/>
      <field name="ma_kt"/>
      <field name="ten_kt%l"/>
      <field name="so_luong"/>
      <field name="ma_nx"/>
      <field name="ten_nx%l"/>
      <field name="ghi_chu"/>

      <field name="gia_nt"/>
      <field name="gia"/>

      &XMLUserDefinedViews;

      <field name="stt_rec"/>
      <field name="stt_rec0"/>

      <field name="stt_rec_pn"/>
      <field name="stt_rec0pn"/>
      <field name="pn_so"/>
      <field name="pn_ln"/>

      <field name="stt_rec_ct"/>
      <field name="stt_rec0ct"/>

      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75zYoXBjtLCfuFJhfaX79HdwFAx5OVbQ+jTUUESwFkfYbPs3P9K5Y+XULO/oJbfc57BB1xGnusZZZlkvf/JskCbaz6VqXVVlG/IxWEuUNoazi</Encrypted>]]>
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtTElG1hN6LKG0Vp8Y9kWhG8aFFhpNj5+u9WMGtcb4/eEMLihrtTjxnXvNsRcJeT3kEXgAAQ/T0sSk3cxYRQvsMxIjeKkN3WdE6Dyl7hpWqMk4OZnMbk2ueltGXOeyID57P0UWgV9UaRV4BCS+Fj5XT9fWqmQruSOdZF6XgbiY1zAzJAbSk53c6z+5WphNMrpnGQ0tN8Kol0XcOk0JzpfX0w/Lkx8KAE5MPRbNI/G74x5BYNm5X/LvxB3vyNKOurPGfBfYRNGlIbGHmoP45IYBknIkkBgoh5obrj6SxBDl6zXTVc+kwQQsOzNMF1/ElmHHorRK1jSutjQxrxmzTauWaibUCgKCh66XU5p045BJIhZ0pdlIkayAej1qY+xyRjz8mF5l9bWJy4AIIJ/tlGQ26dwiiMYTIGLk2C1YHUcqcL44RXK43aLtbm/uvv2TFa2c43mTGqqwFOLjI18qGek016JuiphLJlRG80LSVtZc1xbTNosG4qheKtXXpXNq+nxjI4wSasysnAxBPtT+jQfqP4KWBrPQmK9aXtb8iWKcjHnUgY6JPw4Q2TCT0KahSbxpETAA7igRawU5YaMB0gzqpk1rZJ92LSfRjYZfrVxCxHzPWC7tM0H7dPOGqHbZuyCjQ==</Encrypted>]]>&ScriptCheckGridAction;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4SXRt6K2/x1CNTDoT+g7gO1pVEzorBoI67f1e6ERpZH3lIBBjgWFsbhPWX0DhbWZNl1m5Ya6nTvvxt8y8PVTwNfDi4itH0UP+2e+md7+87cZX707Xe2uFgz3VHJRCBzWuNacG55t1kqAk/x9hMoRYx1ofOSrZDdivX8ia/9jhjmdNDC+OZZ36Gw/Y8x18NaIiHeF66J+fTLBE/m79bn+E+Z2dW54Idsh5GH3QbPegoL8QdJ8Dx5u0+Md+5yZPib8X9hnBu7kU3OQT4b4NaOe8BfU5XIe+Qo1Bs+HckDtj+pVw/mRBIEftCZyY+Iqslygyn6/edjwResPfJY+jKUNi7U/bxK/1GLrrOtp6cBjVnrycW6lVqW+D+L6kQO2mJbROw==</Encrypted>]]>
      &ScriptInsertRetrieveItems;
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/KWW0H3wllwc+j4G03oLj1B66Jra2RsWCSZPM3/TkJSNWLrl2QcXbqLH/L3cyqz4Qp+1k+r3Vvuq6eT2TegvPKV04q/UZBfeI9FyOU6Yix3KgcFBFVGO7GbPHNnr1qxCCSkQMtjSwmSm9n2PqQVUJTg2UkeR46duhOldQ6UfnA6w==</Encrypted>]]>
      </text>
    </query>
  </queries>

  <toolbar>
    <button command="Remove">
      <title v="Toolbar.Remove" e="Toolbar.Remove"></title>
    </button>

    <button command="Retrieve">
      <title v="Lấy số liệu từ phiếu nhập mua hàng$$90" e="Extract Data from Purchase Receipt$$120"></title>
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