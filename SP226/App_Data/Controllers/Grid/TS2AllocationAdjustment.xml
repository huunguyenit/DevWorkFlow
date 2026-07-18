<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vctcddc" code="ma_dc, ma_bp_dc, ky, nam" filter="&FilterCheckAccessUnit;" order="ma_dc, ma_bp_dc, ky, nam" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Điều chỉnh phân bổ tháng CCDC" e="Adjust Monthly Allocation"></title>
  <subTitle v="Kỳ %s1, năm %s2" e="Period %s1, year %s2"></subTitle>
  <fields>
    <field name="ma_dc" isPrimaryKey="true" width="100" allowFilter="true" allowSorting="true">
      <header v="Mã công cụ" e="Tool &#38; Supply Code"></header>
    </field>
    <field name="ten_dc%l" width="300" allowFilter="true" allowSorting="true">
      <header v="Tên công cụ" e="Tool &#38; Supply Name"></header>
    </field>
    <field name="ma_bp_dc" isPrimaryKey="true" width="100" allowFilter="true" allowSorting="true">
      <header v="Bộ phận sử dụng" e="Using Department"></header>
    </field>
    <field name="sua_pb" type="Decimal" width="60" allowFilter="&GridListAllowFilter.Number;">
      <header v="Sửa phân bổ" e="Edit"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="true">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="so_ct" width="100" align="right" allowFilter="true">
      <header v="Số" e="Number"></header>
    </field>
    <field name="ky" type="Decimal" isPrimaryKey="true" width="0" hidden="true">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal" isPrimaryKey="true" width="0" hidden="true">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nguyen_gia" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowFilter="&GridListAllowFilter.Number;">
      <header v="Nguyên giá" e="Original Cost"></header>
      <items style="Numeric"></items>
    </field>
    <field name="gt_da_pb" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowFilter="&GridListAllowFilter.Number;">
      <header v="Gt đã phân bổ" e="Accumulation Allocation"></header>
      <items style="Numeric"></items>
    </field>
    <field name="gt_cl" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowFilter="&GridListAllowFilter.Number;">
      <header v="Gt còn lại" e="Remaining Value"></header>
      <items style="Numeric"></items>
    </field>
    <field name="gt_pb_ky" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowFilter="&GridListAllowFilter.Number;">
      <header v="Gt phân bổ kỳ" e="Monthly Allocation"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_nt" width="100" allowFilter="true">
      <header v="Mã nt" e="Currency Code"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_dc"/>
      <field name="ten_dc%l"/>
      <field name="ma_bp_dc"/>
      <field name="sua_pb"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>
      <field name="ky"/>
      <field name="nam"/>
      <field name="nguyen_gia"/>
      <field name="gt_da_pb"/>
      <field name="gt_cl"/>
      <field name="gt_pb_ky"/>
      <field name="ma_nt"/>
    </view>
  </views>

  <toolbar>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"></title>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>

</grid>