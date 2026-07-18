<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY Identity "SOBlanket">
  <!ENTITY DetailTable "d64">
  <!ENTITY c11 "Mã khách">
  <!ENTITY c12 "Customer">
  <!ENTITY c21 "Số hợp đồng">
  <!ENTITY c22 "Order Number">
  <!ENTITY c31 "Ngày hợp đồng">
  <!ENTITY c32 "Order Date">

]>

<dir table="m64$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Đơn hàng bán" e="Blanket Order"></title>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Yu2lGxHKUKCi4ICByL1LNEKJJtxt13s3AElWpd5NAmC</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl//VVNNvl4XCgLv990U/48gobbG9XDQx/mSGrclDfjIq9M97pMYWDbYscck2MFyyuNwBMS2bSUZTxqR7sXpn/szUFCaN5vmmdtd84LK/AXqA+ImRbgZzt7y0h78GBxkX0aKXB62DnlbJYu2/LnSzbI2S2KuH7jYdDjhlJr7GrLQzLVryxpXo+MHei0nNZDNH3Ax22jAo8RZB4LptxiuUq46/+hp6m0bMQboFJzDjyd2/KdP4GdPe1osW4EQwo6mbU24A9kWZ2pHhOMq5zlazJ8EikXxhbeQb/37V1DITXlFQLdo+9IYI1FdLbM68V+QxmeAiYmDcIwA00hH4U2OfzwEKCIF/ZXeYxsrsiGYlbCgtcEcThc8UEjsmExoiMo4L2WN4h5xayv5nfpn+DPWb1FR/zPWZHIxjN5CdsadqapdQhRnouS1X62VvRPsAvgGdcb+ehhmJCPJQpNl3HLE0SUVyQiA+Xa+5v1bCChxwJ9xpDzf7xmLwDbVvN6XscW1sk0w==</Encrypted>]]>&XMLHiddenFields;<![CDATA[<Encrypted>&+yRcV3XtE2MrYJ2A84tg6IkGhvq87gsV6V8lEPBLz60Db7PLmfJFKEwCSmMiRrR0LjnI0R2clUJQpNsvG5/bH+isxLnkur7JZhVMExBzBWh0gB88oQUsuuvi1KYruFoMYtfhiZFP0RXndrVsCj3nKBJIvXDfLfHyXnqvlbNIIum2ICLxmbj48WyKt7T1up4nmrWKumAWrXgux0fHvhr+Jc2ihBhx/PbzyP22CTktQ7UKJnhIaN+HAABbCwsDdtnrhili7S6KSsM5YQrZvkliGSj/JppeqZdSEiYCo0jok/WckcAN6Drl1L/vyOWEJqbdA42kabRI4l4DwiTIQG6I5ADrxw3/whvxKkMvVvlVqGUadffUhmUBoBd3vX2U+hoG4i0NanAjGWycB6qHTyLDs3Ag8ZyXOibn2QqcqPp2KFT4ienmr8Xn1HX6BaD9Zdtuy+77JVxqBXFBNjg7unnUpKcNMSCkVNB4T/rNkgs3yE1lf3hF4f++4BDBQ5g0RtdlNhAtuciruNzLrIVFhmrj+eTXZEMb2uaYmLM/orYlMNxBWEMj8f2KWGk08CxwhI1Ynvpr3/p+zdi0r2e9EwY9R8vAplo5Gtgd4/4DSgyui0dLvPTRjFeW4uvVhqHEasHNte4UO6tuTKk/3yDHstCT70DO8J0+Li8hgqbBK/bqIPJ0RlmLT2Vzt/GePS3uHvqGAXLtgPxy39HaBSokUetvDsqdPn4dW+S+Fbw8FJ/NaFx7puiNaRiKc09DefiPS8qQ0qdciXov9wvH4j74oDwuZT1Gy3R55LFVCyX4LlVwiZVUu80MljirbStUbq87TRhVRniN8sjzkfDAL2PkOj25cQ==</Encrypted>]]>
    </text>
  </script>
</dir>