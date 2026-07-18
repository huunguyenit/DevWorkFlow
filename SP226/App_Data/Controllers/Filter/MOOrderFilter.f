<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFilterFields SYSTEM "..\Include\XML\FlowFilterFields.txt">
  <!ENTITY XMLFlowFilterViews SYSTEM "..\Include\XML\FlowFilterViews.txt">
  <!ENTITY XMLFlowFilterCommand SYSTEM "..\Include\XML\FlowFilterCommand.txt">
  <!ENTITY XMLFlowFilterCheck SYSTEM "..\Include\XML\FlowFilterCheck.txt">
  <!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">
  <!ENTITY ScriptFlowFilterFunction SYSTEM "..\Include\Javascript\FlowFilterFunction.txt">

  <!ENTITY Identity "MOOrder">
  <!ENTITY c11 "Đơn hàng từ ngày">
  <!ENTITY c12 "Order Date from">
  <!ENTITY c21 "Số đơn hàng">
  <!ENTITY c22 "Order Number">
  <!ENTITY ext "64">

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'MOOrderFilter', 'Filter', 'MOTran'">
  <!ENTITY CheckRelativeQuery "
    select 'so_ct' as field, @$none as message
    return
">
]>

<dir table="m64$000000" code="stt_rec" order="ngay_ct, so_ct" id="DXA" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn đơn hàng" e="Select Sales Order"></title>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5ouhRwVDXfM701d7VDswpeWAIPmqLrh5K8vWYTJHH+uYHmNFJSjilb77qWdmnjXYvQMPDpl6ls9r5CYV/BJrIzxB1C4jw8IWOMwXY6qt0J5COigRr4r9mq09MUcqaV4MAbUc3sjAmJtrrSFjw83I0X7Q4buLWjGWDcue22Pj5OETW5MGikIk+YS9uOdg8UAoK8FZr+WxDBX43RtVwgXs8aUzWWXstlzwK0jA1TyrFmkbRXphdK1qEiNktfImJUOvsQgEz5Xawqdob2AMDwHIYA3NXGo3qQrCYMdipBWj7PWqlUXrjckk4J6ge+yhY9OctZTkz/lPdNWSue2Ux9Vk2VcwIcfYeQCUPtepJnbTP9F</Encrypted>]]>&CheckRelativeProcess;&XMLFlowFilterCheck;
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