<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFilterViews SYSTEM "..\Include\XML\FlowFilterViews.txt">
  <!ENTITY XMLFlowFilterCommand SYSTEM "..\Include\XML\FlowFilterCommand.txt">
  <!ENTITY XMLFlowFilterCheck SYSTEM "..\Include\XML\FlowFilterCheck.txt">
  <!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">
  <!ENTITY ScriptFlowFilterFunction SYSTEM "..\Include\Javascript\FlowFilterFunction.txt">

  <!ENTITY Identity "SRPhysical">
  <!ENTITY c11 "Phiếu nhập từ ngày">
  <!ENTITY c12 "Goods Return Date From">
  <!ENTITY c21 "Số phiếu nhập">
  <!ENTITY c22 "Goods Return Number">
  <!ENTITY ext "36">

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'SRPhysicalFilter', 'Filter', 'SRTran'">
  <!ENTITY CheckRelativeQuery "
    select 'so_ct' as field, @$none as message
    return
">
]>

<dir table="m36$000000" code="stt_rec" order="ngay_ct, so_ct" id="HDR" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn phiếu nhập" e="Select Goods Return List"></title>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcEmcSYdxtUe+PSCBg6yibYyraQiOp/zqF5sxS9r6EbNtJyqLg40MCp+Irp3G3dWyjA6TU1gCfbzpOju9bAUrkE5FrLbLQBZsNerqk2egLVl+5x5n2KdcP4wtg82Un5BGJxAx3vF5Q2mZAySgif8miekEedsREIl0a/LcwCfzSqoMB+i3OWvqBTDTA094MLN1M02izjJie19644JrzikQrln2H2uNNLdyLs8gyRWcrZqKonuUOwfm4Wcri9MzmrEfiLRyNzPKzybCRXshvf0FqNb0CHp10zXOukRib88yY672XLdfoQLTzKAZVFLHF/uZHbBSxG4SW3lgD5N3LNPsf7Ct2mtmRi+UGWPByHKInV2v0s+TZl46x21b2e1PDQaRgj7G5kQVz9mnyaGG3BqXmCY=</Encrypted>]]>&CheckRelativeProcess;&XMLFlowFilterCheck;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cTEHAvAq+gidm2OBN9//gMQwRrMnnY/tBE1Z8/AJV6pfUCh6Zrq7nTSxCsWCGGWEuUt5mp1xhVBwJcPXXLa/nM=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3hBvhiM3L1mWpQV78FCxGrIGZN6GqhMo3sNDsk4V/dVQfcY+TLoHUQdukE+nMRErkg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&Jl3E1PKXzK66ePUEZMCi8/qcujwKVF6jWLTpNH/gey7pY8SQWs9A5nbUAdv7oWjXRUjP+K+SON8lazouBd30jXeoYCK6UOAlFKYADcSrQLAAUZse4NXYvVdGpKTtTu8YGKBKEujBETtlST1q2bfMLA==</Encrypted>]]>
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