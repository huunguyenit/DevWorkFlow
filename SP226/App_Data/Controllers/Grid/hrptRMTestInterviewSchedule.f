<?xml version="1.0" encoding="utf-8"?>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Lịch kiểm tra, phỏng vấn" e="Test and Interview Schedules"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="stt" type="Decimal" dataFormatString="### ###" width ="60" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_dot" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã đợt" e="Period Code"/>
    </field>
    <field name="ten_dot" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên đợt tuyển dụng" e="Description"/>
    </field>
    <field name="ten_vong" width="300" allowSorting="true" allowFilter="true">
      <header v="Vòng tuyển dụng" e="Recruitment Round"/>
    </field>
    <field name="ma_hs" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã ứng viên" e="Applicant ID"/>
    </field>
    <field name="ten" width="300" allowSorting="true" allowFilter="true">
      <header v="Họ và tên" e="Full Name"/>
    </field>
    <field name="ten_vtr" width="150" allowSorting="true" allowFilter="true">
      <header v="Vị trí" e="Vacancy"></header>
    </field>
    <field name="nguoi_pv" width="150" allowSorting="true" allowFilter="true">
      <header v="Người k.tra, phỏng vấn" e="Tester, Interviewer"></header>
    </field>
    <field name="ngay_pv" type="DateTime" dataFormatString="@datetimeFormat" width ="100" allowSorting="true" allowFilter="true">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="thoi_gian_pv" width="300" allowSorting="true" allowFilter="true">
      <header v="Thời gian" e="Time"></header>
    </field>
    <field name="dia_diem_pv" width="300" allowSorting="true" allowFilter="true">
      <header v="Địa điểm" e="Place"></header>
    </field>
    <field name="noi_dung_pv" width="300" allowSorting="true" allowFilter="true">
      <header v="Nội dụng" e="Content"></header>
    </field>
    <field name="ghi_chu" width="300" allowSorting="true" allowFilter="true">
      <header v="Ghi chú" e="Note"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma_dot"/>
      <field name="ten_dot"/>
      <field name="ten_vong"/>
      <field name="ma_hs"/>
      <field name="ten"/>
      <field name="ten_vtr"/>
      <field name="nguoi_pv"/>
      <field name="ngay_pv"/>
      <field name="thoi_gian_pv"/>
      <field name="dia_diem_pv"/>
      <field name="noi_dung_pv"/>
      <field name="ghi_chu"/>
    </view>
  </views>

  <toolbar>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Print">
      <title v="Toolbar.Print" e="Toolbar.Print"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>