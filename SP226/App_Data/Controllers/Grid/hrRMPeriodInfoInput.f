<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY CommandWhenWhenVoucherBeforeInit SYSTEM "..\Include\Command\WhenVoucherBeforeInit.txt">
  <!ENTITY CommandWhenWhenVoucherBeforeAddNew SYSTEM "..\Include\Command\WhenVoucherBeforeAddNew.txt">
  <!ENTITY CommandWhenWhenVoucherAfterInit SYSTEM "..\Include\Command\WhenVoucherAfterInit.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="hrrmdot" code="stt_rec" order="ngay_ct, ma_dot" type="Voucher" id="H11" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật thông tin đợt tuyển dụng" e="Recruitment Period Information Input"></title>
  <subTitle v="Cập nhật thông tin đợt tuyển dụng: thêm, sửa, xóa..." e="Add, Edit, Delete Recruitment Period Information..."></subTitle>
  <partition table="hrirmdot" prime="hrrmdot" inquiry="hrirmdot" field="ngay_ct" expression="''" increase="{0}" default=""/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" width="100" allowFilter="&GridVoucherAllowFilter;">
      <header v="Đơn vị" e="Unit"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_dot" width="100" allowFilter="&GridVoucherAllowFilter;">
      <header v="Mã đợt" e="Period Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_dot%l" width="300" allowFilter="&GridVoucherAllowFilter;">
      <header v="Tên đợt" e="Description"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="&GridVoucherAllowFilter;">
      <header v="Từ ngày" e="From Date"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="&GridVoucherAllowFilter;">
      <header v="Đến ngày" e="To Date"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ma_dvcs"/>
      <field name="ma_dot"/>
      <field name="ten_dot%l"/>
      <field name="ngay_tu"/>
      <field name="ngay_den"/>
      <field name="ngay_ct"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvnQ6JIJ0DAjKFJBEciny6nyPlg0SF3ebKV/Rw5yHd76r+WvLuzzAXb9Htyv7DfX/2bRyBU14n6bRIRrbe7U2LW5zWGPGSpg6JyePV8I+z6liF5EYpDYSGyzt5nje+PaITbztq3ciBVtCOd9bj84gNRzO7bi/jzHbAXgRHDUFor9S/h0ndfX7BjmWQaXPcgZiMYjYMjfYYaejrG+o1QdqoiAwokE5Xa3gzfYuDOeeoieRp2QmbwZNiKYDz8UZkbc9WQ=</Encrypted>]]>
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

    <button command="Clone">
      <title v="Toolbar.Copy" e="Toolbar.Copy"></title>
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

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&Er6kBCOukK5FxLFOw1tnB8I/3UF6nW9jF2yNn7MDyVTRbbW3G47hr2UL+B7ULcAqbdE0VpLI/lpK01kvP7GRGxkDatAeO4oVLuLDDs1RSDo46j7V1vpCTIZEe/Na7B+vNyDaQ2wgEIdcQdlW7Fnbz2RifMt3YhehDmKvnozGsFmbQIbAJWWjuFMlWAwA/CBD+z0E6fUO1zQ2ZI4RZ4MC+79Q5eKkdxv6WO2uCbeDjj8=</Encrypted>]]>
      </text>
    </query>

    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&Er6kBCOukK5FxLFOw1tnB8I/3UF6nW9jF2yNn7MDyVRjiBWiUg+ltOeBPHbKQlX691BLmrDXVFyTL5YwjVZd0fCKmdbWSQOzlMDfnQzK0IpFUjRj3A9aLnVMSzNpGfoUz5Z5ns0zdVZURzGAVPOt4eAmvqccCrNRpu4fRtGToJe1v8tfLhynFb6qR1kOBTIurkhPSfa9MiJA1dH4dqTq+EYOqaA7MFDdxgNNYMZDm63UbmsSW+PkO4SIwWXdImcVpkTbTq2fARhuQgBLzNTgWG0VvGnavCnDP/hYqfEigbkW7+Jq4wNvKrXjYXZo5B9C45ZuH7Qufxwb4FlFG23zdvSdrQMSoYf3JRMVlZnV9vo=</Encrypted>]]>
      </text>
    </query>
  </queries>
</grid>