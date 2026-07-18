<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vdmduyet" code="user_id, loai_duyet, ngay_hl, ma_quyen, ma_bp, ma_nt" order="user_id, loai_duyet, ngay_hl, ma_quyen, ma_bp, ma_nt" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo người duyệt" e="Approving Officers List"></title>
  <subTitle v="Loại duyệt: %c." e="Type: %c."></subTitle>

  <fields>
    <field name="user_id" isPrimaryKey="true" type="Decimal" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="name" width="100" allowFilter="true" allowSorting="true">
      <header v="Người sử dụng" e="User"></header>
    </field>
    <field name="comment%l" width="300" allowFilter="true" allowSorting="true">
      <header v="Tên đầy đủ" e="Full Name"></header>
    </field>
    <field name="ma_quyen" width="100" allowFilter="true" allowSorting="true">
      <header v="Mã quyền" e="Roles Code"></header>
    </field>
    <field name="ten_quyen%l" width="300" allowFilter="true" allowSorting="true">
      <header v="Tên quyền" e="Roles Name"></header>
    </field>
    <field name="loai_duyet" isPrimaryKey="true" hidden="true" width="0">
      <header v="Loại" e="Type"></header>
    </field>
    <field name="ma_bp" isPrimaryKey="true" width="100" allowFilter="true" allowSorting="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="ten_bp%l" width="300" allowFilter="true" allowSorting="true">
      <header v="Tên bộ phận" e="Description"></header>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridListAllowFilter.Number;">
      <header v="Tiền" e="Amount"></header>
    </field>
    <field name="ma_nt" isPrimaryKey="true" width="100" allowFilter="true" allowSorting="true">
      <header v="Mã nt" e="Currency"></header>
    </field>
    <field name="ngay_hl" width="100" isPrimaryKey="true" allowSorting="true" allowFilter="true" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày hiệu lực từ" e="Effective Date from"></header>
    </field>
    <field name="ngay_hl2" width="100" allowSorting="true" allowFilter="true" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày hiệu lực đến" e="Effective Date to"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="user_id"/>
      <field name="name"/>
      <field name="comment%l"/>
      <field name="ma_quyen"/>
      <field name="ten_quyen%l"/>
      <field name="loai_duyet"/>
      <field name="ma_bp"/>
      <field name="ten_bp%l"/>
      <field name="tien_nt"/>
      <field name="ma_nt"/>
      <field name="ngay_hl"/>
      <field name="ngay_hl2"/>
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