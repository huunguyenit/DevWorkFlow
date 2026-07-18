<?xml version="1.0" encoding="utf-8"?>

<grid table="hrkhaibao" code="line_nbr, id" order="line_nbr" filter="id = 'Overtime'" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo loại công tăng ca" e="Overtime Workday Type"></title>
  <subTitle v="Cập nhật danh sách loại công tăng ca cho ngày thường, chủ nhật, lễ..." e="Update Overtime Workday Type..."></subTitle>

  <fields>
    <field name="id" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" isPrimaryKey="true" type="Int16" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="name%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên" e="Description"></header>
    </field>
    <field name="val" width="300" allowSorting="true" allowFilter="true">
      <header v="Giá trị" e="Value"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="id"/>
      <field name="line_nbr"/>
      <field name="name%l"/>
      <field name="val"/>
    </view>
  </views>

  <toolbar>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>