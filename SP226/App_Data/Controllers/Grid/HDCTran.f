<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY CommandWhenVoucherBeforeInit SYSTEM "..\Include\Command\WhenVoucherBeforeInit.txt">
  <!ENTITY CommandWhenVoucherBeforeAddNew SYSTEM "..\Include\Command\WhenVoucherBeforeAddNew.txt">
  <!ENTITY CommandWhenVoucherAfterInit SYSTEM "..\Include\Command\WhenVoucherAfterInit.txt">
  <!ENTITY XMLStandardVoucherToolbar SYSTEM "..\Include\XML\ExternalVoucherToolbar.xml">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>
<grid table="phhd1" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="HDC" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật kết quả hủy hóa đơn" e="Input the Result of Cancelled Invoice"></title>
  <subTitle v="Cập nhật kết quả hủy hóa đơn: thêm, sửa, xóa..." e="New, Edit, Delete Information..."></subTitle>
  <partition table="ihd1" prime="phhd1" inquiry="ihd1" field="ngay_ct" expression="''" increase="{0}" default=""/>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" width="100" aliasName="a" allowFilter="&GridVoucherAllowFilter;">
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
    <field name="ten_tc%l" width="300" external="true" aliasName="b" allowFilter="&GridVoucherAllowFilter;">
      <header v="Tên tổ chức, cá nhân" e="Organization"></header>
      <query>&InsertCommandFilter;</query>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ma_dvcs"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>
      <field name="ten_tc%l"/>
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
        <![CDATA[<Encrypted>&Er6kBCOukK5FxLFOw1tnB8I/3UF6nW9jF2yNn7MDyVTRbbW3G47hr2UL+B7ULcAqbdE0VpLI/lpK01kvP7GRGxkDatAeO4oVLuLDDs1RSDo46j7V1vpCTIZEe/Na7B+vNyDaQ2wgEIdcQdlW7Fnbz+SlfQFHi/qP4kwLxqDnJIree+sgCrVX48aOgvr8fZaLg50tqe4Go/tkYjbwWOm6eUahE2A1uRa7BlAA+/witQvfiKadvahsnrW21gd8tbCRNCKwI+EsRvux8eyaGjGebbzAEX1vuddgsBoDOGGw7DY=</Encrypted>]]>
      </text>
    </query>

    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&Er6kBCOukK5FxLFOw1tnB8I/3UF6nW9jF2yNn7MDyVRjiBWiUg+ltOeBPHbKQlX691BLmrDXVFyTL5YwjVZd0fCKmdbWSQOzlMDfnQzK0IpFUjRj3A9aLnVMSzNpGfoUz5Z5ns0zdVZURzGAVPOt4eAmvqccCrNRpu4fRtGToJe1v8tfLhynFb6qR1kOBTIurkhPSfa9MiJA1dH4dqTq+EYOqaA7MFDdxgNNYMZDm61XDnb9bLYLD3vyQrAR2ODUY1sXRjUcOb5GISuGTY9GM51mryrIR4Xmyfc40zowt9MKwsuAlEcCsmEOzd/5XiWm0RDBG27eETui7CScmjgnXpytvdhOliUM335vHniCPo3j5/PQIsRAMUcaW0Cx9jR+ng1Ry52FMU46JAMBSAwDixvSNb3z7T4QlDyOTYA72EQ=</Encrypted>]]>
      </text>
    </query>
  </queries>
</grid>