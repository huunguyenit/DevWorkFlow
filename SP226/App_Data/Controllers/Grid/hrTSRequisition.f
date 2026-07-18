<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY CommandWhenWhenVoucherBeforeInit SYSTEM "..\Include\Command\WhenVoucherBeforeInit.txt">
  <!ENTITY CommandWhenWhenVoucherBeforeAddNew SYSTEM "..\Include\Command\WhenVoucherBeforeAddNew.txt">
  <!ENTITY CommandWhenWhenVoucherAfterInit SYSTEM "..\Include\Command\WhenVoucherAfterInit.txt">
  <!ENTITY XMLStandardVoucherToolbar SYSTEM "..\Include\XML\ExternalVoucherToolbar.xml">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="hrccyccp" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="H13" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Phiếu yêu cầu cấp phát công cụ, dụng cụ" e="Tool &#38; Supply Requisition"></title>
  <subTitle v="Cập nhật phiếu yêu cầu: thêm, sửa, xóa..." e="Add, Edit, Delete Voucher..."></subTitle>
  <partition table="hriccyccp" prime="hrccyccp" inquiry="hriccyccp" field="ngay_ct" expression="''" increase="{0}" default=""/>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" width="100" aliasName="a" allowFilter="&GridVoucherAllowFilter;">
      <header v="Đơn vị" e="Unit"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="&GridVoucherAllowFilter;">
      <header v="Ngày yêu cầu" e="Date"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="so_ct" width="100" align="right" allowFilter="&GridVoucherAllowFilter;">
      <header v="Số yêu cầu" e="Number"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_bp" width="0" hidden="true" aliasName="a" allowFilter="&GridVoucherAllowFilter;">
      <header v="" e=""></header>
    </field>
    <field name="ten_bp%l" width="300" external="true" aliasName="b" allowFilter="&GridVoucherAllowFilter;">
      <header v="Bộ phận" e="Department"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="dien_giai" width="300" allowFilter="&GridVoucherAllowFilter;">
      <header v="Nội dung" e="Content"></header>
      <query>&InsertCommandFilter;</query>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ma_dvcs"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>
      <field name="ma_bp"/>
      <field name="ten_bp%l"/>
      <field name="dien_giai"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CommandWhenWhenVoucherBeforeInit;
        &CommandWhenWhenVoucherBeforeAddNew;
        &CommandWhenWhenVoucherAfterInit;
      </text>
    </command>
  </commands>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&Er6kBCOukK5FxLFOw1tnB8I/3UF6nW9jF2yNn7MDyVTRbbW3G47hr2UL+B7ULcAqbdE0VpLI/lpK01kvP7GRGxkDatAeO4oVLuLDDs1RSDo46j7V1vpCTIZEe/Na7B+vNyDaQ2wgEIdcQdlW7Fnbzz2kbO0NB/9lfV5j4QQ+7UT7BosDdGG06Lu0qt5LDgArhJZLpHqet+ZEwa2Jix4zuqpxoskgMLVi/9lm5hkKOrixUeZR1HhSHoOHgcAd1Nt9trA2fH9ekMbTuU8qPYV1fBWgd762I2Q+vmEJc90sem4=</Encrypted>]]>
      </text>
    </query>

    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&Er6kBCOukK5FxLFOw1tnB8I/3UF6nW9jF2yNn7MDyVRjiBWiUg+ltOeBPHbKQlX691BLmrDXVFyTL5YwjVZd0fCKmdbWSQOzlMDfnQzK0IpFUjRj3A9aLnVMSzNpGfoUz5Z5ns0zdVZURzGAVPOt4eAmvqccCrNRpu4fRtGToJe1v8tfLhynFb6qR1kOBTIurkhPSfa9MiJA1dH4dqTq+EYOqaA7MFDdxgNNYMZDm613ZZPoLu9+QD1kEJfHz+n/VYGfOa1jHFa17IJC64Y/HUWRi0AUNlfKunGznPBNzxVOVZxZmxn3U+NDweQr0jwKjru0kLQIsnIg6aguIZ73kbeNotXPh0nCG+ijqsEHnNdujpQvtXnuB5xAv5vwb/7qcjORV37qk7WkBtB6eMdAlQ==</Encrypted>]]>
      </text>
    </query>
  </queries>

  &XMLStandardVoucherToolbar;
</grid>