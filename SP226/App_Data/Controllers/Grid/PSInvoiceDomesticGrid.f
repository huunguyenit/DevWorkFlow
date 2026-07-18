<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY XMLUserDefinedHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFields.txt">
  <!ENTITY XMLUserDefinedHiddenViews SYSTEM "..\Include\XML\UserDefinedHiddenViews.txt">
  <!ENTITY XMLFlowGridCommand SYSTEM "..\Include\XML\FlowGridCommand.txt">
  <!ENTITY XMLExternalStockLoading SYSTEM "..\Include\XML\ExternalStockLoading.txt">
  <!ENTITY ScriptFlowGridFunction SYSTEM "..\Include\Javascript\FlowGridFunction.txt">

  <!ENTITY Identity "PSInvoiceDomestic">
  <!ENTITY Tag "">

  <!ENTITY XMLFlowGridTagHeader SYSTEM "..\Include\XML\FlowGridTagHeader.xml">
  <!ENTITY ScriptFlowGridSelect SYSTEM "..\Include\Javascript\FlowGridSelect.txt">
  <!ENTITY FlowGridTagField "chon">
  <!ENTITY FlowGridSetItem "g._setItemValue(r, g._getColumnOrder('so_luong0'), o.checked ? g._getItemValue(r, g._getColumnOrder('so_luong')) : 0);">

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'PSInvoiceDomesticGrid', 'Grid', 'PSTran'">
  <!ENTITY CheckRelativeQuery "
  select top 0 @@fieldExternal from d71$000000 a, dmvt b, cdvt13 e
  return">
]>

<grid table="d71$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="PNA" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c71$000000" prime="d71$" inquiry="i71$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

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
    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100" readOnly="true">
      <header v="Giá" e="Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="0" hidden="true">
      <header v="Tiền hàng" e="Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="so_luong0" type="Decimal" dataFormatString="@quantityInputFormat" external="true" allowContain="true" defaultValue="0" width="100">
      <header v="Sl trả lại" e="Return Q'ty"></header>
      <items style="Numeric"/>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityViewFormat" width="100" readOnly="true" aliasName="a">
      <header v="Sl nhập" e="Receipt Q'ty"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_kho" readOnly="true" width="80" aliasName="a" hidden="true">
      <header v="Mã kho" e="Site"></header>
    </field>

    <field name="ma_vi_tri" readOnly="true" hidden="true" width="80" aliasName="a">
      <header v="Mã vị trí" e="Location"></header>
    </field>
    <field name="ma_lo" readOnly="true" hidden="true" width="80" aliasName="a">
      <header v="Mã lô" e="Lot"></header>
    </field>
    <field name="tk_vt" width="0" hidden="true" allowNulls="false" aliasName="a">
      <header v="Tk nợ" e="Debit Account"></header>
    </field>

    &XMLUserDefinedHiddenFields;

    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
      <handle key="[nhieu_dvt = 1]" field="ma_vt"/>
    </field>
    <field name="he_so" type="Decimal" width="0" hidden="true" dataFormatString="&CoefficientInputFormat;" clientDefault="0">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ton13" type="Decimal" dataFormatString="@quantityViewFormat" width="0" hidden="true" external="true" defaultValue="0" readOnly="true" inactivate="true" aliasName="e.ton13 / case when a.he_so &lt;&gt; 0 then a.he_so else 1 end">
      <header v="Tồn" e="Stock"></header>
      <items style="Numeric"/>
    </field>
    <field name="sua_tk_vt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="lo_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
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
    <field name="so_ct" readOnly="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_pn" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0pn" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="pn_so" readOnly="true" aliasName="a" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="pn_ln" type="Int32" dataFormatString="#####" readOnly="true" aliasName="a" hidden="true">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="stt_rec_dh" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0dh" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" dataFormatString="#####" width="0" align="right" hidden="true">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>
      <field name="so_ct"/>
      <field name="chon"/>

      <field name="so_luong0"/>
      <field name="so_luong"/>

      <field name="gia_nt"/>
      <field name="tien_nt"/>

      <field name="ma_kho"/>
      <field name="ma_vi_tri"/>
      <field name="ma_lo"/>

      <field name="tk_vt"/>
      <field name="sua_tk_vt"/>

      &XMLUserDefinedHiddenViews;

      <field name="nhieu_dvt"/>
      <field name="he_so"/>
      <field name="ton13"/>
      <field name="vi_tri_yn"/>
      <field name="lo_yn"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>

      <field name="stt_rec_pn"/>
      <field name="stt_rec0pn"/>
      <field name="pn_so"/>
      <field name="pn_ln"/>

      <field name="stt_rec_dh"/>
      <field name="stt_rec0dh"/>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22YV+nFrmULD4jDm6taItVgO1LhvUdyB0qfqOdl1NRbuQ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&eQDg7Nv1ZPcHTYx4U3adqNJe711Yb2ode84MRBWaH2YwZkReLRA/Yk00Vph2UQAYlA7Z1YrhNXbJD/RmVO/pL+JZQ6Rc3S2cdsj6M+hGpKwBBIu8IEy4/w4fqSiORrenSp8ej4JAoJ/eOjg6v+sjsObls6x77jMT0IKCSj3mncJhMDa+4b50guuBrscfachL6tubfRX9Rkbih7qIGdIeRORRle9xrovFpA60gj+jFGblB7rtBH5ul2r2x4GbWEnqCmnODBq1jNSthEDYlYzMxA==</Encrypted>]]>
    </text>
  </script>

  <queries>
    &XMLExternalStockLoading;
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