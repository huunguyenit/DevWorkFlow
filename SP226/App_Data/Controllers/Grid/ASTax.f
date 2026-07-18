<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\ASGrid.ent">
  %UserDefinedFields;
  <!ENTITY XMLTaxFields SYSTEM "..\Include\XML\TaxFields.txt">
  <!ENTITY XMLTaxViews SYSTEM "..\Include\XML\TaxViews.txt">
  <!ENTITY XMLTaxResponse SYSTEM "..\Include\XML\TaxResponse.txt">
  <!ENTITY XMLTaxQuery SYSTEM "..\Include\XML\TaxGridQuery.xml">
  <!ENTITY XMLWhenTaxLoading SYSTEM "..\Include\XML\WhenTaxLoading.xml">
  <!ENTITY XMLWhenTaxClosing SYSTEM "..\Include\XML\WhenTaxClosing.xml">
  <!ENTITY ScriptTaxInit SYSTEM "..\Include\Javascript\TaxInitExternal.txt">
  <!ENTITY ScriptTaxClose SYSTEM "..\Include\Javascript\TaxClose.txt">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY ScriptTaxGridDetailAmountDefault SYSTEM "..\Include\Javascript\TaxGridDetailAmountDefault.txt">

  <!ENTITY f ", t_tt: '[t_tt]:=[t_tien]+[t_thue]', t_tt_nt: '[t_tt_nt]:=[t_tien_nt]+[t_thue_nt]'">
]>

<grid table="r30$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="5" id="PN2" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c32$000000" prime="r30$" inquiry="i32$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70PqpbjO/0Uw25iSNDCgXGrqvh8iL5sraJxcr6TBJ+5lViFKP8fReQg/X9wRoZTvcaPNHjmucSmoH09rvhLOOdv8Skxb5Hdm0fjEfbKApYp0auYApmTdjjzUCHVm3WL416o6JR3AuASt9Q4a/+QU63QrRaDO+ti1eDhKwevwyA+g79xZRgdBDZnE4ZXL10/p+q7FELLtc0WstWCllC9PYd9niJFJ+/uYZ4nzkGra/y/W2a7cvk19dBLEZXyWPpGQIyTujXs2pAlbKPiCd7ftp0W+26vcUI5q1Mq94K3UuNjlg1vv0ixagza+va1wN3RYYwpY1CUExwhgEOnBAt0UVkAc13f7svHj5PedMl314fGBR/OLun/ALpSGowc9Yz5WRG3nUbY8+pcQq3Oaxg76zlX8X3dGLq/gooHc3q1KKocxX</encrypted>]]>&ScriptTaxGridDetailAmountDefault;<![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7KsJtdyTrqricFoZ5c86+2GGLrRclaagkTK+ql4oo02AXLwmO7muAGfkUXaGylcqEee8Ll/tfDIM+D+q3qLEaBywJIEv6+dPkNRvTGWDgWrRuKmSdMWIED3x01u0uqlDng2mhi4MdP0+ltKPIwYL7n3VP27L5kR1KEAKzrWllMa8Nefyi07upwGX6cJELoU3Bk7TF4GDw2HMT/NRnAAd9cErjqt3bzHhxbe5izsyJCWLz86P6DWo9rW5mBDA/nPYLwv4wS97FAE13A1y573TjN44=</encrypted>]]>
    </text>
  </script>

  <response>
    &XMLTaxResponse;
  </response>

  &XMLTaxQuery;
  &XMLStandardDetailToolbar;
</grid>