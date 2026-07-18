<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY XMLFlowGridCommand SYSTEM "..\Include\XML\FlowGridCommand.txt">
  <!ENTITY ScriptFlowGridFunction SYSTEM "..\Include\Javascript\FlowGridFunction.txt">

  <!ENTITY Identity "S1Operation">

  <!ENTITY XMLFlowGridTagHeader SYSTEM "..\Include\XML\FlowGridTagHeader.xml">
  <!ENTITY ScriptFlowGridSelect SYSTEM "..\Include\Javascript\FlowGridSelect.txt">
  <!ENTITY FlowGridTagField "chon">
  <!ENTITY FlowGridSetItem "g._setItemValue(r, g._getColumnOrder('so_luong0'), o.checked ? g._getItemValue(r, g._getColumnOrder('so_luong')) : 0);">
]>

<grid table="sfctnvl$000000" code="stt_rec" order="ma_px, ngay_ct, so_ct, stt_rec" type="Detail" freezeColumns="3" id="SF4" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="ms4$000000" prime="sfctnvl$" inquiry="is4$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

  <fields>
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
    <field name="ma_px" readOnly="true" width="100" aliasName="a">
      <header v="Phân xưởng trước" e="Previous Shop"></header>
    </field>
    <field name="ma_lsx" readOnly="true" width="100" aliasName="a">
      <header v="Ycsx trước" e="Previous WO"></header>
    </field>
    <field name="ma_cd" readOnly="true" width="100" aliasName="a">
      <header v="Công đoạn trước" e="Previous Operation"></header>
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
      <header v="Sl công đoạn trước" e="Previous Operation Q'ty"></header>
      <items style="Numeric"/>
    </field>

    <field name="tl_kt" type="Decimal" dataFormatString="##0.00" width="0" readOnly="true" hidden="true" clientDefault="100" aliasName="a">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_cd_t" type="Boolean" width="0" allowContain="true" external="true" defaultValue="0" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="ma_lo" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="lo_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>
      <field name="he_so"/>
      <field name="ma_px"/>
      <field name="ma_lsx"/>
      <field name="ma_cd"/>
      <field name="chon"/>

      <field name="so_luong0"/>
      <field name="so_luong"/>

      <field name="ma_cd_t"/>
      <field name="tl_kt"/>
      <field name="nhieu_dvt"/>
      <field name="ma_lo"/>
      <field name="lo_yn"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu83ZYkZ3oNJVlv9bAUKotx4ZEY594UyO1IROMxlIQzo0JxFy3MehGUeBAsxTaZZJAmKgzM6eJPYXcAK5eZY402ngo8clGnQVJqqZ26CRfF6XCM//C69WuvgaLAoomfLVzUhGLA8raZTXHtUjOyh8DoMJMB1Ig7GO2suvdAokQ6QDV+thdUuRging5ScqTRCOlKlWwSqrDa774z442OoClcgvf5OqDSOzqcsZqCQ+RteW4zfrrEPI1bglWXwpBZrFxg29x2cQs1VXaXsP/MsIFfXnhlGod01rQdM02eXR/CQy8xBrtz3nKUENnxswU0m56pwwuueYY8xKbb7jbqdGuix9tCI/8BEDmTr8fwnRXSOD+i8HFcLIqR26XT4qW0/WnQOJ1meyt4NzGCGUgLlun8l2ZUyyaxdZy510j0smFmvlW4M02gydlJSgxd6AXkLXdJbQN7sROkfFlgQA1av1djSJwLLw9NxA7xwT091BFUr5wyMJw5THeaCPQq/v1Eq0adiT/ug4+MqEw1E+fjeq5PX6sxPmQss89BLIHD4hTqfTyKoBhqcwIgQ71dmIUxS/gcKDQBUFAyADs1AxIuOyuNC7WrKbvm5y/F/gRiwnxpw5FB7Rbah/FDD7Kftxnyczt9ERHrkom6kaLYRQxq5d9N+5wxZZQHxeN/6d2XGrNNdkoK9JBFuuSeaRdEqYXeHFXBnHg8wkcAPhvJbYIteXPEWKozPjMxaSl3hmJElUlS+v91AONpskC1bs9/JU0jNc4Xez+sqUH9hV+Dlzlkmq0Yc=</Encrypted>]]>
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