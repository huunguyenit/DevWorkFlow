<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckRight "(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))">
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vhrtttcd" code="nam, ky, dot, stt_rec, ma_tc, ngay_tu" order="nam, ky, dot, ma_nv, ma_tc, ngay_tu" filter="&FilterCheckRight;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật danh sách lao động phát sinh thanh toán theo chế độ" e="Data Entry for Social Insurance Benefits"></title>
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

    <field name="tg_bhxh" width="150" allowFilter="&GridListAllowFilter.Column;">
      <header v="Thời gian đóng bảo hiểm" e="SI Paying Duration"></header>
    </field>
    <field name="tien_bhxh" type="Decimal" width="100" dataFormatString="@generalCurrencyAmountViewFormat" align ="right" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tiền lương" e="Base Salary"></header>
      <items style="Numeric"/>
    </field>
    <field name="tt_bhxh" width="150" allowFilter="&GridListAllowFilter.Column;">
      <header v="Tình trạng" e="Benefit Status"></header>
    </field>
    <field name="td_bhxh" width="150" allowFilter="&GridListAllowFilter.Column;">
      <header v="Thời điểm" e="Benefit Time"></header>
    </field>

    <field name="ngay_tu" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="&GridListAllowFilter.Column;">
      <header v="Từ ngày" e="Date from"></header>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="&GridListAllowFilter.Column;">
      <header v="Đến ngày" e="Date to"></header>
    </field>

    <field name="so_ngay" type="Decimal" dataFormatString="### ##0.00" width="100" allowFilter="&GridListAllowFilter.Column;">
      <header v="Tổng số ngày" e="No. of Day(s)"></header>
      <items style="Numeric"/>
    </field>
    <field name="st_tc_tk" type="Decimal" width="100" dataFormatString="@generalCurrencyAmountViewFormat" align ="right" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tiền trợ cấp" e="Benefit"></header>
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

      <field name="tg_bhxh"/>
      <field name="tien_bhxh"/>
      <field name="tt_bhxh"/>
      <field name="td_bhxh"/>

      <field name="ngay_tu"/>
      <field name="ngay_den"/>

      <field name="so_ngay"/>
      <field name="st_tc_tk"/>
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