<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY XMLUserDefinedHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFields.txt">
  <!ENTITY XMLUserDefinedHiddenViews SYSTEM "..\Include\XML\UserDefinedHiddenViews.txt">
  <!ENTITY XMLFlowGridCommand SYSTEM "..\Include\XML\FlowGridCommand.txt">
  <!ENTITY ScriptFlowGridFunction SYSTEM "..\Include\Javascript\FlowGridFunction.txt">
  <!ENTITY Identity "PAInvoice">

  <!ENTITY XMLFlowGridTagHeader SYSTEM "..\Include\XML\FlowGridTagHeader.xml">
  <!ENTITY ScriptFlowGridSelect SYSTEM "..\Include\Javascript\FlowGridSelect.txt">
  <!ENTITY FlowGridTagField "chon">
  <!ENTITY FlowGridSetItem "g._setItemValue(r, g._getColumnOrder('so_luong0'), o.checked ? g._getItemValue(r, g._getColumnOrder('so_luong')) : 0);">

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'PAInvoiceGrid', 'Grid', 'PATran'">
  <!ENTITY CheckRelativeQuery "
    select top 0 @@fieldExternal from d83$000000 a, dmvt b
    return
">
]>

<grid table="d83$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="m83$000000" prime="d83$000000" inquiry="i83$000000" field="ngay_ct" expression="''" increase="{0}" default=""/>
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
    <field name="so_luong" type="Decimal" dataFormatString="@quantityViewFormat" clientDefault="0" width="80" readOnly="true">
      <header v="Sl hóa đơn" e="Invoice Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceViewFormat" clientDefault="0" width="100" readOnly="true">
      <header v="Giá nt" e="FC Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" clientDefault="0" width="100" allowContain="true" readOnly="true">
      <header v="Tiền nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" clientDefault="0" width="100" allowContain="true" readOnly="true" hidden="true">
      <header v="Thuế nt" e="FC Tax"></header>
      <items style="Numeric"/>
    </field>
    <field name="tk_vt" width="0" aliasName="a" readOnly="true" hidden="true">
      <header v="Tk nợ" e="Debit Account"></header>
    </field>
    <field name="ten_tk_vt%l" readOnly="true" external="true" defaultValue="' '" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="gia" type="Decimal" dataFormatString="@baseCurrencyPriceViewFormat" clientDefault="0" width="100" allowContain="true" readOnly="true">
      <header v="Giá" e="Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" clientDefault="0" width="100" allowContain="true" readOnly="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="thue" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" clientDefault="0" width="100" allowContain="true" readOnly="true" hidden="true">
      <header v="Thuế" e="Tax"></header>
      <items style="Numeric"/>
    </field>
    <field name="hd_so" width="0" align="right" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>

    &XMLUserDefinedHiddenFields;

    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="lo_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="vi_tri_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="case when exists(select top 1 ma_kho from dmvitri where dmvitri.ma_kho = a.ma_kho) then 1 else 0 end">
      <header v="" e=""></header>
    </field>
    <field name="sua_tk_vt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" readOnly="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" align="right" readOnly="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
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
      <field name="gia_nt"/>
      <field name="tien_nt"/>
      <field name="thue_nt"/>
      <field name="tk_vt"/>
      <field name="ten_tk_vt%l"/>
      <field name="gia"/>
      <field name="tien"/>
      <field name="thue"/>
      <field name="hd_so"/>

      &XMLUserDefinedHiddenViews;

      <field name="nhieu_dvt"/>
      <field name="lo_yn"/>
      <field name="vi_tri_yn"/>
      <field name="sua_tk_vt"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    &XMLFlowGridCommand;
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22ciTfxXLWkc6njlqPxulQ8Q0LC8B5NMqT/jHhfrgr+Va</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&DbQoHpVUVQk4ZohDQymygtg8VRc87HLlgzo0rnek4J6Z2CZMPUZqNV57p62jwigLRgjkVP2OaIiF2h/r6NKxED88MWoN96JVoBxvILP0jIkm9LaNTz8UO/oz2LyeTSh6e2i6ahZTeAcitCRAw+iPuwvtBRoep/og2cxy/bjYm3RJVqSQUVJE9+rRBdSacQy0AA+lNggF5B1AwoAyMveds87JJk/cvwilaOIpgAb7UEp18ic0X8DmMbnEY98CSeF3vP9FyafECjGzrQtQNIWSefo64f3nF4s2zMFUARe7XhWxexqp2+BpChXm5ne5KF8Sy0aiThNXp48kRMcV4QKvhQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&DbQoHpVUVQk4ZohDQymygh2dGNANAJ+hTin4pygtXgRvxwehxajKcMGj3kFmuMz5/YsmZ9mItBXjKFMpwfitiHGGB1KYH0VAJ0/E0vyCTzvNL4eOc/6fItlMOWL6GmWm</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&DbQoHpVUVQk4ZohDQymygkSXzMROpZ2hydOL83xcIzVZcrZVXAtIQ4yAnlgr/LMo/1pSn52ryOMCzmTJXyEDSRSOnDL1faloRwUJafdlJqI=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&DbQoHpVUVQk4ZohDQymygsraOGKxnsc3Nwz8Oo/TO4vK00VcE72HAjgqYf4RyejHqvDZxvK5CkvufjKTMLMdoYXoYXh0lcf2Ei5GZHyKil4l3enyaKwC8SlepjdetWckjsJl+POiGOzVmI/Tjy0+P8Rz3KMdgN+gSJKDRM2CeNsSqKi+ouyAkmOp+35mGPj7qvOz7VXjQ9J2Lv3rGiWE2L5NbabXNdl4twO3tU/QwvxozvPfjsEJtbFC1m5aCKRnOEkuqsFJbU6zaO2SjvjzPaTIAjuGPybmo8MHfKZqstKyYYCBZwo0Sf6Lohu5kfKjSwPjy96FSA9IWY4KrPJ1OTKHk6XI2A9MMSJ3vo40HVPS3THorY8Ptz4VMM5d2u7kiujx9d4s+lE6Y+HbPunMuJbhY9bPr2Tnb7ZQlwxUG1g=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&eQDg7Nv1ZPcHTYx4U3adqNJe711Yb2ode84MRBWaH2YwZkReLRA/Yk00Vph2UQAYlA7Z1YrhNXbJD/RmVO/pL+JZQ6Rc3S2cdsj6M+hGpKwBBIu8IEy4/w4fqSiORrenSp8ej4JAoJ/eOjg6v+sjsObls6x77jMT0IKCSj3mncJhMDa+4b50guuBrscfachL6tubfRX9Rkbih7qIGdIeRORRle9xrovFpA60gj+jFGblB7rtBH5ul2r2x4GbWEnqCmnODBq1jNSthEDYlYzMxA==</Encrypted>]]>
      &ScriptFlowGridSelect;
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        &CheckRelativeProcess;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu0b9OAmooDeZk2yogrlIzXRKsxbhsGhi5IBMG+lxdOZC901gsbt0jniNIH4Ul+4/9ucSs+xj3yga8VAjmJ/y4Snq3EIVYAr3vAvp5k+8KcCDMqSHEaxmmqeRxMO3oBf4/clDxQuz+w88AFt8ve2PUBb7Xo44gznuA4MLYLDeGvKipVQPYGh4Bupbq8Qz+bXSV80+PEr+sqXcTmyuFTjILiiiFQqks2pB6gAoWjNDUu0OAsU2XGa+XFIvU1Yl0igJh/SkQR/tWgxrvAe3YcFFtO7mmuMF3yb/fqcOVfUYHaY89GHpbZFEzQHuD5eL2EDyXhy+gBNnlJK6CvwD0aV1CZERXQlXYaS4VWjTb8bGjefgUsQkz1GHrSKe5ibhqLreiYkWQy/7MawQN//qOydTx2IBQlndycjA3pfJ3WLBRhwlGJRszgrMXQ8Himfj+PiUFouaKs+Fm7ny8CXAwyUTGQnPFQh18PNrz/1zj9uZyFD3vXooXdDes2bjuySxacSWrVBMGHY2poVMFuyovRrG2ZwIl60AQEUdnSeQoiYG0aEXU9lM8oNn/qXtBOQbXsjy/31T+u6ubulMLOeSwA35dYjTQ0SVcfC77QMugzurLnq2mEIgnP3rDOEdd4MOSCdaJ43IXpyXj+tcaDuWsTasADSUfRk5zLnTWdy3VJx0+gX0RbSek3kZtxnmse+uV/uk/FQW3pTPZbtFL0vv9U5NuXT8oHiprL0A1qjSo2B5MVqt/6L0MTHHCfwH8Qpt/S4xeTbCKfGqtfBlTeYYQnX0fCqfz28v1P4udgHjFLbMeUsCURsGsjtkbSLBfnjS1z8H+4G+BYMxUwyLDmUaCA38l2FGy/P+u7hTJ9XutSk/7T5WL+pZW/e3gK/+P0eSvqua81xtEwbsHfpN9oS5uE66Yj9NfiMlKe16mmwEKPtxQL3kHbcq/BXqTiSubjlp5Ja6aNgHcGesdrwjWWNoIO+9QM42c2qLCxZihvBSxVRDi8knacy1FWYTmsU5A8DuFUenl+bQODq858vo+iCHKEnueDPqStExC8XthMbTJ/ud0w0SGICRGWxhCnLtJlRrzsghBXYZRY77+mneSC/emmB1F7aCxKm6tN3zebftlziqjQNX3KFaW0R+THrPbvQEmA7k0xXgs87xITOiehQ/YI08jVhmw6chuPJfptNzfghXH6aJENZlnDt5b43kz+ygoIhKf3MvByYcvAJxTGZyb+X6AURDpPH9E2IkOwDT35htWBMKlsfT/EUE9p4KJ0bWenYm8wcKloUv4MdfiA/uhBcvJVNsODKfuOrXf7LrtEEADXrF+9OdQMJ7uuAcgEy/4ny5cdiZ3kZnm4+Okaqq0QsG2tc=</Encrypted>]]>
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