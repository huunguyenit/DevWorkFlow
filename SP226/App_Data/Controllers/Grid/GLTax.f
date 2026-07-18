<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\GLGrid.ent">
  %UserDefinedFields;

  <!ENTITY XMLTaxFields SYSTEM "..\Include\XML\TaxFields.txt">
  <!ENTITY XMLTaxResponse SYSTEM "..\Include\XML\TaxResponse.txt">
  <!ENTITY XMLTaxQuery SYSTEM "..\Include\XML\TaxQuery.xml">
  <!ENTITY XMLWhenTaxLoading SYSTEM "..\Include\XML\WhenTaxLoading.xml">
  <!ENTITY XMLWhenTaxClosing SYSTEM "..\Include\XML\WhenTaxClosing.xml">
  <!ENTITY ScriptTaxInit SYSTEM "..\Include\Javascript\TaxInit.txt">
  <!ENTITY ScriptTaxClose SYSTEM "..\Include\Javascript\TaxClose.txt">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">

  <!ENTITY f ", t_tt: '[t_ps_no_nt]:=[t_ps_no_nt]', t_tt_nt: '[t_ps_no_nt]:=[t_ps_no_nt]'">
]>

<grid table="r30$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="5" id="PK1" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c11$000000" prime="r30$" inquiry="i11$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    &XMLTaxFields;
    <field name="tk_du" width="80" aliasName="a" allowNulls="false">
      <header v="Tk đối ứng" e="Corr. Tax Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_du%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_du%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="mau_bc"/>
      <field name="ten_bc%l"/>
      <field name="ma_tc"/>
      <field name="ten_tc%l"/>
      <field name="ma_mau_ct"/>
      <field name="ten_mau_ct%l"/>

      <field name="so_ct0"/>
      <field name="so_seri0"/>
      <field name="ngay_ct0"/>

      <field name="ma_kh"/>
      <field name="ten_kh"/>
      <field name="dia_chi"/>
      <field name="ma_so_thue"/>
      <field name="ten_vt"/>

      <field name="t_tien_nt"/>
      <field name="ma_thue"/>
      <field name="ten_thue%l"/>
      <field name="thue_suat"/>
      <field name="tk_thue_no"/>
      <field name="ten_tk_thue_no%l"/>
      <field name="tk_du"/>
      <field name="ten_tk_du%l"/>

      <field name="t_thue_nt"/>
      <field name="ma_kh2"/>
      <field name="t_tien"/>
      <field name="t_thue"/>
      <field name="ghi_chu"/>
      <field name="ten_kh2%l"/>
      <field name="tk_cn"/>

      &XMLUserDefinedViews;

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    &XMLWhenTaxLoading;
    &XMLWhenTaxClosing;
  </commands>

  <script>
    <text>
      &ScriptTaxInit;&f;<![CDATA[<Encrypted>&3/ynUYepZpRiAlwlRh2K/SS3MxFQ5SAqZqNjsAG4qY7cS4tkITRuKgUedjsXPqH3D8Cxh13SHPh1d91GAQYbtsZnnu06YcJdDQ+ZpVLhM7o=</Encrypted>]]>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22XX9/iNqlgvZtmRHtFod1owxj5OkMNfakmDYj2lBWaRXNUKUyDap6Xv/krh1rhXfKFFg5Jd6GLy1TJ0Pre1OoCQ1UOlcz/cgGWcL6hggWvOXXnQ2++62SJI1EPYmLjKusGoxf4WAUjlCbSrqkUgLP2q+P68fz+Db/EgiANqHkf2ADmrNpp1w+YJG6GZaC5Be5YCGqF94q7wO3LBjfVhCJFU0bG6o9++uLtcD4QxQ9gIiqal50fTANUifl31BMRz6zYYldfmZgfaa+V5QVIAZeTYPxczfLpu7zds0/MqjxxxBUHVipbV5YYJl9OiHLSKq1SpbojDYxL10JzGCVxuiue1vRG/WRAADvjuK9MEp7+mywisPBrc2hBXXhCyOS5wScylL1G5XJnTEFlNI8GsdWBU=</Encrypted>]]>
    </text>
  </script>

  <response>
    &XMLTaxResponse;
  </response>

  &XMLTaxQuery;
  &XMLStandardDetailToolbar;
</grid>