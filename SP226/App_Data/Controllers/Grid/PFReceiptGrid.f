<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY XMLUserDefinedHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFields.txt">
  <!ENTITY XMLUserDefinedHiddenViews SYSTEM "..\Include\XML\UserDefinedHiddenViews.txt">
  <!ENTITY XMLFlowGridCommand SYSTEM "..\Include\XML\FlowGridCommand.txt">
  <!ENTITY ScriptFlowGridFunction SYSTEM "..\Include\Javascript\FlowGridFunction.txt">
  <!ENTITY CommandControlLocationLotShowing SYSTEM "..\Include\Command\ControlLocationLotShowing.txt">

  <!ENTITY Identity "PFReceipt">

  <!ENTITY XMLFlowGridTagHeader SYSTEM "..\Include\XML\FlowGridTagHeader.xml">
  <!ENTITY ScriptFlowGridSelect SYSTEM "..\Include\Javascript\FlowGridSelect.txt">
  <!ENTITY FlowGridTagField "chon">
  <!ENTITY FlowGridSetItem "">

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'PFReceiptGrid', 'Grid', 'PFTran'">
  <!ENTITY CheckRelativeQuery "
  select top 0 @@fieldExternal from d73$000000 a, dmvt b
  return">
]>

<grid table="d73$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c73$000000" prime="d73$" inquiry="i73$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

  <fields>
    <field name="chon" type="Boolean" external="true" allowContain="true" defaultValue="1" width="60">
      &XMLFlowGridTagHeader;
      <items style="CheckBox"/>
    </field>

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
    <field name="cp_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true" readOnly="true" hidden="true">
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
    <field name="cp" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true" readOnly="true" hidden="true">
      <header v="Chi phí" e="Charges"></header>
      <items style="Numeric"/>
    </field>
    <field name="hd_so" width="0" align="right" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>

    &XMLUserDefinedHiddenFields;

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" readOnly="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    <field name="line_nbr" type="Int32" align="right" readOnly="true" hidden="true" width="0">
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
      <field name="chon"/>
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
      <field name="cp_nt"/>
      <field name="tk_vt"/>
      <field name="ten_tk_vt%l"/>
      <field name="tien0"/>
      <field name="tien3"/>
      <field name="cp"/>
      <field name="hd_so"/>

      &XMLUserDefinedHiddenViews;

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
    &XMLFlowGridCommand;
  </commands>

  <script>
    <text>
      &ScriptFlowGridFunction;
      &ScriptFlowGridSelect;
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        &CheckRelativeProcess;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu0b9OAmooDeZk2yogrlIzXRKsxbhsGhi5IBMG+lxdOZC901gsbt0jniNIH4Ul+4/9ucSs+xj3yga8VAjmJ/y4Snq3EIVYAr3vAvp5k+8KcCDMqSHEaxmmqeRxMO3oBf4/clDxQuz+w88AFt8ve2PUBb7Xo44gznuA4MLYLDeGvKipVQPYGh4Bupbq8Qz+bXSV80+PEr+sqXcTmyuFTjILiiiFQqks2pB6gAoWjNDUu0OAsU2XGa+XFIvU1Yl0igJh/SkQR/tWgxrvAe3YcFFtO7mmuMF3yb/fqcOVfUYHaY89GHpbZFEzQHuD5eL2EDyXhy+gBNnlJK6CvwD0aV1CZERXQlXYaS4VWjTb8bGjefgUsQkz1GHrSKe5ibhqLreiYkWQy/7MawQN//qOydTx2IBQlndycjA3pfJ3WLBRhwlGJRszgrMXQ8Himfj+PiUFouaKs+Fm7ny8CXAwyUTGQnPFQh18PNrz/1zj9uZyFD3vXooXdDes2bjuySxacSWrVBMGHY2poVMFuyovRrG2ZwIl60AQEUdnSeQoiYG0aEXU9lM8oNn/qXtBOQbXsjy/31T+u6ubulMLOeSwA35dYjTQ0SVcfC77QMugzurLnq2mEIgnP3rDOEdd4MOSCdaJ43IXpyXj+tcaDuWsTasADSUfRk5zLnTWdy3VJx0+gX0RbSek3kZtxnmse+uV/uk/FQW3pTPZbtFL0vv9U5NuXT8oHiprL0A1qjSo2B5MVqt/6L0MTHHCfwH8Qpt/S4xeTbCKfGqtfBlTeYYQnX0fCqfz28v1P4udgHjFLbMeUsCURsGsjtkbSLBfnjS1z8H+4G+BYMxUwyLDmUaCA38l2FGy/P+u7hTJ9XutSk/7T5WdWb1hfP3bJEglWwzkauoln+q5KoyIJ09FyVsBHuMIjxWWJo/snaYK/K4Wu50H5gAQ8TKu/6rkw/A/96W1LO+P8w13E0971uBWkEOhmpSS6yOYokhpmXV40jAep0JglgB0EOrGUGZRilktSC2jBNJhSqB9QioyhoZJY8RX7Y2N1ARaeIgcssZoIqjIk2tRlk8YnFDUonQnZWSNKvceLzFO5c8jIIBgcK6DuFl7d3rDx8lSzSWfAQYqm7UZvMhzFFr1VgDO29MPSs7BujePdlaCdg/UUx3/cHkoiuoWxGQNQ9ln8Z4RqcDlVTNXbfQ6CYlutQsctryz4h2E2HLzaOXNQ1+uNP+G/HHlg4A07b6XjLovvgKkrCssPu3uy3PjrDYJEPS4OS8XCwJU9BQYfwt/vl+tIYrgjnLrgkR/+W6L4m4G0zgVY3TkaHuTQRIhSk1xh4FYBKXRc+AZ1EPntb5P6ywlPQRP3I3Vq/Pw3PupksSrgUQtiAS8Ij6ciIJvzUL</Encrypted>]]>
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