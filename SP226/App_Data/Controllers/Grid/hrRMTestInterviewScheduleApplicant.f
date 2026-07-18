<?xml version="1.0" encoding="utf-8"?>

<grid table="vhrrmlichct" code="ma_dot, stt_rec0" order="ma_dot, stt_rec0" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật lịch kiểm tra, phỏng vấn cho ứng viên" e="Test and Interview Schedule by Applicant"></title>
  <subTitle v="Đợt tuyển dụng: %p - %n..." e="Recruitment Period: %p - %n..."></subTitle>

  <fields>
    <field name="ma_dot" isPrimaryKey="true" width="0" hidden="true">
      <header v="Mã đợt" e="Period Code"></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ten_vong%l" width="300" allowFilter="true">
      <header v="Vòng tuyển dụng" e="Recruitment Round"></header>
    </field>
    <field name="ten_vtr%l" width="150" allowFilter="true">
      <header v="Vị trí tuyển dụng" e="Recruitment Position"></header>
    </field>
    <field name="nguoi_pv" width="150" allowFilter="true">
      <header v="Người phỏng vấn" e="Interviewer"></header>
    </field>
    <field name="ngay_pv" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="true">
      <header v="Ngày phỏng vấn" e="Date of Interview"></header>
    </field>
    <field name="thoi_gian_pv" width="150" allowFilter="true">
      <header v="Thời gian phỏng vấn" e="Time of Interview"></header>
    </field>
    <field name="dia_diem_pv" width="300" allowFilter="true">
      <header v="Địa điểm phỏng vấn" e="Place of Interview"></header>
    </field>
    <field name="noi_dung_pv" width="300" allowFilter="true">
      <header v="Nội dung phỏng vấn" e="Content"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_dot"/>
      <field name="stt_rec0"/>
      <field name="ten_vong%l"/>
      <field name="ten_vtr%l"/>
      <field name="nguoi_pv"/>
      <field name="ngay_pv"/>
      <field name="thoi_gian_pv"/>
      <field name="dia_diem_pv"/>
      <field name="noi_dung_pv"/>
    </view>
  </views>

  <toolbar>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"></title>
    </button>
    <button command="Delete">
      <title v="Xóa chi tiết (Ctrl + Delete)$Xóa..." e="Clear (Ctrl + Delete)$"/>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>