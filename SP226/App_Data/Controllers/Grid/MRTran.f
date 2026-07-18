<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY CommandWhenVoucherBeforeInit SYSTEM "..\Include\Command\WhenVoucherBeforeInit.txt">
  <!ENTITY CommandWhenVoucherBeforeAddNew SYSTEM "..\Include\Command\WhenVoucherBeforeAddNew.txt">
  <!ENTITY CommandWhenVoucherAfterInit SYSTEM "..\Include\Command\WhenVoucherAfterInit.txt">
  <!ENTITY XMLStandardVoucherToolbar SYSTEM "..\Include\XML\ExternalVoucherToolbar.xml">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="m87$000000" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="PX0" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Phiếu yêu cầu lĩnh vật tư" e="Material Requisition"></title>
  <subTitle v="Cập nhật phiếu yêu cầu: thêm, sửa, xóa..." e="Add New, Edit, Delete Requisition..."></subTitle>
  <partition table="c87$000000" prime="m87$" inquiry="i87$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

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
    <field name="dept_id" width="100" aliasName="a" allowFilter="&GridVoucherAllowFilter;">
      <header v="Bộ phận" e="Department"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_bp%l" width="300" external="true" aliasName="b" allowFilter="&GridVoucherAllowFilter;">
      <header v="Tên bộ phận" e="Department Name"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="t_so_luong" type="Decimal" dataFormatString="@quantityViewFormat" width="100" clientDefault="0" allowFilter="&GridVoucherAllowFilter;" aggregate="Sum">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="dien_giai" width="300" allowFilter="&GridVoucherAllowFilter;">
      <header v="Diễn giải" e="Memo"></header>
      <query>&InsertCommandFilter;</query>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ma_dvcs"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>
      <field name="dept_id"/>
      <field name="ten_bp%l"/>
      <field name="t_so_luong"/>
      <field name="dien_giai"/>
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
        <![CDATA[<Encrypted>&Er6kBCOukK5FxLFOw1tnB8I/3UF6nW9jF2yNn7MDyVTRbbW3G47hr2UL+B7ULcAqbdE0VpLI/lpK01kvP7GRGxkDatAeO4oVLuLDDs1RSDo46j7V1vpCTIZEe/Na7B+vNyDaQ2wgEIdcQdlW7Fnbz+SlfQFHi/qP4kwLxqDnJIrN38q7b3jAGY4n9xE3ULQQC1i1tXhOJpkqEylRooswZyfjrgXsYDxGup4XIYUegC+1lNebuttPBuqcj/mFJUUUK4D8usDY61hEInH04tBHayiqbERVJETmafD+DDtXqoE=</Encrypted>]]>
      </text>
    </query>

    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&Er6kBCOukK5FxLFOw1tnB8I/3UF6nW9jF2yNn7MDyVRjiBWiUg+ltOeBPHbKQlX691BLmrDXVFyTL5YwjVZd0fCKmdbWSQOzlMDfnQzK0IpFUjRj3A9aLnVMSzNpGfoUz5Z5ns0zdVZURzGAVPOt4eAmvqccCrNRpu4fRtGToJe1v8tfLhynFb6qR1kOBTIuwdPemFolxuUWMjj8/yJZCzYjXzgEqbpSupisNj5LOpzHnKO2CuYPzJqFW0v7jK24OprQotSQQstn6y0ldQxfOedTYSgQCFR1b/D5iXZjSkwmjBtxkdrl1RWNZriPwWe+Xu/++pssSLJyFE3FkWWYDfE0o1SJqa/p4Jpd9fKBT72at2cp+tfW8yeIBkbziP703JD1omplu0N+UV16UxlNzxpB4xPdAumlCHeJwhrOboY=</Encrypted>]]>
      </text>
    </query>
  </queries>
</grid>