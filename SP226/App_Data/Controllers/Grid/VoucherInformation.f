<?xml version="1.0" encoding="utf-8"?>
<grid table="vdmct" code="ma_phan_he, ma_ct" order="xstt, ma_phan_he, stt, ma_ct" filter="wedition &lt;&gt; '9'" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo các màn hình nhập chứng từ" e="Voucher Information"></title>
  <subTitle v="Mã phân hệ: %s1 - %s2" e="Module: %s1 - %s2"></subTitle>

  <fields>
    <field name="ma_phan_he" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã phân hệ" e="Module"></header>
    </field>
    <field name="ma_ct" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã chứng từ" e="Code"></header>
    </field>
    <field name="ten_ct%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên chứng từ" e="Description"></header>
    </field>
    <field name="ma_ct_me" width="100" allowSorting="true" allowFilter="true">
      <header v="Chứng từ mẹ" e="Parent Code"></header>
    </field>
    <field name="stt" type="Int16" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="xstt" width="0" hidden="true" external="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_phan_he"/>
      <field name="ma_ct"/>
      <field name="ten_ct%l"/>
      <field name="ma_ct_me"/>
      <field name="stt"/>
      <field name="xstt"/>
    </view>
  </views>

  <toolbar>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"></title>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>