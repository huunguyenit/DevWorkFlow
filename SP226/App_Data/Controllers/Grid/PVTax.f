<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\PVGrid.ent">
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

<grid table="r30$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="5" id="PNA" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c71$000000" prime="r30$" inquiry="i71$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtdRv1YhR9e9Dl5cHVOOvzXwlPR6lInIRz6lvy+KaxUMWdZOMJhjUoeFeJ932cZMN3Gv7Abrvg/OBIpx0S5D+n0w2DK/V3NY39vTCADwqoaGdv78gU1JIs1tDY5zZ60Ay+WO7I4wKlnSntDUhUbzrwA2zksH6jzjHDN6Ze7obvY5/gwUcW4hm+Px7IUao22k30N+RPf3BNpfW1ULj6PFpDG6NcZA3241NmtrpTGryhQXMPYf43QzxCkrDgMW4NtMnxGzBDn/bm/4PW53XN/ZbRWfNFsi+v0X0mwX/VlEEavYu2pTq5pD+W5EgVwzqHyT4wFEeTVDbi1MbWh3fHu5lsmtbyXOgFcIYVgdEkvy/LmYXFRTyr5zB3Yr6xCv5qw9rGB6+UCvdx0qgh60CDBinbafMdul6GOjXnOhPpYtcwlTg8oa/lmImJsR+19aK0tvvfJkS9M0SVakWqORkmArzKjKRnlgErEbWUda71a49Jtn7q2XM92SiGZOeWQp4muFnqRJCWtxGh/Sx80YQRnItp/L2iYtMH9OZqRJq4/NUR7cuiLwMAB05jmdCKcikDgZ5kcnjaI+qzRRA/sn8nXdoY4jPUi8uVfOKg5LECEYJF+8f</Encrypted>]]>
    </text>
  </script>

  <response>
    &XMLTaxResponse;
  </response>

  &XMLTaxQuery;
  &XMLStandardDetailToolbar;
</grid>