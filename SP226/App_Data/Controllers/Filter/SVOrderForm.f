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
  <!ENTITY EnvironmentTaxComma "">

  <!ENTITY Identity "SVOrder">
  <!ENTITY DetailTable "d64">
  <!ENTITY c11 "Mã khách">
  <!ENTITY c12 "Customer">
  <!ENTITY c21 "Số đơn hàng">
  <!ENTITY c22 "Order Number">
  <!ENTITY c31 "Ngày đơn hàng">
  <!ENTITY c32 "Order Date">
]>

<dir table="m64$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Đơn hàng bán" e="Sales Order"></title>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Yu2lGxHKUKCi4ICByL1LNEKJJtxt13s3AElWpd5NAmC</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl//VVNNvl4XCgLv990U/48gobbG9XDQx/mSGrclDfjIq9M97pMYWDbYscck2MFyyuNwBMS2bSUZTxqR7sXpn/szUFCaN5vmmdtd84LK/AXqA+ImRbgZzt7y0h78GBxkX0aKXB62DnlbJYu2/LnSzbI2RRJFWWto2sJ2+NrlYWKkzxQd/n+ZkJqojvawePSAHiAkF00W1lambAHGuPi5dYKMnJdKtmEr0hxUIdJcLoGZ27bq0H3rXt5qP+ZFkvHN8pnBsLibX3y+2H+ntIZ0k84ewN6RyY5CHkA3TXudxWXUadGEhdWh2AEhwmbnGtKU64pLI30uyTbAfI8H767sRNXRdBnClQMGTmHLX8pzh7czvjCYexj9r1ikYie0Gyuz1dXZmHKij7RBbQJi9vzu43xDGQwmso24ZhdZ2tFRn+jK1qZ430CkbRh+qiQX8tmCLDMjYYUqsWWrWQa1mBhf9wlHCHjlmjXKL4W5WJq2dduPi6qHKjOAr6IMk2mHj63jDOEd31UvP4FeDue5tF2+9VKRmpu3M+yuPX6mJ8nQThOakcOEIEiJaiVDp59Yy0atIswKJsMzxl2IPYjsxhJwMtDO5ZSYX1Jv/L4/SK8/wSh2p/XiwJUdirAT/Wbsc/IEgZ4Luf4POfoSQpIjHP6FjaLZK+NDfQaQYcYbLdByee0vRcYmHpSFIgZ1GflmyZLaLhupupcbK7aWznMt2LwXwOtJZj4cwjaAv8SbZ0FjhqoPeES+uymKCs4Hc5uAKSuLfXfe6JF6e1bgCLuS2TJpT5qMbsA+u4l2kiqlqP3o76Y3GNJvWPhahUSTsbs4Kw67LbdtJhyhC+zbf+bqY/TUdtT8bZ/m5n0s05ajFXptsrAObI+tDbtYbx2+/iLcO9xUgG6oKHZ85utbkt4WgDE8yyBWzRa0LAnjzC2rh2N4suDo91</Encrypted>]]>&XMLHiddenFields;<![CDATA[<Encrypted>&BOZjxW2GeBQn1R6O6BtYgqqDkh6Gf7wJh8RJiRUFaSMwuZDACDphtQ6Je4E3lh2V</Encrypted>]]>&DetailTaxFollowCopyFieldsBase;&EnvironmentTaxInheritanceColumns;<![CDATA[<Encrypted>&+yRcV3XtE2MrYJ2A84tg6IkGhvq87gsV6V8lEPBLz60Db7PLmfJFKEwCSmMiRrR0LjnI0R2clUJQpNsvG5/bH+isxLnkur7JZhVMExBzBWh0gB88oQUsuuvi1KYruFoMYtfhiZFP0RXndrVsCj3nKHHK1i4eAazgYP5BIceqhA8o6YHQ4+1kkMtwKXXNfc4cc9c3QUoBmnveNMrn28BZd0Im0u+0/BjzaOUvY4wjblU+KyLUYD/MLD+OjPib02QpQGA3TtXLA+d972onEgj7CD+l3cHH9UOK90gx5PpRJpmPygeqf/GFgUnVBLCsKHCq5uSyf9Mm1jhaflqYsUZcYhy1xAx5E+MUbC33bxOR5Aj50xHws5zfPlwrtBXjpFJwwv0xj07FG78nsVRzrkPCbMFTMho7b1Rv2Vic81M9tntD5Z4WPz1m4Bf07rFdTEDQosLWeEbLANtMf2NN9z3dq2b+VN3nSwv6MnWhEoIU5xHzuILmBc5rCJgeydV3c8OBVB/0TEBXWv9hG9UdZhVgqNd9Xtf64ZC5LQl2MuwTK5Y=</Encrypted>]]>&DetailTaxFollowValidDetail;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP/PB9PzfmnPB3zSD8G2EIrqwmH3U2Skaw8ouIefi2To538Bv3w9J+E7uFDi8apCWpU/VxUS4/n24iGxmKafZVTPsXCCF3CnJ/x21aW7/KoFb</Encrypted>]]>&DetailTaxFollowValidDetail;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wPx53rtj3AgLrbJrLA/ITavt8QvcZanahteFabkd6H8KpwDmro15a4v8hcWVcuuLwwQ==</Encrypted>]]>&EnvironmentTaxDetailChangeQuatityInheritance;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP3zp+LLYHgokIgL1ZwlUOWxtMIylaH9Hwll9tGhyB7B6E4uEdwFosoru4BlLPZlXPfmVXqE78l3GrW1LxQUSMtzk0TpMksdmWUTemr09/1BN9+GV8O5q4xo1VRQrQImjLDYGT94wkk2LKrV/ODIiS2dLoD0jYMIb+n/IyzAqRarIbGVv7UEcS1zXVT+v+aDWL0B4t8atZjRH7UTFfvCyZCGwkJ8nvlIIXbMKhLwSO8XdBntmCEAoI3b8gkhrXdUPjZzqOAL82sK2Czl/MgvvrT5QpKq8yG93RqO54SZYxdC6zHGZ+98PjFXuxhryACvxy7Kj6xumd+L9DTLA8FGLMmD8XErSPdAqA4h/tBTPMz2w9d9ROBpp99O+7HgcHXWYhZn0fX6s7bj+0HjXEiEvaurObbZFSLsg5tWJPDdDabHdQ2KI5EzUEZUr8JBRKR57BGkEMSA3/jT5c9OLLWac1sWz77XAMgQk9y7QpzTO7uuPjjtbGv5LDoeQkRDHC5+A7zynjBIxNJfxmxUA1Am+C2GtWL1qvdhYiicS6yfGVJHJ1njYxQ7r1Uk7Mv1/ce5tvS12XzSEVK72vwKW8VzLxcj826b6ds5w/DVvQTtzT1lM</Encrypted>]]>&EnvironmentTaxDetailChangeQuatityTotalInheritance;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wPyUIWZAnb0xVdoMhqOX4XhYvqZz3N2DUTo7IWY6g7wohk43mkg2rk79Y6drlXdUm7Bgo5IyDU3hRaiGTMZ117Wz9NRSVeWLm8hjHauurDsZP3vkivy0aXW599JnxnT1rM6ScbuVQ42O/57OO/vEELJo=</Encrypted>]]>
    </text>
  </script>
</dir>