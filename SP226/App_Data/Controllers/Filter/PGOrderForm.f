<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY Identity "PGOrder">
  <!ENTITY DetailTable "d94">
  <!ENTITY c11 "Mã ncc">
  <!ENTITY c12 "Supplier">
  <!ENTITY c21 "Số đơn hàng">
  <!ENTITY c22 "Order Number">
  <!ENTITY c31 "Ngày đơn hàng">
  <!ENTITY c32 "Order Date">
]>

<dir table="m94$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Đơn hàng" e="Purchase Order"></title>
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
      <![CDATA[<encrypted>%mp6eznZa11PdGfCdIfJZVm5Ou6fR7iCNVZ6RB7O/yDIe2gXVITH8pO8JBar+axPU</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9O11Ok+FM+pOodAeyr450QWpUKIdOJChu+Z+yqvJnVo+4gLn3zvA9O4/YSNKpRT+//WVhmYk0wRw906yZIb++Si236OCH6/mcVwUzS8Lh7+7whmwFinUswh7DDW6RVWT9uMgjA6f7dRv5vNXa9QNEnqJ3YdrZmtIDf5ZO/rL/KqFm+/GsVnwDgny+9YK2OtBLYR8PnW/3sXaRGbMFxKI0y2UD1FXFtkz2YrmS/JaS4vmsym8yEcR6+taQmZR2JCAIQ2Znc7nqv9UBN4m25/l2po/JaEr3hDg0Ei33Tw+pDzNRgbcqyyl/3oidF1q8qmb4HetIep+6pr7SD3lrFb/5p254fU1YuVDGfKR7PwkdZP5Cs3k3YYUJFjVHVzPu7QP3+nJtsP5YoBJ26v5vKzURuzy/2bdi3UhZfiRneL3p/KZkIQAKHVsnbuHWTl/WemuMynUddNT8nxmT9ej3xbh2FDEBbPIHieglAvsPucWkycHtcjzwyWwtju0XIlIrTCi5Q==</encrypted>]]>&XMLHiddenFields;<![CDATA[<encrypted>%bTwx6BwczM9aR7zqTp36M9d18qwxAo1FWFSWnP3O7YfbekbrWZ6r/XAgme1x1e1W/cnkdWpRT3GBdYryX0icC+IJVceHJxntJ0lLZAHwWsjlcC6R3fNuXcbgcOLBcjVWpqun2kGHP1KtFLFBVuW7s6ZibXeb4HvQQU/UiAIqEvNLB7h0q69rorlzfXr2SiQ9j4OwbSXGHLxkydVM4L3bG8iTZq1LQRSFhh15s4bT86ub5SlX9WCI6NrI+6xcOTTlH634mjoLfzfLUO7WakV0BWqEAW+oAnwxgMZALC6FfnY2QeuqLHmsid5iQFR+ajP477+Cz4WFIqgYvNLcHdcst4pgugBO8DC2iZyYAIPXHIX1ZOChapLUinQnvAfAGMyi/jloPlnAC6Dqs2q+dIFtaADTBd9V8fGAh3QNZzFpH+aSA1W0yokFyT5HYzIRChm4AypJ3k2v/z7bBVWYisr8YSCnpR+wstw2O9Vkq3FLx1ieKAkls+t1DF7rpFtuN2J7jO0C/ztCS64mOB0aSeVd+sizG4w+CIs3VIURF8BafqK+KN7QfHkEMxxvypT2xpyFyvwi9WzBwcARKQxkmwy430nLTRlRb4SVtpTHW5vb/ksuoiRalnWaJUt5jOz7J6DvF65W95MX4p53cI3tmUAXDQ==</encrypted>]]>
    </text>
  </script>
</dir>