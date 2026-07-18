<?xml version="1.0" encoding="utf-8"?>
<grid table="hddetailrules" code="ma_mau" order="line_nbr" type="Detail" database="Sys" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <fields>
    <field name="ma_mau" isPrimaryKey="true" width="0" hidden="true" dataFormatString="@upperCaseFormat" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="loai" width="100" aliasName="a" allowNulls="false">
      <header v="Loại" e="Type"></header>
      <items style="AutoComplete" controller="VisibleFieldRuleType" reference="ten_loai%l" key="1=1" check="1=1" information="loai$hdtypes.ten_loai%l"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZejwuG3FXgKty2XZyo2w8rE+d4XnBMRumkI7jYnL67yIXq5FgSeyjktRP9atOvA++6JjkCPSV2s/jRgY0iHsEJY=</encrypted>]]></clientScript>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="c">
      <header v="Tên loại" e="Type Name"></header>
    </field>

    <field name="ma_ct" width="100" allowNulls="false" aliasName="a">
      <header v="Mã chứng từ" e="Voucher Code"></header>
      <items style="AutoComplete" controller="Voucher" reference="ten_ct%l" key="status = '1' and exists (select 1 from @@sysDatabaseName..hdfields b where dmct.ma_ct = b.ma_ct and (b.loai = '{$%c$%r.[loai]}') and status = '1')" check="exists (select 1 from @@sysDatabaseName..hdfields b where dmct.ma_ct = b.ma_ct and (b.loai = '{$%c$%r.[loai]}') and status = '1')" information="ma_ct$dmct.ten_ct%l"/>
    </field>
    <field name="ten_ct%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b">
      <header v="Tên chứng từ" e="Voucher Name"></header>
    </field>

    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_mau"/>
      <field name="loai"/>
      <field name="ten_loai%l"/>
      <field name="ma_ct"/>
      <field name="ten_ct%l"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzq8azyY8fiqcUOLppq5ZIcEHtLgbQosyI5Lu8c0KbRMWFqefBL5oTTnOm9Xci/KcbzmNV3EjADWunP8SaQfaXLiWoKHOXKedoKT69ua9ly3</encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiPfDbQH+eNOEniFMwhrnDUGoM7A4yAemX4a/lj50PCkzlkUsTQAEyjqBecIQOYllXTt9Ohq226U8WOgfZ1/+yZXYd201nJMlT703pSXZA1vH</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AWYs1WMbXW4t6rMGyKy+hkYzIg+S4JWJsZne8ozANwPQwl64SfoLVS6G5nqYX0YJeOU1bubB58IrCbn+1uNHKm3Uf9gQBuliiyC/g9d9WoK7EAghHEYXwCTxD9nhe2hxxt4T0DYJZuN9TqVvtbtP+d0AD1N+VmN8vFSL2Uewzl04ngnqkPfOREud+w5BPd1olMOjq1CQlcPhuJ9oINwb8YDLXnFdYdJOs3ANSNQem6333ylTBqtZDEV8p/miqZJriSslll7ml+MNlpnmsWp7SPfjsvShYDY4DeCvSYDNDaPTkbuYlQ7nDshSvCalWEFY+Kc2AHgPXbIAAlDveYmOdQXXbl5FvaFs1Hvxj5djWsTSBv3FUHtSEMqGywX17sPMmKSIAmeRhpqPXDU67Pexyqb+5zUA9f3+nNR4emd6gJBjRO62wCGABqO6Z8S46kPaeP9Pfx1eJrhD1BN7I+VxlI=</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Type">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4t5w2+icxkb4kqyHqVMqnteS0HDiZ5WVYoqTmECckGcU/iSmjI9GL3bRiM3dp/o3pX0zDaHRXXWL5v4LsGYcdKg9JKGTe5tD7ihE+Z/MeDmSMlb3lrpFehr4hJ9Vj34RI=</encrypted>]]>
      </text>
    </action>
  </response>


  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1OrDTQdK1c5LVXuryLCGmqLoEfUEG7/1aysIx2GGWIbcRwFITRYcy2BFsrSpCe/Bmxn+Ho5JX8d9tZec56qgrBF8PZt66H+y3nYBdSqqso26pkM7684qGdyKIX8a1hZ7C4PKsXgAXuBb+sj2O4Fr/WGJrTpGAi8JjzLwpjHMJoY</encrypted>]]>
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