<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY Identity "IRPhysical">
  <!ENTITY DetailTable "d34">
  <!ENTITY c11 "Mã khách">
  <!ENTITY c12 "Customer">
  <!ENTITY c21 "Số phiếu nhập">
  <!ENTITY c22 "Receipt Number">
  <!ENTITY c31 "Ngày phiếu nhập">
  <!ENTITY c32 "Receipt Date">
]>

<dir table="m34$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Phiếu nhập kho thực tế" e="Physical Receipt"></title>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OxtLgDo0Qc9xaVo2DGXWD9uQsOqLbYSTi9QaNQgFC4h</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9O11Ok+FM+pOodAeyr450QWpUKIdOJChu+Z+yqvJnVo+0xSf2ysiOpaeOK36gJRBZdfsWafJwCGn/5shMwTq/eE0L9G095AOO99MA1PyKwmTe8EsaHG8hVNGIrsRJqtBLSkfJoQT9cGnMViKZT5AtbbVq54YUXH/d4expT6/Xi+MY76oq1D4OlZsQnFABUHHvX7QQ3dBwrEuvisIeV+XfOatZDH47WfgA3fzeBf1i+OTy3/nYfpJ42BdtRv7vL6BifKgcQ0BiqmsefW4XMw+L512OVYpd5FdOxRt/wWY+uRgLMJ5BLxTQJZ6EuZ8U3Q0Y8up0uKCs0Z/kUrY6ZN43VymXTIDDPkHIdb2AHnuWtRJkna7giqMOOY5ZZUiM3wr4aSDvNRLT538pQWljdl5Zh3rzkPAxejSFtLnPjqg/OXhA9fj0OBtFqJyuGuXTD2aLaAdfHPkqEAJSoaKhSP8U3O/r2y51vFd4L2G9EOkZ5JuSX7nqv5icXFcweltrJVrLpiU8vk9bmVx/rH6l7pH++0=</encrypted>]]>&XMLHiddenFields;<![CDATA[<encrypted>%bTwx6BwczM9aR7zqTp36M9d18qwxAo1FWFSWnP3O7YfbekbrWZ6r/XAgme1x1e1W/cnkdWpRT3GBdYryX0icC77QFDb5wXVpyiq97UjwCGgd3rV0T4jofyPZxq3qen22FgvjoMvf0PCeZjD3L0a9vKQRip71iD6yOK2YVD4OGiJ3CZiuLXmx0RlO9KzoaZO7Gxw1J0gfFmIa2/kA2ktC9h7iLMPMo1kUwqMa02UL5z2bEo4MQRFZDn/WgCEv632USvdgpTt9OtCxy2tc+EXZVIwgOFmS9RUVeC+yG4mdu/oEsOF3veenh25m3m8sONgbI+JVaCFG38GYRJGIVdjBbtgZVMBbK0LEjFza3bbDpjZ/FCz7ugdPXK6nupF0pNx9YnQdlXUMkVnwDySi+niAmyKucR4C+x4XSniwfxOUUZtPnemH0FpMYgN4em5TFmNiOlVmQ24wgKbWyaKNTMjpU+xfE6OzgSESz0aAKguotTfAILoS9orFokDcjo03Cr2Muo0Uz8AzO8nafcjqSIm9bbzWwasLkjmsFQiLpvKTX/DXOAvlC0XGLsWRzJOHnCbYWNQeEaCVXKcs9JcD6o21KCNepoSlXqVBzi9C8hzdRHch+/It9iZRnYP4OUb8D18N</encrypted>]]>
    </text>
  </script>
</dir>