<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY CommandWhenVoucherBeforeInit SYSTEM "..\Include\Command\WhenVoucherBeforeInit.txt">
  <!ENTITY CommandWhenVoucherAfterInit SYSTEM "..\Include\Command\WhenVoucherAfterInit.txt">
  <!ENTITY XMLStandardVoucherToolbar SYSTEM "..\Include\XML\ExternalVoucherToolbar.xml">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="hrdtkq" code="stt_rec" order="ngay_ct, ma_khoa" type="Voucher" id="H09" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật kết quả khóa học" e="Training Course Result"></title>
  <subTitle v="Cập nhật kết quả khóa học: thêm, sửa, xóa..." e="Add, Edit, Delete Training Course Result..."></subTitle>
  <partition table="hridtkq" prime="hrdtkq" inquiry="hridtkq" field="ngay_ct" expression="''" increase="{0}" default=""/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" width="100" aliasName="a" allowFilter="&GridVoucherAllowFilter;">
      <header v="Đơn vị" e="Unit"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="100" aliasName="a" allowFilter="&GridVoucherAllowFilter;">
      <header v="Ngày" e="Date"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_khoa" width="100" aliasName="a" allowFilter="&GridVoucherAllowFilter;">
      <header v="Mã khóa học" e="Course Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_khoa%l" external="true" width="300" aliasName="b" allowFilter="&GridVoucherAllowFilter;">
      <header v="Tên khóa học" e="Course Name"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ngay_hoc1" external="true" type="DateTime" dataFormatString="@datetimeFormat" width="100" aliasName="b" allowFilter="&GridVoucherAllowFilter;">
      <header v="Từ ngày" e="From Date"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ngay_hoc2" external="true" type="DateTime" dataFormatString="@datetimeFormat" width="100" aliasName="b" allowFilter="&GridVoucherAllowFilter;">
      <header v="Đến ngày" e="To Date"></header>
      <query>&InsertCommandFilter;</query>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ma_dvcs"/>
      <field name="ngay_ct"/>
      <field name="ma_khoa"/>
      <field name="ten_khoa%l"/>
      <field name="ngay_hoc1"/>
      <field name="ngay_hoc2"/>
    </view>
  </views>

  &XMLStandardVoucherToolbar;

  <commands>
    <command event="Loading">
      <text>
        &CommandWhenVoucherBeforeInit;
        &CommandWhenVoucherAfterInit;
      </text>
    </command>
  </commands>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&Er6kBCOukK5FxLFOw1tnB8I/3UF6nW9jF2yNn7MDyVTRbbW3G47hr2UL+B7ULcAqbdE0VpLI/lpK01kvP7GRGxkDatAeO4oVLuLDDs1RSDo46j7V1vpCTIZEe/Na7B+vNyDaQ2wgEIdcQdlW7Fnbz+SlfQFHi/qP4kwLxqDnJIqEy7tm+f+bTRYQaHjrMO9jkbOo30ED+1dl3BPICcpOW9LkAEolvp5Ix8CRH7+dTBBtCf/Ya0WEqFxyhewFznHAdTdnblSDTyEtUk+IiPzdyOQOKVQCr5WQUNKdLXEG6hBCqU7Ix6iJaQzgMLqeUlPVQwzBcbBTBw7VNVjw0XQ+Yg==</Encrypted>]]>
      </text>
    </query>

    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&Er6kBCOukK5FxLFOw1tnB8I/3UF6nW9jF2yNn7MDyVRjiBWiUg+ltOeBPHbKQlX691BLmrDXVFyTL5YwjVZd0fCKmdbWSQOzlMDfnQzK0IpFUjRj3A9aLnVMSzNpGfoUz5Z5ns0zdVZURzGAVPOt4eAmvqccCrNRpu4fRtGToJe1v8tfLhynFb6qR1kOBTIurkhPSfa9MiJA1dH4dqTq+EYOqaA7MFDdxgNNYMZDm61XDnb9bLYLD3vyQrAR2ODUMUX9I2ZjV81BYE1gNh4rpod+HvFBAHWJ/eJa/DlkXRRc/9P8UmZisrUI0YwiOEfQiP0k6SdQOsdMKQRoA+aQA1pzFN/VkfjvdmQ/6mz3jORHF/UKIAvYqs7tulzL0kkap6GIVB6NRqPwqEM6ZqO993o90Zylyos9pbGiIhjiWA2h/ricBlyD2qYTPfs6e9Cx</Encrypted>]]>
      </text>
    </query>
  </queries>
</grid>