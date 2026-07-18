<?xml version="1.0" encoding="utf-8"?>

<grid table="dtmaubc" code="ma_dt" order="ma_dt" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo mẫu" e="Edit Information"></title>
  <subTitle v="Sửa thông tin dự án, công trình và hạng mục công trình" e="Investment By Project, Work and Work Detail"></subTitle>

  <fields>
    <field name="ma_dt" isPrimaryKey="true" width="100" dataFormatString="X" hidden="true" readOnly="true">
      <header v="Mã sổ" e="Book"></header>
    </field>
    <field name="ten_dt%l" width="500" allowSorting="true" allowFilter="true">
      <header v="Tên vụ việc" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_dt"/>
      <field name="ten_dt%l"/>
    </view>
  </views>

  <toolbar>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"/>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
  </toolbar>
</grid>