<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY % DetailTax SYSTEM "..\Include\DetailTax.ent">
  %DetailTax;

  <!ENTITY Identity "SIOrder">
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
      <![CDATA[<encrypted>%mp6eznZa11PdGfCdIfJZVm5Ou6fR7iCNVZ6RB7O/yDIe2gXVITH8pO8JBar+axPU</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9O11Ok+FM+pOodAeyr450QWpUKIdOJChu+Z+yqvJnVo+1Zl+E150Ws5MfrWREfQsimZtzwmvojzAlwxUH6jvMVAstrpv/cxhR6gpvQ6fOmPfXEnjWU1DWUeeIRtnz9K6V9f00Eq+DWUcW99VR+AuRZHCWSnB8nL7N4K5aH5Hyc/Zj/WT/aE9kPGKhVmKD6AXfL1auHbu5yYs11C9iBPipi0nInYbavPwEcfEzDlDTVZDZL4qV0ISpI0RMwXpmthYkRqEnp8ZvBA3Cc8HTKWXLlxOtIafAqKGs82ZBrCUFe7JWl4lehVFYVgxAUXMXrkNjUerMdeeLqrOy4Fo2OWrJCYE7t3+A3hee7VCwMama2VqjAHEQVElZgO0QJPka+es4t52NB3JFFfbJqVc2Xl2hNMdFMbS89al2ZJHpHTqhustlbKWLab2kGj6reE15GyUDhwHIGPaeuIbBEYtTsAxf0ZCRabkrom2cSUkY55NeqY21GROTcO+qL0PAtaof0ROSCXxZOU8uZAFCt/wixpagdE=</encrypted>]]>&XMLHiddenFields;<![CDATA[<encrypted>%bTwx6BwczM9aR7zqTp36M9d18qwxAo1FWFSWnP3O7Ye40q1q8tU6q/ahU4naqMy/OtHmIpy2SH+ERJO8FDA6I22Lgv/cBQ1VbPizDRBrRLM=</encrypted>]]>&DetailTaxFollowCopyFieldCode;<![CDATA[<encrypted>%QFirECjU/RgLQ4k5nc6GMyDu2IQ3UH81ZdswzJFsguvCenq6zM5oCWerE/QjxTPjqmBijk7hclLVZ7Pn4BhkfW1ocLvjSy23uK69EY7l/SGb3+jC04YIoIiU5AXlt156mCPpVoS9lyQQ7yC8azo7wiCL+eQREZIBUPNjfAJS6rWq0XUezRdngfbLJ1MfHk1dpaglMOnZT6oV3oRBoGpQuRq9DpILFeYgOE+sP0Bcp+4w9mjzaQ+Sfc8odZt9HtLcTLV0Cw0sXmg81VEbteZvXNKE3EOtSQX1N5ASDiX2XuX/b4NvDPctwcKB04b2zkQ1+KBevIZgo/MYFGHkrX+0ouHprxnmxiKPBLrEu3h7Kfd/pT4UnrCHsVBeBLTjl7/pYWf1gruohWEzkDr39kzP7SRvp/qd8vwcNRR5RHgtAHk/xLzIHily90TVyCqrSi48wyxEk6K10eBLWYll+AcsfOACmjT57L6RdZQqCjAQtI8CK6wbII8g98vSocsbdygqq5/vAPniFUU2SlQUqIIp9Q7k9acrUJ99Q8YOw9CaP+zsmFoIqPwwMOYSAeY/n8BA9hCBJhkiO9VO3ytWAogP6X1RD+Duscly2DfnVGeKf9ypiOA9KvzMagEj1Z6RqSmvtgf9Hq5W6fi/sLOpUgP12dO/nRYo/GP48I1vgfaDsA5jMSkIDbtZeQAEsnFj0yNt3V0Mfwf+saf3MKnvI7yhnJSS4LIEp/5NAYkvjuOZ0KA9Wlb0b9ZzcxBUxk+ImSt1E5C5DPQTbiAgtL+/0Jr9eRKlgl8F5QellZi1HLh5zPIBf3y7SkZF3oaPRUaIQOJO+xN38KGu+fW/lQ/27F6AVU5odrOXZPGQpPlM1U9vo132N7qYsjE0eHgWcy35TJgcGFyHSyACbqApSkwmhGE2ft7MzHJzN8xd4GqHs5IBxBmFL8HgmkHv9tH0l1jQVAIUdXX8punOmEHh5ITHgfVfXMUprLsitwJ8eod/75wWjOXx8rl8uuVuNuGlMsRhDzVGLPbSlak8pOeBnziiJVmiHdI5xmldh8ccIZ8aPfjgjUuRcozvCLG1kWwSvJI/1q6NEsn+baQWviHDyi3tT6ZF3e/vxAbk3mn7a9NqTLqarLwa1j8NHQ5nc6xaOXr4QMYmXT70UDW+BTc+27MTxV1OibXOc7wXCLQ87UV0Qgg/Ft0AV67nOqyPGmSySRv0TbQcpDtJmXcadad4edd1ddyJBGBoKtWKhZ1SNg4fLsvs73XLf445h0pGFcnzZCHe+10u</encrypted>]]>
    </text>
  </script>
</dir>