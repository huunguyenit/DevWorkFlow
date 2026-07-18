<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFilterViews SYSTEM "..\Include\XML\FlowFilterViews.txt">
  <!ENTITY XMLFlowFilterCommand SYSTEM "..\Include\XML\FlowFilterCommand.txt">
  <!ENTITY XMLFlowFilterCheck SYSTEM "..\Include\XML\FlowFilterCheck.txt">
  <!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">
  <!ENTITY ScriptFlowFilterFunction SYSTEM "..\Include\Javascript\FlowFilterFunction.txt">

  <!ENTITY Identity "ISMR">
  <!ENTITY c11 "Phiếu yêu cầu từ ngày">
  <!ENTITY c12 "Requisition Date from">
  <!ENTITY c21 "Số phiếu yêu cầu">
  <!ENTITY c22 "Requisition Number">
  <!ENTITY ext "87">

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'ISMRFilter', 'Filter', 'ISTran'">
  <!ENTITY CheckRelativeQuery "
    select 'so_ct' as field, @$none as message
    return
">

]>

<dir table="m87$000000" code="stt_rec" order="ngay_ct, so_ct" id="PX0" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn phiếu yêu cầu lĩnh vật tư" e="Select Material Requisition"></title>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcEmcSYdxtUe+PSCBg6yibYyraQiOp/zqF5sxS9r6EbNtJyqLg40MCp+Irp3G3dWyjA6TU1gCfbzpOju9bAUrkE5FrLbLQBZsNerqk2egLVl+3KVxdjfW5MXB9mKayus/dxmw6xh+UcNFbqk5dcqGCgWScyoIk3iI/OFEApjHHlAVNamhyUtsuIlN4J/30BKMx9Ka9+GKOlfsy69eWz8ydG1QalPQ9+o5ldgwTk/elfxKgP99RVa1B3E1/Y/UNqc2LnOYDce3BVJW6ygr0AHpbdgXh6uZ9wIR0sJ6lgM2dxQSAmi/3kL0IINjMgxeLFbz9y78sHxq5t9MLgqfWZqMkA6zJa6ZMF79dtLqrXBBVSdDNmvw8wHV75WdyQ3oYIuCZqMrQA9LSG80kOaE6wsmvak=</Encrypted>]]>&CheckRelativeProcess;&XMLFlowFilterCheck;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cTEHAvAq+gidm2OBN9//gMQwRrMnnY/tBE1Z8/AJV6pfUCh6Zrq7nTSxCsWCGGWEuUt5mp1xhVBwJcPXXLa/nM=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3hBvhiM3L1mWpQV78FCxGrIGZN6GqhMo3sNDsk4V/dVQfcY+TLoHUQdukE+nMRErkg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&Jl3E1PKXzK66ePUEZMCi8/qcujwKVF6jWLTpNH/gey7pY8SQWs9A5nbUAdv7oWjXRUjP+K+SON8lazouBd30jXeoYCK6UOAlFKYADcSrQLAAUZse4NXYvVdGpKTtTu8YGKBKEujBETtlST1q2bfMLA==</Encrypted>]]>
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