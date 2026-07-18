<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFilterFields SYSTEM "..\Include\XML\FlowFilterFields.txt">
  <!ENTITY XMLFlowFilterViews SYSTEM "..\Include\XML\FlowFilterViews.txt">
  <!ENTITY XMLFlowFilterCommand SYSTEM "..\Include\XML\FlowFilterCommand.txt">
  <!ENTITY XMLFlowFilterCheck SYSTEM "..\Include\XML\FlowFilterCheck.txt">
  <!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">
  <!ENTITY ScriptFlowFilterFunction SYSTEM "..\Include\Javascript\FlowFilterFunction.txt">

  <!ENTITY Identity "WKIssue">
  <!ENTITY c11 "Phiếu xuất từ ngày">
  <!ENTITY c12 "Pick Date From">
  <!ENTITY c21 "Số phiếu xuất">
  <!ENTITY c22 "Pick Number">
  <!ENTITY ext "66">

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'WKIssueFilter', 'Filter', 'WKTran'">
  <!ENTITY CheckRelativeQuery "
    select 'so_ct' as field, @$none as message
    return
">
]>

<dir table="m66$000000" code="stt_rec" order="ngay_ct, so_ct" id="DX1" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn phiếu xuất" e="Select Pick List"></title>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcEmcSYdxtUe+PSCBg6yibYyraQiOp/zqF5sxS9r6EbNtJyqLg40MCp+Irp3G3dWyjA6TU1gCfbzpOju9bAUrkE5FrLbLQBZsNerqk2egLVl+5x5n2KdcP4wtg82Un5BGJ1FJHmf98tnb44cnqd7WSrdiYXCmzV7+W1XWQQ0Ng7F89KbHDgQuHy8JqJCKyG2jajgbsITY9kg7Pj30i0h/yNJVrrgvdawHOulOPDt2jBklbwg91FReTUtdZqf8a6NqcKfKqtBQqLgLTP4dL0Op1nedBry4o61Hu6hoOhZcvrfE2jQJspLGliKMRnSVQCJb/wBp6e/5YpKAmWdao5yyFtHaU8PMFIcOFKdpgudDDs63ptwmkUNNz61L6Huci7g/TQdq2GqS7TTCqJavG/XH/EMamgNvEHSECySyUrF8xbEM</Encrypted>]]>&CheckRelativeProcess;&XMLFlowFilterCheck;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cTEHAvAq+gidm2OBN9//gMQwRrMnnY/tBE1Z8/AJV6pfUCh6Zrq7nTSxCsWCGGWEuUt5mp1xhVBwJcPXXLa/nM=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3hBvhiM3L1mWpQV78FCxGrIGZN6GqhMo3sNDsk4V/dVQfcY+TLoHUQdukE+nMRErkg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&Jl3E1PKXzK66ePUEZMCi8/qcujwKVF6jWLTpNH/gey7pY8SQWs9A5nbUAdv7oWjXRUjP+K+SON8lazouBd30jXeoYCK6UOAlFKYADcSrQLAAUZse4NXYvVdGpKTtTu8YGKBKEujBETtlST1q2bfMLA==</Encrypted>]]>
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