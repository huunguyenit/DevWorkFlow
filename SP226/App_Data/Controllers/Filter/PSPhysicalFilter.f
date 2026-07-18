<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFilterViews SYSTEM "..\Include\XML\FlowFilterViews.txt">
  <!ENTITY XMLFlowFilterCommand SYSTEM "..\Include\XML\FlowFilterCommand.txt">
  <!ENTITY XMLFlowFilterCheck SYSTEM "..\Include\XML\FlowFilterCheck.txt">
  <!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">
  <!ENTITY ScriptFlowFilterFunction SYSTEM "..\Include\Javascript\FlowFilterFunction.txt">

  <!ENTITY Identity "PSPhysical">
  <!ENTITY c11 "Phiếu xuất từ ngày">
  <!ENTITY c12 "Return Goods Date From">
  <!ENTITY c21 "Số phiếu xuất">
  <!ENTITY c22 "Return Goods Number">
  <!ENTITY ext "68">

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'PSPhysicalFilter', 'Filter', 'PSTran'">
  <!ENTITY CheckRelativeQuery "
    select 'so_ct' as field, @$none as message
    return
">
]>

<dir table="m68$000000" code="stt_rec" order="ngay_ct, so_ct" id="PXR" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn phiếu xuất" e="Select Return Goods to Supplier"></title>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcEmcSYdxtUe+PSCBg6yibYyraQiOp/zqF5sxS9r6EbNtJyqLg40MCp+Irp3G3dWyjA6TU1gCfbzpOju9bAUrkE5FrLbLQBZsNerqk2egLVl+5x5n2KdcP4wtg82Un5BGJxAx3vF5Q2mZAySgif8miekBIQHgnR3baNSY5Va7K+GI6zdBZFs2oI31iMxVdP027iw2fAIDncrkUHLCZM79+vKHEoW3NVgz39I8pCIeW3qa/8VcZEf7TqIl9vJuwRHN5RUnMtzC2MKHDvCEgsFj4jrC+483E9FenjtKyzoSNIobTTSlS+abzDWK5Vy5kBCnsMhNX+cyHrpIL67HMyaJlqwDsJzILrWNOifr3aEmWFrz3KzR4fcgvW5DJwjW7gVj0EHJ6iVgbPlm0EwNFdPza8DIZm+7cpRdGVFjWBIPxvN4</Encrypted>]]>&CheckRelativeProcess;&XMLFlowFilterCheck;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cTEHAvAq+gidm2OBN9//gMQwRrMnnY/tBE1Z8/AJV6pfUCh6Zrq7nTSxCsWCGGWEuUt5mp1xhVBwJcPXXLa/nM=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3hBvhiM3L1mWpQV78FCxGrIGZN6GqhMo3sNDsk4V/dVQfcY+TLoHUQdukE+nMRErkg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&Jl3E1PKXzK66ePUEZMCi8/qcujwKVF6jWLTpNH/gey7pY8SQWs9A5nbUAdv7oWjXRUjP+K+SON8lazouBd30jXeoYCK6UOAlFKYADcSrQLAAUZse4NXYvVdGpKTtTu8YGKBKEujBETtlST1q2bfMLA==</Encrypted>]]>
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