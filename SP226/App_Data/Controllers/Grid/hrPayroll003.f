<?xml version="1.0" encoding="utf-8"?>

<grid table="hrPayroll003" code="ma_bc" order="ma_bc" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Khai báo tham số mẫu báo cáo" e="Report Form Parameter Declaration"></title>
  <subTitle v="Sửa tên báo cáo, danh sách loại lương..." e="Edit Report Name and Pay Types..."></subTitle>

  <fields>
    <field name="ma_bc" isPrimaryKey="true" width="100" dataFormatString="X" hidden="true" readOnly="true">
      <header v="Mã báo cáo" e="Code"></header>
    </field>
    <field name="ten_bc%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên báo cáo" e="Description"></header>
    </field>
    <field name="ds_loai_luong" width="300" allowSorting="true" allowFilter="true">
      <header v="Danh sách loại lương" e="Pay Type List"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_bc"/>
      <field name="ten_bc%l"/>
      <field name="ds_loai_luong"/>
    </view>
  </views>

  <toolbar>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>