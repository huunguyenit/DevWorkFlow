<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY % DetailTax SYSTEM "..\Include\DetailTax.ent">
  %DetailTax;
  <!ENTITY % EnvironmentTax SYSTEM "..\Include\EnvironmentTax.ent">
  %EnvironmentTax;
  <!ENTITY EnvironmentTaxComma ",">

  <!ENTITY Identity "SRIssue">
  <!ENTITY DetailTable "d66">
  <!ENTITY c11 "Mã khách">
  <!ENTITY c12 "Customer">
  <!ENTITY c21 "Số phiếu xuất">
  <!ENTITY c22 "Pick Number">
  <!ENTITY c31 "Ngày phiếu xuất">
  <!ENTITY c32 "Pick Date">
]>

<dir table="m66$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Phiếu xuất bán" e="Pick List"></title>
  <fields>
    &EnvironmentTaxXMLFlowFormFields;
  </fields>

  <views>
    &EnvironmentTaxXMLFlowFormViews;
  </views>

  <commands>
    &XMLFlowFormCommand;
  </commands>


  <script>
    <text>
      &EnvironmentTaxScriptFlowFormFunction;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Yu2lGxHKUKCi4ICByL1LNEKJJtxt13s3AElWpd5NAmC</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl//VVNNvl4XCgLv990U/48gobbG9XDQx/mSGrclDfjIq91JFHtZzQwwXNy5tf4x3GNPpxAquIU35hTRRZ6+UoG93yzb7ELkRE3HYEMS5ibleU0gYARw/b+6VDrPEz9+ZN1v7D7ymagJMnEerat5eE9+JYpSJyYcddgxvSnHXBM7OGWikB7yoOzLs7uhxmZEGdRQNubPTBtLAue29Oon9NyrYPl4n3FKhA196geMTMyJJw5Y/3wXCKtbH3veHzTnNz0cK6JCepJ7KssH8xmIpg9mcUKfYmJ5UIuqzw00JzohTTZXG/IlHE6B6mF5ZTmI0+hO1KV6Dw8x8G685VJWrukvciPTG9aBBNNorxNMVoRCK1Xaws4+MLI9cgmhYKuOQ0+M5gkrv/buqmbbwZOL2hJ1hNnS62u5AeAezrvDBc5uU1IQ01OoguJq4UjOSZrMQu4EB5GJe1wNQU5iyXEcS/wqyMgTvPp0J5qICh3MjGelG5JKE920nioCSmVrihA/CqTuiFZJYFSYaEWgE+0KnYTLKzStz290Y6KIvq4Ee6WvBb</Encrypted>]]>&XMLHiddenFields;<![CDATA[<Encrypted>&G75wpTCBEZ8vgldpJvT/L3KIP1znAUSu71i+9C2k+egkB2DWsR7HQnnfecO6i27U</Encrypted>]]>&DetailTaxFollowCopyFieldsBase;&EnvironmentTaxInheritanceColumns;<![CDATA[<Encrypted>&+yRcV3XtE2MrYJ2A84tg6IkGhvq87gsV6V8lEPBLz60Ylg0gWk3Hu0OmtdH7lOrc1bhlV4OK3rOq07c4ByudavtRgBmPnFtoaqKujtIXW/vLkcF2BCUxuFsaIVALB0IyN1z/zcf+215VvD07pNFW98unwaq538dG+NdhS/2/6hHNNFZsoiHZH9noTQnvTpvDdAXkccqL6LwHS/3aeNyLrW1d0GA9QRCmPnparLhIZ2TInUO8GWYCxCAOik5rM1J13oqWCa5ng8QMS/msnO0OMMTIs/n5V/OT0jGgegv9mugFn5MoKlfbDG58ywEGoB5vJJTgjFM7ji96nHoV3Us/ZnSdlU2EzvsiOElyAJ3LfFA5youx4g9YbHG6EVhDWe4FR+R+jx1E9pTG/XwK5yCaR+in41/STE5sf4g7xqSsabw2J9kw4bmus8aLB4PZ+2Z3IJg/DZ0R+BVrRPAKv1ZRHqBGHaMDHrtknlqx71rsW1c=</Encrypted>]]>&DetailTaxFollowValidDetail;&EnvironmentTaxDetailChangeQuatityInheritance;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP/gGXjltxUum96kSYcnz3wzmeuFwBYlYywK5CUhUnoUV/iE2g7uYvSr3Qpvxm5Oyt6QwXwyQA3MjXt7PonWbl9TF2J/iMq4gGeINW+vFyN5KyPKqDr7ezS1x4CVn2rj0ooZoEjYy1X6ZEmwZ2n8LTMeOFDR1lSKONwwokt148SqyNkdEDVEwByQpFNAlSTWv3lUfHxnFJ0jKQg/Z62Oh/CbIeXN7zNpJr/Rm9c3pcTuB0m2fhakxN1DxOTbolyJHXA==</Encrypted>]]>&EnvironmentTaxDetailChangeQuatityTotalInheritance;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wPyUIWZAnb0xVdoMhqOX4XhYvqZz3N2DUTo7IWY6g7wohk43mkg2rk79Y6drlXdUm7Bgo5IyDU3hRaiGTMZ117Wz9NRSVeWLm8hjHauurDsZP3vkivy0aXW599JnxnT1rM6ScbuVQ42O/57OO/vEELJo=</Encrypted>]]>
    </text>
  </script>
</dir>