<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFilterViews SYSTEM "..\Include\XML\FlowFilterViews.txt">
  <!ENTITY XMLFlowFilterCommand SYSTEM "..\Include\XML\FlowFilterCommand.txt">
  <!ENTITY XMLFlowFilterCheck SYSTEM "..\Include\XML\FlowFilterCheck.txt">
  <!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">
  <!ENTITY ScriptFlowFilterFunction SYSTEM "..\Include\Javascript\FlowFilterFunction.txt">

  <!ENTITY Identity "PGOrder">
  <!ENTITY c11 "Đơn hàng từ ngày">
  <!ENTITY c12 "Order Date from">
  <!ENTITY c21 "Số đơn hàng">
  <!ENTITY c22 "Order Number">
  <!ENTITY ext "94">

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'PGOrderFilter', 'Filter', 'PGTran'">
  <!ENTITY CheckRelativeQuery "
    select 'so_ct' as field, @$none as message
    return
">
]>

<dir table="m94$000000" code="stt_rec" order="ngay_ct, so_ct" id="PO1" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn đơn hàng" e="Select Order"></title>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcEmcSYdxtUe+PSCBg6yibYyraQiOp/zqF5sxS9r6EbNtNyrLCilDT3R8TlXDOn5gFyc/xGuSalXl7byqi3cVJOKBPp1NUt1nqlfRvmnvIt4jERNWD08MPFT40QZffNCRzBCxsioM/n5Mj7OVterHMZIMdv0UJRuPdqMcHYEXcKdQW5VUzNjPIf66Ms7hds2TjGASP1NUsQaLRMQVB1qU4+ofhEHbRGMgDztMoF9bwrhEAoJEVxBk4YWniWT1gRaCb7rN/jGS+kCkPzURCjGL8Y2jmcs4JWeQZdlIkv2fmGHFH4tZpOnLZjJwf/AcSkjQYFizbYKvDY1aMguJef9qo+Q1hrVxx6FSR0CQ80HkgoTH7onJKzx9GgewrZdfRpKNnT+HUrNlGraJZdj3rJmGIdq4HKbLQvqukTDbd8rs5LWw</Encrypted>]]>&CheckRelativeProcess;&XMLFlowFilterCheck;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cTEHAvAq+gidm2OBN9//gMQwRrMnnY/tBE1Z8/AJV6pfUCh6Zrq7nTSxCsWCGGWEuUt5mp1xhVBwJcPXXLa/nM=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3hBvhiM3L1mWpQV78FCxGrIGZN6GqhMo3sNDsk4V/dVQfcY+TLoHUQdukE+nMRErkg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&Jl3E1PKXzK66ePUEZMCi8/qcujwKVF6jWLTpNH/gey7pY8SQWs9A5nbUAdv7oWjXRUjP+K+SON8lazouBd30jXeoYCK6UOAlFKYADcSrQLAAUZse4NXYvVdGpKTtTu8YGKBKEujBETtlST1q2bfMLA==</Encrypted>]]>
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