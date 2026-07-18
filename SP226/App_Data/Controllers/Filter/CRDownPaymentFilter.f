<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFilterFields SYSTEM "..\Include\XML\FlowFilterFields.txt">
  <!ENTITY XMLFlowFilterViews SYSTEM "..\Include\XML\FlowFilterViews.txt">
  <!ENTITY XMLFlowFilterCommand SYSTEM "..\Include\XML\FlowFilterCommand.txt">
  <!ENTITY XMLFlowFilterCheck SYSTEM "..\Include\XML\FlowFilterCheck.txt">

  <!ENTITY ScriptFlowFilterFunction SYSTEM "..\Include\Javascript\DPFilterFunction.txt">

  <!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">

  <!ENTITY Identity "CRDownPayment">
  <!ENTITY c11 "Phiếu thu từ ngày">
  <!ENTITY c12 "Date from">
  <!ENTITY c21 "Số phiếu">
  <!ENTITY c22 "Voucher Number">
  <!ENTITY ext "41">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'CRDownPaymentFilter', 'Filter', ''">
  <!ENTITY CheckRelativeQuery "
    select 'so_ct' as field, @$none as message
    return
">
]>

<dir table="m41$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn phiếu thu" e="Select Cash Receipt"></title>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5ouhRwVDXfM701d7VDswpft4Sd4q5jokGETfCgExOZTPnMCDG2AEGodO9guTQ5uGW6ptKBcopiNNk/mmX30sBlEd9Rtm60ALhilVnBoajT0sdgaZUDi+JG3CVXy+3/oS/iQGj/FG4GKWLLzjAEtp7HyHfKd34poEx5u5rmC27h/WYb+yrqaclYCR9Nq5UZOUlxkvM7DX4lOAYjXWAFRxv00eXtp5qWXyXmJ0Xi3Xhpel/no1pxfRNhY8QgNCbmULyiQ9SJBIZqU+pHYmTc2FQcE3pFUYttIxA4m1mlZDqFM0EOK5tEhfABKo2dnuiKHLnQEOZrPzHKJe0WgBtsBqCloU9Y4M4Pa8couvgiOfPwtQF2DbUyXHcoLsafV9B9eDg==</Encrypted>]]>&CheckRelativeProcess;&XMLFlowFilterCheck;
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