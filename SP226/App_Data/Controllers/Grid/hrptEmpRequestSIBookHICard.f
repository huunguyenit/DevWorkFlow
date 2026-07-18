<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh sách lao động đề nghị cấp sổ BHXH, BHYT" e="Employees Requesting for SI Book, HI Card"></title>
  <subTitle v="Đợt: %d, tháng %t, năm %n..." e="Time: %d, Month %t, Year %n..."></subTitle>
  <fields>
    <field name="stt" type="Decimal" width="30" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_nv" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ho_ten" width="150" allowSorting="true" allowFilter="true">
      <header v="Họ và tên" e="Full Name"/>
    </field>
    <field name="si_no" width="100" allowSorting="true" allowFilter="true">
      <header v="Số sổ BHXH" e="SI Book No."/>
    </field>
    <field name="ngay_sinh" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Ngày sinh" e="Date of Birth"/>
    </field>
    <field name="dan_toc" width="100" allowSorting="true" allowFilter="true">
      <header v="Dân tộc" e="Ethnic"/>
    </field>
    <field name="cmnd_so" width="100" allowSorting="true" allowFilter="true">
      <header v="Số CMND" e="ID Card No."/>
    </field>
    <field name="cmnd_ngay_hl" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Ngày cấp" e="Date of Issue"/>
    </field>
    <field name="noi_cap_cmnd" width="100" allowSorting="true" allowFilter="true">
      <header v="Nơi cấp" e="Place of Issue"/>
    </field>
    <field name="dia_chi_th_tru" width="200" allowSorting="true" allowFilter="true">
      <header v="Hộ khẩu thường trú" e="Permanent Residence"/>
    </field>
    <field name="ma_tinh_KCB" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã tỉnh KCB" e="HI Prov. Code"/>
    </field>
    <field name="benh_vien" width="150" allowSorting="true" allowFilter="true">
      <header v="Bệnh viện" e="Medical Care Center"/>
    </field>
    <field name="quyen_loi" width="200" allowSorting="true" allowFilter="true">
      <header v="Quyền lợi hưởng BHYT" e="HI Benefit"/>
    </field>
    <field name="ghi_chu" width="100" allowSorting="true" allowFilter="true">
      <header v="Ghi chú" e="Note"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma_nv"/>
      <field name="ho_ten"/>
      <field name="si_no"/>
      <field name="ngay_sinh"/>
      <field name="dan_toc"/>
      <field name="cmnd_so"/>
      <field name="cmnd_ngay_hl"/>
      <field name="noi_cap_cmnd"/>
      <field name="dia_chi_th_tru"/>
      <field name="ma_tinh_KCB"/>
      <field name="benh_vien"/>
      <field name="quyen_loi"/>
      <field name="ghi_chu"/>
    </view>
  </views>

  <commands>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      &JavascriptReportInit;
    </text>
  </script>

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