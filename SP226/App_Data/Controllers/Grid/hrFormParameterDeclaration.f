<?xml version="1.0" encoding="utf-8"?>

<grid table="hrtsmbc" code="ma_tsmbc" order="stt_sx, ma_tsmbc" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo tham số mẫu báo cáo" e="Report Form Parameter Declaration"></title>
  <subTitle v="Sửa tham số mẫu báo cáo..." e="Edit Report Form Parameters..."></subTitle>

  <fields>
    <field name="ma_tsmbc" isPrimaryKey="true" width="100" dataFormatString="X" hidden="true" readOnly="true">
      <header v="Tham số" e="Parameter"></header>
    </field>
    <field name="ten_tsmbc%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên tham số" e="Description"></header>
    </field>
    <field name="stt_sx" width="0" hidden="true" type="Decimal">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_tsmbc"/>
      <field name="ten_tsmbc%l"/>
      <field name="stt_sx"/>
    </view>
  </views>

  <toolbar>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"/>
    </button>
  </toolbar>
</grid>