<?xml version="1.0" encoding="utf-8"?>

<grid table="sysgendatainfo" code="id" order="id" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Tạo dữ liệu" e="Create Data"></title>
  <subTitle v="Năm %s1." e="Year %s1."></subTitle>
  <partition table="sysgendatainfo" prime="sysgendatainfo" inquiry="" field="" expression="''" increase="{0}" default=""/>
  <fields>
    <field name="id" isPrimaryKey="true" type="Decimal" width="100" allowFilter="true" align="right" readOnly="true">
      <header v="Số thứ tự" e="Ordinal No."></header>
    </field>
    <field name="info%l" width="300" allowFilter="true" readOnly="true">
      <header v="Thông tin" e="Information"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="id"/>
      <field name="info%l"/>
    </view>
  </views>

  <toolbar>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>