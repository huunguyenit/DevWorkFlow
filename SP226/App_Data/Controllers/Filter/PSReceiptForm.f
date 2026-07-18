<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY Identity "PSReceipt">
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OxtLgDo0Qc9xaVo2DGXWD9uQsOqLbYSTi9QaNQgFC4h</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9O11Ok+FM+pOodAeyr450QWpUKIdOJChu+Z+yqvJnVo+MFSpcvf3CI1ANcjEN9u3tvMQGRiZcdUxCinBc5oydDEg6GJBvWTO7v3ogCthD8LsxNidUCpYgQM5lcMYcbXTLcwQm0SjwXiLGgsvzS3Rv7O2qlokNUtzJ16wnYFkQjBk1fuh/mZjsgM5TOZto/DGiNvBKX/DDdL378xoRdt1CBJNLhVGsZrJwWHpI/HuyozHrbs0Iu/u29t7AhqFzt9yBio//Ro3hNRnH5X7/sjtR8W2OS1feaeFT9awynrc2POkJlU/7gVnp/dTzSBlDwKpHvlZUR7viq7PTNEsVEVJW4oLpsF0UQInHWzu9knJkvpLtxJFpHFGpqh6KB9Tvb3RUlZiCV97MKY1UpOSfQkWdElLZn7Bif3usprBdchWfDSoUcwjbfqdiHN7leNU7DReeqf8tu3t2iVSEQJLMbHtleNi4Dc4U0R6sANtjCcaOQYQWwi0/U2m5ttj0KeDepj7jw==</encrypted>]]>&XMLHiddenFields;<![CDATA[<encrypted>%bTwx6BwczM9aR7zqTp36M9d18qwxAo1FWFSWnP3O7Ye0LSQQ3B98oAyYa6qXmxq83NNzZiLLNsIddpsgfVa6mPLrARx98nHtJTN8gv4nVE2bDZUp8pUD/hrS8fyxtJZKw+lS5e/E+fm7fmiBBJeUMF2tFtWZwmjGGOVz8oXivqbQc3esj+0COMdOXLLfa55DVoiyhY2e7ryzwDz0ThQTGCTwl0fRCMci6pe9fr+Ubqs+IwB27r+UmJz2/tapDsP7A4F9PKZ2a0KovWFko791a1ShxNupXo9D2z2jcu1lCPbPQhU5pFWNdT/yfDCKQi0xwLumzUYXQQOhAMo+n+1/8G5BMZWdi7ufvd0iy8Ot/5+ojF/03nw/vGX556uMwOrr+jGaCIPp2BZc997BnJbVCZ5UavIz06vHjdqT/vXjwVha1MPffKlTuz9Qi0sLvmaiAEMZJn7v6Wt9eWvc0vuiI1rJ7NFdOYEGazwrhckBTf4AL+LpMn1mO/zaY/yn5LNOO/It4VX8TO23b+kVDhAIEMvJSeUgf4nuMcEQB9IrliUYB5eUPDE01tMFTJKkCdFTmc1+DtFVRwtN7fE82iUAoceLIqeabOIeUNQppHrmKbvBPW9LloeE7ReNMWeYZXuXTcnY3hdJr/dM+WSMlyV16YpGN9n/YG6IPWRgR7Ne2XP2ESTuw6ph8WyuvbCXmK2BjcMdBY+wUA5jdXXmIg+DC/T4vHcldA/T5L838oeLqvSOas8cLsJlOvEO5i2azAsVN7+C7kOPyvyF9Fc0sTivjReIUR76qkeqSktKSIwG+m4BZmU57scOzB73N+ojo3N4ECCCXssC9e7BlIxlE/K3cWPpXoXBlTHn11jWOcyyc9gr7cpjku5izvKHDAb3FMWmbBJ14h/XOny86RVAX9dTs3k2arOjrVe+dkucwtEojp7zRrF4dmysrksaPxO3oS23wtFaYi+ZvPfEbODoG3aJrGtzkKVz7y1bOVKo5wQtY99mcSw4r+SIMFx7TTu3Fu0i8y98Y6nQGh1uQFqGpDIeQtH9ZMUYtoA565OWWskwW9+8WzUe/9z2jluzyWJ6BwbRqi55OhUClcdleU56kfxvY9lAlSdC++qC8eGMnoNHDeDxMcOmL4YMEl5Ie1cT7Nq8DDxqHe67xfd/shUTDv+XkqdVG6KTbjIkACISCKiP+eRx3k+Bpwj5v4k44zEHPuZadzlgh8ZL30mD9au7U/bUoC1p3R4XcVZCTHn4mzkr3a8=</encrypted>]]>
    </text>
  </script>
</dir>
