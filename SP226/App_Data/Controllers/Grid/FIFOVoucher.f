<?xml version="1.0" encoding="utf-8"?>

<grid table="dmct" code="ma_ct" filter="ct_nxt &lt;&gt; 0" order="stt_ctntxt, ma_ct" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Khai báo về chứng từ để tính giá NTXT" e="Voucher Information for FIFO Cost Calculating"></title>
  <subTitle v="Sửa thông tin chứng từ" e="Edit Voucher Information"></subTitle>

  <fields>
    <field name="stt_ctntxt" type="Int32" width="60" align="right" allowSorting="true" allowFilter="true">
      <header v="Stt" e="Ordinal"></header>
    </field>
    <field name="ma_ct" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã chứng từ" e="Voucher Code"></header>
    </field>
    <field name="ten_ct%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên chứng từ" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_ctntxt"/>
      <field name="ma_ct"/>
      <field name="ten_ct%l"/>
    </view>
  </views>

  <toolbar>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"/>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>