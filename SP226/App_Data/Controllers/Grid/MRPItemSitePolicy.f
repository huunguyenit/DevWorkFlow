<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessSite "@@0">
  <!ENTITY SiteRight "exec FastBusiness$System$GetGridFilter 'ma_dvcs', 'ma_kho', '', '', @@userID, @@admin">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vmdmvtkho" code="ma_vt, ma_kho" filter="&FilterCheckAccessSite;" initialize="&SiteRight;" order="ma_vt, ma_kho" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Chính sách đặt hàng theo kho" e="Item Site Planning Maintenance"></title>
  <subTitle v="Cập nhật chính sách đặt hàng theo kho: thêm, sửa, xóa..." e="Add, Edit, Delete Item Site Planning Maintenance..."></subTitle>

  <fields>
    <field name="ma_vt" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã vật tư" e="Item Code"></header>
    </field>
    <field name="ten_vt%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên vật tư" e="Item Name"></header>
    </field>
    <field name="ma_kho" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã kho" e="Site"></header>
    </field>
    <field name="ty_le" width="50" type="Decimal" dataFormatString="# ##0.00" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tỷ lệ" e="Rate"></header>
      <items style="Numeric"></items>
    </field>
    <field name="muc_do" width="60" type="Decimal" dataFormatString="#0" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Mức độ" e="Priority"></header>
      <items style="Numeric"></items>
    </field>
    <field name="kieu_hd" width="60" allowSorting="true" allowFilter="true">
      <header v="Kiểu hoạch định" e="Order Policy"></header>
    </field>
    <field name="ton_at" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tồn an toàn" e="Safety Stock"></header>
      <items style="Numeric"></items>
    </field>
    <field name="co_lo" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Cỡ lô" e="Lot Size"></header>
      <items style="Numeric"></items>
    </field>
    <field name="so_ngay_dh" width="100" type="Decimal" dataFormatString="##0" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Số ngày đặt hàng" e="Interval Days"></header>
      <items style="Numeric"></items>
    </field>
    <field name="tg_th" width="100" type="Decimal" dataFormatString="##0" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Thời gian thực hiện" e="Lead Time"></header>
      <items style="Numeric"></items>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="ma_kho"/>
      <field name="ty_le"/>
      <field name="muc_do"/>
      <field name="kieu_hd"/>
      <field name="ton_at"/>
      <field name="co_lo"/>
      <field name="so_ngay_dh"/>
      <field name="tg_th"/>
    </view>
  </views>

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
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"/>
    </button>
    <button command="-">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>