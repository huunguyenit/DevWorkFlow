<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vgpbdc" code="stt_rec" filter="&FilterCheckAccessUnit;" order="ngay_ct, so_ct, ma_dc, stt_rec" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo giảm/hỏng" e="Tool &amp; Supply Disposal"></title>
  <subTitle v="Cập nhật khai báo giảm/hỏng: thêm, sửa, xóa..." e="Add, Edit, Delete Tool &amp; Supply Disposal..."></subTitle>
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

    <field name="ma_ld_giam" width="100" align="right" allowFilter="true">
      <header v="Lý do giảm" e="Reason"></header>
    </field>

    <field name="ma_bp_dc" width="100" allowSorting="true" allowFilter="true">
      <header v="Bộ phận sử dụng" e="Using Department"></header>
    </field>
    <field name="so_luong" width="100" type="Decimal" dataFormatString="@quantityInputFormat" allowFilter="true">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="nguyen_gia_nt" width="100" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" allowFilter="&GridListAllowFilter.Number;">
      <header v="Nguyên giá nt" e="FC Original Cost"></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_pb_nt" width="100" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" allowFilter="&GridListAllowFilter.Number;">
      <header v="Giá trị phân bổ nt" e="FC Allocated Value"></header>
      <items style="Numeric"/>
    </field>
    <field name="nguyen_gia" width="100" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" allowFilter="&GridListAllowFilter.Number;">
      <header v="Nguyên giá" e="Original Cost"></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_pb" width="100" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" allowFilter="&GridListAllowFilter.Number;">
      <header v="Giá trị phân bổ" e="Allocated Value"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>
      <field name="ma_dc"/>
      <field name="ten_dc%l"/>
      <field name="ma_ld_giam"/>
      <field name="ma_bp_dc"/>
      <field name="so_luong"/>
      <field name="nguyen_gia_nt"/>
      <field name="gt_pb_nt"/>
      <field name="nguyen_gia"/>
      <field name="gt_pb"/>
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