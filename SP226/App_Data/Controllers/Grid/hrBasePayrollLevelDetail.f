<?xml version="1.0" encoding="utf-8"?>

<grid table="hrtblct" code="ma_bp, id_ngay_hl, ma_ngach, ma_bac" order="line_nbr" type="Detail" freezeColumns="3" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <fields>
    <field name="ma_ngach" width="100" allowNulls="false" isPrimaryKey="true" aliasName="a">
      <header v="Mã ngạch lương" e="Pay Grade"></header>
      <items style="AutoComplete" controller="hrPayGradeList" reference="ten_ngach%l" information="ma_ngach$hrdmnl.ten_ngach%l"></items>
    </field>
    <field name="ten_ngach%l" readOnly="true" external="true" defaultValue="''" width="300" aliasName="b">
      <header v="Tên ngạch lương" e="Pay Grade Name"></header>
    </field>
    <field name="ma_bac" width="100" allowNulls="false" isPrimaryKey="true" aliasName="a">
      <header v="Bậc lương" e="Rank of Salary "></header>
      <items style="AutoComplete" controller="hrPayrollLevel" reference="ten_bac%l" key="status = '1'" check="1=1" information="ma_bac$hrdmbl.ten_bac%l"></items>
    </field>
    <field name="ten_bac%l" readOnly="true" external="true" defaultValue="''" width="0" hidden="true" aliasName="c">
      <header v="" e=""></header>
    </field>

    <field name="he_so" type="Decimal" dataFormatString="##0.00" width="100" clientDefault="0">
      <header v="Hệ số" e="Coefficient"></header>
      <items style="Numeric"/>
    </field>
    <field name="ghi_chu" width="300">
      <header v="Ghi chú" e="Note"></header>
    </field>

    <field name="ma_bp" isPrimaryKey="true" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="id_ngay_hl" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_ngach"/>
      <field name="ten_ngach%l"/>
      <field name="ma_bac"/>
      <field name="ten_bac%l"/>
      <field name="he_so"/>
      <field name="ghi_chu"/>

      <field name="ma_bp"/>
      <field name="id_ngay_hl"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1OrDTQdK1c5LVXuryLCGmoS0KXcExNhLM+s3fk22C0aFmEnvJ1YxGY04XfZZYOItxz+bG6haR4n0tpyljHODH4EIstStgytBf0UcWkGiesdxlBsH+nlXiCQbrpJGLFX7B0LGAVrlSC3DC6x+EdQBfn7AiEo3PtPv2ePAJEW2Fxw0xWtKaJ/QlcIZsGGyiEw8g==</encrypted>]]>
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

    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>