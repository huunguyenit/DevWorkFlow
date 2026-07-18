<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY XMLUserDefinedHiddenViews SYSTEM "..\Include\XML\UserDefinedHiddenViews.txt">
  <!ENTITY XMLUserDefinedHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFields.txt">
  <!ENTITY XMLFlowGridCommand SYSTEM "..\Include\XML\FlowGridCommand.txt">
  <!ENTITY ScriptFlowGridFunction SYSTEM "..\Include\Javascript\FlowGridFunction.txt">

  <!ENTITY Identity "SPInvoice">

  <!ENTITY XMLFlowGridTagHeader SYSTEM "..\Include\XML\FlowGridTagHeader.xml">
  <!ENTITY ScriptFlowGridSelect SYSTEM "..\Include\Javascript\FlowGridSelect.txt">
  <!ENTITY FlowGridTagField "chon">
  <!ENTITY FlowGridSetItem "g._setItemValue(r, g._getColumnOrder('so_luong0'), o.checked ? g._getItemValue(r, g._getColumnOrder('so_luong')) : 0);">

  <!ENTITY % DetailTax SYSTEM "..\Include\DetailTax.ent">
  %DetailTax;

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'SPInvoiceGrid', 'Grid', 'SPTran'">
  <!ENTITY CheckRelativeQuery "
    select top 0 @@fieldExternal from d81$000000 a, dmvt b, dmtk c, dmtk d, dmtk f
    return
">
]>

