<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY Identity "SOQuotation">
  <!ENTITY DetailTable "d61">
  <!ENTITY c11 "Mã khách">
  <!ENTITY c12 "Customer">
  <!ENTITY c21 "Số báo giá">
  <!ENTITY c22 "Quotation Number">
  <!ENTITY c31 "Ngày báo giá">
  <!ENTITY c32 "Quotation Date">

]>

<dir table="m61$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Giấy báo giá" e="Quotation Entry"></title>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Yu2lGxHKUKCi4ICByL1LNEKJJtxt13s3AElWpd5NAmC</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl//VVNNvl4XCgLv990U/48gobbG9XDQx/mSGrclDfjIq9rcLRD+6+mnFDJalo3od1Qj9UzEHajmUhmWnXimdxjseyfWnBBg1XuIk6F9sDJM+Z43hBxcDJeTh9zGYwRt3TnsFHuOqANve+TZTWZYC5HynmEhjGV0il9EbFkqMOrU/ZmueJoNyGHkTElJdU/ABGwTmojfhcSiiJGsTtWrhX1p3sncXSbOZYV0asHqMs+3gthl7EVS23OUAdKsQcIan1Bfg2w8wO7a1bK1jgSV7nnpXLSn58HvXr+c4IXfEBt7ceSXUpgLhICdY4FDSzKmzE19T3VYwzAeXRA8ECE8+TpkSNytMtBgwPF53aYbSuztZxWcKvPqT5w6YpfTpyVP/HRzxMEq5/lj8nNg6odX/cctRzuhbi5HZrfRjh8Es9A+oFes/QOvEZdiBzdAjrw2L3em+3ILc/+butAfC8LZJQI9KavkYnJAHU/A8jge4Dv+4C</Encrypted>]]>&XMLHiddenFields;<![CDATA[<Encrypted>&+yRcV3XtE2MrYJ2A84tg6IkGhvq87gsV6V8lEPBLz60Db7PLmfJFKEwCSmMiRrR0LjnI0R2clUJQpNsvG5/bH+isxLnkur7JZhVMExBzBWh0gB88oQUsuuvi1KYruFoMYtfhiZFP0RXndrVsCj3nKHHK1i4eAazgYP5BIceqhA8o6YHQ4+1kkMtwKXXNfc4cc9c3QUoBmnveNMrn28BZd0Im0u+0/BjzaOUvY4wjblU+KyLUYD/MLD+OjPib02QpQGA3TtXLA+d972onEgj7CD+l3cHH9UOK90gx5PpRJpmPygeqf/GFgUnVBLCsKHCqC3Hwr6qZ3kSWCXFJ4M6SQqzMCrDox0kuf9enXIiNJwzZyzsJ1APFnX1/1ULtkKGS6NIk2sSMYS1gL6xUODPwT80LMwS7ZMMjRcFz3hJGHRYS8ka0HVu5ysof2MADSzQf8ncxS641onP8TLe3HSg16mcVNXgx/48z/PnYnPKgun9nTvtktz52jrxvThr5+aaUQaTO1LMicZ9aecT64RgHtJFbzv+ip2AaK15x5znMrN0eV+pGw07NlGj+LyZNV77u2r5ds9PK/FiZFgXTnEd3fdrABdPQiF7zVLIhMKaF8eSdCZkrER7VvVNVbt6O51ZwHDiGPtVy0sfj+DLFxegFY1IAFCfgBBinnVCVYh9kmtlrT0F7LcCAQuN1pa75rfufSwHfI7Slzbz47oCHBoewdg==</Encrypted>]]>
    </text>
  </script>
</dir>