<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFilterFields SYSTEM "..\Include\XML\FlowFilterFields.txt">
  <!ENTITY XMLFlowFilterViews SYSTEM "..\Include\XML\FlowFilterViews.txt">
  <!ENTITY XMLFlowFilterCommand SYSTEM "..\Include\XML\FlowFilterCommand.txt">
  <!ENTITY XMLFlowFilterCheck SYSTEM "..\Include\XML\FlowFilterCheck.txt">
  <!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">
  <!ENTITY ScriptFlowFilterFunction SYSTEM "..\Include\Javascript\FlowFilterFunction.txt">

  <!ENTITY % SplitIssuingOrder SYSTEM "..\Include\SplitIssuingOrder.ent">
  %SplitIssuingOrder;

  <!ENTITY Identity "SIIssue">
  <!ENTITY c11 "&SplitIssuingOrderC11;">
  <!ENTITY c12 "&SplitIssuingOrderC12;">
  <!ENTITY c21 "&SplitIssuingOrderC21;">
  <!ENTITY c22 "&SplitIssuingOrderC22;">
  <!ENTITY ext "66">

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'SIIssueFilter', 'Filter', 'SITran'">
  <!ENTITY CheckRelativeQuery "
    select 'so_ct' as field, @$none as message
    return
">
]>

<dir table="m66$000000" code="stt_rec" order="ngay_ct, so_ct" id="&SplitIssuingOrderVoucherCode;" xmlns="urn:schemas-fast-com:data-dir">
  <title v="&SplitIssuingOrderSIIssueFilterTitle.v;" e="&SplitIssuingOrderSIIssueFilterTitle.e;"></title>
  <fields>
    &XMLFlowFilterFields;
  </fields>

  <views>
    &XMLFlowFilterViews;
  </views>

  <commands>
    &XMLFlowFilterCommand;

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5ouhRwVDXfM701d7VDswpez7+/+e4uNdngeMhXgf+a9devon2VJybaIu5rOMrMd9f4MDhqqVlLAcKF6GmieNAOh7jkbUQexTT4KFaMn4y57NXBUTxJTsvgpYdXrBrD2BYadTlg8g4xxXyD7Pmsdf5PAFpp0A06Caor/K0qlYc0Wizzlrvns07SKLUkgdQoVe0zOw+S8UT9ME0BKJkqGe+CfipBLscHLnI5MTart8ic1oOCOSB2uSonPDCPzampAIIl92OeNL4YDfu+lEwHt3yDUo/4kkr0w1Qrj80NNdXRXENCqSNkPymYbbRynOHtyK5D8dHhd850vS4yFoww5CLada5Bw1/s1U0aGbHKFLTR4S2DdMGEHvL04n4yk0JaO0siy4FyIYpEmlXF8tZsJeks=</Encrypted>]]>&CheckRelativeProcess;&XMLFlowFilterCheck;
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