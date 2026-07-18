<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY CommandWhenWhenVoucherBeforeInit SYSTEM "..\Include\Command\WhenVoucherBeforeInit.txt">
  <!ENTITY CommandWhenWhenVoucherBeforeAddNew SYSTEM "..\Include\Command\WhenVoucherBeforeAddNew.txt">
  <!ENTITY CommandWhenWhenVoucherAfterInit SYSTEM "..\Include\Command\WhenVoucherAfterInit.txt">
  <!ENTITY XMLStandardVoucherToolbar SYSTEM "..\Include\XML\ExternalVoucherToolbar.xml">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="m05$000000" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="L05" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật tạm ứng" e="Salary Advance"></title>
  <subTitle v="Cập nhật tạm ứng: thêm, sửa, xóa..." e="Add, Edit, Delete Voucher..."></subTitle>
  <partition table="c05$000000" prime="m05$" inquiry="i05$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu91/O1gAuW3llQzQxU9giV2yoHVTp8hcEF2DYN37m563e4lLzASR1FA8a8uVsDbyFT4Kl0/BeB72uu9RQCxWR+T7ZJoxAaKm2Zgz2M5y4ngR9rMZxjo7V8ygzmY7iW1370OZwJV7kPxwyPjlF17vnHbvHDrUXtG9UdNEzOwwMhBtiRFAlyfZ4O+9w3H15zB70QKTN3w9ke5X7rjByTAwFAVEFUP7NdjxHfkaDBGt3Xhg2SfPh2kyDq7vldwWPtpZPPeRLYSwUf4gwNNGQlzTz5x5OzG8qeGGNzsNeLAHDd3MJxo77xzL9ncF4G8EhVqcCL2FCqYSG7ZjIHxwmfgfqB/ROgDXJlTSUhm2jzonzXHHAm0Zd6Y3a6ESSDi69ORt8GPChKqX8dZ7f66UuoYUGW3Ix8+AqzdlmyycgUUV/UsX</Encrypted>]]>
      </text>
    </query>

    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&sp4+hMHegg2EZffLn/pV+7n2ujJawtwavLudUME/X3+IThELEGtveSZcVdE52Go2bWG4dv2b8nVCSyFRsA7CIcvMprrvW0bxoPDsyPFO2FlXZu4ZI6Vz804UIR1hMS+ux75Z2RRh2XsiUbG7QO/fRHYMUIDhCbFN9WjePQRWH8sKTAxHmOnsDZiCXskiKK8U/YM8DCRY2pkgqD86kKTd513+yjnGz2f7lFhbTY2bigOXt19XgwhW3uDANuVAzGD8zOeZRMuYM4OPKNde15uegrvWNlsee35u0CStUrI4Jn0vIXTrtwUzmBt+sXgbGF/ZDfug8m2xnj4ctx/63NDHQl+P3cgot4I2RSCPcHLk8KwJzPFnnrWXKW6xNQ8jiYjoD3f+BmRBoc8OogISEEMbTZHgn7wlA52oKIQP6lGKoxVq1X+ERwsD09dZ8vfnHkML8nlOnXZVQIaVTUV/yDo60S7xN1BSzyLeqp6SdMPOmhngTb7wGpkZSaR/2sktOU8oE5yGfPVmeQroE/vSdI8DOg==</Encrypted>]]>
      </text>
    </query>
  </queries>

  &XMLStandardVoucherToolbar;
</grid>