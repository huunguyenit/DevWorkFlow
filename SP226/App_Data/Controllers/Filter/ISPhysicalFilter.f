<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFilterViews SYSTEM "..\Include\XML\FlowFilterViews.txt">
  <!ENTITY XMLFlowFilterCommand SYSTEM "..\Include\XML\FlowFilterCommand.txt">
  <!ENTITY XMLFlowFilterCheck SYSTEM "..\Include\XML\FlowFilterCheck.txt">
  <!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">
  <!ENTITY ScriptFlowFilterFunction SYSTEM "..\Include\Javascript\FlowFilterFunction.txt">

  <!ENTITY Identity "ISPhysical">
  <!ENTITY c11 "Phiếu xuất từ ngày">
  <!ENTITY c12 "Issue Date from">
  <!ENTITY c21 "Số phiếu xuất">
  <!ENTITY c22 "Issue Number">
  <!ENTITY ext "38">

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'ISPhysicalFilter', 'Filter', 'ISTran'">
  <!ENTITY CheckRelativeQuery "
    select 'so_ct' as field, @$none as message
    return
">
]>

<dir table="m38$000000" code="stt_rec" order="ngay_ct, so_ct" id="PXH" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn phiếu xuất" e="Physical Issue"></title>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcEmcSYdxtUe+PSCBg6yibYyraQiOp/zqF5sxS9r6EbNtHJ3A23ZT9s/aPETr/dt4cIGLy+lqXZsPXmidmerr5tdvb1+sctnEwsCDSL94ESwkcZEr03WJ3vUs7MidnT8lzA5Ap+H5NcMEvNvdBmmNTl2179AegF5k7Z4CGEuMZXUAO8+gZLrGwKVO0HXZWimkYBbNubfB45Y5HfwvA5E9TxdwkPh+YkVAQRjR1DNVZAmoxaAHOatzCMaQJ4i5Q6klkgQl4whRhLd6Dyix+XAe9ILfrQLdfgtaOtqkH0bwWinbr85Ra/cwWhlvY2Y/xyNQYge+MjNFDDColn5rTVJEtUNhG7CIUGuHeBojo65d4tgOk42a9uh9EMTSgWT8XqtEFLrok3qtPqeGxncg2a3YRrA=</Encrypted>]]>&CheckRelativeProcess;&XMLFlowFilterCheck;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cTEHAvAq+gidm2OBN9//gMQwRrMnnY/tBE1Z8/AJV6pfUCh6Zrq7nTSxCsWCGGWEuUt5mp1xhVBwJcPXXLa/nM=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3hBvhiM3L1mWpQV78FCxGrIGZN6GqhMo3sNDsk4V/dVQfcY+TLoHUQdukE+nMRErkg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&Jl3E1PKXzK66ePUEZMCi8/qcujwKVF6jWLTpNH/gey7pY8SQWs9A5nbUAdv7oWjXRUjP+K+SON8lazouBd30jXeoYCK6UOAlFKYADcSrQLAAUZse4NXYvVdGpKTtTu8YGKBKEujBETtlST1q2bfMLA==</Encrypted>]]>
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