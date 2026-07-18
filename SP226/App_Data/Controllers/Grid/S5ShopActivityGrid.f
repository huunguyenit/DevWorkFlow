<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY XMLFlowGridCommand SYSTEM "..\Include\XML\FlowGridCommand.txt">
  <!ENTITY ScriptFlowGridFunction SYSTEM "..\Include\Javascript\FlowGridFunction.txt">

  <!ENTITY Identity "S5ShopActivity">

  <!ENTITY XMLFlowGridTagHeader SYSTEM "..\Include\XML\FlowGridTagHeader.xml">
  <!ENTITY ScriptFlowGridSelect SYSTEM "..\Include\Javascript\FlowGridSelect.txt">
  <!ENTITY FlowGridTagField "chon">
  <!ENTITY FlowGridSetItem "g._setItemValue(r, g._getColumnOrder('so_luong0'), o.checked ? g._getItemValue(r, g._getColumnOrder('so_luong')) : 0);">
]>

<grid table="ds1$000000" code="stt_rec" order="ngay_ct, so_ct" type="Detail" freezeColumns="3" id="SF1" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_px" width="100" aliasName="a">
      <header v="Phân xưởng" e="Shop"></header>
    </field>
    <field name="ma_lsx" width="100" aliasName="a">
      <header v="Yêu cầu sản xuất" e="Work Order"></header>
    </field>
    <field name="ma_cd" width="100" aliasName="a">
      <header v="Công đoạn" e="Operation"></header>
    </field>
    <field name="ma_vt" allowNulls="false" readOnly="true" width="100" aliasName="a">
      <header v="Mã hàng" e="Item Code"></header>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''" width="300" aliasName="b">
      <header v="Tên mặt hàng" e="Item Description"></header>
    </field>
    <field name="dvt" allowNulls="false" readOnly="true" width="50" aliasName="a">
      <header v="Đvt" e="UOM"></header>
      <handle key="[nhieu_dvt]"/>
    </field>
    <field name="he_so" type="Decimal" width="0" hidden="true" dataFormatString="&CoefficientViewFormat;" aliasName="a">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="chon" type="Boolean" external="true" allowContain="true" defaultValue="0" width="60">
      &XMLFlowGridTagHeader;
      <items style="CheckBox"/>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJe59IuSGOziul8hi2ke/AgcAfwwwOW5NLQt7EnwZmuWC</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&eQDg7Nv1ZPcHTYx4U3adqKoJjScIBCzrKvEQWxYaCH1iLN+d7k3O78zMgFPktn7n</Encrypted>]]></clientScript>
    </field>

    <field name="so_luong0" type="Decimal" dataFormatString="@quantityInputFormat" external="true" allowContain="true" defaultValue="0" width="100">
      <header v="Số lượng" e="Q'ty"></header>
      <items style="Numeric"/>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityViewFormat" width="100" readOnly="true" aliasName="a">
      <header v="Sl giao dịch phân xưởng" e="Run Q'ty"></header>
      <items style="Numeric"/>
    </field>

    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="ma_lo" readOnly="true" hidden="true" aliasName="c">
      <header v="" e=""></header>
    </field>
    <field name="lo_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="ma_px"/>
      <field name="ma_lsx"/>
      <field name="ma_cd"/>

      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>
      <field name="he_so"/>
      <field name="chon"/>

      <field name="so_luong0"/>
      <field name="so_luong"/>

      <field name="nhieu_dvt"/>
      <field name="ma_lo"/>
      <field name="lo_yn"/>
    </view>
  </views>

  <commands>
    &XMLFlowGridCommand;
  </commands>

  <script>
    <text>
      &ScriptFlowGridFunction;
      &ScriptFlowGridSelect;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22YV+nFrmULD4jDm6taItVgO1LhvUdyB0qfqOdl1NRbuQ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&eQDg7Nv1ZPcHTYx4U3adqNJe711Yb2ode84MRBWaH2YwZkReLRA/Yk00Vph2UQAYlA7Z1YrhNXbJD/RmVO/pL+JZQ6Rc3S2cdsj6M+hGpKwBBIu8IEy4/w4fqSiORrenSp8ej4JAoJ/eOjg6v+sjsObls6x77jMT0IKCSj3mncJhMDa+4b50guuBrscfachL6tubfRX9Rkbih7qIGdIeRORRle9xrovFpA60gj+jFGahfAsypDhbbwkxg9VjkwesvenLxwcP53My1ydYhUjX/w==</Encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu83ZYkZ3oNJVlv9bAUKotx5sargNUWd9JiUx9L9bBt+jlMXHvcaV/vkI6aRuTaexqPbRiLjk5EhoBMLiQ9ebnBuePfQ6oaeqIz5izoyKhOXM3pyBcFkf3yjtXmpX6OeoP6vU9IlKlmtfHup+F39fBJ9TwDd9+DBfGxZd565dbspw6lDykVHswsn4e3UgP0rtvEZeWaXqycpMecpRF0FUk7wJT7+V6GHjw8sWgwlJNQiDAuZny/eJTa+Azt+Y/kKgfi75jsLAMqvfE2WzgZM+u2ofH8vJmJWvnFvwfEH5Lse9l6NpSbWrhl+wjE/wJpcDeLmXmm+Nub0DUGONJRqK165aZuOFrcTrBaV8oWuB/hK9ppgbI2t3is2lwGPW7a7TGlfCbgtLKK1rI4VOyKtELpl6SZlYkpqNxDcBIVydmICLaau0Y/RkC85dQibmSQz+lFB+hJ33zA04iDcA1LxX6HlkZ4xvYsXlchlXjrtlEh+pFbMes+aNBLvit3+3CKBUqGVTY2jci3PEDIXs2nF2Z6BYT5CV/7Ye7Egphn3enC4EqB7RTmTl8xpVNHE1i/cx0bpbQNTtq7IMJQuViHwtCqsAtPzOuXRfIidGKN8m3QkAZi7ypiCTXBpaKtWI0Kl5AAeDiOoE27+hThz+ZDzF2aU2VxeCG1lmJRbVHyGd3EY2jOfVZFkxgu75kaOoqAP+tRMfzkGyBvO+Y/GVPV5ZXiHdIy2OH83ZbRNA3qV3XPTWP+Bw44MTLktCUly7wPfUSbTlu1wJ1ODL1jD8EPXxSsw7i2L1xAByaM6AK/gpyLjyhTO1jq/cW9AhZCBjWScRc81znJ+HuyDTVuctIj8xXQIQ5uO+Sw0E2DuqP28IyElrThHnYF1+UZRA1APGT/7efCfm3TsIaCfAkfsSeApjf65j8KshaXe8pprq8t5cmB99cOhGy67QGLjnIVQ9VGJcdhh/ir9KZju0TqJgqtFcyTMzylb4gXOP6v5nTe/a4cOmYywlt1ggfb1bupyfqEdkJxl7k99mbUNH6yorKmuPmo/8LOyUVmVVZZqBfJTzU6kXaGk4v9oqd1kdtZ3v5tYTlOalkpD5fSow2yUY6Aw449vLoz2vuRsriC8Ub90bjn80</Encrypted>]]>
      </text>
    </query>
  </queries>

  <toolbar>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>