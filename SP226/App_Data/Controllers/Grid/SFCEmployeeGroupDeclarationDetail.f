<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;
]>

<grid table="sfctkbnhnc" type="Detail" code="ma_nh, ngay_hl, ma_ca, ma_nc" order="line_nbr" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>

  <fields>
    <field name="ma_nh" width="0" hidden="true">
      <header v="Mã nhóm" e="Group Code"></header>
    </field>
    <field name="ngay_hl" width="0" hidden="true" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Hiệu lực từ" e="Effective Start"></header>
    </field>
    <field name="ma_ca" width="0" hidden="true">
      <header v="Mã ca" e="Shift Code"></header>
    </field>
    <field name="ma_nc" allowNulls="false" dataFormatString="@upperCaseFormat" width="100" aliasName="a">
      <header v="Mã nhân công" e="Labor Code"></header>
      <items style="AutoComplete" controller="SFCEmployeeList" reference="ten_nc%l" key="status = '1'" check="1 = 1" information="ma_nc$sfdmnc.ten_nc%l"/>
    </field>
    <field name="ten_nc%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b">
      <header v="Tên nhân công" e="Labor Name"></header>
    </field>
    <field name="he_so" allowNulls="false" type="Decimal" dataFormatString="&CoefficientInputFormat;" width="100" aliasName="a">
      <header v="Hệ số" e="Coefficient"></header>
      <items style="Numeric"></items>
    </field>
    <field name="dien_giai" width="300" aliasName="a">
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_nh"/>
      <field name="ngay_hl"/>
      <field name="ma_ca"/>
      <field name="ma_nc"/>
      <field name="ten_nc%l"/>
      <field name="he_so"/>
      <field name="dien_giai"/>
      <field name="line_nbr"/>
    </view>
  </views>

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
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/i78tusYOHM8A+jYm/tXbR1DwytIxHWjvt0JYoIb8/nACj/Z7cd7BOqamsN17UEaUNX24tZ5NaSsTBtQcici8BnG5o+D3lWo41ixwQcRw60ftyOoTcvYX/KFGfxOH9sdw=</Encrypted>]]>
      </text>
    </query>
  </queries>

</grid>