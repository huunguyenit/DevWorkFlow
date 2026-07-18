<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFilterViews SYSTEM "..\Include\XML\FlowFilterViews.txt">
  <!ENTITY XMLFlowFilterCommand SYSTEM "..\Include\XML\FlowFilterCommand.txt">
  <!ENTITY XMLFlowFilterCheck SYSTEM "..\Include\XML\FlowFilterCheck.txt">
  <!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">
  <!ENTITY ScriptFlowFilterFunction SYSTEM "..\Include\Javascript\FlowFilterFunction.txt">

  <!ENTITY Identity "SOQuotation">
  <!ENTITY c11 "Báo giá từ ngày">
  <!ENTITY c12 "Date From">
  <!ENTITY c21 "Số báo giá">
  <!ENTITY c22 "Quotation Number">
  <!ENTITY ext "61">

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'SOQuotationFilter', 'Filter', 'SOTran'">
  <!ENTITY CheckRelativeQuery "
    select 'so_ct' as field, @$none as message
    return">
]>

<dir table="m61$000000" code="stt_rec" order="ngay_ct, so_ct" id="SQ1" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn giấy báo giá" e="Select Quotation"></title>
  <fields>
    &FlowMultiFilterFields;
  </fields>

  <views>
    &XMLFlowFilterViews;
  </views>

  <commands>
    &XMLFlowFilterCommand;

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcEmcSYdxtUe+PSCBg6yibYyraQiOp/zqF5sxS9r6EbNtJyqLg40MCp+Irp3G3dWyjA6TU1gCfbzpOju9bAUrkE5FrLbLQBZsNerqk2egLVl+5x5n2KdcP4wtg82Un5BGJxAx3vF5Q2mZAySgif8miekBIQHgnR3baNSY5Va7K+GI6DUljBo0ZOeW4uCBJyDRkOmVvwNM7TaTBudugbos7VO0pTPidQWol6YBEQe16EbWXVkF0Tpd2QLDcspQFF4JTiXUuvg/uUa0Vr3n01UItFdipdPeViS5M5yjd5jRMTpx6o7d7J1fWgpn4A46fpVkFzXaErhAL+FlNMykMo825Vk55gdkAGTNLX0CaooyEzNkiZeJNmaPOy6Q9raAR7G8BqSxUpzt8+KKDLIaRCuq8yiL0MllcSLxV5rCErS8Vdsm</Encrypted>]]>&CheckRelativeProcess;&XMLFlowFilterCheck;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cTEHAvAq+gidm2OBN9//gMQwRrMnnY/tBE1Z8/AJV6pfUCh6Zrq7nTSxCsWCGGWEuUt5mp1xhVBwJcPXXLa/nM=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3hBvhiM3L1mWpQV78FCxGrIGZN6GqhMo3sNDsk4V/dVQfcY+TLoHUQdukE+nMRErkg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&Jl3E1PKXzK66ePUEZMCi8/qcujwKVF6jWLTpNH/gey7pY8SQWs9A5nbUAdv7oWjXRUjP+K+SON8lazouBd30jXeoYCK6UOAlFKYADcSrQLAAUZse4NXYvVdGpKTtTu8YGKBKEujBETtlST1q2bfMLA==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptFlowFilterFunction;
    </text>
  </script>

  &ScriptFlowFilterCss;
</dir>