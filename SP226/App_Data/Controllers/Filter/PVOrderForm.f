<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY Identity "PVOrder">
  <!ENTITY DetailTable "d94">
  <!ENTITY c11 "Mã ncc">
  <!ENTITY c12 "Supplier">
  <!ENTITY c21 "Số đơn hàng">
  <!ENTITY c22 "Order Number">
  <!ENTITY c31 "Ngày đơn hàng">
  <!ENTITY c32 "Order Date">

]>

<dir table="m94$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Đơn hàng trong nước" e="Domestic Purchase Order"></title>
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
      <![CDATA[<encrypted>%mp6eznZa11PdGfCdIfJZVm5Ou6fR7iCNVZ6RB7O/yDIe2gXVITH8pO8JBar+axPU</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9O11Ok+FM+pOodAeyr450QWpUKIdOJChu+Z+yqvJnVo+4gLn3zvA9O4/YSNKpRT+//WVhmYk0wRw906yZIb++Si236OCH6/mcVwUzS8Lh7+7nGBfm+++RyPuUw8NEYrLfEGfPMK+RZ+Rqha6zAjq21fND8B95ziU5TQtKvlrFFS8gfLLTlTxtuEwJAug7cSaNraEjsRsNLKnPNx3EPm0MelwBraPNtkKAGHIETaITV2yVYbtZh9LctLQg0ivGAMaMkBPx97MdojIbyPbshsSuHtp5gqt7pdzwQ/4xRRIMyOUlYW4jhk0DqRZu1x+2MI3JiqTIO1GpkdNaKWtjk6oYHnS0A9m4SrgtWcWkA2VIz4eir361FMwsdwesMZBZCh+QG3RMwRarjQk2aZw35hBzv+ruDkWHYfs3t8LlNtuLPDMrfSqHrmFbcHIV0ZxcLOREk0jz+yj9qBK7364V9vSPr7wjbfCnyzIQAaKNbzcQ7Xu</encrypted>]]>&XMLHiddenFields;<![CDATA[<encrypted>%bTwx6BwczM9aR7zqTp36MyhwxjuJJROD8XL7gASRog/haCp8JXugrSdvjEmGAdlGK8AGVMoRTUBqNeNyjzItBLuT2TWQmkpJxHFyT8Csa+hlsZtxdllBl15KumcfpuBN5a+y0J46fM4xiycj16unXxMvvsL1lWJBbgUJbNMw7zvxY9CDV7nKKpOtHon40DqD9JvJwNzPxuM38H2Gj+7fLzIKbx+/1fAqkhXlBjhzVh0KyZLZoQnGtzTHCpcsZDv7r6ipFGcSzaDf9MDmyPHgULw6iOn+t9Ek62ucPLn+iHxIobSzLfcVAqdrZmzVCB+z0K+okLMaikhgQqqQncWOaTYJO4Ti5MaYzOdCyGziLPku/Ix3bS7bBspfAf765MIYU7QuTdxtTi5ryr8w7eSIrAPbcDLV0AgON8ePpTD3udtpdkv7Gs1pptSIeIQljmEyDHTAgm2PaSyEMfi39qSmBOBchkJm1FhF7ULRiDWzLWNUqA3VbZvkBHRevXUsBE8b+pLmRFzYto21D7zucLq2Xqrb2iJWTVmTcdvCudcN/VYpTcO2lHm3vzje7js338UlqNE9H67dnGXwH4ihQnbJS+6rsNONaEmPwCxnEk0nja7SZ2H8ldgkgHm+XNS/3LgPIeKfZJTvOOovzwceD1M0+A==</encrypted>]]>
    </text>
  </script>
</dir>