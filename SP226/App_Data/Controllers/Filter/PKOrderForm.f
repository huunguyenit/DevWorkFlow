<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY Identity "PKOrder">
  <!ENTITY DetailTable "d95">
  <!ENTITY c11 "Mã ncc">
  <!ENTITY c12 "Supplier">
  <!ENTITY c21 "Số đơn hàng">
  <!ENTITY c22 "Order Number">
  <!ENTITY c31 "Ngày đơn hàng">
  <!ENTITY c32 "Order Date">

]>

<dir table="m95$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Đơn hàng nhập khẩu" e="Import Purchase Order"></title>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OxtLgDo0Qc9xaVo2DGXWD9uQsOqLbYSTi9QaNQgFC4h</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9O11Ok+FM+pOodAeyr450QWpUKIdOJChu+Z+yqvJnVo+LHyVsRT3Hh4Su71YOcd9Hw3e6n/Jrn3fLPPQ4U/ltJihh1yCMrEFawBr5oCunSO2kaiS7mcQcQKhZiObMocBnn94N89ZymDcRPl9GJe3VRoYIfmy/fRj2FgPVXc7B2Sr5RoWwtSXq4Kw8d6CxkMbAXjVVYOU4PIFPHykE8Olq2klmKYv2VanigCanmvZm4hs60o8ahy3Hd+M5SVhFIT18vXS6xg//C8GafOghPBMTxiJXLLSJGF4awUjQx7pKqG4bsRrVWwP3/UouO34NRZzKj8l6IWE0cwdp4yfVJ10wh7g7EAVjdEnCSNAJJKlGYSthJKXDinVchMcM3hqmKEyDwhcUO3Zyim6/IKRtEfYdV1WsGfvP5ImrbEEGL7DHndUT/OJJyHzelCzCwaUqv0lf3mIl+UtaRzMAVkB50m4iCU=</encrypted>]]>&XMLHiddenFields;<![CDATA[<encrypted>%bTwx6BwczM9aR7zqTp36M+rjt2bKttm+2KP7fjVT5EahdvLIwzFEy6YY/kxW9GyeyZ39Qxy3GFZtuuOfpDQcaqoTMyE66zeXV8oTbjKScipjkfl/3XcHYnsfb1+kg7O33TW9nVWin62L4QvW5dwpemEJGI12NXgFpDFCb2Leqgk+3EG4uqT6k2sONBuo93yuNxyHRrHRtWTADXxOjtcBoxUlz7Ws8XQDy2zI4GiJ7q9HaRoFplw5FbchSmt7mAafVduq5B0xFOgh+VU4EtDjCGslBcjlqTDn+odtg89hdKlIP+z43sOQsmk02KVipCf7dAhC4Mw7EvhRcvYonvBRn1ShUgq4KwJ6pOf/lI3xqeuJsAJontXNBjeI/uynDGypui0Dq6VbGaK9yH9QjibOZjOLzmFfDRs1EChX8SL66CRCxqddQGQp2UT+jrcANVWRRDfT2AQA/dNy7+f1l1UDsNn9F+UQrgEX8N0s1QmPwowM+rOdlR1m0ANrXrRGba8zWz90i5pY9ToNavBPgqnuXFvK4ZxI/EFGCennyeaoOYmwdH6YB4KLQi5IGjVtVCFvPvh5UkpABdhF8/qWDfEXcV07QJVlsysemBbXOO08LZ5j4ZEbwzQhRF9Po8v1JlIaa3JYu3/wahQtRhzUjgbkJas/jLcIeeCIXGSzuBcptYBnj6ulUm46yyqnylA07d35umdg2/eTbAaeUOG/bPL4++CeU6DFn0AK6O5MeXPLRXkQjTtYnN7+8OpsqXxsk/WT7TpH7Pt2P0WrZoNWj3n4Cg==</encrypted>]]>
    </text>
  </script>
</dir>