<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY CommandWhenVoucherBeforeInit SYSTEM "..\Include\Command\WhenVoucherBeforeInit.txt">
  <!ENTITY CommandWhenVoucherBeforeAddNew SYSTEM "..\Include\Command\WhenVoucherBeforeAddNew.txt">
  <!ENTITY CommandWhenVoucherAfterInit SYSTEM "..\Include\Command\WhenVoucherAfterInit.txt">
  <!ENTITY XMLStandardVoucherToolbar SYSTEM "..\Include\XML\ExternalVoucherToolbar.xml">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="m07$000000" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="CN2" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật phát sinh theo biểu thuế toàn phần" e="Income by the Flat Rate Tariff"></title>
  <subTitle v="Cập nhật chứng từ: thêm, sửa, xóa..." e="Add, Edit, Delete Voucher..."></subTitle>
  <partition table="c07$000000" prime="m07$" inquiry="i07$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
    <field name="ma_tn" width="100" aliasName="a" allowFilter="&GridVoucherAllowFilter;">
      <header v="Mã chỉ tiêu" e="Pattern Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_tn%l" width="300" external="true" aliasName="b" allowFilter="&GridVoucherAllowFilter;">
      <header v="Tên chỉ tiêu" e="Description"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="t_tn_ct_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowFilter="&GridVoucherAllowFilter;" aggregate="Sum">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_nt" width="100" aliasName="a" allowFilter="&GridVoucherAllowFilter;">
      <header v="Mã nt" e="Currency Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ma_dvcs"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>
      <field name="ma_tn"/>
      <field name="ten_tn%l"/>
      <field name="t_tn_ct_nt"/>
      <field name="ma_nt"/>
    </view>
  </views>

  &XMLStandardVoucherToolbar;

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
        <![CDATA[<Encrypted>&Er6kBCOukK5FxLFOw1tnB8I/3UF6nW9jF2yNn7MDyVTRbbW3G47hr2UL+B7ULcAqbdE0VpLI/lpK01kvP7GRGxkDatAeO4oVLuLDDs1RSDo46j7V1vpCTIZEe/Na7B+vNyDaQ2wgEIdcQdlW7Fnbz+SlfQFHi/qP4kwLxqDnJIpeY3/Ez45scidNjlsNgI2QY7FcFw/+vqx5neeFJWelFZ0SwE8X5BV54mDvjazyWBGY5agbuIZRZFs2PZqCBg88JOhmgbiogfH/NeiNJ02mM9TqcX9ACbdAyqERg8W8+r8=</Encrypted>]]>
      </text>
    </query>

    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&Er6kBCOukK5FxLFOw1tnB8I/3UF6nW9jF2yNn7MDyVRjiBWiUg+ltOeBPHbKQlX691BLmrDXVFyTL5YwjVZd0fCKmdbWSQOzlMDfnQzK0IpFUjRj3A9aLnVMSzNpGfoUz5Z5ns0zdVZURzGAVPOt4eAmvqccCrNRpu4fRtGToJe1v8tfLhynFb6qR1kOBTIurkhPSfa9MiJA1dH4dqTq+EYOqaA7MFDdxgNNYMZDm61XDnb9bLYLD3vyQrAR2ODURib7LvKkh4mFvNyI/juoskxDaKCa+OyVGqDrdkxgBB3mUCqRP3EM4PgiGN9M6KXDQPV4MAlXk5IwmEcOst62+nVp9AhoehVdYnVtyUO9poYAKHLr3p0FJXVCvTCb/Cz8aMQMhunnuZbNxUN17CiG8hyykSjK3nFLQZLIYeEgyuc=</Encrypted>]]>
      </text>
    </query>
  </queries>
</grid>