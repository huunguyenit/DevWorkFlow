<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY CommandWhenVoucherBeforeInit SYSTEM "..\Include\Command\WhenVoucherBeforeInit.txt">
  <!ENTITY CommandWhenVoucherBeforeAddNew SYSTEM "..\Include\Command\WhenVoucherBeforeAddNew.txt">
  <!ENTITY CommandWhenVoucherAfterInit SYSTEM "..\Include\Command\WhenVoucherAfterInit.txt">
  <!ENTITY XMLStandardVoucherToolbar SYSTEM "..\Include\XML\ExternalVoucherToolbar.xml">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>
<grid table="ms2$000000" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="SF2" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Yêu cầu sản xuất" e="Work Order"></title>
  <subTitle v="Cập nhật phiếu yêu cầu sản xuất: thêm, sửa, xóa..." e="Add New, Edit, Delete Work Order..."></subTitle>
  <partition table="cs2$000000" prime="ms2$" inquiry="is2$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
    <field name="so_ct" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_lsx" width="100" allowFilter="&GridVoucherAllowFilter;">
      <header v="Yêu cầu sản xuất" e="Work Order"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_lsx%l" width="300" allowFilter="&GridVoucherAllowFilter;">
      <header v="Tên yêu cầu sản xuất" e="Work Order Name"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="sl_yc" type="Decimal" dataFormatString="@quantityViewFormat" width="100" clientDefault="0" allowFilter="&GridVoucherAllowFilter;" aggregate="Sum">
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
      <field name="ma_lsx"/>
      <field name="ten_lsx%l"/>
      <field name="sl_yc"/>
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
        <![CDATA[<Encrypted>&Er6kBCOukK5FxLFOw1tnB8I/3UF6nW9jF2yNn7MDyVTRbbW3G47hr2UL+B7ULcAqMLgOlszxhc17342ydeWrvFfPeiRfEIMrFfc2qBAjkvQGQGE+P4OSmoT2ygHDoDnU3VYG8qH2Zd2FHfcUq7B8iC6J0+scUxCv/92vyt4/CtqxWVxascPfni/tYWrcXxOf2/QdVX4rcDjEaBGzoOImIbqQQ9AAMSs/hYw2j45zVnHX3txTc+9qJnv2b6qGxbaR</Encrypted>]]>
      </text>
    </query>

    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2GKOgHIQaRn3LQ7MIojxA6xyCzK3nq1nrG9MkKGJcFQsCOoBfwpoYxwzY5QPl43hPfeCPzDyJnaavrlXEi17Ta2CFyVrQH+5iiu1E3mJB4S50+/vwQ3pn1o04TLdBATuSCWrCE7+8LQUM0uupGy75ASQnc8uOu9p1Iw0neQAgOXSMUWoFT/yH6F3GNE3GF7ba235dRVJQVQCrMKBvZo9sV6WNsGtYdI/pp1h9HzuEI+XuGHFY/7bznDDBf8K4EWaVNlK4tZFYNCtcJSKLY0iMCYFUzHE2hvu/MVEYKnY/uFMGanjJZmrkmmwfoTrRRgr+jrr3D3lx3HHUIUo9Rv6h1iZzksaRfGiE3MYl3pLjaGNhSWtyPO4jbAw+SDPvBGcIVTle7UVmAptssT1wXdPoWuj/B6TVgFYVhY62StLXfg1oy8V5CU6M5GuZ6pOWcDf8uPA7bpVewNj9/zJiBFbiBuVZXDnoXKskXWKEYCKVzBQ8CMEHFforr7o1Rsvm6T2eH3VBuGHD3tRTpLQbl7whQIzCoHEQq8DEsN5vOqvwK3/hOP8xly25xAlV1RQ6OUGRiQuw/noz4bf/9vCxVTRjC/aTG5k7fcFXKP/JGGUHQx</Encrypted>]]>
      </text>
    </query>
  </queries>
</grid>