<?xml version="1.0" encoding="utf-8"?>

<grid table="v20dmctnkt" code="ma_nkt" order="line_nbr" type="Detail" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <fields>
    <field name="ma_nkt" isPrimaryKey="true" width="0" hidden="true" dataFormatString="@upperCaseFormat" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="ma_ct" width="100" allowNulls="false" aliasName="a">
      <header v="Mã chứng từ" e="Voucher Code"></header>
      <items style="AutoComplete" controller="Voucher" reference="ten_ct%l" key="wedition &lt;&gt; '9' and status = '1'" check="wedition &lt;&gt; '9'" information="ma_ct$dmct.ten_ct%l"/>
    </field>
    <field name="ten_ct%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0" aliasName="b">
      <header v="Tên" e="Description"></header>
    </field>
    <field name="lstuser2" width="300" aliasName="a">
      <header v="Danh sách người sử dụng" e="User(s)"></header>
      <items style="Lookup" controller="User" reference="comment%l" information="name$userinfo2.comment%l"/>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_nkt"/>
      <field name="ma_ct"/>
      <field name="ten_ct%l"/>
      <field name="lstuser2"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK+YfohbBOuq4Q4/sCftlbIdEhcLums13Kvd+ydCUJMxG0w8BaeSvMFEpA66GhMNVC9mmyRo0hX+ou0o5TUILZdWSxlPcWPv0o+EWY+FPsSIgQ==</Encrypted>]]>
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