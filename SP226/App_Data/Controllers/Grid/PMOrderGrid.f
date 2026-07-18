<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY % EnvironmentTax SYSTEM "..\Include\EnvironmentTax.ent">
  %EnvironmentTax;
  <!ENTITY EnvironmentTaxType "1">
  <!ENTITY EnvironmentTaxAliasName "mt">
  <!ENTITY EnvironmentTaxPrimeTable "95">

  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY XMLUserDefinedHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFields.txt">
  <!ENTITY XMLUserDefinedHiddenViews SYSTEM "..\Include\XML\UserDefinedHiddenViews.txt">
  <!ENTITY XMLFlowGridCommand SYSTEM "..\Include\XML\FlowGridCommand.txt">
  <!ENTITY ScriptFlowGridFunction SYSTEM "..\Include\Javascript\FlowGridFunction.txt">

  <!ENTITY Identity "PMOrder">

  <!ENTITY XMLFlowGridTagHeader SYSTEM "..\Include\XML\FlowGridTagHeader.xml">
  <!ENTITY ScriptFlowGridSelect SYSTEM "..\Include\Javascript\FlowGridSelect.txt">
  <!ENTITY FlowGridTagField "chon">
  <!ENTITY FlowGridSetItem "g._setItemValue(r, g._getColumnOrder('so_luong0'), o.checked ? g._getItemValue(r, g._getColumnOrder('so_luong')) - g._getItemValue(r, g._getColumnOrder('sl_hd')) : 0);">

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'PMOrderGrid', 'Grid', 'PMTran'">
  <!ENTITY CheckRelativeQuery "
  select top 0 @@fieldExternal from d95$000000 a, dmvt b, dmtk c, (select *, 0 as tl_chiu_thue, 0 as he_so_mt from dmkbtmt where 1 = 0) mt
  return">
]>

