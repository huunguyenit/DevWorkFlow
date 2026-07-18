<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY XMLUserDefinedHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFields.txt">
  <!ENTITY XMLUserDefinedHiddenViews SYSTEM "..\Include\XML\UserDefinedHiddenViews.txt">
  <!ENTITY XMLFlowGridCommand SYSTEM "..\Include\XML\FlowGridCommand.txt">
  <!ENTITY ScriptFlowGridFunction SYSTEM "..\Include\Javascript\FlowGridFunction.txt">

  <!ENTITY Identity "IRReceipt">

  <!ENTITY XMLFlowGridTagHeader SYSTEM "..\Include\XML\FlowGridTagHeader.xml">
  <!ENTITY ScriptFlowGridSelect SYSTEM "..\Include\Javascript\FlowGridSelect.txt">
  <!ENTITY FlowGridTagField "chon">
  <!ENTITY FlowGridSetItem "g._setItemValue(r, g._getColumnOrder('sl_nm0'), o.checked ? g._getItemValue(r, g._getColumnOrder('so_luong')) - g._getItemValue(r, g._getColumnOrder('sl_ss')) : 0);">

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'IRReceiptGrid', 'Grid', 'IRTran'">
  <!ENTITY CheckRelativeQuery "
  select top 0 @@fieldExternal from d96$000000 a, dmvt b, (select '' as ma_nx, '' as tk_du) c
  return">
]>

<grid table="d96$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="PD1" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c96$000000" prime="d96$" inquiry="i96$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

  <fields>
    <field name="ma_vt" allowNulls="false" readOnly="true" width="100" aliasName="a">
      <header v="Mã hàng" e="Item Code"></header>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''" width="300" aliasName="b">
      <header v="Tên mặt hàng" e="Item Description"></header>
    </field>
    <field name="dvt" allowNulls="false" readOnly="true" width="50" aliasName="a">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="chon" type="Boolean" external="true" allowContain="true" defaultValue="0" width="60">
      &XMLFlowGridTagHeader;
      <items style="CheckBox"/>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJe59IuSGOziul8hi2ke/AgcAfwwwOW5NLQt7EnwZmuWC</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&eQDg7Nv1ZPcHTYx4U3adqKoJjScIBCzrKvEQWxYaCH1iLN+d7k3O78zMgFPktn7n</Encrypted>]]></clientScript>
    </field>
    <field name="sl_nm0" type="Decimal" dataFormatString="@quantityInputFormat" width="100" external="true" allowContain="true" defaultValue="0">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityViewFormat" width="100" readOnly="true" aliasName="a">
      <header v="Sl nhập" e="Receipt Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="sl_ss" type="Decimal" dataFormatString="@quantityViewFormat" width="100" readOnly="true" aliasName="a">
      <header v="Đã chuyển kế toán" e="Book Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceViewFormat" clientDefault="0" readOnly="true" width="100">
      <header v="Giá" e="Price"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_kho" readOnly="true" width="0" hidden="true" aliasName="a">
      <header v="Mã kho" e="Site"></header>
    </field>
    <field name="ma_vi_tri" readOnly="true" width="0" hidden="true" aliasName="a">
      <header v="Mã vị trí" e="Location"></header>
    </field>
    <field name="ma_lo" readOnly="true" width="0" hidden="true" aliasName="a">
      <header v="Mã lô" e="Lot"></header>
    </field>
    <field name="tk_vt" width="0" hidden="true" allowNulls="false" aliasName="case when exists(select top 1 ma_kho from dmkho where dmkho.ma_kho = a.ma_kho and dmkho.dai_ly_yn = 1) then b.tk_dl else b.tk_vt end">
      <header v="Tk nợ" e="Debit Account"></header>
    </field>
    <field name="ma_nx" width="0" hidden="true" aliasName="c">
      <header v="Mã nx" e="Reason Code"></header>
    </field>
    <field name="tk_du" width="0" hidden="true" aliasName="c">
      <header v="Tk có" e="Credit Account"></header>
    </field>

    &XMLUserDefinedHiddenFields;

    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
      <handle key="[nhieu_dvt = 1]" field="ma_vt"/>
    </field>
    <field name="he_so" type="Decimal" width="0" hidden="true" dataFormatString="&CoefficientViewFormat;" clientDefault="0">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="sua_tk_vt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="gia_ton" type="Int32" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="lo_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="tao_lo" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="vi_tri_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="case when exists(select top 1 ma_kho from dmvitri where dmvitri.ma_kho = a.ma_kho) then 1 else 0 end">
      <header v="" e=""></header>
    </field>

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="so_ct" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>
      <field name="chon"/>

      <field name="sl_nm0"/>
      <field name="so_luong"/>
      <field name="sl_ss"/>
      <field name="gia_nt"/>

      <field name="ma_kho"/>
      <field name="ma_vi_tri"/>
      <field name="ma_lo"/>
      <field name="tk_vt"/>
      <field name="ma_nx"/>
      <field name="tk_du"/>
      <field name="sua_tk_vt"/>

      &XMLUserDefinedHiddenViews;

      <field name="nhieu_dvt"/>
      <field name="he_so"/>
      <field name="vi_tri_yn"/>
      <field name="lo_yn"/>
      <field name="tao_lo"/>
      <field name="gia_ton"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="so_ct"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    &XMLFlowGridCommand;
  </commands>

  <script>
    <text>
      &ScriptFlowGridFunction;
      &ScriptFlowGridSelect;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22YV+nFrmULD4jDm6taItVgO1LhvUdyB0qfqOdl1NRbuQ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&eQDg7Nv1ZPcHTYx4U3adqNJe711Yb2ode84MRBWaH2YwZkReLRA/Yk00Vph2UQAYlA7Z1YrhNXbJD/RmVO/pL+JZQ6Rc3S2cdsj6M+hGpKwBBIu8IEy4/w4fqSiORrenSp8ej4JAoJ/eOjg6v+sjsObls6x77jMT0IKCSj3mncIl66IChJelYhOnF9kV2sii74l/Dy3nA1WGS+qL9IsOB4+FeI0U0Tp9P3eIHM4siYNfHqZUKsODaav5Y9fnPqLl/zN7MRI0PmQqC7/pYWUy2uiJGdJsJsrBNlcb0/cYlHk=</Encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        &CheckRelativeProcess;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7KoCZtVaVyV77dT9eKL0oYWZo++CZjWEUqBBZFZnIKLyf0U6qoMJNsv+7zs1thZni8w4iUpTQtJ2xARu7fG/t2lp3uuNODJVwNqlHXYvn8Gs6Wj+k4avy4wgTRWdpwn6678qOu0exagw1JKcPPeXB+QzQfNpnSSKFgM5Ns4cAo0hFd0BM7lr2wWAiKvNnl6cr3QwRVg9lcO7vsVRDENIB5h6kn/cR+x8CfRPRQKLoZAgwWCAg7nqGmXH4frUSaYSpi0ojlLWrA8OZ4Ym4A0MKfpgVDYolvfD1l7wYES9qBUjl5Pw5af1oFrcEmDyJQ9/NRjEIgN5BtcVaf4tiLVSgWlRn2rHPCL34nXwCToXSar9fisUHgsFJUd1gYgPseiGQ==</Encrypted>]]>
      </text>
    </query>

  </queries>

  <toolbar>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>