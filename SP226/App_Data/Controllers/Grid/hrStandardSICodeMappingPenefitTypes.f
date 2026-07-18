<?xml version="1.0" encoding="utf-8"?>

<grid table="hrmapbhltc" code="ma_tc, f_ma_tcbh, f_ma_kieu" order="ma_tc, line_nbr" type="Detail" freezeColumns="3" id="" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""/>
  <subTitle v="" e=""/>
  <fields>
    <field name="f_ma_tcbh" isPrimaryKey="true" allowNulls="false" width="100" aliasName="a">
      <header v="Mã trợ cấp" e="Benefit Code"></header>
      <items style="AutoComplete" controller="hrSIBenefitItem" reference="ten_tcbh%l" key="status ='1'" check="1=1" information="ma_tcbh$hrdmtcbh.ten_tcbh%l"/>
    </field>
    <field name="ten_tcbh%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b">
      <header v="Tên trợ cấp" e="Benefit Name"></header>
    </field>
    <field name="f_ma_kieu" isPrimaryKey="true" width="100" aliasName="a">
      <header v="Mã kiểu trợ cấp" e="Benefit Category Code"></header>
      <items style="AutoComplete" controller="hrSIBenefitType" reference="ten_kieu%l" key="status ='1'" check="1=1" information="ma_kieu$hrdmktcbh.ten_kieu%l"/>
    </field>
    <field name="ten_kieu%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="c">
      <header v="Tên kiểu trợ cấp" e="Benefit Category Name"></header>
    </field>

    <field name="tc_loai" width="100" dataFormatString="@upperCaseFormat" allowNulls="false" aliasName="a">
      <header v="Loại thay đổi (BHXH)" e="Type (SI)"></header>
      <items style="Mask"/>
    </field>

    <field name="ma_tc" isPrimaryKey="true" readOnly="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="f_ma_tcbh"/>
      <field name="ten_tcbh%l"/>
      <field name="f_ma_kieu"/>
      <field name="ten_kieu%l"/>
      <field name="tc_loai"/>
      <field name="ma_tc"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1OrDTQdK1c5LVXuryLCGmoS0KXcExNhLM+s3fk22C0aAf1GD8z2NN9zWxqQ65Z+s7MqH+9gQpeRxPuft//zxFwfQEhMKaOSjwI8tD7W4w4QqibIhfmoSwEvvOsojv6z2hn/CunbcM2YpVxUuPRy+/e9h8xF1paQSCuK89UtIMSS</encrypted>]]>
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