<?xml version="1.0" encoding="utf-8"?>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo kiểm tra số chứng từ" e="Voucher Number Checking Report"></title>
  <subTitle v="Kiểm tra từ ngày %d1 đến ngày %d2..." e="Checking Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="stt" width="60" type="Int16" dataFormatString="### ### ###" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_nk" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã quyển" e="Book Code"></header>
    </field>
    <field name="ten_nk" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên quyển" e="Book Name"></header>
    </field>
    <field name="ky_hieu" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã quyển" e="Series"></header>
    </field>
    <field name="ngay_ph" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowSorting="true" allowFilter="true">
      <header v="Ngày phát hành" e="Issuing Date"/>
    </field>
    <field name="ngay_hl_tu" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowSorting="true" allowFilter="true">
      <header v="Hiệu lực từ" e="Effective from"/>
    </field>
    <field name="ngay_hl_den" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowSorting="true" allowFilter="true">
      <header v="Đến" e="To"/>
    </field>
    <field name="so_ct1" width="100" allowSorting="true" allowFilter="true">
      <header v="Số bắt đầu" e="Start Number"></header>
    </field>
    <field name="so_ct2" width="100" allowSorting="true" allowFilter="true">
      <header v="Số kết thúc" e="End Number"></header>
    </field>
    <field name="so_ct0" width="100" allowSorting="true" allowFilter="true">
      <header v="Số hiện tại" e="Current Number"></header>
    </field>
    <field name="so_gd" width="200" allowSorting="true" allowFilter="true">
      <header v="Gián đoạn" e="Interruption"></header>
    </field>
    <field name="so_trung" width="200" allowSorting="true" allowFilter="true">
      <header v="Trùng" e="Duplicate"></header>
    </field>
    <field name="so_ngoai" width="200" allowSorting="true" allowFilter="true">
      <header v="Ngoài phạm vi" e="Out of Range"></header>
    </field>
    <field name="so_sai" width="200" allowSorting="true" allowFilter="true">
      <header v="Sai định dạng" e="Invalid Format"></header>
    </field>
    <field name="so_hl" width="200" allowSorting="true" allowFilter="true">
      <header v="Sai ngày hiệu lực" e="Expired"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma_nk"/>
      <field name="ten_nk"/>
      <field name="ky_hieu"/>
      <field name="ngay_ph"/>
      <field name="ngay_hl_tu"/>
      <field name="ngay_hl_den"/>
      <field name="so_ct1"/>
      <field name="so_ct2"/>
      <field name="so_ct0"/>
      <field name="so_gd"/>
      <field name="so_trung"/>
      <field name="so_ngoai"/>
      <field name="so_sai"/>
      <field name="so_hl"/>
    </view>
  </views>

  <toolbar>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
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