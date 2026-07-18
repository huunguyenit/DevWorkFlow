<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or ma_dvcs = '' or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">
  <!ENTITY CostingUnitGridClosing SYSTEM "..\Include\Command\CostingUnitGridClosing.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vxctgtspx" code="ky, nam, ma_dvcs, ma_sp, ma_bp, so_lsx" order="ky, nam, ma_dvcs, ma_sp, ma_bp, so_lsx" filter="&FilterCheckAccessUnit;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Điều chỉnh giá thành sản phẩm" e="Cost Adjustment"></title>
  <subTitle v="Kỳ %s1, năm %s2" e="Period %s1, Year %s2"></subTitle>

  <fields>
    <field name="ky" type="Decimal" isPrimaryKey="true" hidden="true" width="0">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal"  isPrimaryKey="true" hidden="true" width="0">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_dvcs" isPrimaryKey="true" width="100" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ma_sp" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã sản phẩm" e="Product"></header>
    </field>
    <field name="ten_sp%l" width="300" readOnly="true" external="true" allowSorting="true" allowFilter="true">
      <header v="Tên sản phẩm" e="Description"></header>
    </field>
    <field name="ma_bp" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="so_lsx" isPrimaryKey="true" width="100" align="right" allowSorting="true" allowFilter="true">
      <header v="Số lsx" e="MO Number"></header>
    </field>
    <field name="sl_tp" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" allowFilter="&GridListAllowFilter.Number;" aggregate="Sum">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia_dc_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceViewFormat" width="100" allowSorting="true" allowFilter="&GridListAllowFilter.Number;" aggregate="Sum">
      <header v="Giá đc nt" e="FC Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_dc_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="100" allowSorting="true" allowFilter="&GridListAllowFilter.Number;" aggregate="Sum">
      <header v="Tiền đc nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia_dc" type="Decimal" dataFormatString="@baseCurrencyPriceViewFormat" width="100" allowSorting="true" allowFilter="&GridListAllowFilter.Number;" aggregate="Sum">
      <header v="Giá đc" e="Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_dc" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="100" allowSorting="true" allowFilter="&GridListAllowFilter.Number;" aggregate="Sum">
      <header v="Tiền đc" e="Amount"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ky"/>
      <field name="nam"/>
      <field name="ma_dvcs"/>
      <field name="ma_sp"/>
      <field name="ten_sp%l"/>
      <field name="ma_bp"/>
      <field name="so_lsx"/>
      <field name="sl_tp"/>
      <field name="gia_dc_nt"/>
      <field name="tien_dc_nt"/>
      <field name="gia_dc"/>
      <field name="tien_dc"/>
    </view>
  </views>

  <commands>
    &CostingUnitGridClosing;
  </commands>

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