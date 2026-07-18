<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\APGrid.ent">
  %UserDefinedFields;

  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>

<grid table="d31$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="PN1" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c31$000000" prime="d31$" inquiry="i31$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="tk_vt" width="80" allowNulls="false" aliasName="a">
      <header v="Tk nợ" e="Debit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_vt%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_vt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b.ten_tk%l">
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
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Tiền hàng nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="dien_giai" clientDefault="Default" width="300">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="gia" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Giá" e="Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Tiền hàng" e="Amount"></header>
      <items style="Numeric"/>
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
      <field name="tk_vt"/>
      <field name="ten_tk_vt%l"/>

      <field name="dvt"/>
      <field name="so_luong"/>
      <field name="gia_nt"/>

      <field name="tien_nt"/>
      <field name="dien_giai"/>
      <field name="gia"/>
      <field name="tien"/>

      &XMLUserDefinedViews;

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ6AUMZqevdhU1w9/FmVctxKTEfy8nSMu+uMpM5NcrEaLT0P/tQz5GcPNIoVQeIOg3ppW6JASPSCsXNqUXhkbW1qJq1RlgxuJkKGVxeFKJqARoIUKRwSKujaHgIE6m4OTDCtb9YJrExnX+33mIFfqU1QHX3oIxjSSEKwiBdpVVAEmg7/Zel2N+9lQEBfos/3/HXK4wTHhe239cmPfXozWf/XgJFLZISVLbqIcdaVbndVZd5Tg6J5JNHW5RMfc9JaFgLMLEVOyvouqhcM7z9idnp4+VKj2MNcaQylkl8OS8yyEYpR8M47jr60x59SVxbA+6Qvh4pyNYtcqtc4Maj5TZ5gYak268XznEebxKTAIk1US8Mtdfss8G/tkgpk44btpDRya6JJjwFZhvM0bJqYLwzE0Ndp9r5NBZOWx32YKTf/MI2Nm558Jh/P6zCHo4u5pck7ZrHak0rLjsqYT+G0OHwvU6CmJc7QhsdWI9X15kv4jPhhFZp3gDOXvhG+sCspe/AqViHeg4I41ynTABrGcFmMTQUEJ+G+nrIpbCuHSgTvq8HqnsaDLb9CUPtGTmEiWkKARaP6mPkV21j4lTIdtGPR7+FoeC1NeCf3wyTvmOAeNh7i3ZrAsCyOLzzB86ZMFn7z5f25BpS4HLZk+735zX3HCpmFWKjfedQC8D8DbuMXRMNGTGsOmqXS6/yKdArj7+j/gjS1xE1PB3ypsds6fa405s+rDc/Xpt6dV4KePDEMWWX7TaAZaBGm6GL/3xDhllggcNd7+Eckjvp52YPkzVLU9m5e/E1uZWLTutS+O6/XbqQ7NXLq0lCm21QE9OxmbiBze5+G4mI7oVnJfM7h//g104o8a8JXrkEebkhOZSIxB9iq3iPpyjJZWO8P8NTXIQfFKSpalvN8AKWWD5LhjMv4kWgNSRE4B+rJxDtj5kpVM046qieLaKY+1m9dLrl1bbLWmRysFt1KgzD73LdSVh3aHkm75Q7cQvnkLXV8ZraNSZM9UIq6h2W0+AaV8OtMeKWRvKY6kQMojF3Tbzb2LD0v</Encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/KWW0H3wllwc+j4G03oLj1B66Jra2RsWCSZPM3/TkJSNKyrn0cM6jkbscC3QA5Ess6nTVQriuFVaOiT/ynWmeE1AL4vBMjKCfjPdOqc8m6Bog0MtY3bxxCdPx2DrayioPdLOM2QaD2RvSF4Z9zJ6Km</Encrypted>]]>
      </text>
    </query>
  </queries>

  &XMLStandardDetailToolbar;
</grid>