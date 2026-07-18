<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Sổ quản lý lao động" e="Book of Labor"></title>
  <subTitle v="Đến tháng %v1/%v2..." e="Month to %v1/%v2..."></subTitle>

  <fields>
    <field name="stt" type="Int16" width="60" dataFormatString="# ###" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_nv" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ho_ten_nv" width="150" allowSorting="true" allowFilter="true">
      <header v="Họ và tên" e="Full Name"></header>
    </field>
    <field name="vi_tri" width="150" allowSorting="true" allowFilter="true">
      <header v="Vị trí" e="Position"></header>
    </field>
    <field name="gioi_tinh" width="80" allowSorting="true" allowFilter="true">
      <header v="Giới tính" e="Gender"></header>
    </field>
    <field name="ngay_sinh" type="DateTime" dataFormatString="@datetimeFormat" width ="100" allowSorting="true" allowFilter="true">
      <header v="Năm sinh" e="Birthdate"></header>
    </field>


    <field name="ma_so_thue" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã số thuế" e="PIT Code"></header>
    </field>
    <field name="trinh_do_cm" width="150" allowSorting="true" allowFilter="true">
      <header v="Trình độ" e="Qualifications"></header>
    </field>
    <field name="bac_ky_nang" width="150" allowSorting="true" allowFilter="true">
      <header v="Bậc kỹ năng" e="Job Grade"></header>
    </field>

    <field name="loai_hdld" width="150" allowSorting="true" allowFilter="true">
      <header v="Loại hợp đồng" e="Type of Labor Contract"></header>
    </field>
    <field name="ngay_lv" type="DateTime" dataFormatString="@datetimeFormat" width ="100" allowSorting="true" allowFilter="true">
      <header v="Ngày làm việc" e="Join Date"></header>
    </field>

    <field name="tham_gia_bh" width="80" allowSorting="true" allowFilter="true" align="Center">
      <header v="BH" e="SI"></header>
    </field>
    <field name="ngay_tg" type="DateTime" dataFormatString="@datetimeFormat" width ="100" allowSorting="true" allowFilter="true">
      <header v="Ngày tham gia" e="SI Joining Date"></header>
    </field>
    <field name="muc_luong" type="Decimal" width="100" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Mức lương" e="Current Salary"></header>
      <items style="Numeric"></items>
    </field>

    <field name="nang_bac_luong" width="150" allowSorting="true" allowFilter="true">
      <header v="Nâng bậc/lương" e="Grade/Salary Approving"></header>
    </field>

  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma_nv"/>
      <field name="ho_ten_nv"/>
      <field name="vi_tri"/>
      <field name="gioi_tinh"/>
      <field name="ngay_sinh"/>


      <field name="ma_so_thue"/>
      <field name="trinh_do_cm"/>
      <field name="bac_ky_nang"/>
      <field name="loai_hdld"/>
      <field name="ngay_lv"/>
      <field name="tham_gia_bh"/>
      <field name="ngay_tg"/>
      <field name="muc_luong"/>
      <field name="nang_bac_luong"/>


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