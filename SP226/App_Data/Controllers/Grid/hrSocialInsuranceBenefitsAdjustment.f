<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckRight "(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))">
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vhrdctcd" code="nam, ky, dot, stt_rec, ma_tc" order="nam, ky, dot, ma_nv, ma_tc" filter="&FilterCheckRight;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Điều chỉnh danh sách lao động thanh toán theo chế độ" e="Data Adjustment for Social Insurance Benefits"></title>
  <subTitle v="Tháng %p năm %y." e="Month %p Year %y."></subTitle>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="dot" isPrimaryKey="true" type="Decimal" dataFormatString="#0" width="60" allowFilter="&GridListAllowFilter.Number;">
      <header v="Đợt" e="Time"></header>
      <items style="Numeric"/>
    </field>
    <field name="ky" isPrimaryKey="true" type="Decimal" dataFormatString="#0" width="0" hidden="true">
      <header v="Tháng" e="Month"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" isPrimaryKey="true" type="Decimal" dataFormatString="###0" width="0" hidden="true">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nv" width="100" allowFilter="&GridListAllowFilter.Column;">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ho_ten" width="150" allowFilter="&GridListAllowFilter.Column;">
      <header v="Họ và tên" e="Employee Name"></header>
    </field>
    <field name="ma_tc" isPrimaryKey="true" width="100" allowFilter="&GridListAllowFilter.Column;">
      <header v="Mã trợ cấp" e="Benefit Code"></header>
    </field>
    <field name="ten_tcbh%l" width="150" allowFilter="&GridListAllowFilter.Column;">
      <header v="Tên trợ cấp" e="Benefit Name"></header>
    </field>

    <field name="dot_xd" type="Decimal" dataFormatString="#0" width="100" allowFilter="&GridListAllowFilter.Number;">
      <header v="Đợt xét duyệt" e="Approving Time"></header>
      <items style="Numeric"/>
    </field>
    <field name="thang_xd" type="Decimal" dataFormatString="#0" width="100" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tháng" e="Month"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam_xd" type="Decimal" dataFormatString="###0" width="100" allowFilter="&GridListAllowFilter.Number;">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>

    <field name="so_tien1" type="Decimal" width="100" dataFormatString="@generalCurrencyAmountViewFormat" align ="right" allowFilter="&GridListAllowFilter.Number;">
      <header v="Mức hưởng cũ" e="Old Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="so_tien2" type="Decimal" width="100" dataFormatString="@generalCurrencyAmountViewFormat" align ="right" allowFilter="&GridListAllowFilter.Number;">
      <header v="Mức hưởng mới" e="New Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="so_tien3" type="Decimal" width="100" dataFormatString="@generalCurrencyAmountViewFormat" align ="right" allowFilter="&GridListAllowFilter.Number;">
      <header v="Mức chênh lệch" e="Diff. Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="so_ngay_cl" type="Decimal" dataFormatString="### ##0.00" width="100" allowFilter="&GridListAllowFilter.Number;">
      <header v="Ngày chênh lệch" e="No. of Diff. Days"></header>
      <items style="Numeric"/>
    </field>
    <field name="luy_ke" type="Decimal" width="100" dataFormatString="@generalCurrencyAmountViewFormat" align ="right" allowFilter="&GridListAllowFilter.Number;">
      <header v="Lk từ đầu năm" e="YTD Accumu."></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>

      <field name="dot"/>
      <field name="ky"/>
      <field name="nam"/>
      <field name="ma_nv"/>
      <field name="ho_ten"/>
      <field name="ma_tc"/>
      <field name="ten_tcbh%l"/>

      <field name="dot_xd"/>
      <field name="thang_xd"/>
      <field name="nam_xd"/>

      <field name="so_tien1"/>
      <field name="so_tien2"/>
      <field name="so_tien3"/>

      <field name="so_ngay_cl"/>
      <field name="luy_ke"/>
    </view>
  </views>

  <toolbar>
    <button command="New">
      <title v="Toolbar.New" e="Toolbar.New"/>
    </button>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"/>
    </button>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"/>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>

</grid>