<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\SDGrid.ent">
  %UserDefinedFields;

  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY CommandControlLocationLotShowing SYSTEM "..\Include\Command\ControlLocationLotShowing.txt">
]>

<grid table="ctpbgg" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="HD2" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="ctpbgg" prime="ctpbgg" inquiry="i22" field="ngay_ct" expression="''" increase="{0}" default=""/>
  <fields>
    <field name="ma_vt" width="100" aliasName="a" readOnly="true">
      <header v="Mã hàng" e="Item Code"></header>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="' '" width="300" aliasName="b">
      <header v="Tên mặt hàng" e="Item Description"></header>
    </field>
    <field name="dvt" width="50" aliasName="a" readOnly="true">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="ten_dvt%l" readOnly="true" external="true" defaultValue="' '" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="he_so" type="Decimal" width="0" inactivate="true" hidden="true" dataFormatString="&CoefficientInputFormat;" clientDefault="0">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_kho" width="80" aliasName="a" readOnly="true">
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

    <field name="tien2" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" readOnly="true">
      <header v="Tiền hàng" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="0" hidden="true" readOnly="true" allowContain="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="tk_vt" width="80" aliasName="a" readOnly="true">
      <header v="Tk vật tư" e="Item Account"></header>
    </field>
    <field name="ten_tk_vt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="tk_gv" width="80" aliasName="a" readOnly="true">
      <header v="Tk giá vốn" e="COGS Account"></header>
    </field>
    <field name="ten_tk_gv%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="tk_no" width="80" aliasName="a">
      <header v="Tk giảm giá" e="Debit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_no%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_no%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
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

      <field name="tien2"/>
      <field name="tien_nt2"/>

      <field name="tk_vt"/>
      <field name="ten_tk_vt%l"/>
      <field name="tk_gv"/>
      <field name="ten_tk_gv%l"/>
      <field name="tk_no"/>
      <field name="ten_tk_no%l"/>

      &XMLUserDefinedViews;

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
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

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75wnGW0dZAPtBwZLpKxvxiCjLWO4HbbMfWoClpb971RxHeF7QXlpm+/w3igFGJdLDqk1u0x+cqRYEmhhROB7cWN8=</Encrypted>]]>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ5aaWLYgTMRU0ByZcgqjHRC4p4GMWR8xXfBa0diaZomcMwJeOHLcgutkj+6iKpu8wCGPwP8OSTtN3Fa6mQRBGqY+hjm+j1nvc01dA6WnV+A/MVV2fjqgOeZMs6hR4zazmvi0zQmZy7VXkmp1m8F6UAcDadq+0PJDYsxo6jnbTBx5y/FmrY5/txIane7ysKre9+XT+WOWkxUD1brew26UUKl/r4DpwhO2R2CQer61wkaJOZQSDw0WoB2jupJ8dcpGfHvICiFvZ6MWq3yrYRYNg5oSpc+lGwa98qaBS2jwxufPF7k2c56GWQU1J++gwV4dv8R7ihMsFev4xNbKru8rAeYnSNQJWT10biLoTcpPZtvFfmumBwHTijZE2apwjF1uWPd1mopWJlJX62vV4ld7YCK+Z0Rj+Vxg867Oyo/+VLL1IdbLBBEqD47FfM4v6cT+jlOuvmo+HOI7WJIogm2nGcyL5yeJqYXzgTgL8DhdqLkEAHnG7o9Pdifx/CPaMWWww4NBkFNG9cZ4eYFCEBwaHGAel/TruzEu80xqzM5nFDmE4C9DKQJsYbm6Y/gPoERCRzJOm982v95kkmJM82oHYd4+JaKlzefbfin5hq8wFHDRj8PWPJLZw/kxRJw8Z4V3SpuC4nbfzFjY5YccVQIpBTcps2/pn0U7SYpKNwLsF87CA==</Encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcJ110+3RBftiA2EGWiFqYBhsA83u1qguID2+1CGnpNXgjRfL7KQsk7nrUf/nCx8sFbO4/0zZVooUE3YVQsK7i5WspVSugGQyU8/rJrDsC5MEI5prDUWmYLtmYQlqHbCQ6WLW+F4CLmFxXEfKbx5r4uy84hi0lxtfd7iYz4ekKzEDXlLny9wJSVcnkkLhuTjPNXCTKKewSWP3jRhUh/Bzd7I=</Encrypted>]]>
      </text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu83ZYkZ3oNJVlv9bAUKotx42qAL6017zWxqc8qZy4BApLOEOdGT7HcaAC5h1XCfLQKzx5aH4GJlq48gQK/JTD3rKuJkfphVtF9fPBQ103i5lQ/yoDXGgzrNv5fBIr3JSKYQnd6gY0rcQyF5QCk9K/UZQyL6MRPOZosFBm3VgQqupI5MExubLWIMKp+4ad8RF6UXTTk9k0QX++NzAeQz/KNKW7poerbgJGNnOyNfNtoDSxebBv3KLfmfRvG8x2G1x7WySNn3tBzdul7bs8a6UGOJp8JaSJAVk7ynwZKl3tOWQ36y5lnAC/v1k8R6y0gFe+RH1jNiY5YZFAQkPfazAaMZY+hU9Q6c61FR8DQc5QsDEfNaSsLQZjUh8HEOg37tv4273W2D7Oj0boMImCYRS1UGxyCTYpyh93UeW2LcaJ2i/17UiCsz1mdEKpnDCrs60xAlgcwV1xjB13BYR8fg9ZLChApxxYczhsJWDzZgJLh16w+lpOwTUqSsbFNO+EX2mtyHUmGz98lOFBJHTa+S/biciF5cobFe2ic4zYuH3BM+Hs60YRy7EIV21k7UVzGWlcVChvGfFvweZB7Fp+Es6wj7GOxvatx7pwUqmwt1mqdG5SdExoCNt0J7xy2eDRgZgmFW5Iv3rdEhVIF+dQu5cuWOKXghUE2Us3onbIhQu6pYF</Encrypted>]]>
      </text>
    </query>
  </queries>

  <toolbar>
    <button command="Remove">
      <title v="Toolbar.Remove" e="Toolbar.Remove"></title>
    </button>
    <button command="Search">
      <title v="Chọn hóa đơn$Chọn..." e="Select Invoice$Select..."></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>