<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\CDGrid.ent">
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

<grid table="r30$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="5" id="PC1" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c51$000000" prime="r30$" inquiry="i51$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75/Ly0zZw/zjT/p0Msnxfl7qVy09w45rmnCdnWSHJ3z3eYuT0ojmB40naUIGBWv+IWVhnnsiP0v25GqMaQn49RKI=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptTaxInit;&f;<![CDATA[<Encrypted>&ZlnBcZ26l0kGG+HmwaXcNdJk35iyrmevkn1yezQUIkY+zlyQ0PXLVC+O+dVqtjUwlFrOvhCzDqCY5MxPO+N2XPDfNdO1Hc+fWwCjetXpDGR7IccsUeV5MNdHtoPq2PKoPt7wJnu0bPdLG46waWqt4PSjppBxldm2uEPL5WSsb6I/DW4VXo/rtn/szF/RdQoN9mXkyncd1sqKIt+su/gZd123+x5/bbsD2sUKRM6rkOatHnB2K2u2FGw71vW0kWFtHMrbRuAB+OPi+qHAyFSrz/LqqIL0qcfTsiLQuUqrNXlfExU1RIi2/5DRwSDnGEv/aoisKlpVk3HjKXm+JnPhTuOtVWaWwgxDJDwSuXsXqBJ6R4spWcZxKBU97nach5WtfdZ+zaaRketNVbLsW0pLVxiMtBS7oMV+EyPsudRdQSeTV1R1JF66I8EdrRXZfBUB7gm9Mn4Zur6ybJH8ndndmqwYv2iL48OLwJ/3lcYBMsclaybIEsGVgDIaNis9LVMrJkUC0o48uYqfxYXysnq8EW29ts05uZsIP55RDZd4nUxD2QZefrXAA+kp2ffx6Ov+4UoLI66XwHI29XGW85SuGQNp7vmlEFPcUuWF1Bij8LfF9Nv9VznqhGguxzT6HrRYogpljR3OLfOwKEuHHl0eyMmAZpB1OrZ1XvwrTPfIE4gCKiMOHGLYf1RAgS/hX21HEE8NS8HV8GEQolNczba/zUUl9jy3JVhv53C4nDfPSVCChmnjIRp30DfbL3WLH9RSPLflLCQJw2oYakZc4dDlFY2v6cRdOE3tHa3ZytlxjUbUSAAaOCgVthXPwSWF05mN</Encrypted>]]>&ScriptTaxGridDetailAmountDefault;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4U79NbB7oOxo3ptPS/APbH1yYQJ4Jiw88PPQpOTuRtnWzetUteJcNSC6pGhqX6jmwyIjt6fn3fJbg89P2AQuNoLdQwU15fSQqSTU41cxOLTkskKmIwEiL/9SB3h6DwmrPGQso5yDcdj5rn44RVXdF/E=</Encrypted>]]>
    </text>
  </script>

  <response>
    &XMLTaxResponse;
  </response>

  &XMLTaxQuery;
  &XMLStandardDetailToolbar;
</grid>