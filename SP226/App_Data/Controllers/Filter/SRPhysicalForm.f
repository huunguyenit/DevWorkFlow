<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY % EnvironmentTax SYSTEM "..\Include\EnvironmentTax.ent">
  %EnvironmentTax;
  <!ENTITY EnvironmentTaxComma ",">

  <!ENTITY Identity "SRPhysical">
  <!ENTITY DetailTable "d36">
  <!ENTITY c11 "Mã khách">
  <!ENTITY c12 "Customer">
  <!ENTITY c21 "Số phiếu nhập">
  <!ENTITY c22 "Goods Return Number">
  <!ENTITY c31 "Ngày phiếu nhập">
  <!ENTITY c32 "Goods Return Date">
]>

<dir table="m36$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Phiếu nhập hàng bán trả lại" e="Goods Return from Customer"></title>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Yu2lGxHKUKCi4ICByL1LNEKJJtxt13s3AElWpd5NAmC</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl//VVNNvl4XCgLv990U/48gobbG9XDQx/mSGrclDfjIq9ZTRCvKPwEATTyezomMDssGZsfsBuwbCOXIVXn9pzLYkjPkiVVlbkakUhhGP97PBxhJclGYGx4E1KDDXXwTm8fuR6u+anHGBKxbVYbOZqg7tg9ZETRqQ0439AzsjqCY5m/WQLGSCGDaT0d6h+hw89zYkeco2HaTNbHgA5zjuCYL+vqTveYIFWUWLZtu62BnEGJ116wXzYEMto7TiD/isa6dtxqkLQK4f7W2Y+XjQQLhxCVtv2sW+QKurgV4my/pOa3ZJOpNhsil9+TBhtlilkUJo0tp5NPEC8JervtnArCKZpod/cFz7ezYxVdNj3yKnDwqVVHWuDi6l3zRAlmutjGgKENmYFPmt/s6EbAhEiZ3/OHXFker3viCt3qDLJMoJSZbBxeJuG10CBLCbZi+CPOSqHopFymMo7a4JnXKq9DSBDvdTDyEHZoFB4jy5B1uAI2yYXP1ujpqrzhQnDD13aP8WkC2fvNzeqTumP1K2kWmc89hZ6DvCY9o/avS/SVmn6AnrGCyc9FbuUMDeuqexZhw==</Encrypted>]]>&XMLHiddenFields;&EnvironmentTaxInheritanceColumns;<![CDATA[<Encrypted>&+yRcV3XtE2MrYJ2A84tg6IkGhvq87gsV6V8lEPBLz61LhCDgIQAmtCAPK1zJ/U5YwanciH+LPT0LUZw5ryy88g8DuovPJmBNy/6bTNbtIPgd85w5s1TdjLJBEL3fJjkEWywgAbA+XKmR5wLOVGMIUxWzF3+0hG6cKJn6NCJuAkmOyjn4YoPVehcsBv0vNWNuEddaidUgv2qcgv7foN2ZZ9qUCXamYN2+BlpwmKCxImvovpcM/cPU7kNZOsQgu8e5hNjfaZYFVxM9xCRFs5dTNqBhmZ49JNdQwXP3zbpSkB8LWNpsXQASth3Hly36PO1BmUCk7auAVl9djJniIfRvorHQ9HYyCGL0PTqbrxZr92Fz0lktyGVwwloCqygZA+LzY9k2u9/f5xTJr7RG5p0Pe+7QNNP1W+v3qVZYkeKHXqAKU6o/zPl5nqu/ExmlIhT7r65nx4znXAky7fOeRiD3U864y39SN14qZTQqjJ/CdWg=</Encrypted>]]>&EnvironmentTaxDetailChangeQuatityInheritance;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP/gGXjltxUum96kSYcnz3wzmeuFwBYlYywK5CUhUnoUV/iE2g7uYvSr3Qpvxm5Oyt6QwXwyQA3MjXt7PonWbl9TF2J/iMq4gGeINW+vFyN5KyPKqDr7ezS1x4CVn2rj0ooZoEjYy1X6ZEmwZ2n8LTMeOFDR1lSKONwwokt148SqyNkdEDVEwByQpFNAlSTWv3lUfHxnFJ0jKQg/Z62Oh/CZTiLtffTa39bRj9qbrI3YU8Az0G+DZreMo0Wg6fOHOVV6WsI1pyXLqo8ccjej52mk=</Encrypted>]]>&EnvironmentTaxDetailChangeQuatityTotalInheritance;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP7PA7FXaFeOZu8Y8U7JYCr0taUxrEuGlS7Lu6y4RlabxuqtcWr3q3XVruGgmKfe5FA==</Encrypted>]]>
    </text>
  </script>
</dir>