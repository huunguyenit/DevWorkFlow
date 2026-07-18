<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY CommandWhenVoucherBeforeInit SYSTEM "..\Include\Command\WhenVoucherBeforeInit.txt">
  <!ENTITY CommandWhenVoucherAfterInit SYSTEM "..\Include\Command\WhenVoucherAfterInit.txt">
  <!ENTITY CommandWhenVoucherBeforeAddNew SYSTEM "..\Include\Command\WhenVoucherBeforeAddNew.txt">
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="m53$000000" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="PC0" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Phân bổ tiền hàng trả cho các hóa đơn" e="Cash Disbursement Allocation to Invoices"></title>
  <subTitle v="Cập nhật phân bổ: thêm, sửa, xóa..." e="New, Edit, Delete Cash Receipt Allocation..."></subTitle>
  <partition table="c53$000000" prime="m53$" inquiry="i53$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuyMz+UI0zApuPau/rNqt1omEMyKs+hUgdQB0MbpqDopMCd1T+GOKOpJbpzDyLoH/DVJM0nYeO7CItnVXpuO4RRkAUa9EAtf4N1GaJGBMWWTnQRD85S/i5awb645m58Q4nFucFHJ6/8nFrIIUt8QK6M03aqIeTLjszNgDAJl0BpJvp3CsVUxNJmQS9cjoJGWWJyIR/cZJ7HNXvby5hWn1q9wJWzYRWeDKNH9MaaLjHUGyoAbXbNYZ64Qq8ESVP2StChpZjAbirtk62vRwiHr845p0Vr+HHzWFavaXZCcpph0JospS3q8SpNZORQLm8CEbVES8KoVfFGGIG7Y0EM0FQDHbjSv4W/N+VvlbawoSnXGH9/7Bqej8d7fSFUXVw1O2PluaoHNFULlgSY3JxjdcS/+Ogquuuvg3dXf8XMuPssToEPJHnM0wwJsiDAct1+ykh2iOfSU/4/KOmGJBAyfS1EyqcUiMQ8CgkBUuoijNakK8LFdhm6tZ3IMXnmvAnbWr7sRwRU72WawQZMLnwcqiqNs=</Encrypted>]]>
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