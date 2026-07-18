<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY Identity "IRReceipt">
  <!ENTITY DetailTable "d96">
  <!ENTITY c11 "Mã ncc">
  <!ENTITY c12 "Supplier">
  <!ENTITY c21 "Số phiếu nhập">
  <!ENTITY c22 "Receipt Number">
  <!ENTITY c31 "Ngày phiếu nhập">
  <!ENTITY c32 "Receipt Date">
]>

<dir table="m96$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Phiếu nhập mua hàng" e="Purchase Receipt"></title>
  <fields>
    &XMLFlowFormFields;
  </fields>

  <views>
    &XMLFlowFormViews;
  </views>

  <commands>
    &XMLFlowFormCommand;
  </commands>


  <commands>
    &XMLFlowFormCommand;
  </commands>

  <script>
    <text>
      &ScriptFlowFormFunction;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OxtLgDo0Qc9xaVo2DGXWD9uQsOqLbYSTi9QaNQgFC4h</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9O11Ok+FM+pOodAeyr450QWpUKIdOJChu+Z+yqvJnVo+MFSpcvf3CI1ANcjEN9u3tvMQGRiZcdUxCinBc5oydDEg6GJBvWTO7v3ogCthD8LsxNidUCpYgQM5lcMYcbXTLeY8lS8z4nKN6aKouPiGjJk1RW/qj/cW9Urslw1e2PPUYUKK0NohUXvpRciRlFywZaByVLz+1Rzd3l5tyfSQy5WIliUzWCCxjRHpzCRxOZzNnWpoQ017awBWNchXx1q6pQCWvTv+fAgPQP665PA3Hp+QDL+mVBrZbKCWRW9vwVep1zsvk+tZCwJGtF+RCJnJN315UQk3rBv2IGcXYVNfEBlB6ciUIH2+E/kB+s0MezhMfOP8EzKeRueZna6mAbybu+6qY6rnea8tA9ZkEo9cq2QmZRqvm2xFCxogDNgJ14d3Pr1cZJpc2oyEpAsXrxwpZEUQxGnxQsfFr5GTjJa4STJ8fkHg5TNTmfbrostqOrS7oUH8ekmwB9MTsjqBwsqCaQ==</encrypted>]]>&XMLHiddenFields;<![CDATA[<encrypted>%bTwx6BwczM9aR7zqTp36M9d18qwxAo1FWFSWnP3O7YfbekbrWZ6r/XAgme1x1e1W/cnkdWpRT3GBdYryX0icC77QFDb5wXVpyiq97UjwCGgd3rV0T4jofyPZxq3qen22FgvjoMvf0PCeZjD3L0a9vKQRip71iD6yOK2YVD4OGiJ3CZiuLXmx0RlO9KzoaZO7Gxw1J0gfFmIa2/kA2ktC9h7iLMPMo1kUwqMa02UL5z2bEo4MQRFZDn/WgCEv632USvdgpTt9OtCxy2tc+EXZVIwgOFmS9RUVeC+yG4mdu/oEsOF3veenh25m3m8sONgbI+JVaCFG38GYRJGIVdjBbtgZVMBbK0LEjFza3bbDpjZ/FCz7ugdPXK6nupF0pNx9YnQdlXUMkVnwDySi+niAmyKucR4C+x4XSniwfxOUUZtPnemH0FpMYgN4em5TFmNiOlVmQ24wgKbWyaKNTMjpU+xfE6OzgSESz0aAKguotTfAILoS9orFokDcjo03Cr2Muo0Uz8AzO8nafcjqSIm9bbzWwasLkjmsFQiLpvKTX/DXOAvlC0XGLsWRzJOHnCbYWNQeEaCVXKcs9JcD6o21KCNepoSlXqVBzi9C8hzdRHch+/It9iZRnYP4OUb8D18N</encrypted>]]>
    </text>
  </script>
</dir>