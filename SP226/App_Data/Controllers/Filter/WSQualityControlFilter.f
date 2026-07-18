<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFilterViews SYSTEM "..\Include\XML\FlowFilterViews.txt">
  <!ENTITY XMLFlowFilterCommand SYSTEM "..\Include\XML\FlowFilterCommand.txt">
  <!ENTITY XMLFlowFilterCheck SYSTEM "..\Include\XML\FlowFilterCheck.txt">
  <!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">
  <!ENTITY ScriptFlowFilterFunction SYSTEM "..\Include\Javascript\FlowFilterFunction.txt">

  <!ENTITY Identity "WSQualityControl">
  <!ENTITY c11 "Chứng từ từ ngày">
  <!ENTITY c12 "QC Date from">
  <!ENTITY c21 "Số phiếu">
  <!ENTITY c22 "Voucher Number">
  <!ENTITY ext "97">

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'WSQualityControlFilter', 'Filter', 'WSTran'">
  <!ENTITY CheckRelativeQuery "
    select 'so_ct' as field, @$none as message
    return
">
]>

<dir table="m97$000000" code="stt_rec" order="ngay_ct, so_ct" id="PD2" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn phiếu kiểm định" e="Select QA Transaction"></title>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcEmcSYdxtUe+PSCBg6yibYyraQiOp/zqF5sxS9r6EbNtHJ3A23ZT9s/aPETr/dt4cIGLy+lqXZsPXmidmerr5tdvb1+sctnEwsCDSL94ESwkXyUe5GSLSxWcmUHgut352r3kfHNcemRUQ1QCTaqhlWFnnlkGYd+Jz43Ay9lhsvxcKinigp3KZA2qTHUC8ef4u9dnl7AUYuMwBPgFgb6aCbmn5h3Em+lyiFvOMjWMhwjEFuKnqOTbg7XPNMlAwX5SymA3AuNKVjxEhRtYqNOlO85jLC1bjGhSw5vch+y+OIATzgEqc1DiBUEK56b1ggh5xaXM+vJ9PhMZuNtvUXWqR6TwAwl0oAw/9cOpdEIUZsqoBCcrw4ne/SFyLVkIH8V8bevDqtmVeCLTQyk3gjWn/YT2L6Ubq3qZI/EmJXi8KnDn</Encrypted>]]>&CheckRelativeProcess;&XMLFlowFilterCheck;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cTEHAvAq+gidm2OBN9//gMQwRrMnnY/tBE1Z8/AJV6pfUCh6Zrq7nTSxCsWCGGWEuUt5mp1xhVBwJcPXXLa/nM=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3hBvhiM3L1mWpQV78FCxGrIGZN6GqhMo3sNDsk4V/dVQfcY+TLoHUQdukE+nMRErkg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&Jl3E1PKXzK66ePUEZMCi8/qcujwKVF6jWLTpNH/gey7pY8SQWs9A5nbUAdv7oWjXRUjP+K+SON8lazouBd30jXeoYCK6UOAlFKYADcSrQLAAUZse4NXYvVdGpKTtTu8YGKBKEujBETtlST1q2bfMLA==</Encrypted>]]>
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