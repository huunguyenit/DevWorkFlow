<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vctkieuduyet" code="loai_duyet, ma_kieu, dvcs, ma_bp, ma_md, nh_kh1, nh_kh2, nh_kh3, ma_nt, tien_tu" order="loai_duyet, ma_kieu, dvcs, ma_bp, ma_md, nh_kh1, nh_kh2, nh_kh3, ma_nt, tien_tu" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo kiểu duyệt" e="Approval Category Detail"></title>
  <subTitle v="Loại duyệt: %c, kiểu duyệt: %m..." e="Type: %c, Approval Category: %m..."></subTitle>

  <fields>
    <field name="loai_duyet" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kieu" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="dvcs" isPrimaryKey="true" width="100" allowFilter="true" allowSorting="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ten_dvcs%l" width="300" allowFilter="true" allowSorting="true">
      <header v="Tên đơn vị" e="Unit Name"></header>
    </field>
    <field name="ma_bp" isPrimaryKey="true" width="100" allowFilter="true" allowSorting="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="ten_bp%l" width="300" allowFilter="true" allowSorting="true">
      <header v="Tên bộ phận" e="Department Name"></header>
    </field>
    <field name="ma_md" isPrimaryKey="true" width="100" allowFilter="true" allowSorting="true">
      <header v="Mức độ" e="Priority"></header>
    </field>
    <field name="ten_md%l" width="300" allowFilter="true" allowSorting="true">
      <header v="Tên mức độ" e="Priority Name"></header>
    </field>

    <field name="nh_kh1" isPrimaryKey="true" width="100" allowFilter="true" allowSorting="true">
      <header v="Nhóm khách hàng 1" e="Customer Group 1"></header>
    </field>
    <field name="ten_nh1%l" width="300" allowFilter="true" allowSorting="true">
      <header v="Tên nhóm khách hàng 1" e="Customer Group Name 1"></header>
    </field>
    <field name="nh_kh2" isPrimaryKey="true" width="100" allowFilter="true" allowSorting="true">
      <header v="Nhóm khách hàng 2" e="Customer Group 2"></header>
    </field>
    <field name="ten_nh2%l" width="300" allowFilter="true" allowSorting="true">
      <header v="Tên nhóm khách hàng 2" e="Customer Group Name 2"></header>
    </field>
    <field name="nh_kh3" isPrimaryKey="true" width="100" allowFilter="true" allowSorting="true">
      <header v="Nhóm khách hàng 3" e="Customer Group 3"></header>
    </field>
    <field name="ten_nh3%l" width="300" allowFilter="true" allowSorting="true">
      <header v="Tên nhóm khách hàng 3" e="Customer Group Name 3"></header>
    </field>

    <field name="tien_tu" isPrimaryKey="true" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Giá trị từ" e="Amount from"></header>
    </field>
    <field name="tien_den" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Đến" e="To"></header>
    </field>
    <field name="ma_nt" isPrimaryKey="true" width="100" allowFilter="true" allowSorting="true">
      <header v="Mã nt" e="Currency"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="loai_duyet"/>
      <field name="ma_kieu"/>
      <field name="dvcs"/>
      <field name="ten_dvcs%l"/>
      <field name="ma_bp"/>
      <field name="ten_bp%l"/>
      <field name="ma_md"/>
      <field name="ten_md%l"/>
      <field name="nh_kh1"/>
      <field name="ten_nh1%l"/>
      <field name="nh_kh2"/>
      <field name="ten_nh2%l"/>
      <field name="nh_kh3"/>
      <field name="ten_nh3%l"/>
      <field name="tien_tu"/>
      <field name="tien_den"/>
      <field name="ma_nt"/>
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