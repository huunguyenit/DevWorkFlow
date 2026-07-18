<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY Identity "PDImport">
  <!ENTITY DetailTable "d95">
  <!ENTITY c11 "Mã ncc">
  <!ENTITY c12 "Supplier">
  <!ENTITY c21 "Số đơn hàng">
  <!ENTITY c22 "Order Number">
  <!ENTITY c31 "Ngày đơn hàng">
  <!ENTITY c32 "Order Date">
]>

<dir table="m95$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Đơn hàng" e="Order"></title>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OxtLgDo0Qc9xaVo2DGXWD9uQsOqLbYSTi9QaNQgFC4h</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9O11Ok+FM+pOodAeyr450QWpUKIdOJChu+Z+yqvJnVo+LHyVsRT3Hh4Su71YOcd9Hw3e6n/Jrn3fLPPQ4U/ltJihh1yCMrEFawBr5oCunSO2kaiS7mcQcQKhZiObMocBnn94N89ZymDcRPl9GJe3VRodqOsDaK9vqpsoPTfNVfxpeOzkFO+iEBMwSzx2tjJn23oJzjX+cnUHBue4hyi16kFnplij7oi1FQg5IIzc0KSQ2/8tAyq1i+4mMXpEVO13SukHnDFX5fhWzmx38zASVNxHNdu/Beb3SP5w5Tq8lgdXqpXqGEPCHSaNDcGJxtlIsr4b5sU4WsUZEWg495PD3QBrgF2+AdLukuDJdJEnuy8EYldy3qOfD7xzQaA3IZlY3849rCBT5340dg2IaI5QtHvxGues46LglbEfo0jaWF+q8l2W/Cb1QG3yE9Y6cfNjtnltQ1uOpJIgERj0akLuM9oPpvSOdgfSLKbEx4vQ05rS</encrypted>]]>&XMLHiddenFields;<![CDATA[<encrypted>%bTwx6BwczM9aR7zqTp36MyhwxjuJJROD8XL7gASRog9hVUWp8fuDaimnjAW32kEhZLo4HceMe5KyvVpyQAV+fGcvE6TqMin7KvKMHefo0cwEbI7FN/8zSBqb8mZbUX/IHRqO9jva2A+7o+KcAaEa0qAcboMAEnUQoFTQYnBy06zRaxLoS2gIjx1cgj87oEZEsmCzC2G2ThgTw2QfgpcWtaNbC4rtAZ9ZTy8kFQxzEc6oxU3nA4pgbkmAWGmzroBKIgG5reDwxtud+SHxACFZJTjA3YsOin+4toLB9RZH0Ji+CiEWNyIGPWr+mVf8b6gomYdeIMfY/8TXU0XkzMWykHwDSx/4ZzvoZFZcNfd5DsUZ0XKrmmILWbXiSDnVHiRf0EAsMQJQK2lu1YID4LQ6bQ+aaCk10hc/Td0cw0BEJPhe7gWww1b+vxjCtKw8X++hq5SLT5tMYYgjpBsMHXIwfD+dhETUnMP3wdn9zDi4rY+UH/fKMNuV8lTasbgn6WYrp/ONUGFNYrEXrFvf5uQ3EiW57KPXh/IVbcK1SOUPjMUPlUmevzJ8I1fHtvVP/eGKM1xaU2e/3yD1Us1GkXyaIw==</encrypted>]]>
    </text>
  </script>
</dir>