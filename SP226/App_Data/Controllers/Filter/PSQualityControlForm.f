<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY Identity "PSQualityControl">
  <!ENTITY DetailTable "d97">
  <!ENTITY c11 "Mã ncc">
  <!ENTITY c12 "Supplier">
  <!ENTITY c21 "Số phiếu">
  <!ENTITY c22 "Voucher Number">
  <!ENTITY c31 "Ngày chứng từ">
  <!ENTITY c32 "Voucher Date">
]>

<dir table="m97$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Phiếu kiểm định chất lượng" e="QA Transaction"></title>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OxtLgDo0Qc9xaVo2DGXWD9uQsOqLbYSTi9QaNQgFC4h</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9O11Ok+FM+pOodAeyr450QWpUKIdOJChu+Z+yqvJnVo+AHlYyfcRj/F/5fkb1AjHZJKxI7O8pocR5wYsV3xI0GwxfgQudj47ptW5MhUF504AkNA+W2S+u7PLuAKj1g64229nZWrx+nnqazyysOJKFzpaaPu27R0RTY9Rw5vxFtXKFJ7SYMaoX9uYlHcYA656vbf4WGV2wjV8o4AE4Jhx1yUtdFGrRwcfe3CuqUWpcCMOpVRAtcTHEuMuQVDQ7kIQgdfP+ITq6u75NByDUa96a4T2qAVyJ/biN6XZBzk2GDCX1fkEC3Ebujd/0f2pYuyGbuKRNR7HvNYMUIZ48dX23uaxX20qJc4dH5FGYep3/GD2Ez3vDXGIZRc+qgehg9U4S/kkiLWsZ1QopiRvya0LhsE1keTF8GLhRzxAaqvJ0aX/kFj4JHIsA8y3ts2lw78ykBbiBEzsTdieYRGRTJD31MBIIC+VGfcqOC7yv/UjsCx2uNT58iX7pYhOJWZPTvDb5A==</encrypted>]]>&XMLHiddenFields;<![CDATA[<encrypted>%bTwx6BwczM9aR7zqTp36M9d18qwxAo1FWFSWnP3O7YfsCVQmH3PxjKSFVAXSasal4/T+oBrY/YhHOSFbXxWc93SO/KUw8dLI6XgDcPpvYRWijD5ctPKNLeflvhPisnOT7cowjNovB3vHfOI8zaleL4vHdlgim8PdIaRzTTGDJbPC8Bhj2whMMGOmcva3CgBCD53X6HIs28EGCiPY4bs5KwwtBf57PRsL9ie9zrPMS/dgwPAuqZSbk7vYfdzqLkwfCONEAaGPEfp3p6PhN14sIfBrG3SYJ3Ech1oMpM3lGBIZWg9SwHM/FNsJzotzVxm2n4XTlQtgSD95SBDnWjP46AJMqNsBIRqYd+tB4JjmT3k4vU1HipFaguNQybsta77wAoLej8QUTgVpGl5+ZKohLRxzw2rak6a9LKxElRvmdYaTVnmguoLZuli7uBIgP+B4vda05aMdF+KjsO/80zwqbD0kcjqCrVY09f0sWRl4WiF9sjqUVT4TctuCSkOinBrEgb3BJy7hsZwKACk9KbS2xC7ia0rx7Za+3iOPpun6uX3NvJqKONTTrO+fzzZ/e87ofSsWQZ1ZTUTkZpa01FNo9ifHLI9xpkoKC2u2zrpJLSYZVj94y7jhQlfIWBnNtZZ+d0G2Oyu75tuBs6K1e1h4zbnZHj3kJWW5oNAnkiDnpZ7CEV35VN5HOdQK5MIi2EdHKUeBBjkSTs+e0GJNAmit3cxPIvqmr7MuDKzEViyan23RXZSEbvW4y6TcGBTfivAVktxnw0UaW+7Sn8L1rkEuoKw+oADPHWdz4bE6IBLKbzRl4SIYssHTcFLiGk51RBJpFq54dygPhqQhN8PiLu387TRgry8k8XGxxvq0Nxa0IyiTEluicCeKHmlH2Hse75uZnWIs5+zuobCacTI8/cf7iTE4Zah3oPUpgIfXdVhrq1skHp0JTLz5maUKoEptbFsiXbLHT6P5vScm1BWrE3YIGBxIpiB+mKU19O0VLWuap8Xz+hmYZAvyJ+CHWhGWj4kzMT9AZYHUhrA0bUDy2mvN8AJef5wpjddhSg8b8H22Xwhl1JdPU/BddWxsOpX51mzOsKl94ZA+WlyXS48L+6dxPjEyFTNO2nNUUgK/WMJlVaH1HxKu4nRhsX9/SCNk4NGV/gVGBerXjqae55IixiMtWCYlvzQIZvDvIV+hX/KY0oskiTtjiq7fZpQorHWWHsn5kdzr4bXWPN+1UU0cjasI81iV6x3xCUVsMF2641DsTrc=</encrypted>]]>
    </text>
  </script>
</dir>
