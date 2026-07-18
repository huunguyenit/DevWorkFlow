<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFilterFields SYSTEM "..\Include\XML\FlowFilterFields.txt">
  <!ENTITY XMLFlowFilterViews SYSTEM "..\Include\XML\FlowFilterViews.txt">
  <!ENTITY XMLFlowFilterCommand SYSTEM "..\Include\XML\FlowFilterCommand.txt">
  <!ENTITY XMLFlowFilterCheck SYSTEM "..\Include\XML\FlowFilterCheck.txt">
  <!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">
  <!ENTITY ScriptFlowFilterFunction SYSTEM "..\Include\Javascript\FlowFilterFunction.txt">

  <!ENTITY Identity "PMDeclaration">
  <!ENTITY c11 "Tờ khai từ ngày">
  <!ENTITY c12 "Date from">
  <!ENTITY c21 "Số tờ khai">
  <!ENTITY c22 "Voucher Number">
  <!ENTITY ext "98">

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'PMDeclarationFilter', 'Filter', 'PMTran'">
  <!ENTITY CheckRelativeQuery "
    select 'so_ct' as field, @$none as message
    return">
]>

<dir table="m98$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn tờ khai" e="Select Customs Declaration"></title>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5ouhRwVDXfM701d7VDswpez7+/+e4uNdngeMhXgf+a9mCmrkvfnKpVErC0/jHX9+8vpyxX3wQM7o7Wmjm50eC3k4jjB7cJSf9/3yGfUa8JgzForAOmhnFX2Tl8seZN8RAB9Rkv6kRmRDwElbmWVoKm3up0gsShMog0SbES7y+d/Fdw48PXM8O1gA9HlT8iOg6GRV6k4fEISaqohWzKicmeR2vphs3EiQlUdhl8pFrYOV8UiZlxSZAXZXgibofTLpsoi4CpkhHKzmN6MiYEY6zb05Jeehv3aIipTmLljFLxEd9T1Vr3ypS9Hcz02qCSbAGr/SM2Vm0WJlkbMOXO4nd0bZ3Irj1TsEtFMzOHNL4Xd</Encrypted>]]>&CheckRelativeProcess;&XMLFlowFilterCheck;
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