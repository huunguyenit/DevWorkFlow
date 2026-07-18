<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\PFGrid.ent">
  %UserDefinedFields;

  <!ENTITY ScriptInsertRetrieveItems SYSTEM "..\Include\Javascript\InsertRetrieveItems.txt">
  <!ENTITY CommandControlLocationLotShowing SYSTEM "..\Include\Command\ControlLocationLotShowing.txt">
]>

<grid table="d73$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="PNC" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c73$000000" prime="d73$" inquiry="i73$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="ma_vt" allowNulls="false" width="100" aliasName="a" readOnly="true">
      <header v="Mã hàng" e="Item Code"></header>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="' '" width="300" aliasName="b">
      <header v="Tên mặt hàng" e="Item Description"></header>
    </field>
    <field name="dvt" allowNulls="false" width="50" aliasName="a" readOnly="true">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="ten_dvt%l" readOnly="true" external="true" defaultValue="' '" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="he_so" type="Decimal" width="0" inactivate="true" hidden="true" dataFormatString="&CoefficientInputFormat;" clientDefault="0">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_kho" allowNulls="false" width="80" aliasName="a" readOnly="true">
      <header v="Mã kho" e="Site"></header>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" defaultValue="' '" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ma_vi_tri" width="80" aliasName="a" readOnly="true">
      <header v="Mã vị trí" e="Location"></header>
    </field>
    <field name="ten_vi_tri%l" readOnly="true" external="true" defaultValue="' '" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ma_lo" width="80" readOnly="true">
      <header v="Mã lô" e="Lot"></header>
    </field>
    <field name="ten_lo%l" readOnly="true" external="true" defaultValue="' '" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80" readOnly="true">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>

    <field name="cp_vc_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="0" hidden="true" allowContain="true">
      <header v="Chi phí vận chuyển nt" e="FC Freight Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="cp_bh_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="0" hidden="true" allowContain="true">
      <header v="Chi phí bảo hiểm nt" e="FC Insurance Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="cp_khac_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="0" hidden="true" allowContain="true">
      <header v="Chi phí khác nt" e="FC Other Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="cp_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="0" allowContain="true" readOnly="true" hidden="true">
      <header v="Chi phí nt" e="FC Charges"></header>
      <items style="Numeric"/>
    </field>

    <field name="tk_vt" width="80" allowNulls="false" aliasName="a" readOnly="true">
      <header v="Tk nợ" e="Debit Account"></header>
    </field>
    <field name="ten_tk_vt%l" readOnly="true" external="true" defaultValue="' '" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="tien0" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="tien3" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="cp_vc" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="0" hidden="true" allowContain="true" filterSource="Invariability">
      <header v="Chi phí vận chuyển" e="Freight Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="cp_bh" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="0" hidden="true" allowContain="true" filterSource="Invariability">
      <header v="Chi phí bảo hiểm" e="Insurance Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="cp_khac" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="0" hidden="true" allowContain="true" filterSource="Invariability">
      <header v="Chi phí khác" e="Other Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="cp" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="0" allowContain="true" readOnly="true" hidden="true" filterSource="Invariability">
      <header v="Chi phí" e="Charges"></header>
      <items style="Numeric"/>
    </field>

    <field name="hd_so" width="80" readOnly="true" align="right" inactivate="true">
      <header v="Phiếu nhập" e="Purchase Receipt"></header>
    </field>
    <field name="hd_ln" type="Int32" dataFormatString="#####" width="50" readOnly="true" inactivate="true">
      <header v="Dòng" e="Line Number"></header>
      <items style="Numeric"></items>
    </field>

    &XMLUserDefinedFields;

    <field name="stt_rec_hd" allowContain="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0hd" allowContain="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="volume" type="Int32" width="0" hidden="true" aliasName="b">
      <header v="Thể tích" e="Volume"></header>
    </field>
    <field name="weight" type="Int32" width="0" hidden="true" aliasName="b">
      <header v="Khối lượng" e="Weight"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>
      <field name="ten_dvt%l"/>
      <field name="he_so"/>

      <field name="ma_kho"/>
      <field name="ten_kho%l"/>
      <field name="ma_vi_tri"/>
      <field name="ten_vi_tri%l"/>
      <field name="ma_lo"/>
      <field name="ten_lo%l"/>
      <field name="so_luong"/>

      <field name="cp_vc_nt"/>
      <field name="cp_bh_nt"/>
      <field name="cp_khac_nt"/>
      <field name="cp_nt"/>

      <field name="tk_vt"/>
      <field name="ten_tk_vt%l"/>
      <field name="tien0"/>
      <field name="tien3"/>

      <field name="cp_vc"/>
      <field name="cp_bh"/>
      <field name="cp_khac"/>
      <field name="cp"/>

      <field name="hd_so"/>
      <field name="hd_ln"/>

      &XMLUserDefinedViews;

      <field name="stt_rec_hd"/>
      <field name="stt_rec0hd"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>

      <field name="volume"/>
      <field name="weight"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ia4XDMcx1FoIIq08b4bJZpbVjAXhuAeZ8AEa5tYn3akA=</Encrypted>]]>
        &CommandControlLocationLotShowing;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ6AUMZqevdhU1w9/FmVctxKQMRwrqQg5HeQZgOGRz7fjxsnUjikC8Uuy5FW0bdzoKK0+PrlYR0b8RRalkwkCQggNiy09MqzcD11RMgspcZPN96+2HZUEhv6iGDI02QnMq4An+2wdBOyeab2Sp4Rnu6kRzg9qlBCH6RbafPH3nJgyjCw3ZTiKFHfaL0dW+8yrouF7Jxth1PZ/780kX3u2l24PpM5CjgE7ZAu/8eylwqGXErB8QNI2fIVZoiKuL1D5ZPD49U0tO/snyXIffKiqYpBqI2814j0A70RCtMjnubOqHuphu0fKOi+e99HY1IKPmivFnyiJXgEWOEGQlBH1sMXwZtO8mmVISi2lNGosEgPF7uKTf9vtvPkLH+KLED7HJI=</Encrypted>]]>
      &ScriptInsertRetrieveItems;
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/KWW0H3wllwc+j4G03oLj1B66Jra2RsWCSZPM3/TkJSNWLrl2QcXbqLH/L3cyqz4R5WPurvONXlXPy/jxQyx5/tygPniSGVrG82pjVdXduiJK//ZfrB6eByq2D0qY0hOEQZq4i0Iu/MeeIoceyfWC3</Encrypted>]]>
      </text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu83ZYkZ3oNJVlv9bAUKotx6qhJsEQFVRTJFaj9kNJWj9JgZgyQ+OedZLxCJ27QqshHQq72v/FIgOSOfuy67Mo1OjR/F+my6rYzFetTjfwk8cmeX57OUwFdNq0kfQBi6LwjLbFWm3pYLXCBvnur/PaXHU/uc5kLxD7kyengEkL2tRcRYKUkqh3KBq6LY/iOKMK4bhBGu64EYegqel3XgYd7w3FYmVYk6THeDY8rPMKr2CQCoPKKfwjppxMbICIx8MEX1ISLo0QxHUCt2Bb4ng6/0x9ke2j6GwQmLO5ccBov4cWLRPSUhRxn8zniuMIR9+SomGRPF6LuiJy5Di7RZE7qIrArMmx0ofVAKiX9V1kX5yTAtCk3YXoi7qiughTx3pi5FS6zxV3H4K/y1vn4tuSYD9dvJxtWP8taeZVqzwr+yrWTB2tOUzwFhJ41/FqAvyG7Fm7A4ntckaG6Z8vDlD9y5y6+KL6QcKPVMEpIp+MCl1yYvFiR3xER+As0RnfD+2dtAOQMeOXxT/k8SiMettxERv9iJZ87YMIm0dtcyFNPf6SUoT2zsYkaFWsnHnf6o6yoFsOt7lIH1XxTxbpkBoCF8Kt0wx+Qi1F8Qe76g111f35QA7LZmT7K6u81sjw2T6UD2afUYoWk2BzRJMXVyDtVlHh2cC094me4rFG3LF+T6XQAMbhkI3o2dR7yruXp5MorEOem9Z6QtaUTjvpfuY5YoDTQszkamTgfKYDTo/NJz/ASpzsyVVqAA33zD5pqnWN25SDfoi/cCOCzwNJdT2Rh8=</Encrypted>]]>
      </text>
    </query>
  </queries>

  <toolbar>
    <button command="Remove">
      <title v="Toolbar.Remove" e="Toolbar.Remove"></title>
    </button>
    <button command="Search">
      <title v="Xóa chi tiết và chọn phiếu nhập$Xóa..." e="Select Receipt Voucher and Clear Contents$Clear..."></title>
    </button>
    <button command="Retrieve">
      <title v="Chọn phiếu nhập$$120" e="Select Receipt Voucher$$120"></title>
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