<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY CommandWhenVoucherBeforeInit SYSTEM "..\Include\Command\WhenVoucherBeforeInit.txt">
  <!ENTITY CommandWhenVoucherBeforeAddNew SYSTEM "..\Include\Command\WhenVoucherBeforeAddNew.txt">
  <!ENTITY CommandWhenVoucherAfterInit SYSTEM "..\Include\Command\WhenVoucherAfterInit.txt">
  <!ENTITY XMLStandardVoucherToolbar SYSTEM "..\Include\XML\ExternalVoucherToolbar.xml">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="m01$000000" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="CN1" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật thu nhập/giảm trừ theo biểu thuế lũy tiến" e="Income/Deduction by the Progressive Tax Tariff"></title>
  <subTitle v="Cập nhật chứng từ: thêm, sửa, xóa..." e="Add, Edit, Delete Voucher..."></subTitle>
  <partition table="c01$000000" prime="m01$" inquiry="i01$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
        <![CDATA[<Encrypted>&Er6kBCOukK5FxLFOw1tnB8I/3UF6nW9jF2yNn7MDyVTRbbW3G47hr2UL+B7ULcAqMLgOlszxhc17342ydeWrvFfPeiRfEIMrFfc2qBAjkvQVHchA3qezQ2PLLqhw5/VFudXTNWsRD8WWf08Xqx+yPHLUh0ldc5zWCl71vRFu1/oC5P5OuTQE+4DX8Inci1pmZN0+Vbo3HgWyQshuM29TXRSLnThD0H1BVDc93f3DGphr/EThSITTVRwMPhvZ3FQaCDWGL/TAH7W4rOvYQ09uolQ0vOedgN5ewlUkvTFT9y0=</Encrypted>]]>
      </text>
    </query>

    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&Er6kBCOukK5FxLFOw1tnB8I/3UF6nW9jF2yNn7MDyVRjiBWiUg+ltOeBPHbKQlX6BO8HVIABKgJFvWTtNLJkzs0W2L1FxojjLKIgfGMZqoyYfsFZUBfwarDeEOBeN/aseDcBFAMua7TVX4hZltkAiHPx2NVQzsffrHBuIiUALkGb1hRymamaj6bf22L/nkiUn/ZNOuXmY8pv34KmgpYjNJWpSYsaAqswHn7o5j0YZM5Q+yNT3ZcwWUFN1TahmI/CBQFRpEAHSBnbSHkfncFJZFiCQ6GZHCvQNLqvPfGNshQuoOBTGKlKC8baQDQFkhHwvJgy9JLQ33uCZ9Wd0YZWcKYeINxQIfBatl93+cdjM4sS3FxsHwpTZB4K/xiG9jJRdnuv1r9n94hzAAcUBCKN3Q==</Encrypted>]]>
      </text>
    </query>
  </queries>
</grid>