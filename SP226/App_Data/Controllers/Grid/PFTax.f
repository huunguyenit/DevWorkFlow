<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\PFGrid.ent">
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

  <!ENTITY f ", t_tt: '[t_tt]:=[t_thue]+[t_cp]', t_tt_nt: '[t_tt_nt]:=[t_thue_nt]+[t_cp_nt]'">
]>

<grid table="r30$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="5" id="PNC" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c73$000000" prime="r30$" inquiry="i73$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
      &ScriptTaxInit;&f;<![CDATA[<Encrypted>&ZlnBcZ26l0kGG+HmwaXcNRkGRWpdyjrgQ8xtdnIG/cQIr4gtFcNIXfUiNURwyUxXsIo0E1LOu3GE/8yIDA7W8Q==</Encrypted>]]>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtdRv1YhR9e9Dl5cHVOOvzXwlPR6lInIRz6lvy+KaxUMWlaVQSnuiI8uvbE+03LUC0deNG60c2n5S/TYzuGEkickgHTu9GYD+vwfg0Y+o4Ddn5FSoTuHDB5Gln4QogzwlyPr2H6n9fFVVxJvQRtbtke51P/g3mMNvjbBGGhmUT6yrClOkjmPWjHaWNPUDz2bctxdtcuCoYRDTzRAwu7JMJoVlf7jxCbaevwRQz7JPJ4rnfhq5R7CG8iWR1skfIMsE7fp0pH8x5EmGgbqDZb27Ic9u7a2IjD2H1xsx25h14FPqEiJxYFkWYXZS9SSXTaHKSxwkjleAVuWuRv+e21jLvonEn0KYjOajI5YWqwFV2DPkopzAQaoH5UG8CFcRNJ+XxeDTBpd5LFJthGkpalxFP457Jm56j/Hcol2Q4+/vs0MFhds73EnruX/1ZzsbXAjKMVoHHUXqp7b5XNCQHAep9DErL3M74VWNbehA3fTW6cZVXOUhKRCDaBOHDKEYOf8/yTjFy3ccAw7hjnEvKz2avmApgNbymNHycYXT87isK1HrD5i5pYxcuGk/YvroacJSUsO8spVHBdwjbOFFhzs5R3Jwa3RKIxznTsUbbHuS9u2f</Encrypted>]]>
    </text>
  </script>

  <response>
    &XMLTaxResponse;
  </response>

  &XMLTaxQuery;
  &XMLStandardDetailToolbar;
</grid>