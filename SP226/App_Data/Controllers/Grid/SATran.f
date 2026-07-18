<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY CommandWhenVoucherBeforeAddNew SYSTEM "..\Include\Command\WhenVoucherBeforeAddNew.txt">
  <!ENTITY CommandWhenVoucherAfterInit SYSTEM "..\Include\Command\WhenVoucherAfterInit.txt">
  <!ENTITY XMLStandardVoucherToolbar SYSTEM "..\Include\XML\StandardVoucherToolbar.xml">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="m93$000000" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="PD5" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Chọn nhà cung cấp" e="Supplier Allocation"></title>
  <subTitle v="Cập nhật chọn nhà cung cấp: thêm, sửa, xóa..." e="Add New, Edit, Delete Allocation..."></subTitle>
  <partition table="c93$000000" prime="m93$" inquiry="i93$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" width="100" allowFilter="&GridVoucherAllowFilter;">
      <header v="Đơn vị" e="Unit"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="&GridVoucherAllowFilter;">
      <header v="Ngày" e="Date"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="so_ct" width="100" align="right" allowFilter="&GridVoucherAllowFilter;">
      <header v="Số" e="Number"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ong_ba" width="100" allowFilter="&GridVoucherAllowFilter;">
      <header v="Người yêu cầu" e="Requester"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="dien_giai" width="300" allowFilter="&GridVoucherAllowFilter;">
      <header v="Diễn giải" e="Description"></header>
      <query>&InsertCommandFilter;</query>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ma_dvcs"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>
      <field name="ong_ba"/>
      <field name="dien_giai"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvnf6A6VZl49REtA7Yr9/6LXw4VoHqjyKOcg/iKhBfHkW3lj3iIwUnYbV0XRgmn/af7jagCJNoT7G1OLYdptROf+V9nmje22irqHb+Mb0MQEt7/O2hcMfUkz7bh+SfW0DjehqYdNpcVMNVAnulkwF+RJqQS6Jt4XSpVhDOwePVSpLF2g5SgA69711A81FqRXcin1R7+sXUICv1tW9Tr02WdXSK4COIxo2JX56VGTy+4a0zU/WkRmtjRlgjijwsq0jK72/xAFGQJPmuHcXuZDVL4T</Encrypted>]]>
        &CommandWhenVoucherBeforeAddNew;
        &CommandWhenVoucherAfterInit;
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
    <button command="Print">
      <title v="Toolbar.Print" e="Toolbar.Print"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&Er6kBCOukK5FxLFOw1tnB8I/3UF6nW9jF2yNn7MDyVTRbbW3G47hr2UL+B7ULcAqbdE0VpLI/lpK01kvP7GRGxkDatAeO4oVLuLDDs1RSDo46j7V1vpCTIZEe/Na7B+vNyDaQ2wgEIdcQdlW7Fnbz2RifMt3YhehDmKvnozGsFmbQIbAJWWjuFMlWAwA/CBDQZdL9yrEhDiRSFFo1MwlMurZFSbKPHrhbPNOySzRQkn+6tWodJgRx0RB2zoGe/Qo</Encrypted>]]>
      </text>
    </query>

    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&Er6kBCOukK5FxLFOw1tnB8I/3UF6nW9jF2yNn7MDyVRjiBWiUg+ltOeBPHbKQlX691BLmrDXVFyTL5YwjVZd0fCKmdbWSQOzlMDfnQzK0IpFUjRj3A9aLnVMSzNpGfoUz5Z5ns0zdVZURzGAVPOt4eAmvqccCrNRpu4fRtGToJe1v8tfLhynFb6qR1kOBTIurkhPSfa9MiJA1dH4dqTq+EYOqaA7MFDdxgNNYMZDm628KH0/KRIIBawoHp45V2lu8aTVBrFVrLC2mabpk4h+bScUciNrV3dT7D9ki3ubePerBHKJP9qrNsgfQ5dDXCQnCOr91sHBfiZOMbOxdXhc4knLJZ3kDmL95CX2y/bMaoA5uVcMQ5YanjRiU+ZRkXnA</Encrypted>]]>
      </text>
    </query>
  </queries>

</grid>