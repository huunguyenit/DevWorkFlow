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

  <!ENTITY Identity "SRInvoice">
  <!ENTITY DetailTable "d81">
  <!ENTITY c11 "Mã khách">
  <!ENTITY c12 "Customer">
  <!ENTITY c21 "Số hóa đơn">
  <!ENTITY c22 "Invoice Number">
  <!ENTITY c31 "Ngày hóa đơn">
  <!ENTITY c32 "Invoice Date">

]>

<dir table="m81$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Hóa đơn bán hàng" e="Sales Invoice"></title>
  <fields>
    &XMLFlowFormFields;
  </fields>

  <views>
    &XMLFlowFormViews;
  </views>

  <commands>
    &XMLFlowFormCommand;
  </commands>

  <script>
    <text>
      &ScriptFlowFormFunction;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Yu2lGxHKUKCi4ICByL1LNEKJJtxt13s3AElWpd5NAmC</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl//VVNNvl4XCgLv990U/48gobbG9XDQx/mSGrclDfjIq9Bw87cBcUmgKd8TQu55UmP0Ur0Qqn1PMvIAHE1dU1BS0YM7axWRsch5IR7RZ9t6qEdn5Ow1UBFw9oTQDBKSDHLImzpy2OWSDeoEj6a1VVEZCbVJI4o2YH66ifNjlj74j6r+s6pC/1fFJ9c0xyNtvweAsYnWRMX1qZvUN9DMqcO1iDvS+C3Nn7BRNlDzDUo0pWcQ90LrdUpJNjFcABhANH6XR9WQTqbBotFn3/ddbKM2DifYjmNgM+ZrFlDqtKmA9V0O/XVBB04uxL8XdHCDiCssevaSG3AP0+mXAVte+BXChvjD8CIASF9+WuE9Gly2lSlVQOtNw2JR9Nan2faMdQSAJyqlafqr3/NQj/8wLivvQ4PbiRT6FR1D9VQod8TM/b7bgWGq2pB7tiz/Jqyo09uv6Dn+/zMBuIh3ndFl3vvE89PwaB9y+9wa9JbzhH4G0NPQMQFs1rWZLKwzPsrUE0BYrvv3qKCRLm1rVrONTsJJK7uEdlKyGgC8eppocusaEUOs8feADmltqV2es++CRhAQ==</Encrypted>]]>&XMLHiddenFields;<![CDATA[<Encrypted>&G75wpTCBEZ8vgldpJvT/L3KIP1znAUSu71i+9C2k+egkB2DWsR7HQnnfecO6i27U</Encrypted>]]>&DetailTaxFollowCopyFields;&EnvironmentTaxInheritanceColumns;<![CDATA[<Encrypted>&+yRcV3XtE2MrYJ2A84tg6IkGhvq87gsV6V8lEPBLz60Ylg0gWk3Hu0OmtdH7lOrc1bhlV4OK3rOq07c4ByudavtRgBmPnFtoaqKujtIXW/vLkcF2BCUxuFsaIVALB0IyN1z/zcf+215VvD07pNFW98unwaq538dG+NdhS/2/6hHNNFZsoiHZH9noTQnvTpvDdAXkccqL6LwHS/3aeNyLrW1d0GA9QRCmPnparLhIZ2TInUO8GWYCxCAOik5rM1J13oqWCa5ng8QMS/msnO0OMMTIs/n5V/OT0jGgegv9mugFn5MoKlfbDG58ywEGoB5vJJTgjFM7ji96nHoV3Us/ZnSdlU2EzvsiOElyAJ3LfFA5youx4g9YbHG6EVhDWe4FR+R+jx1E9pTG/XwK5yCaR+in41/STE5sf4g7xqSsabw2J9kw4bmus8aLB4PZ+2Z3IJg/DZ0R+BVrRPAKv1ZRHk+KnB3UB/m/WPuV8JsgyEcCktqTkqIbA6LjEV0vkTJq</Encrypted>]]>&DetailTaxFollowValidDetail;&EnvironmentTaxDetailChangeQuatityInheritance;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP/gGXjltxUum96kSYcnz3wyMp3N7Hk/BtJkjLzzoEjym/U2JAFAaeVhLKGuoQn6h6WrQwe/l2UrLLRRPDhXcLi50F8ooLwgrHTxU09bXxo9VSbzrWuWWAkDndJx4nHKdVI4IbXeDW7lBYMjr2kTpPy49oqNQ8jRHe+rAFCFhMUjXOZP5K+ZGzjn0fGFZ7SDIYbtGpDS3BG6LJB4ct4LsCkux7UZ1Pku0M7CleoO9n29x</Encrypted>]]>&EnvironmentTaxDetailChangeQuatityTotalInheritance;<![CDATA[<Encrypted>&im/F9+/L7KfDV5duCZdE5HxcfVAkh25l4jWQXerStlUpk0IAcPFIZBN3oL6Dl60S6Icxd3c1Owi4MhPTjWigZnIRGRuv10/55TtXoLC7UuKi8+DNjQd6IDQogrAIcYKAGisMXXZh1M31PQyR2pD6Vu6hpe0mL+TebSwj7n1VwXFt42yWsNnB0USJIbSq7Cza</Encrypted>]]>
    </text>
  </script>
</dir>