<grid table="d81$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="HDA" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c81$000000" prime="d81$" inquiry="i81$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

  <fields>
    <field name="ma_vt" allowNulls="false" width="100" aliasName="a" readOnly="true">
      <header v="Mã hàng" e="Item Code"></header>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="' '" width="300" aliasName="b">
      <header v="Tên mặt hàng" e="Item Description"></header>
    </field>
    <field name="dvt" allowNulls="false" width="50" aliasName="a" readOnly="true">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="ten_dvt%l" readOnly="true" external="true" defaultValue="' '" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="he_so" type="Decimal" width="0" inactivate="true" hidden="true" dataFormatString="&CoefficientInputFormat;" clientDefault="0">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_kho" allowNulls="false" width="80" aliasName="a" readOnly="true">
      <header v="Mã kho" e="Site"></header>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" defaultValue="' '" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ma_vi_tri" width="80" aliasName="a" readOnly="true">
      <header v="Mã vị trí" e="Location"></header>
    </field>
    <field name="ten_vi_tri%l" readOnly="true" external="true" defaultValue="' '" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ma_lo" width="80" readOnly="true">
      <header v="Mã lô" e="Lot"></header>
    </field>
    <field name="ten_lo%l" readOnly="true" external="true" defaultValue="' '" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    <field name="chon" type="Boolean" external="true" allowContain="true" defaultValue="1" width="60">
      &XMLFlowGridTagHeader;
      <items style="CheckBox"/>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJe59IuSGOziul8hi2ke/AgcAfwwwOW5NLQt7EnwZmuWC</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&eQDg7Nv1ZPcHTYx4U3adqKoJjScIBCzrKvEQWxYaCH1iLN+d7k3O78zMgFPktn7n</Encrypted>]]></clientScript>
    </field>
    <field name="so_luong0" type="Decimal" dataFormatString="@quantityInputFormat" external="true" defaultValue="a.so_luong" width="100">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" readOnly="true" clientDefault="0" width="80">
      <header v="Sl hóa đơn" e="Invoice Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia_nt2" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100" readOnly="true">
      <header v="Giá bán nt" e="FC Sales Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true" readOnly="true">
      <header v="Tiền nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="0" allowContain="true" readOnly="true" hidden="true">
      <header v="Thuế nt" e="FC Tax"></header>
      <items style="Numeric"/>
    </field>
    <field name="tk_vt" width="0" aliasName="a" readOnly="true" hidden="true">
      <header v="Tk nợ" e="Debit Account"></header>
    </field>
    <field name="ten_tk_vt%l" readOnly="true" external="true" defaultValue="' '" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="gia2" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" allowContain="true" readOnly="true">
      <header v="Giá bán" e="Sales Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien2" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true" readOnly="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="thue" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="0" allowContain="true" readOnly="true" hidden="true">
      <header v="Thuế" e="Tax"></header>
      <items style="Numeric"/>
    </field>

    &XMLUserDefinedHiddenFields;

    <field name="gia_ton" type="Int32" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="lo_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="vi_tri_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="case when exists(select top 1 ma_kho from dmvitri where dmvitri.ma_kho = a.ma_kho) then 1 else 0 end">
      <header v="" e=""></header>
    </field>
    <field name="tk_dt" width="0" external="true" hidden="true" aliasName="b.tk_dt">
      <header v="" e=""></header>
    </field>
    <field name="tk_gghb" width="0" external="true" hidden="true" aliasName="b.tk_gghb">
      <header v="" e=""></header>
    </field>
    <field name="kieu_dt" type="Int32" width="0" external="true" hidden="true" aliasName="c.loai_tk">
      <header v="" e=""></header>
    </field>
    <field name="kieu_gg" type="Int32" width="0" external="true" hidden="true" aliasName="d.loai_tk">
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

    &DetailTaxFollowFields;
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>
      <field name="ten_dvt%l"/>
      <field name="he_so"/>

      <field name="ma_kho"/>
      <field name="ten_kho%l"/>
      <field name="ma_vi_tri"/>
      <field name="ten_vi_tri%l"/>
      <field name="ma_lo"/>
      <field name="ten_lo%l"/>

      <field name="chon"/>
      <field name="so_luong0"/>
      <field name="so_luong"/>
      <field name="gia_nt2"/>
      <field name="tien_nt2"/>
      <field name="thue_nt"/>
      <field name="tk_vt"/>
      <field name="ten_tk_vt%l"/>
      <field name="gia2"/>
      <field name="tien2"/>
      <field name="thue"/>

      &XMLUserDefinedHiddenViews;
      <field name="gia_ton"/>
      <field name="nhieu_dvt"/>
      <field name="lo_yn"/>
      <field name="vi_tri_yn"/>
      <field name="tk_dt"/>
      <field name="tk_gghb"/>
      <field name="kieu_dt"/>
      <field name="kieu_gg"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="so_ct"/>
      <field name="line_nbr"/>

      &DetailTaxFollowView;
    </view>
  </views>

  <commands>
    &XMLFlowGridCommand;
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22ciTfxXLWkc6njlqPxulQ8Q0LC8B5NMqT/jHhfrgr+Va</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&DbQoHpVUVQk4ZohDQymygtg8VRc87HLlgzo0rnek4J6Z2CZMPUZqNV57p62jwigLRgjkVP2OaIiF2h/r6NKxED88MWoN96JVoBxvILP0jIkm9LaNTz8UO/oz2LyeTSh6e2i6ahZTeAcitCRAw+iPuwvtBRoep/og2cxy/bjYm3RJVqSQUVJE9+rRBdSacQy0AA+lNggF5B1AwoAyMveds87JJk/cvwilaOIpgAb7UEp18ic0X8DmMbnEY98CSeF3vP9FyafECjGzrQtQNIWSefo64f3nF4s2zMFUARe7XhWxexqp2+BpChXm5ne5KF8Sy0aiThNXp48kRMcV4QKvhQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&DbQoHpVUVQk4ZohDQymygh2dGNANAJ+hTin4pygtXgRvxwehxajKcMGj3kFmuMz5zETNYTcYm+6IwFQHmPZjhf15hEErLl0EbpNKmX1Ucb5vZOXrCNYMAFg44JFbmwYT</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&DbQoHpVUVQk4ZohDQymygkSXzMROpZ2hydOL83xcIzVZcrZVXAtIQ4yAnlgr/LMo/1pSn52ryOMCzmTJXyEDSRSOnDL1faloRwUJafdlJqI=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&DbQoHpVUVQk4ZohDQymygsraOGKxnsc3Nwz8Oo/TO4vK00VcE72HAjgqYf4RyejHqvDZxvK5CkvufjKTMLMdoYXoYXh0lcf2Ei5GZHyKil4l3enyaKwC8SlepjdetWckjsJl+POiGOzVmI/Tjy0+P8Rz3KMdgN+gSJKDRM2CeNsSqKi+ouyAkmOp+35mGPj7qvOz7VXjQ9J2Lv3rGiWE2L5NbabXNdl4twO3tU/QwvxozvPfjsEJtbFC1m5aCKRnOEkuqsFJbU6zaO2SjvjzPaTIAjuGPybmo8MHfKZqstKyYYCBZwo0Sf6Lohu5kfKjSwPjy96FSA9IWY4KrPJ1OTKHk6XI2A9MMSJ3vo40HVPS3THorY8Ptz4VMM5d2u7kiujx9d4s+lE6Y+HbPunMuJbhY9bPr2Tnb7ZQlwxUG1g=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&eQDg7Nv1ZPcHTYx4U3adqNJe711Yb2ode84MRBWaH2YwZkReLRA/Yk00Vph2UQAYlA7Z1YrhNXbJD/RmVO/pL+JZQ6Rc3S2cdsj6M+hGpKwBBIu8IEy4/w4fqSiORrenSp8ej4JAoJ/eOjg6v+sjsObls6x77jMT0IKCSj3mncJhMDa+4b50guuBrscfachL6tubfRX9Rkbih7qIGdIeRORRle9xrovFpA60gj+jFGblB7rtBH5ul2r2x4GbWEnqCmnODBq1jNSthEDYlYzMxA==</Encrypted>]]>
      &ScriptFlowGridSelect;
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        &CheckRelativeProcess;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/KWW0H3wllwc+j4G03oLj1B66Jra2RsWCSZPM3/TkJSNWLrl2QcXbqLH/L3cyqz4S8s/8EXCXT9ocwBIE1gAgcb58mkCwF9aTGXS3ZDSCWvxnkXtZAaJL7ni38ZtKDeOVwAzYiyvciTi4EzLqqqc9I</Encrypted>]]>&GridDetailQueryLoadingJoin;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4VF+ha7LkMaeuzNNX9bRXMx8/oQgbI8idowfKEyoXGGCvOENxLbPKKQ5F/txn0KlrQ==</Encrypted>]]>
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