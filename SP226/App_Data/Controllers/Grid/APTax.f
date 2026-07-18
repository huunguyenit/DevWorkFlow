<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\APGrid.ent">
  %UserDefinedFields;

  <!ENTITY XMLTaxFields SYSTEM "..\Include\XML\TaxFields.txt">
  <!ENTITY XMLTaxViews SYSTEM "..\Include\XML\TaxViews.txt">
  <!ENTITY XMLTaxResponse SYSTEM "..\Include\XML\TaxResponse.txt">
  <!ENTITY XMLTaxQuery SYSTEM "..\Include\XML\TaxQuery.xml">
  <!ENTITY XMLWhenTaxLoading SYSTEM "..\Include\XML\WhenTaxLoading.xml">
  <!ENTITY XMLWhenTaxClosing SYSTEM "..\Include\XML\WhenTaxClosing.xml">
  <!ENTITY ScriptTaxInit SYSTEM "..\Include\Javascript\TaxInit.txt">
  <!ENTITY ScriptTaxClose SYSTEM "..\Include\Javascript\TaxClose.txt">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">

  <!ENTITY f ", t_tt: '[t_tt]:=[t_tien]+[t_thue]', t_tt_nt: '[t_tt_nt]:=[t_tien_nt]+[t_thue_nt]'">
]>

<grid table="r30$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="5" id="PN1" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c31$000000" prime="r30$" inquiry="i31$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    &XMLTaxFields;
  </fields>

  <views>
    <view id="Grid">
      &XMLTaxViews;
    </view>
  </views>

  <commands>
    &XMLWhenTaxLoading;
    &XMLWhenTaxClosing;
  </commands>

  <script>
    <text>
      &ScriptTaxInit;&f;&ScriptTaxClose;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtdRv1YhR9e9Dl5cHVOOvzXwlPR6lInIRz6lvy+KaxUMWfBJi6UzD/OhmQXgz2Mt8OicLcewey9oolysXEa7QzaXq2v4UJ0R66QJPGekTGtntQlLxHyuzv3j6+8K2iamaDkIijJNVcwogAj0wnZdiZZCyLHL9WhOe3lA3bkpbC94PrqvuFhmIyqDe7xGCqhGE/PqJd7yhlfjzaPaMahyTqrsI/i4ih+vPdFaX86DTOmHMyCUuT5GLvftVuGul+x+kq4bUIKqiIqiqiaj2K4YfTBIpEk28HGpACAsII2LqfmdfMJmSjajSO1Fv5B2qVwk3OpGlLnWzyPqZB7ILrltHwJXK5FgCJuTxQlMxnICK4D/DospskXI6wipQM2XbhSllG47wTmod04JzKuIFRqpwGDo6d9VQ2tnNWjZCtidrN72WqkaiYhoA0Tw7lszjBASBfrgd+gxgAqdhbXhrqF+pobVpDOcCFwdpq3Z5LKldC6Q6KF/bORKfbyA3PP2W1UI0ygblQUbNgsIa9zelWBzsyQr+S60o8wYS/RVoL+OTTPdZz7WoX1QvpaY/x7xQEQgM5MXH6h/zwPVX0R/eP3KfLAI2Zogt30ljquj/wJOWsSbn</Encrypted>]]>
    </text>
  </script>

  <response>
    &XMLTaxResponse;
  </response>

  &XMLTaxQuery;
  &XMLStandardDetailToolbar;
</grid>