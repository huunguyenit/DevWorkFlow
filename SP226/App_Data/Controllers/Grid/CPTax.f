<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\CPGrid.ent">
  %UserDefinedFields;
  <!ENTITY XMLTaxFields SYSTEM "..\Include\XML\TaxFields.txt">
  <!ENTITY XMLTaxViews SYSTEM "..\Include\XML\TaxViews.txt">
  <!ENTITY XMLTaxResponse SYSTEM "..\Include\XML\TaxResponse.txt">
  <!ENTITY XMLWhenTaxLoading SYSTEM "..\Include\XML\WhenTaxLoading.xml">
  <!ENTITY XMLWhenTaxClosing SYSTEM "..\Include\XML\WhenTaxClosing.xml">
  <!ENTITY ScriptTaxInit SYSTEM "..\Include\Javascript\TaxInitExternal.txt">
  <!ENTITY ScriptTaxClose SYSTEM "..\Include\Javascript\TaxClose.txt">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">

  <!ENTITY ScriptTaxGridDetailAmountDefault SYSTEM "..\Include\Javascript\TaxGridDetailAmountDefault.txt">
  <!ENTITY XMLTaxQuery SYSTEM "..\Include\XML\TaxGridQuery.xml">

  <!ENTITY f ", t_tt: '[t_tt]:=[t_tien]+[t_thue]', t_tt_nt: '[t_tt_nt]:=[t_tien_nt]+[t_thue_nt]'">
]>

<grid table="r30$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="5" id="BN1" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c56$000000" prime="r30$" inquiry="i56$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
      &ScriptTaxInit;&f;<![CDATA[<Encrypted>&ZlnBcZ26l0kGG+HmwaXcNdJk35iyrmevkn1yezQUIkY+zlyQ0PXLVC+O+dVqtjUwlFrOvhCzDqCY5MxPO+N2XPDfNdO1Hc+fWwCjetXpDGR7IccsUeV5MNdHtoPq2PKoPt7wJnu0bPdLG46waWqt4PSjppBxldm2uEPL5WSsb6I/DW4VXo/rtn/szF/RdQoN9mXkyncd1sqKIt+su/gZd123+x5/bbsD2sUKRM6rkOatHnB2K2u2FGw71vW0kWFtHMrbRuAB+OPi+qHAyFSrz/LqqIL0qcfTsiLQuUqrNXlfExU1RIi2/5DRwSDnGEv/aoisKlpVk3HjKXm+JnPhTuOtVWaWwgxDJDwSuXsXqBJ6R4spWcZxKBU97nach5WtfdZ+zaaRketNVbLsW0pLVxiMtBS7oMV+EyPsudRdQSeTV1R1JF66I8EdrRXZfBUBB3ajsOSFYUknmoHfCItQKM7UQiH/v5crwll9oxhPTe9OSENoj2cnyh2VpobRVZOgIQKCmIgqGLXw93arxuOelaiHU+wxtPO+5PtaREt+C4Bt/dXyhVaFpFVWckL0rWTu/wKxPK6d+wbcTqyOABiwh04Ioa29PqFH1M9/P421+6AuVx9TqMcVb7H1Fr5CmDMQB/3dxhX9h2GW08vU3qHMH6VJMXg5s05W0PVLEdVesh/4cvRP3JKNQEXiTDUrqugJLFya8bCcYILp9SDk4mUpPJgBe+GkouwoOAlhgEA12ees7pCia2uNBAE4t8rixAB4VfTbjKiVsoBhKaWPTURN+yhC/cpMeI+zJa6PjNX/BwxUcDjiS45hbpmlPAGkKFIA</Encrypted>]]>&ScriptTaxGridDetailAmountDefault;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4U79NbB7oOxo3ptPS/APbH1yYQJ4Jiw88PPQpOTuRtnWzetUteJcNSC6pGhqX6jmwyIjt6fn3fJbg89P2AQuNoLdQwU15fSQqSTU41cxOLTkskKmIwEiL/9SB3h6DwmrPGQso5yDcdj5rn44RVXdF/E=</Encrypted>]]>
    </text>
  </script>

  <response>
    &XMLTaxResponse;
  </response>

  &XMLTaxQuery;

  &XMLStandardDetailToolbar;
</grid>