<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessSite "@@0">
  <!ENTITY SiteRight "exec FastBusiness$System$GetGridFilter 'ma_dvcs', 'ma_kho', '', '', @@userID, @@admin">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vkkdc" code="stt_rec, ma_kho, ma_vi_tri, ma_vt, dvt, ma_lo" order="ma_kho, ma_vi_tri, ma_vt, dvt, ma_lo" filter="&FilterCheckAccessSite;" initialize="&SiteRight;"  xmlns="urn:schemas-fast-com:data-grid">
  <title v="Điều chỉnh số liệu" e="Stocktaking Adjustment"></title>
  <subTitle v="Số yêu cầu: %s..." e="Voucher No.: %s..."></subTitle>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_kho" isPrimaryKey="true" width="100" dataFormatString="@upperCaseFormat" allowFilter="true">
      <header v="Mã kho" e="Site"></header>
    </field>
    <field name="ma_vi_tri" isPrimaryKey="true" width="100" dataFormatString="@upperCaseFormat" allowFilter="true">
      <header v="Mã vị trí" e="Location"></header>
    </field>
    <field name="ma_vt" isPrimaryKey="true" dataFormatString="@upperCaseFormat" width="100" allowFilter="true">
      <header v="Mã vật tư" e="Item"></header>
    </field>
    <field name="ten_vt%l" width="300" allowFilter="true">
      <header v="Tên vật tư" e="Description"></header>
    </field>
    <field name="dvt" isPrimaryKey="true" width="50" allowFilter="true">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="ma_lo" isPrimaryKey="true" width="100" dataFormatString="@upperCaseFormat" allowFilter="true">
      <header v="Mã lô" e="Lot"></header>
    </field>

    <field name="so_luong" type="Decimal" dataFormatString="@quantityViewFormat" clientDefault="0" width="100" allowFilter="&GridListAllowFilter.Number;">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ma_kho"/>
      <field name="ma_vi_tri"/>
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>
      <field name="ma_lo"/>
      <field name="so_luong"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22alPjDnV4JapQMqYNEp52dUsFiuBX/iYGBOeR/lqE321hTMnQ3rF0X8jNlGSJdBqqBSOkhTUi4RRejGWS+0B5PD7mI6KzVs7D1m2u2o0iJqFf9RfCOvQ96fHa+DESbfpHdA9oM4A+SXwBQV1V4iGNAyjZdEg0Zw8HHaygmXCj4APMsS+7TaKVPWqBLtkA/OLeFpTLGCG4f3TeJvCOhECQfuXX37hzQGG1/D+0LVR6rGnun2Jhj8eL8enxAodHGHQdQ==</Encrypted>]]>
      </text>
    </command>
  </commands>

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
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>