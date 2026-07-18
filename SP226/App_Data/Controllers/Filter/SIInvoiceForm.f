<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY % DetailTax SYSTEM "..\Include\DetailTax.ent">
  %DetailTax;

  <!ENTITY Identity "SIInvoice">
  <!ENTITY DetailTable "d81">
  <!ENTITY c11 "Mã khách">
  <!ENTITY c12 "Customer">
  <!ENTITY c21 "Số hóa đơn">
  <!ENTITY c22 "Invoice Number">
  <!ENTITY c31 "Ngày hóa đơn">
  <!ENTITY c32 "Invoice Date">

]>

<dir table="m81$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Hóa đơn bán hàng" e="Sales Invoice"></title>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OxtLgDo0Qc9xaVo2DGXWD9uQsOqLbYSTi9QaNQgFC4h</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9O11Ok+FM+pOodAeyr450QWpUKIdOJChu+Z+yqvJnVo+i6n6BJtfR51IdFIqNnW2xE9YAByBjELNiiMtFW6SER6rqrg+8mWiN7DboFrwqAsRIO/O9Nf/KuIASuJLn6IAYboq4+Mhn2xTl50Kui28NoceHJ48/WFNJmOycc5yPQNUxrpHTStcmPTSnXVVHxeCZdr+gIFoPMu49u039PZ4pTLvb4FaH27VGqCGP6y/boPQCH7JjWYjeqPSZLGURFEm2+GEj/wQeGK3/IIfO5izBlHgNGg5egKauHes/ehD3qVU22mbp+f5Ywrt7HXkBiK/WXe2RCNoo8NUSfQeSiFguMGHRUSswjiTbtX6KQ0yZjfk3ygAFY1Dxk5bRSURz88FNk0henvIQ/lfUbRpGcT0M0aYj6pEoJDt5lnayLsARHzysfM8GwKp4DdqvfIf/l93uYpa6ZIRK2N0djQi+q9nseezuicNiW0eJE824una3Bn4VhVvqDeCI3BpNTLj7FRQ5FTXs89pkySTdwYHe4FDlug=</encrypted>]]>&XMLHiddenFields;<![CDATA[<encrypted>%G3BbmCyRRiHr6hEkdA9t+i/U6xtz9ud2nBRAiWLWGHwhShUkL5yzJ3c21GD5lD6no1JnIJjHuzbNmokQ6v1bMTLhy7VYrXzzQZd79jOy2SY=</encrypted>]]>&DetailTaxFollowCopyFieldCode;<![CDATA[<encrypted>%QFirECjU/RgLQ4k5nc6GMyDu2IQ3UH81ZdswzJFsguvCenq6zM5oCWerE/QjxTPjqmBijk7hclLVZ7Pn4BhkfW1ocLvjSy23uK69EY7l/SGb3+jC04YIoIiU5AXlt156mCPpVoS9lyQQ7yC8azo7wiCL+eQREZIBUPNjfAJS6rWq0XUezRdngfbLJ1MfHk1dpaglMOnZT6oV3oRBoGpQuRq9DpILFeYgOE+sP0Bcp+4w9mjzaQ+Sfc8odZt9HtLcTLV0Cw0sXmg81VEbteZvXNKE3EOtSQX1N5ASDiX2XuX/b4NvDPctwcKB04b2zkQ1+KBevIZgo/MYFGHkrX+0ouHprxnmxiKPBLrEu3h7Kfd/pT4UnrCHsVBeBLTjl7/pYWf1gruohWEzkDr39kzP7SRvp/qd8vwcNRR5RHgtAHk/xLzIHily90TVyCqrSi48wyxEk6K10eBLWYll+AcsfOACmjT57L6RdZQqCjAQtI8CK6wbII8g98vSocsbdygqq5/vAPniFUU2SlQUqIIp9Q7k9acrUJ99Q8YOw9CaP+zsmFoIqPwwMOYSAeY/n8BA9hCBJhkiO9VO3ytWAogP6X1RD+Duscly2DfnVGeKf9ypiOA9KvzMagEj1Z6RqSmvtgf9Hq5W6fi/sLOpUgP12dO/nRYo/GP48I1vgfaDsA5jMSkIDbtZeQAEsnFj0yNt3V0Mfwf+saf3MKnvI7yhnJSS4LIEp/5NAYkvjuOZ0KA9Wlb0b9ZzcxBUxk+ImSt1E5C5DPQTbiAgtL+/0Jr9eRKlgl8F5QellZi1HLh5zPIBf3y7SkZF3oaPRUaIQOJO+xN38KGu+fW/lQ/27F6AVU5odrOXZPGQpPlM1U9vo132N7qYsjE0eHgWcy35TJgcGFyHSyACbqApSkwmhGE2ft7MzHJzN8xd4GqHs5IBxBmFL8HgmkHv9tH0l1jQVAIUdXX8punOmEHh5ITHgfVfXMUprLsitwJ8eod/75wWjOXx8rl8uuVuNuGlMsRhDzVGLPbSlak8pOeBnziiJVmiHdI5xmldh8ccIZ8aPfjgjUuRcozvCLG1kWwSvJI/1q6NEsn+baQWviHDyi3tT6ZF3e/vxAbk3mn7a9NqTLqarLwa1j8NHQ5nc6xaOXr4QMYmXT70UDW+BTc+27MTxV1OibXOc7wXCLQ87UV0Qgg/Ft0AV67nOqyPGmSySRv0TbQcpDtJmXcadad4edd1ddyJBEfNbqqTC8KDvgRYhz1jj230uwuYPuhVjxR1XZaR6tm1</encrypted>]]>
    </text>
  </script>
</dir>