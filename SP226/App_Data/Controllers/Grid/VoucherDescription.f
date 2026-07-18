<?xml version="1.0" encoding="utf-8"?>

<grid table="vv20dmdg" code="ma_ct" order="ma_ct" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo diễn giải chứng từ tự động" e="Auto-generated Voucher Descriptions"></title>
  <subTitle v="Cập nhật diễn giải chứng từ tự động" e="Edit Description"></subTitle>
  <fields>
    <field name="ma_ct" isPrimaryKey="true"  width="100" allowSorting="true" allowFilter="true">
      <header v="Mã chứng từ" e="Voucher Code"></header>
    </field>

    <field name="ten_ct%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên chứng từ" e="Voucher Name"></header>
    </field>
    
    <field name="dien_giai" width="300" allowSorting="true" allowFilter="true">
      <header v="Diễn giải" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_ct"/>
      <field name="ten_ct%l"/>
      <field name="dien_giai"/>
    </view>
  </views>

  <toolbar>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>