<grid table="d95$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="PO2" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c95$000000" prime="d95$" inquiry="i95$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

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

    <field name="so_luong0" type="Decimal" dataFormatString="@quantityInputFormat" external="true" allowContain="true" defaultValue="0" width="100">
      <header v="Sl hóa đơn" e="Invoice Q'ty"></header>
      <items style="Numeric"/>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityViewFormat" width="100" readOnly="true" aliasName="a">
      <header v="Sl đơn hàng" e="PO Q'ty"></header>
      <items style="Numeric"/>
    </field>
    <field name="sl_nhan" type="Decimal" dataFormatString="@quantityViewFormat" width="100" readOnly="true" aliasName="a">
      <header v="Sl đã nhận" e="Q'ty Received"></header>
      <items style="Numeric"/>
    </field>
    <field name="sl_hd" type="Decimal" dataFormatString="@quantityViewFormat" width="100" readOnly="true" aliasName="a">
      <header v="Đã nhận hóa đơn" e="Received Invoice"></header>
      <items style="Numeric"/>
    </field>

    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceViewFormat" clientDefault="0" width="100" readOnly="true">
      <header v="Giá" e="Price"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_thue_nk" width="0" readOnly="true" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="thue_suat_nk" type="Decimal" dataFormatString="#0.00" readOnly="true" hidden="true" aliasName="a" width="0">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="tk_thue_nk" width="0" readOnly="true" hidden="true" aliasName="a">
      <header v="Tk thuế nk" e="Import Tax Account"></header>
    </field>
    <field name="ma_thue_ttdb" width="0" readOnly="true" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="thue_suat_ttdb" type="Decimal" dataFormatString="#0.00" readOnly="true" hidden="true" aliasName="a" width="0">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="tk_thue_ttdb" width="0" readOnly="true" hidden="true" aliasName="a">
      <header v="Tk thuế ttđb" e="Excise Tax Account"></header>
    </field>
    <field name="ma_thue" width="0" readOnly="true" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="thue_suat" type="Decimal" dataFormatString="#0.00" readOnly="true" hidden="true" aliasName="a" width="0">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="tk_thue" width="0" readOnly="true" hidden="true" aliasName="a">
      <header v="Tk thuế" e="VAT Account"></header>
    </field>

    <field name="tk_vt" width="0" hidden="true" allowNulls="false" aliasName="b">
      <header v="Tk nợ" e="Debit Account"></header>
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
    <field name="lo_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="tao_lo" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="sua_tk_vt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="gia_ton" type="Int32" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="thue_cn" type="Decimal" readOnly="true" defaultValue="''" external="true" width="0" hidden="true" aliasName="c.tk_cn">
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
    <field name="line_nbr" type="Int32" dataFormatString="#####" width="0" align="right" hidden="true">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>

    &EnvironmentTaxInheritanceFields;
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>
      <field name="chon"/>

      <field name="so_luong0"/>
      <field name="so_luong"/>
      <field name="sl_nhan"/>
      <field name="sl_hd"/>

      <field name="gia_nt"/>

      <field name="ma_thue_nk"/>
      <field name="thue_suat_nk"/>
      <field name="tk_thue_nk"/>
      <field name="ma_thue_ttdb"/>
      <field name="thue_suat_ttdb"/>
      <field name="tk_thue_ttdb"/>
      <field name="ma_thue"/>
      <field name="thue_suat"/>
      <field name="tk_thue"/>

      <field name="tk_vt"/>
      <field name="sua_tk_vt"/>

      &XMLUserDefinedHiddenViews;

      <field name="nhieu_dvt"/>
      <field name="he_so"/>
      <field name="lo_yn"/>
      <field name="tao_lo"/>
      <field name="thue_cn"/>
      <field name="gia_ton"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="so_ct"/>
      <field name="line_nbr"/>

      &EnvironmentTaxInheritanceViews;
    </view>
  </views>

  <commands>
    &XMLFlowGridCommand;
  </commands>

  <script>
    <text>
      &ScriptFlowGridFunction;
      &ScriptFlowGridSelect;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22YV+nFrmULD4jDm6taItVgO1LhvUdyB0qfqOdl1NRbuQ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&eQDg7Nv1ZPcHTYx4U3adqNJe711Yb2ode84MRBWaH2YwZkReLRA/Yk00Vph2UQAYlA7Z1YrhNXbJD/RmVO/pL+JZQ6Rc3S2cdsj6M+hGpKwBBIu8IEy4/w4fqSiORrenSp8ej4JAoJ/eOjg6v+sjsObls6x77jMT0IKCSj3mncJhMDa+4b50guuBrscfachLr0IBdva6HLE11oCjwjYzHROa07j1SVbH6pla4bW8zgqS8bh4O7SSEzL4Yk3QBDvZXS1voagTU43CGrMKKaOO/gjiOeklQvmWEPjomWXOKnA=</Encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        &CheckRelativeProcess;
        &EnvironmentTaxInheritanceQuery;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK8nauo0POnSDumPauY33wgNCdht/l6yGC92B8k2MGvmQQ==</Encrypted>]]>&EnvironmentTaxPrimePartitionCurrent;<![CDATA[<Encrypted>&/CeVoo3cM+o2CPgco9dGQ9pavM6kFfE8PSVHHXdAorMRYhh/PHQAF95zVrfy4HZj1jkQiJDyKlPZP8vAqArRF6GVn8IxKlY7a8ez6SVkaNE=</Encrypted>]]>&EnvironmentTaxInheritanceLoadingJoin;<![CDATA[<Encrypted>&M+kvXi/dU/Pm/PVr5kRbNMD6cPXfSceSUdVUu+q8eTxVmhOkcAaqxBWiOhmOhml8G7E6jciNoQt8ZOt/pvypOtzOqkGZT1SF4qRS0t5NeJJ83EMgwckr+8tZ1HBRbBu7aOmOm3cOVPEC/Ov8uHT7UUb3+wzzr1+LCVe3dTCMi/d1LgZNOmRwC/DtrL7e98HYHC0I0vRblbrFRAVEnYCkuUXqMHxo9RQflNmIKKzuatCdS/Q5dPoIAf0wCeMSyJbSh3YwUSBbYqfg38siHxXT1w==</Encrypted>]]>
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