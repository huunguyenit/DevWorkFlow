<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFilterFields SYSTEM "..\Include\XML\FlowFilterFields.txt">
  <!ENTITY XMLFlowFilterViews SYSTEM "..\Include\XML\FlowFilterViews.txt">
  <!ENTITY XMLFlowFilterCommand SYSTEM "..\Include\XML\FlowFilterCommand.txt">
  <!ENTITY XMLFlowFilterCheck SYSTEM "..\Include\XML\FlowFilterCheck.txt">

  <!ENTITY ScriptFlowFilterFunction SYSTEM "..\Include\Javascript\DPFilterFunction.txt">

  <!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">

  <!ENTITY Identity "CPDownPayment">
  <!ENTITY c11 "Giấy báo nợ từ ngày">
  <!ENTITY c12 "Date from">
  <!ENTITY c21 "Số phiếu">
  <!ENTITY c22 "Voucher Number">
  <!ENTITY ext "56">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'CPDownPaymentFilter', 'Filter', ''">
  <!ENTITY CheckRelativeQuery "
    select 'so_ct' as field, @$none as message
    return
">
]>

<dir table="m56$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn giấy báo nợ" e="Select Bank Debit Advice"></title>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5ouhRwVDXfM701d7VDswpft4Sd4q5jokGETfCgExOZTPnMCDG2AEGodO9guTQ5uGW6ptKBcopiNNk/mmX30sBlEd9Rtm60ALhilVnBoajT0sdgaZUDi+JG3CVXy+3/oS/iQGj/FG4GKWLLzjAEtp7GAFGxl0A2CvT8mseVtRLHVzupdfQ4HF4y0F3s/a1tVu+J4lgi3HaCsnEK3IPCFxag9NQSW63ThPxjnLuiHd7Dn0UFY022/1abE/MiTdpi64g7BZTiQ8FHTlgoXEwhX+VApkOWreXO69ciPmuDwqK4mpfcn1fMoXNLnvgl1KQpcufjfyGvF5RIopaj9UdnEDRwtzSdv4+Dgeyf/m/ZAx4YgMLYIQUVjICdT5ee2RtVplOEB54TsAINPKuam/b+Zvxs=</Encrypted>]]>&CheckRelativeProcess;&XMLFlowFilterCheck;
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