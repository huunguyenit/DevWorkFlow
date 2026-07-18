<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid table="vgndmduyetlai" code="user_id4, u_status, loai_duyet" order="user_id4, u_status, loai_duyet" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo trạng thái cho phép duyệt lại" e="Reapproval Status Assignment"></title>
  <subTitle v="Chức năng: %c." e="Function: %c."></subTitle>

  <fields>
    <field name="user_id4" isPrimaryKey="true" type="Decimal" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="name" width="100" allowFilter="true" allowSorting="true">
      <header v="Người sử dụng" e="User"></header>
    </field>
    <field name="comment%l" width="300" allowFilter="true" allowSorting="true">
      <header v="Tên đầy đủ" e="Full Name"></header>
    </field>
    <field name="loai_duyet" isPrimaryKey="true" hidden="true" width="0">
      <header v="Loại" e="Type"></header>
    </field>
    <field name="u_status" isPrimaryKey="true" width="100" allowFilter="true" allowSorting="true">
      <header v="Trạng thái" e="Status"></header>
    </field>
    <field name="u_status_name%l" width="300" allowFilter="true" allowSorting="true">
      <header v="Tên trạng thái" e="Status Name"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="u_status"/>
      <field name="u_status_name%l"/>
      <field name="user_id4"/>
      <field name="name"/>
      <field name="comment%l"/>
      <field name="loai_duyet"/>
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