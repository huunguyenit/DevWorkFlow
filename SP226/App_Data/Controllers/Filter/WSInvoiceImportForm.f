<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY Identity "WSInvoiceImport">
  <!ENTITY DetailTable "d72">
  <!ENTITY c11 "Mã ncc">
  <!ENTITY c12 "Supplier">
  <!ENTITY c21 "Số hóa đơn">
  <!ENTITY c22 "Invoice Number">
  <!ENTITY c31 "Ngày hóa đơn">
  <!ENTITY c32 "Invoice Date">
]>

<dir table="m72$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Hóa đơn mua hàng nhập khẩu" e="Import Purchase Invoice"></title>
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
      <![CDATA[<encrypted>%mp6eznZa11PdGfCdIfJZVm5Ou6fR7iCNVZ6RB7O/yDIe2gXVITH8pO8JBar+axPU</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9O11Ok+FM+pOodAeyr450QWpUKIdOJChu+Z+yqvJnVo+NTFmCmyZ30bDyY5tCAhxTTjhLlI3jRKlTtZ6AU5cntXdu5GF0FZfWd3KBP6tw/084kvjsqc7IGRMfs3AZY444IJy9PgdukfPKJOTDrT05MnhkC2PbyRAMqOzBVHJeTKgTvFxfjlk7MrWjHV1/8MtKwas5pY+AhejkopeEyh2/HwDM3RlTFH5wDK1v30J9MInWpDKXtft2tHz5BIErqicvaLA+wHX8QbcJ45ZVKEbxl20MaDsAsHlWlV0HsBLvM91pK2o8KI4UztKoWh9Y3dju2JFzTrXOnnbNpCsw4cw3owEqDE6vg7niNOl6I22frc6ttcrVYFFphx3KGjMb9QIUG8gM5VSVM1t7vdwrYnuvmUV45v2+zFRxXhuN7xnAt2Gad7A+QEiD50pzlZTZaa3TES0bs948cU+JJsRYnEL1u674GXL9N3HFcGnMb3Tdjss</encrypted>]]>&XMLHiddenFields;<![CDATA[<encrypted>%bTwx6BwczM9aR7zqTp36M9d18qwxAo1FWFSWnP3O7YfsCVQmH3PxjKSFVAXSasalzWm2HUyYlDN5jVi/IjF0DGY9iJSrF1zUbk+A770odSGCw7VPcG5Pp7TpdN6qYFBKJOJS11HF4nZ6CnCLa9D3IiN7wE4DrRp3mYDWkdnycBjF0z/iV9L0pwbaxRjBT3zh6svHSbHxbYvJBbRlPmMRbuA5b5Rwyn0PCmKPlZIo35QPzs8YktY3ceg49+bKda6HlzrYo253Dci9ZysvtE0dOd8sPGmehMdPYt9N2YlerGzXTnSl1MUwm/HWcX6DrWsolviXkhUKRp2f/Y+LkAJSvOf6CUEKf3SAaiTGiWhJtmECQsDcAqMjOxpeoQLwJJ9JIhAkeiCsJkJuOLRtcFrprGpKi2m2jbTOIB+aXuBehlb4eYHYSNXSvPlcWCusJM+32aHZPAQuRjKyZ02V6QHbTgXUpg1Lpe45ihMSOYNCwCrcu6hhYUGuHsRtZ/qsUEQVawvNYbGyozMcHayR37naTf6qrzPcuM1pj3obhry/fIIqDY3j+EMgb7KAe6PV8xoop8L8111FG+N6U01EGvegdpxCmWRJ51c30I5owchFJp3PzUgOjNwP1MBppvkzMAWCpytvJYPA39UjTOwecerguv0tGmAVyKyvkelthKhltc4bkqrFDmkk9lj2++BxWAkF59dsWGhpqWN9KFHFl9BVfR0qpkEFHSv8/QJO6dGB8jYhVkLLOHqKCFLbFBFc1pbBg2vV3hHsn/2Ro8KmYh8f4eOM9LHBSMuOWrOY8j6O/fYgrhUJUBSwFWuaGNjnYYF2HIGnaBL4jWF4yhDxq55+vmiuyz59OncUMmbr66UpFXncj2731mgbEaov8xJad+WRF39nBJM6Qelvt3bJg67oXXOlW4ssMxVZs8zeAXKKgCBu7MZ8gohJ2hk/mUa1onzBg4wt8RaNFhYKuzedaob0kbSQwMAhNvg2+r2v8SAFDJ0ISGrjciyqVXDIDqFtsXGXFqw5V1mAfF+6ZvTLvKdAxZSI4w9ycqCOstpgcHiJeIv/kTnQ4KZedez2E0TvOoU+hBe9D+Ne8vaSPL8+NMgwgpCTcc34MrUQ4Q7MqMTJLfzmmZCbg0UDndrWu8W77gLY8lqU//blFkgUJJKC6QvUOA1Vp1CDOzbKoONd4paS7h57j8faIaf1+892itsxmH5+HFfffHhQRuOAlywSgrx3lQ==</encrypted>]]>
    </text>
  </script>
</dir>