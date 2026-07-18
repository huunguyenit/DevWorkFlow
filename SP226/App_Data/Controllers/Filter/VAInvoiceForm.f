<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY Identity "VAInvoice">
  <!ENTITY DetailTable "d21">
  <!ENTITY c11 "Mã khách">
  <!ENTITY c12 "Customer">
  <!ENTITY c21 "Số hóa đơn">
  <!ENTITY c22 "Invoice Number">
  <!ENTITY c31 "Ngày hóa đơn">
  <!ENTITY c32 "Invoice Date">
]>

<dir table="m21$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Hóa đơn dịch vụ" e="Service Invoice"></title>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OxtLgDo0Qc9xaVo2DGXWD9uQsOqLbYSTi9QaNQgFC4h</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9O11Ok+FM+pOodAeyr450QWpUKIdOJChu+Z+yqvJnVo+sEshPmWnP7V5ye/LIHZqIJCnDOkB3/BsjwnsdVkyYtSgp9KXrKsHrR3MEjrjm80ssCeogxmUp+lM4ixyRe7/64FzLnYfsWzTrG94mjIaiAjMf9X16v/qJ4Me/8eldvHd9OTAvcy+BVsSgDkEr45fgTBov8LZJ/QcODjLuWNb1lKjUHAwdfxaaRRUAqdlOg7B2KQSD5iKyOJzfYxiwTR39ZPvySGf2Ke16EhjM1CLe+yoJMbEGelizVRahIZiBFGsEfQ+wL+I3gj9jwRMCF4IAsabEP/65QjlgIJuAgj+sUJvTlgkGJvfCivjy9eMPRtyOEm5CtPjk9hfYe+grsVFJjWJsUfM76P/szaeMdmsvwmlB56FDw11alDEDSiCL5nEz7KDMHioE+YPujBnJJjGBjf8DTpmS/ANrhbkJfuN+IfdVbJckVQ4zsSXbX3z1JvbsRagtfqxk5jiQEKj/sr80Q==</encrypted>]]>&XMLHiddenFields;<![CDATA[<encrypted>%gbF6n/+he9+3AjHLwReYaoCGZ7Fntf0y/lSCG9EyDvBUX3OEtb6BSR822vl4tjXBvxgNOX2FmqIRMqwekmg5V7AGogU7TxnmibTVHBzr0loaOMkxvTB5RqfbUPyxue1SCsFBEB5QuZLUm5e+to21O19/lHxeS39I7qM9/+qqXj9q0Q8xUaC6nWP7s/lg2ecAfhfnDELHnkMhusUktl3B4jpRLnF1xcS43BpY4bnotZNSuK+5DQOJd4rRY1XioPbAD3LF2ums4thBEXUZ9XsVcZBD3eq2f2SJFhgEGwJj27r9vDAoxuyeiuvhE+U+70xS8t1r4f0s3j82akb5SANy+lSLxsq0wKwC2Ra18UNiGWZ1PLhHQw0UytfwESMP0fPi0Nwv3xf2rJgy3nCYG4X7ubBQDoneOIkyNV+sn6bPPgn/UXBiqbnC07gAbKdPccBQj0I32UyTa95cOBTpWLngFAA/njQUm2skkYf4xJsxXTBWZSqY+4BGyDyHk0YzhJXJe3i668FF9wIgXGir6euKuxRl3Kk1k/1wm7xHV629xoxXxS1YQvwPV7uyGIHxlJcLsdXN9EvcoijJ6xCg3nQSq+vaxPh9g8HwZvqJieaqUctEyae9/3OW0ececP3DoIYU9OX3mjmRW7kaBYph7redpfRa2r5PbN/lsNOxhM8GXxAxwbEC96bwSW3AvxTla5tIx6DK5cwWePPktF/xNLdIVsqteWw1rfHXZnlNXWsHV2ct8Ir8LVc5vDhEEODvdXFplJGfuIiFfkSw2PN0TMwEwLRpvmPO3kAXNckXkVMF+ixfwULSB645SPxGoDC93xA14GcL3lv+foAG8p08eIl3CzMjDF/xOSB9dVpgmcIOHWR9s6OUpGnL41XhonrcE3e1</encrypted>]]>
    </text>
  </script>
</dir>
