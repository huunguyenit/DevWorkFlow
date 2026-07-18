<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY % SplitIssuingOrder SYSTEM "..\Include\SplitIssuingOrder.ent">
  %SplitIssuingOrder;

  <!ENTITY % DetailTax SYSTEM "..\Include\DetailTax.ent">
  %DetailTax;

  <!ENTITY Identity "SIIssue">
  <!ENTITY DetailTable "d66">
  <!ENTITY c11 "Mã khách">
  <!ENTITY c12 "Customer">
  <!ENTITY c21 "&SplitIssuingOrderC21;">
  <!ENTITY c22 "&SplitIssuingOrderC22;">
  <!ENTITY c31 "&SplitIssuingOrderC31;">
  <!ENTITY c32 "&SplitIssuingOrderC32;">
]>

<dir table="m66$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="&SplitIssuingOrderPickListTitle.v;" e="&SplitIssuingOrderPickListTitle.e;"></title>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Yu2lGxHKUKCi4ICByL1LNEKJJtxt13s3AElWpd5NAmC</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl//VVNNvl4XCgLv990U/48gobbG9XDQx/mSGrclDfjIq91JFHtZzQwwXNy5tf4x3GNPpxAquIU35hTRRZ6+UoG93yzb7ELkRE3HYEMS5ibleU0gYARw/b+6VDrPEz9+ZN1jDbhFE1LL8ZFSTvukvq4Vcm20FtObDb6F398H4zyu174pTJ7ekgE+rlrT0ysxtVB8y0cJcDXQWPLcyVgZC/KpLSYLA0ImJs9jx05whYI4pVpAur5l05Yn7JyJ6wuluHVUSSRBix96Jb1UnMlwsAOQSlhDgHEFy9aDtmPBbMwOM4lIFzKn0Ox6kxN2XQJ782Lw5b65kwljnPWXsu7C9jnhSPB7i31neWxI7rqJSW8E8CqEC+lDuwoHn4upJkH4XFyhGeeQxzhYz11K1ToG2nwg9vfWowotEGmVzgyYo1uqM0bJW8x8xPOenVZsDWJ1CClIH5jxBAz7ITkzU1g+RI9tunYCJwFLEF5MqpQ3g8Y3Rda9TRo3LvNJHolKIkOhunBg==</Encrypted>]]>&XMLHiddenFields;<![CDATA[<Encrypted>&3t3N/5ofOgok900XO0gvbFMUNZUTcT+XfC+WH+fzJLoH10/8YUkcCZOfbcMYWm8ZPpmkG9um07uqScrUNpFqshKJZDVyCjO0sGPg4iMMcg0WM5Y/+IkQV40+ke9bPTzm</Encrypted>]]>&DetailTaxFollowCopyFieldCode;<![CDATA[<Encrypted>&+yRcV3XtE2MrYJ2A84tg6L048v8GIgrjXW6VgADNzZf23MR3hBaaKENCaeK+quLRnRyiUicki7yR+GGYRTnTeC4+/Dm8qY386irKVGiBPyZ1SBRDzFsgLXu2I730vgqyS+2mhuo2v8T6l/pJjr4wdVCLibkonN1K1iN6+wJJoeSXu4u4msUzkmZtbBoOJkDa3g4UBf6RiZgy7/h2hgF542e6UiRmTuesVI3SA58X7JhMSPq7iBg2kFP5DeOIqUoqluoy+D4rFwLE1yGwHMLI/imczFC0RQOlIPyzaNDQypgk405Sw9wWe9mMkl3zZv8cy/lYXkEVe4KB24ABoXZhFfTKNBN/ZyinPpYgB9dAdThnvPF3VJPHdKd+3v9veImo+m+ncvWbQAjRgQNb0BwIEbOsJ7kbQ60CyHRr/iK680WYy8IayjCSAyQfNWqb62QjBp05QMaWXPnKynnrqXRfDKnrczjl7hT+svaV9wC3wf0YDFfcKBKeK8beL4BZRIo4qOAXaQTtmsJtyTyUXl2oE6Q+zc5JoCd1Z5w5f06GN5tLhqOazza90UaUSihzuz3zs7Po7Dh2clVW3VJ5mP+dQpzWp5TNnh9we5WzW0xP/pz9yCGj2y6KiEo1up8EdZbP9rqPPjwq10NO4wB8aFPxXYxBYqoYZZW2VxHN4icdpczZLdpR75UVzn+vIdpPaUftptCBPdQAtS+4EItamLSgiT5LYgBOubmHPdtZU8OGaXw2/GS6GSU792kr+m0sylEyKjGVsiMzdeBIaTKlIhpJnRa9BroRV/Pi1CftioawWAR5TpbheL04EB3kPbkgA5GPO5rgiW7oKsSe31gqvTRs6koRGx5Cj9krwpeiAlphU1Ram+027cO+7I/nOpO9njp+fP7Pi3Yc00F4Bpvq4ib3p+3NfpzWvtdLzUmVC2hWrA+Lqq0vkze94vcZn8kz0Ar+ANcTqC7cqcKtYFj2CnFDKh3wtcKehvXoflVlhRtBt3rHZufEZ0vE6SVYi/AYRt1+m2bKURDy71FDsRBoCHpx0umh+rNDKEoCC4k54eEJeru5Fqk3zixsnrJBjSbLh3bc2/JsEnl2GoW/fcE1fY2rNMhE54YvUFBxeWsiTVF6CVVX+0UP2xTUqiyEOzds2tHrAeFs9ujr1d4hwjsf5qvmcJCh0rn5gsIPIbk+Fe+k4CPLogaGi/2GBAmxQ7dgnVR+rLMeKiHLvZU1hqiFIf/WpzdPQQWpcxcNeucL3PtN/UqWKV8J5865vxemefDRSdKj+dvXB1YAPuY/FsqvUlinXQ==</Encrypted>]]>
    </text>
  </script>
</dir>