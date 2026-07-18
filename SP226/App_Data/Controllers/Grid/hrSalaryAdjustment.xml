<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckRight "(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vhrdcluong" code="stt_rec, ma_loai_lg, nam, ky, ma_bp" order="stt_rec, ma_loai_lg, nam, ky, ma_bp" filter="&FilterCheckRight;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Điều chỉnh dữ liệu lương" e="Salary Adjustment"></title>
  <subTitle v="Kỳ %s1, năm %s2..." e="Period %s1, Year %s2..."></subTitle>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ky" isPrimaryKey="true" type="Decimal" width="0" hidden="true">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" isPrimaryKey="true" type="Decimal" width="0" hidden="true">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nv" width="100" allowFilter="true" allowSorting="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ho_ten" width="150" allowFilter="true" allowSorting="true">
      <header v="Họ và tên" e="Employee Name"></header>
    </field>
    <field name="ma_bp" width="100" isPrimaryKey="true" allowFilter="true" allowSorting="true">
      <header v="Mã bộ phận" e="Department"></header>
    </field>
    <field name="ten_bp%l" width="300" allowFilter="true" allowSorting="true">
      <header v="Tên bộ phận" e="Department Name"></header>
    </field>
    <field name="ma_loai_lg" isPrimaryKey="true" width="100" allowFilter="true" allowSorting="true">
      <header v="Mã loại lương" e="Pay Type"></header>
    </field>
    <field name="ten_loai_lg%l" width="300" allowFilter="true" allowSorting="true">
      <header v="Tên loại lương" e="Pay Type Name"></header>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowFilter="true" allowSorting="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>

  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ky"/>
      <field name="nam"/>
      <field name="ma_nv"/>
      <field name="ho_ten"/>
      <field name="ma_bp"/>
      <field name="ten_bp%l"/>
      <field name="ma_loai_lg"/>
      <field name="ten_loai_lg%l"/>
      <field name="tien"/>
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

    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>