<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vtpbdc" code="stt_rec" filter="&FilterCheckAccessUnit;" order="ngay_ct, so_ct, ma_dc, stt_rec" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo thôi phân bổ" e="Tool &amp; Supply Abandonment"></title>
  <subTitle v="Khai báo thôi phân bổ: thêm, sửa, xóa..." e="Add, Edit, Delete Tool &amp; Supply Abandonment..."></subTitle>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="true">
      <header v="Ngày chứng từ" e="Voucher Date"></header>
    </field>
    <field name="so_ct" width="100" align="right" allowFilter="true">
      <header v="Số chứng từ" e="Voucher Number"></header>
    </field>
    <field name="ma_dc" width="100" allowSorting="true" allowFilter="true" align = "right">
      <header v="Mã công cụ dụng cụ" e="Tool &amp; Supply Code"></header>
    </field>
    <field name="ten_dc%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên công cụ dụng cụ" e="Description"></header>
    </field>
    <field name="ma_bp_dc" width="100" allowSorting="true" allowFilter="true">
      <header v="Bộ phận sử dụng" e="Using Department"></header>
    </field>
    <field name="ngay_hl_tu" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="true">
      <header v="Ngày thôi phân bổ từ" e="Abandonment Date from"></header>
    </field>
    <field name="ngay_hl_den" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="true">
      <header v="Ngày thôi phân bổ đến" e="Abandonment Date To"></header>
    </field>
    <field name="so_luong" width="100" type="Decimal" dataFormatString="@quantityInputFormat" allowFilter="&GridListAllowFilter.Number;">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_dvcs" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>
      <field name="ma_dc"/>
      <field name="ten_dc%l"/>
      <field name="ma_bp_dc"/>
      <field name="ngay_hl_tu"/>
      <field name="ngay_hl_den"/>
      <field name="so_luong"/>
      <field name="ma_dvcs"/>
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