<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFilterViews SYSTEM "..\Include\XML\FlowFilterViews.txt">
  <!ENTITY XMLFlowFilterCommand SYSTEM "..\Include\XML\FlowFilterCommand.txt">
  <!ENTITY XMLFlowFilterCheck SYSTEM "..\Include\XML\FlowFilterCheck.txt">
  <!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">
  <!ENTITY ScriptFlowFilterFunction SYSTEM "..\Include\Javascript\FlowFilterFunction.txt">

  <!ENTITY Identity "PVIR">
  <!ENTITY c11 "Phiếu nhập từ ngày">
  <!ENTITY c12 "Receipt Date from">
  <!ENTITY c21 "Số phiếu nhập">
  <!ENTITY c22 "Receipt Number">
  <!ENTITY ext "74">

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'PVIRFilter', 'Filter', 'PVTran'">
  <!ENTITY CheckRelativeQuery "
    select 'so_ct' as field, @$none as message
    return
">
]>

<dir table="m74$000000" code="stt_rec" order="ngay_ct, so_ct" id="PND" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn phiếu nhập kho" e="Select Receipt"></title>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcEmcSYdxtUe+PSCBg6yibYyraQiOp/zqF5sxS9r6EbNtHJ3A23ZT9s/aPETr/dt4cIGLy+lqXZsPXmidmerr5tdvb1+sctnEwsCDSL94ESwkXyUe5GSLSxWcmUHgut352r3kfHNcemRUQ1QCTaqhlWEIJnnXjX4tFRzU1c/1KR2RrJpIhb5FElIYYevI0nwLyT5BGrIVxA2mZAW4ocAlEjr0lp2x6jtRCYSQSzkLRm60nAJHLxGxrcnOVca5wiNcj9uy/HOrWO9hEX5I30I5t9OLWCDwqIrqynXGoER+MjyWEb0L0QBFnXnVs27rU0sgncLlw4336Ao/RYTKHqUVQveqwrnadq+DYySCik/wzYydHBfbPLqJ7n2oqPxfOfEg8eyG2Ec/sV6MI0vXlw33zkQWzURBmoF2SgLmTzRoywZVOSElsBqdn4/96CwWuqWzvrO+aVqgHk8m0jSbbDwtvAg=</Encrypted>]]>&CheckRelativeProcess;&XMLFlowFilterCheck;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cTEHAvAq+gidm2OBN9//gMQwRrMnnY/tBE1Z8/AJV6pfUCh6Zrq7nTSxCsWCGGWEuUt5mp1xhVBwJcPXXLa/nM=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3hBvhiM3L1mWpQV78FCxGrIGZN6GqhMo3sNDsk4V/dVQfcY+TLoHUQdukE+nMRErkg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&Jl3E1PKXzK66ePUEZMCi8/qcujwKVF6jWLTpNH/gey7pY8SQWs9A5nbUAdv7oWjXRUjP+K+SON8lazouBd30jXeoYCK6UOAlFKYADcSrQLAAUZse4NXYvVdGpKTtTu8YGKBKEujBETtlST1q2bfMLA==</Encrypted>]]>
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