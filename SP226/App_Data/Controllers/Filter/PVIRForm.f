<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY Identity "PVIR">
  <!ENTITY DetailTable "d74">
  <!ENTITY c11 "Mã ncc">
  <!ENTITY c12 "Supplier">
  <!ENTITY c21 "Số phiếu nhập">
  <!ENTITY c22 "Receipt Number">
  <!ENTITY c31 "Ngày phiếu nhập">
  <!ENTITY c32 "Receipt Date">
]>

<dir table="m74$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Phiếu nhập kho" e="Receipt"></title>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OxtLgDo0Qc9xaVo2DGXWD9uQsOqLbYSTi9QaNQgFC4h</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9O11Ok+FM+pOodAeyr450QWpUKIdOJChu+Z+yqvJnVo+xljd3BvuZ8V9ad79c0oFFUltad1y+3tAx+iIfKHpnOrqnjXzQMvym42jSqABq7O+dFvVg8EYIagHgsPKsoCzQc7sLQroDLPkZ5okf9kGQTu/KwcVkvhYsmyj47Wqbtt6J5tfQZEOpxXNVWzxIrl31F1Wrh/XE5CblpOZ2Zb7SZyZ+zmuJe2LEE/JgwDhdEuUBMeCrrkmQBJsgp8jAUNvrrp1af7sWTFHNFgOois/+jS6eGNpb7x6YSl+sbeUQkY3NLWPJ8ulPceCoyN0Oo/r1zevV2r/Kd6JWyBK9i+yegm0935JKmyUGc4JEnffzsXuXMtUxypC7TyrZzEBte3BrfkM+JCNFDRZRA5qC1BJa8zG6Cyp7XSMxjVEXLPOB3SJnhrN2X9vOJwrSQvjPjWO8Wt+dubc/CpHKFmAPuHw/mqdIMXI8Mn/EKyrREbOe5hJvF3VdxwyAa7zQhadRG+hdprq2h9gJvvobEp99V8njqV/eL336bUfRzdCfKePPYVR</encrypted>]]>&XMLHiddenFields;<![CDATA[<encrypted>%bTwx6BwczM9aR7zqTp36M9d18qwxAo1FWFSWnP3O7YccM0Sar8VRdcaMhBcSSBmyZ3uQhFxdrTBPOJzry792YWcr7BFOrjCxHhLS8l7EyFdz50Z5d8wsZ57EAgmjMiY6gSLLOMtZG0ra5IRjgGwaV/Tdb81FGdeQYFx393wb28hGXBwaFiw/AomoZwNU7rQ2R4+JkMbrrwQKfzRnYedOFiMEQmzrIta82TOXeqIvplaPh+A+oHxy3h8hXWIQ2eqsvykBXh3hKyOat0tiAkEHZVV73AmC46UdrJ6xm7NMa6oldvqDgKXdFrwmc+4ZLee/B1lakTxiSSXon9m1E0Lgc/LHz2eYRf6JTKGu5gC5jZ7y2x3u3ichVoIiwfWTNh3vLMVxPtuZeAlmYP21Wc+ZuFoMdxQC+lgs1y1pbim0vryssgijJKHBeeuCfE70T+FtvRn43fEdISz28yCpRwWpGAbYPqpyYiwOB++N969eDhtYRYwogIsxiFfpa4nZsT8tHaCWIfwAGGwunSxOpj3BTOhsCbTh3CYGF0U0k2ogLc6yq6E4SX2vjH8xY9DV4CzHSROYyAEcR1FAICViK3IfhTMRgwC1h6mIkTxcGkLz6MWTxhOLgfDTt8b+cLj5lE7cUJBZnBOIWbApvYBgYRc7U44dycGcDO41N3W7CjMimHY=</encrypted>]]>
    </text>
  </script>
</dir>