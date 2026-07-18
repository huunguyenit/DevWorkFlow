<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY CommandWhenWhenVoucherBeforeInit SYSTEM "..\Include\Command\WhenVoucherBeforeInit.txt">
  <!ENTITY CommandWhenWhenVoucherBeforeAddNew SYSTEM "..\Include\Command\WhenVoucherBeforeAddNew.txt">
  <!ENTITY CommandWhenWhenVoucherAfterInit SYSTEM "..\Include\Command\WhenVoucherAfterInit.txt">
  <!ENTITY XMLStandardVoucherToolbar SYSTEM "..\Include\XML\ExternalVoucherToolbar.xml">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="m04$000000" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="L04" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật số lượng sản phẩm theo bộ phận" e="Department Product Quantity Input"></title>
  <subTitle v="Cập nhật số lượng sản phẩm theo bộ phận: thêm, sửa, xóa..." e="Add, Edit, Delete Voucher..."></subTitle>
  <partition table="c04$000000" prime="m04$" inquiry="i04$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" width="100" allowFilter="&GridVoucherAllowFilter;" aliasName="a">
      <header v="Đơn vị" e="Unit"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="&GridVoucherAllowFilter;" aliasName="a">
      <header v="Ngày" e="Date"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="so_ct" width="100" align="right" allowFilter="&GridVoucherAllowFilter;" aliasName="a">
      <header v="Số" e="Number"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_bp" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="ten_bp%l" width="300" external="true" aliasName="b" allowFilter="&GridVoucherAllowFilter;">
      <header v="Bộ phận" e="Department"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="dien_giai" width="300" allowFilter="&GridVoucherAllowFilter;" aliasName="a">
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
        <![CDATA[<Encrypted>&sp4+hMHegg2EZffLn/pV++8ZqYxBNSB1BL2p8i0uQZb7Gr3t8L5nPvkC8WUs5G4hZi4Aa77liTbAGycjTlM1c7OPofTC1DWKT5fyDHYfhttYdk0J9UTnAYH+3ZlD87WA1R6ULH6y8jnll1XjBkkZNZqGuM8uH3PuklfLxSPC39SONFn+lO8hP+OlN+URvMiMxVMJsGHebksFz/HRBqJLl6OwZMXEl4oU4nCyV5s+lq3KyQCKXvIwA+Lomn27Bo99T223ufV50uffYYRJZHPkO8uVXQ40xUv+iKq36CW0RYVp6aCFtGChb/CPB8qXlDtqil21irRbhR/6bfRDR85BauiNkuyxJLhn8kcVzFZwBvUcQRYPrQFkuuZVQxIYyoWNe2phag7YuZxHTETc1GIkzBjJMVD9alu6KV5AHEPOhq+KXJgvH8hg8W+eHnOyxa40</Encrypted>]]>
      </text>
    </query>

    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&sp4+hMHegg2EZffLn/pV+7n2ujJawtwavLudUME/X3+IThELEGtveSZcVdE52Go2bWG4dv2b8nVCSyFRsA7CIcvMprrvW0bxoPDsyPFO2FlXZu4ZI6Vz804UIR1hMS+ux75Z2RRh2XsiUbG7QO/fRHYMUIDhCbFN9WjePQRWH8sKTAxHmOnsDZiCXskiKK8U/YM8DCRY2pkgqD86kKTd513+yjnGz2f7lFhbTY2bigOXt19XgwhW3uDANuVAzGD8zOeZRMuYM4OPKNde15uegrvWNlsee35u0CStUrI4Jn0vIXTrtwUzmBt+sXgbGF/Zwn0xvg/B7zUTBlaiTBbnGOrIEiO2IqPFMFKee6ncwoctjrOLAutKvYB6s9ww106EHO9snjnqulay1Ktx5AYcT78psox4cYwGBIzcCQcrABjOlgd2itzT3Aent8ngaB9mLt+e83OwY/gg0VOdmPGKnJDvyO/zXfYob9kRsqQdkb0SU7qiIrlOFA9d3tyzel5eyYWJNVMV0Bb41/mQYEj4Yw==</Encrypted>]]>
      </text>
    </query>
  </queries>

  &XMLStandardVoucherToolbar;
</grid>