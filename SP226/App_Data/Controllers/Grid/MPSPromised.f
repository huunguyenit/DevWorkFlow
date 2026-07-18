<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessSite "@@0">
  <!ENTITY SiteRight "exec FastBusiness$System$GetGridFilter 'ma_dvcs', 'ma_kho', '', '', @@userID, @@admin">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vmpdh" code="ma_vt, ma_kho, ma_kh, ngay_yc" order="ma_vt, ma_kho, ma_kh, ngay_yc" filter="&FilterCheckAccessSite;" initialize="&SiteRight;" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Cập nhật đơn hàng dự kiến" e="Promised"></title>
  <subTitle v="Cập nhật đơn hàng dự kiến: thêm, sửa, xóa..." e="Add, Edit, Delete Promised..."></subTitle>

  <fields>
    <field name="ma_vt" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã vật tư" e="Item Code"></header>
    </field>
    <field name="ten_vt%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên vật tư" e="Item Name"></header>
    </field>
    <field name="ma_kho" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã kho" e="Site"></header>
    </field>
    <field name="ma_kh" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã khách" e="Customer"></header>
    </field>
    <field name="ten_kh%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên khách hàng" e="Customer Name"></header>
    </field>
    <field name="ngay_yc" isPrimaryKey="true" type="DateTime" width="100" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày yêu cầu" e="Require Date"></header>
    </field>
    <field name="sl_dh" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" aggregate="Sum" allowFilter="&GridListAllowFilter.Number;">
      <header v="Số lượng" e="Quantity"></header>
    </field>
    <field name="dvt" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Đvt" e="UOM"></header>
    </field>
  </fields>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22alPjDnV4JapQMqYNEp52dUsFiuBX/iYGBOeR/lqE321hTMnQ3rF0X8jNlGSJdBqqBSOkhTUi4RRejGWS+0B5PD7mI6KzVs7D1m2u2o0iJqFf9RfCOvQ96fHa+DESbfpHdA9oM4A+SXwBQV1V4iGNAyjZdEg0Zw8HHaygmXCj4APhH3iiQO/IAPhnjr47d3rGVUzgTpy3fWgtnHQCImDVvpFsu1BeWTbWTHrsMlnEe64u/5tuBCTue12XMX/YENU3w==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <views>
    <view id="Grid">
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="ma_kho"/>
      <field name="ma_kh"/>
      <field name="ten_kh%l"/>
      <field name="ngay_yc"/>
      <field name="sl_dh"/>
      <field name="dvt"/>
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
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"/>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>