<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessSite "@@0">
  <!ENTITY SiteRight "exec FastBusiness$System$GetGridFilter 'ma_dvcs', 'ma_kho', '', '', @@userID, @@admin">
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">
  <!ENTITY CommandCheckUnitRightBeforeInit SYSTEM "..\Include\Command\CheckUnitRightBeforeInit.txt">
  <!ENTITY CommandControlLocationLotShowing SYSTEM "..\Include\Command\ControlLocationLotShowing.txt">
]>

<grid table="dmxknvltd" code="ma_dvcs, ma_bp, tk_vt" filter="&FilterCheckAccessSite;" initialize="&SiteRight;" order="ma_dvcs, ma_bp, tk_vt" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo thông tin xuất kho tự động" e="Auto Generated Issues Information Declaration"></title>
  <subTitle v="Cập nhật thông tin xuất kho tự động: thêm, sửa, xóa..." e="Add, Edit, Delete Auto Generated Issues Information Declaration..."></subTitle>
  <fields>
    <field name="ma_dvcs" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ma_bp" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="tk_vt" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Tài khoản vật tư" e="Inventory Account"></header>
    </field>
    <field name="tk_cp" width="100" allowSorting="true" allowFilter="true">
      <header v="Tài khoản chi phí" e="Expense Account"></header>
    </field>
    <field name="ma_kho" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã kho xuất" e="Source Site"></header>
    </field>
    <field name="ma_vi_tri" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã vị trí" e="Location"></header>
    </field>
    <field name="ma_lo" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã lô" e="Lot"></header>
    </field>
    <field name="ma_nx" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhập xuất" e="Reason Code"></header>
    </field>
    <field name="ma_phi" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã phí" e="Expense"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_dvcs"/>
      <field name="ma_bp"/>
      <field name="tk_vt"/>
      <field name="tk_cp"/>
      <field name="ma_kho"/>
      <field name="ma_vi_tri"/>
      <field name="ma_lo"/>
      <field name="ma_nx"/>
      <field name="ma_phi"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb3fo5H/YFkrmgBgukOI3tO6ZmiIYqyq1utiqsyhKkQoc1Qpm2oHOPgtrFDRejynnvWe0qL6FVuXPETKGHrSVqeYKBLheqocTG5/H5+wz/b6HYd9Xdpa9AfOoPHv6O+QK/Mx5vmMO/VoUvgVaasfPSwKgC7LBtCdmzOfHn5ZWAG2k/PPi5W3lB21dHG+S1UTADvQUTIyFxksZ0a8ijt21sY4o1TqbOtg28dly6kKXQdLIiKSPF6OSXiXxhC2E3sRDtmyykXCiABjcxhZXRSUWrQ/8Jy2Xw1tRgVLWS06vgYVw==</encrypted>]]>
        &CommandControlLocationLotShowing;
        <![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7KsDfxM+g442Ngv0gNfsEgxfWijOElOxA9uYw84O2z1N/HRSJaSzmhh0vZtVpq0CT3w==</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        &CommandCheckUnitRightBeforeInit;
      </text>
    </command>
  </commands>

  <toolbar>
    <button command="New">
      <title v="Toolbar.New" e="Toolbar.New"></title>
    </button>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"></title>
    </button>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"></title>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"/>
    </button>
    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>