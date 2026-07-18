<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\JRGrid.ent">
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

<grid table="r30$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="5" id="HD9" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c29$000000" prime="r30$" inquiry="i29$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtdRv1YhR9e9Dl5cHVOOvzXwlPR6lInIRz6lvy+KaxUMW2HpVORFpMyZutjyvyEgIyRFUbDZZ/M374LRUkRF2z8BweXajV9+L1NbMgCta1GQzuZEUtZp/LBXlvwE2kJiT7ENyRUmeZU9CNVgjYqsVENvrj6vPxUBuuD2yJeyoQdwboSfbsjzpcGV4vAWUtH+VWCWokKJgJfZn7GJNyvBoZw+sgtrrzV684fVqf1cKj7nwXzMTuVFHODlWvDfjQNLceUE3gK+eJBuaI4RXq41uy8dOGNl2oeY6mdooMbuD3KfoQTtKwFNRsIwsjB3QuiiC1C0MdOnKIktWdgRtG3iFHoywLAiC8Hpx8XrhdV9sZ4ZzLEbnnHhRlb4hxkdQhY8Tmw==</Encrypted>]]>
    </text>
  </script>

  <response>
    &XMLTaxResponse;
  </response>

  &XMLTaxQuery;
  &XMLStandardDetailToolbar;
</grid>