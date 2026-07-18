<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\GCGrid.ent">
  %UserDefinedFields;
]>

<grid table="d12$000000" code="stt_rec" order="a.stt_rec, a.line_nbr" type="Detail" freezeColumns="3" id="PKH" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="m12$000000" prime="d12$000000" inquiry="i12$000000" field="ngay_ct" expression="''" increase="{0}" default=""/>
  <fields>
    <field name="tk" width="100" allowNulls="false" aliasName="a" readOnly="true">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b.ten_tk%l">
      <header v="Tên tài khoản" e="Account Name"></header>
    </field>
    <field name="ma_kh" width="100" aliasName="a" readOnly="true">
      <header v="Mã khách" e="Customer"></header>
    </field>

    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="c.ten_kh%l">
      <header v="Tên khách" e="Customer Name"></header>
    </field>
    <field name="ps_no_nt" readOnly="true" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" width="120" allowContain="true">
      <header v="Phát sinh nợ nt" e="FC Debit"></header>
      <items style="Numeric"/>
    </field>
    <field name="ps_co_nt" readOnly="true" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" width="120" allowContain="true">
      <header v="Phát sinh có nt" e="FC Credit"></header>
      <items style="Numeric"/>
    </field>
    <field name="dien_giai" width="300" clientDefault="Default" aliasName="a">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="ps_no" readOnly="true" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" width="120" allowContain="true">
      <header v="Phát sinh nợ" e="Debit"></header>
      <items style="Numeric"/>
    </field>
    <field name="ps_co" readOnly="true" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" width="120" allowContain="true">
      <header v="Phát sinh có" e="Credit"></header>
      <items style="Numeric"/>
    </field>
    <field name="nh_dk" readOnly="true" defaultValue="'1'" width="80" clientDefault="Default">
      <header v="Nhóm định khoản" e="Group"></header>
    </field>

    &XMLUserDefinedFields;

    <field name="ct_ngay" width="0" type="DateTime" clientDefault="Default" dataFormatString="@datetimeFormat" align="left" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ct_so" width="0" readOnly="true" align="right" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ct_ln" type="Int32" dataFormatString="#####" width="0" readOnly="true" hidden="true">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="stt_rec_ct" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0ct" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>

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
      <field name="tk"/>
      <field name="ten_tk%l"/>
      <field name="ma_kh"/>
      <field name="ten_kh%l"/>

      <field name="ps_no_nt"/>
      <field name="ps_co_nt"/>
      <field name="dien_giai"/>
      <field name="ps_no"/>
      <field name="ps_co"/>

      &XMLUserDefinedViews;

      <field name="nh_dk"/>

      <field name="ct_ngay"/>
      <field name="ct_so"/>
      <field name="ct_ln"/>
      <field name="stt_rec_ct"/>
      <field name="stt_rec0ct"/>

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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ6AUMZqevdhU1w9/FmVctxKMOjoAiWpx0FPETWa5fuf9o5BvYRyKD7m02KTSnT7qGayLz/nPRi233HWOP+omGXDzCq/VZf8YMU2y3bnarFpbUKE0zLK0udqD5w9cVqTH7ezOWj1jc0GPqYPmD64qhI5VN5WGoZIJnRbxOVs7BS5YdUy8kzfeRf7rDpsz/nxKxmrJY3M60BwUsACV8iUOWOOnwMx4vpigMHF1w7HLdEh1w==</Encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/KWW0H3wllwc+j4G03oLj1B66Jra2RsWCSZPM3/TkJSNKyrn0cM6jkbscC3QA5Esuwt2bjAP6mzr8u+6HZ/LEClUmRdfPu+rGY1l/BH4aKfvGykKXa+jbAxoblr7MpnUTaunZWuYqy8zFcLzK+EMzdRoj4hTVBwatf4BT/U3nQAw==</Encrypted>]]>
      </text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu83ZYkZ3oNJVlv9bAUKotx7YtoEjrh48LLzkk629h+7GPUbydjoV1BCd8j1+M/rPu8Za/nUWht4er/oQks+DYnC/74eQqIgC5HZAisVuLtjEIo+Zk9Gh9+AWPGWFTFm6nQ1aZwKMEIJaqfmskJaMPfY0wN2s57f04SOhu3GbEV7ScfOERz9a3PJBw9aKJAPxFQXuLCgW0evADzWQ0uiKk83MdDOipeNyb4GCYQnYWWqObuZ8HX6zSKH2kSTo/UBIdrKtpMCRcn5CheJpnQaVKRhtTzbEXwGOD2W2rllFj1Z2ja2WYdAU6a8lxRcXPyDXYvPwCLoSPsWo4KRuKKnmlVuvkyb2TsdyK9fqcyXrDhEXSdFl53WQQfNmV9mFLSmvfKv/OzwEn03EPKg0V2o1xvwdO4ixpx+NICA4AlWUL1/fqfafZDcS6SB7EXShToWL+D4omJhrRssDG3cAeHy9T7/sXIalWnlajEx6LAM5PrMlM9ut6iRS4kdhqiFkGC31E1H0xU6HDno+ZEcOwZWR5qMLy1dFVGeSPNQGuXQIQpbJiyK64HBpArcQTDhVqzitOp3Kg2XcYhftrTBpPSVjXQRTkDQi5XSzsmvrASUn1nnZsD3NiIa3We4rLvrwcd8piVpFgwtLE4cGQOuXxg2wZtQQ7YJR4N++2PQP8uQsiQ/YSBdzZiwae3E8vuqDFFC/iE847uiA/KRDUYT7by/eU8EZ+oE4aM8tQ3S2vO9iuWz5</Encrypted>]]>
      </text>
    </query>
  </queries>

  <toolbar>
    <button command="Grow">
      <title v="Toolbar.Grow" e="Toolbar.Grow"></title>
    </button>
    <button command="Down">
      <title v="Toolbar.Down" e="Toolbar.Down"></title>
    </button>
    <button command="Search">
      <title v="Lấy chứng từ cần hủy$Lấy..." e="Extract Data from Voucher$"></title>
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