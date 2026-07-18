<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFilterViews SYSTEM "..\Include\XML\FlowFilterViews.txt">
  <!ENTITY XMLFlowFilterCommand SYSTEM "..\Include\XML\FlowFilterCommand.txt">
  <!ENTITY XMLFlowFilterCheck SYSTEM "..\Include\XML\FlowFilterCheck.txt">
  <!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">
  <!ENTITY ScriptFlowFilterFunction SYSTEM "..\Include\Javascript\FlowFilterFunction.txt">

  <!ENTITY Identity "SVIssue">
  <!ENTITY c11 "Phiếu xuất từ ngày">
  <!ENTITY c12 "Pick Date from">
  <!ENTITY c21 "Số phiếu xuất">
  <!ENTITY c22 "Pick Number">
  <!ENTITY ext "66">

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'SVIssueFilter', 'Filter', 'SVTran'">
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcEmcSYdxtUe+PSCBg6yibYyraQiOp/zqF5sxS9r6EbNtNyrLCilDT3R8TlXDOn5gFyc/xGuSalXl7byqi3cVJOItEWkEE70lmzCeWOgZ+ApPDpVPnHwSTNZhz4+xytwEomN1A+3nTG7eY8aVgyMRELs9cXq4IiDwUyA37QqeTSz99OlDhNXFIwrkNb//l4BM6kF7gBf42FZEvCANok6ucK9l4/OOwoKDDsqjEu1TmWS8PO4lLB5b/M3fkKdO8LQyn7e2LtLzfKXw3PSTlVAoyOEl7+ut5Ot0j+Nj6sPxlxvAtoiu/5OQ9r5a8paj64lOeovold6P7paG8YluitTT2byK52YEcRHJh7nD8tZa7DzeEVbFNKwj7A6THsBewGNuASBy02UuZjCy30iFmvdWpcvsGF6rQq2+OpFgLayCBuwX</Encrypted>]]>&CheckRelativeProcess;&XMLFlowFilterCheck;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cTEHAvAq+gidm2OBN9//gMQwRrMnnY/tBE1Z8/AJV6pfUCh6Zrq7nTSxCsWCGGWEuUt5mp1xhVBwJcPXXLa/nM=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3hBvhiM3L1mWpQV78FCxGrIGZN6GqhMo3sNDsk4V/dVQfcY+TLoHUQdukE+nMRErkg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&Jl3E1PKXzK66ePUEZMCi8/qcujwKVF6jWLTpNH/gey7pY8SQWs9A5nbUAdv7oWjXRUjP+K+SON8lazouBd30jXeoYCK6UOAlFKYADcSrQLAAUZse4NXYvVdGpKTtTu8YGKBKEujBETtlST1q2bfMLA==</Encrypted>]]>
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