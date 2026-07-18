<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY Identity "STInvoice">
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OxtLgDo0Qc9xaVo2DGXWD9uQsOqLbYSTi9QaNQgFC4h</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9O11Ok+FM+pOodAeyr450QWpUKIdOJChu+Z+yqvJnVo+i6n6BJtfR51IdFIqNnW2xE9YAByBjELNiiMtFW6SER6rqrg+8mWiN7DboFrwqAsRIO/O9Nf/KuIASuJLn6IAYdb//6fVLRkkTvVlNvibN/kYxC6DkRxmZeodnY2PYZuXmmTjRQjGiASD3z8Q7FFMsV/0F0v0BGuP857j3De+nwgOCf0wans2778vApTb7avN9ABaMJAmw1cE4WbQPCxs+l0hKcszA9cWDM+SNVIykCiEcWYLAingmR8GNih8MPfHPKN5OJQeojiABYZjpxPSDIRMpCqkkiDHeimbLriY85KFybx0TDi99+tl4+I4UuAGcJmqblxcHfAFD+PWtuPvBmoS9wCnLutmRqOkuNrqsR7m/HVTe/zZ+Kt/t0DvNdI9</encrypted>]]>&XMLHiddenFields;<![CDATA[<encrypted>%bTwx6BwczM9aR7zqTp36M9d18qwxAo1FWFSWnP3O7Ye0LSQQ3B98oAyYa6qXmxq8BYKHOfVh4CdU0mWTE2SrAUVU6WhNHjxLoZBL+PaYOGj/ghwCy/fehz54DTL/GtPPki9PC93xJUl8BgFe4anb7iv2vvATVzzVl61ApW9NAAEaA/M0LECTRGv1ZC42inm289ZCOUfR41v1441gtfB4DClM9WDBPHWMCGofNBD9D+ssRea+Y6pSbIJ+E9SraSIeBILzyQNfRjpx+Ac40ZEU18IjYDuyOEXHot1ZTiv5cEJw1qtLsKp0nnrh8KMHwRt1/3vR1S2ObEz9oT/fwqGyQDfU/ORPyk0RNEM9U57dAsJSlJQvK2Kitgs5aomD3cwrAD1kNenDmeXl5bszdd6cgdegdk6CXKJhUVLc8wrcDvzGQPEKHb2LpJNje40UL43FQ2Helij9MAyNkZURdVkqRfDwbh88nlovZcYKLOAZUSb4aunGSXKDEywGE0WCNFDi0K/7OnKFHXSOhou7VufI0aZ5ydy3apuYGKAGGgw1hOD+0A8G4aEIQVmmwZ1i5278xxReZDol9J8xn8XV8DiLauG/cDRnDuO3l+hZ4sV2qDjcZLWHyYEv/hItq/HaATj0huQ4oRrZ4zWc8kvEyEYqfLwfytqDC68ivHZl78L8A8GCbv0LNoyMtQTvAL/GB9Rq</encrypted>]]>
    </text>
  </script>
</dir>