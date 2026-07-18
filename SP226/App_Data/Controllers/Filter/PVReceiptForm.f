<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY Identity "PVReceipt">
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OxtLgDo0Qc9xaVo2DGXWD9uQsOqLbYSTi9QaNQgFC4h</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9O11Ok+FM+pOodAeyr450QWpUKIdOJChu+Z+yqvJnVo+MFSpcvf3CI1ANcjEN9u3tvMQGRiZcdUxCinBc5oydDEg6GJBvWTO7v3ogCthD8LsxNidUCpYgQM5lcMYcbXTLcwQm0SjwXiLGgsvzS3Rv7O2qlokNUtzJ16wnYFkQjBk1fuh/mZjsgM5TOZto/DGiNvBKX/DDdL378xoRdt1CBJNLhVGsZrJwWHpI/HuyozHrbs0Iu/u29t7AhqFzt9yBio//Ro3hNRnH5X7/sjtR8W2OS1feaeFT9awynrc2POkJlU/7gVnp/dTzSBlDwKpHvlZUR7viq7PTNEsVEVJW4oLpsF0UQInHWzu9knJkvpLtxJFpHFGpqh6KB9Tvb3RUlZiCV97MKY1UpOSfQkWdElLZn7Bif3usprBdchWfDSoUcwjbfqdiHN7leNU7DReeqf8tu3t2iVSEQJLMbHtleNi4Dc4U0R6sANtjCcaOQYQWwi0/U2m5ttj0KeDepj7jw==</encrypted>]]>&XMLHiddenFields;<![CDATA[<encrypted>%bTwx6BwczM9aR7zqTp36M9d18qwxAo1FWFSWnP3O7YccM0Sar8VRdcaMhBcSSBmyZ3uQhFxdrTBPOJzry792YWcr7BFOrjCxHhLS8l7EyFdz50Z5d8wsZ57EAgmjMiY6gSLLOMtZG0ra5IRjgGwaV/Tdb81FGdeQYFx393wb28hGXBwaFiw/AomoZwNU7rQ2R4+JkMbrrwQKfzRnYedOFiMEQmzrIta82TOXeqIvplaPh+A+oHxy3h8hXWIQ2eqsvykBXh3hKyOat0tiAkEHZVV73AmC46UdrJ6xm7NMa6oldvqDgKXdFrwmc+4ZLee/B1lakTxiSSXon9m1E0Lgc/LHz2eYRf6JTKGu5gC5jZ7y2x3u3ichVoIiwfWTNh3vLMVxPtuZeAlmYP21Wc+ZuFoMdxQC+lgs1y1pbim0vryssgijJKHBeeuCfE70T+FtvRn43fEdISz28yCpRwWpGAbYPqpyYiwOB++N969eDhtYRYwogIsxiFfpa4nZsT8tHaCWIfwAGGwunSxOpj3BTOhsCbTh3CYGF0U0k2ogLc6yq6E4SX2vjH8xY9DV4CzHSROYyAEcR1FAICViK3IfhTMRgwC1h6mIkTxcGkLz6MWTxhOLgfDTt8b+cLj5lE7cUJBZnBOIWbApvYBgYRc7U44dycGcDO41N3W7CjMimHY=</encrypted>]]>
    </text>
  </script>
</dir>