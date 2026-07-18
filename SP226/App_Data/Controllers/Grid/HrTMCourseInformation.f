<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY CommandWhenVoucherBeforeInit SYSTEM "..\Include\Command\WhenVoucherBeforeInit.txt">
  <!ENTITY CommandWhenVoucherAfterInit SYSTEM "..\Include\Command\WhenVoucherAfterInit.txt">
  <!ENTITY XMLStandardVoucherToolbar SYSTEM "..\Include\XML\ExternalVoucherToolbar.xml">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="hrdtkh" code="stt_rec" order="ngay_ct, ma_khoa" type="Voucher" id="H08" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật thông tin khóa học" e="Training Course Information"></title>
  <subTitle v="Cập nhật thông tin khóa học: thêm, sửa, xóa..." e="Add, Edit, Delete Training Course Information..."></subTitle>
  <partition table="hridtkh" prime="hrdtkh" inquiry="hridtkh" field="ngay_ct" expression="''" increase="{0}" default=""/>
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
    <field name="ma_khoa" width="100" allowFilter="&GridVoucherAllowFilter;">
      <header v="Mã khóa học" e="Course Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_khoa%l" width="300" allowFilter="&GridVoucherAllowFilter;">
      <header v="Tên khóa học" e="Course Name"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ngay_du_kien1" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="&GridVoucherAllowFilter;">
      <header v="Dự kiến từ ngày" e="Schedule from"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ngay_du_kien2" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="&GridVoucherAllowFilter;">
      <header v="Đến ngày" e="To"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ngay_hoc1" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="&GridVoucherAllowFilter;">
      <header v="Học từ ngày" e="Training from"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ngay_hoc2" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="&GridVoucherAllowFilter;">
      <header v="Đến ngày" e="To"></header>
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
      <field name="ngay_du_kien1"/>
      <field name="ngay_du_kien2"/>
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
        <![CDATA[<Encrypted>&Er6kBCOukK5FxLFOw1tnB8I/3UF6nW9jF2yNn7MDyVTRbbW3G47hr2UL+B7ULcAqMLgOlszxhc17342ydeWrvFfPeiRfEIMrFfc2qBAjkvQyT02EpTz+97f9ATdMPw7/B+U1tvZGQ9vr16KHWvQCMxzXcgqy5q3xt4PjZ6cy8lHgr1aVaV5ZevGU2f5Mm05Ppn+ltW9WR55yTzaz+rQvDi0S5EOSD9w/RAdLPahsGzE=</Encrypted>]]>
      </text>
    </query>

    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&Er6kBCOukK5FxLFOw1tnB8I/3UF6nW9jF2yNn7MDyVRjiBWiUg+ltOeBPHbKQlX691BLmrDXVFyTL5YwjVZd0fCKmdbWSQOzlMDfnQzK0IpFUjRj3A9aLnVMSzNpGfoUz5Z5ns0zdVZURzGAVPOt4eAmvqccCrNRpu4fRtGToJe1v8tfLhynFb6qR1kOBTIurkhPSfa9MiJA1dH4dqTq+EYOqaA7MFDdxgNNYMZDm63UbmsSW+PkO4SIwWXdImcVpkTbTq2fARhuQgBLzNTgWG0VvGnavCnDP/hYqfEigbkW7+Jq4wNvKrXjYXZo5B9CCfLt3kNhEEiv6cjmtMQeUs+mX/Klmzo28VezfnHGUjXp6s6+q2QWiGa1CYJ2GkA2</Encrypted>]]>
      </text>
    </query>
  </queries>
</grid>