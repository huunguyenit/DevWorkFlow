<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY CommandWhenVoucherBeforeInit SYSTEM "..\Include\Command\WhenVoucherBeforeInit.txt">
  <!ENTITY CommandWhenVoucherAfterInit SYSTEM "..\Include\Command\WhenVoucherAfterInit.txt">
  <!ENTITY CommandWhenVoucherBeforeAddNew SYSTEM "..\Include\Command\WhenVoucherBeforeAddNew.txt">
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="m43$000000" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="PT0" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Phân bổ thu tiền cho các hóa đơn" e="Cash Receipt Allocation to Invoices"></title>
  <subTitle v="Cập nhật phân bổ: thêm, sửa, xóa..." e="New, Edit, Delete Cash Receipt Allocation..."></subTitle>
  <partition table="c43$000000" prime="m43$" inquiry="i43$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
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
    <field name="ma_kh" width="100" aliasName="a" allowFilter="&GridVoucherAllowFilter;">
      <header v="Mã khách" e="Customer ID"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_kh%l" width="300" external="true" aliasName="b" allowFilter="&GridVoucherAllowFilter;">
      <header v="Tên khách" e="Customer Name"></header>
      <query>&InsertCommandFilter;</query>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ma_dvcs"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>
      <field name="ma_kh"/>
      <field name="ten_kh%l"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CommandWhenVoucherBeforeInit;
        &CommandWhenVoucherBeforeAddNew;
        &CommandWhenVoucherAfterInit;
      </text>
    </command>
  </commands>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&Er6kBCOukK5FxLFOw1tnB8I/3UF6nW9jF2yNn7MDyVTRbbW3G47hr2UL+B7ULcAqbdE0VpLI/lpK01kvP7GRGxkDatAeO4oVLuLDDs1RSDo46j7V1vpCTIZEe/Na7B+vNyDaQ2wgEIdcQdlW7Fnbz+SlfQFHi/qP4kwLxqDnJIrIEuOmSbmiomvj63vhBgT5aBtgdl2xl7+PBnmNVcCN+zRK0sHzn1BmigUWPGjYxpRtD3ZWP+SmNWzYiIsLJGJI1QTq3km0i+fRoyBLp2Uo+wBjQfo4Dt8PXyhEjzXT3RM=</Encrypted>]]>
      </text>
    </query>
    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>
    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&sp4+hMHegg2EZffLn/pV+zuRft05Vw3NGwzF3dpkmDLcT8VOGUkbNSCIf83ow1cuoyEVoCcxz4ayeFYXpmeqGRnm4R5VZSMp7Hea9qlzvaSCqY4UTeBX7C1tGUww0VtTkHAJPjmKGQ1THD/fNgSvfH0RxvZTetDqUB9SEbyA1BVyW/Zqp49m+GWASoBrsfhxcy3YTDLu9XStebnKYxRYO61rKIBZ9kVHqhgnO3nwkAOlRiu/HMeZlrjZORlbDFbxHVDhtEcNc3X4Tkqrn6/Ajkhc63wQOhBXgMJmOLM/B/FglKZSK3DYkXwAe8IAyJqgG/Hat2e4Z7pE1TEbZQGBchf0bE2wUZoKlynKqq6V+H9Ev1KRVubNvRa5BU5EY37B3X+pbJV0+aI63DVkLaXoq7KWI+d3jhlEUs8QLd+zU0/DmNvLaxxUSE9Wj2jrKo5ioACA3FyJqgvFbaAHVwgwzWY9IfyFHte/d8l9TzQ7/q8SvQ7QI2YoJHSBlP3vsc3LZBv3LQhetQrpgXoANOL0Jy1TIoZLIb/78VCQeHXXQLE=</Encrypted>]]>
      </text>
    </query>
  </queries>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2zttHYXeyJnRlMt9ciQNRih2gD3TqubwgqMQ1FYqJwt9I/WeaygPRosJwicqKklu6R0tAyQCC1BdhXcm9ocUXw=</Encrypted>]]>
    </text>
  </css>

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
</grid>