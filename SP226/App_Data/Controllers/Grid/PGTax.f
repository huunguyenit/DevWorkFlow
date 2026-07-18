<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\PGGrid.ent">
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

  <!ENTITY f ", t_tt: '[t_tt]:=[t_tien0]+[t_thue]+[t_cp]', t_tt_nt: '[t_tt_nt]:=[t_tien_nt0]+[t_thue_nt]+[t_cp_nt]'">
]>

<grid table="r30$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="5" id="PNG" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c78$000000" prime="r30$" inquiry="i78$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtdRv1YhR9e9Dl5cHVOOvzXwlPR6lInIRz6lvy+KaxUMWlaVQSnuiI8uvbE+03LUC0SWEG57hm7rRTelafl3ZCev1hPfwZ0y0QsJVVkHM38wVRcOnnaR6rjMrTK0Rt+xCUtUGQWWXxOD4k/JkT7Q4fHS3UsZioA9aDTezGpRSO0gOo8G3YJJY9nE5D6jHTsec2g7IIzDvhefav0RDYDG/VukRFbTvbHiemWPXJ+EgpMVp3wZTeSMbo9qh9ilaJjFf3JL1gLrFWzWGUWSS9NmNNmA4cFaXbypXUUDgePeKGl8ShKFVXcRqF+UBXIe06jmdzQYU8r+MZX2OEuFnZePReP/50Sklf3ugu7dM3Q5Gkh+PnLIVsBPfvsHe93Br4MR9/MgsKIay/gsSS7zh1pi4n43FUo8L18nrt2tzLsxsYghYx8+lSNJUBAvQ10qDuBVPi4+JSRfywwZCi18gjIouZdrg2O1N8iV0bV8VDFH7C4tCWEelf5Tv7r+z0mT54LpXvGJq96aQa39g3N6zc2Xzb+0ByrjTk1bmO764YIlahQXxICyaxinM3EBcdq27SihUbrf+i7Jls1wjLzgi5sX4Gzg98u7lQc2Zx6VbCOMOQKYs</Encrypted>]]>
    </text>
  </script>

  <response>
    &XMLTaxResponse;
  </response>

  &XMLTaxQuery;
  &XMLStandardDetailToolbar;
</grid>