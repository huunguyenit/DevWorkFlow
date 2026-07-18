<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFilterViews SYSTEM "..\Include\XML\FlowFilterViews.txt">
  <!ENTITY XMLFlowFilterCommand SYSTEM "..\Include\XML\FlowFilterCommand.txt">
  <!ENTITY XMLFlowFilterCheck SYSTEM "..\Include\XML\FlowFilterCheck.txt">
  <!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">
  <!ENTITY ScriptFlowFilterFunction SYSTEM "..\Include\Javascript\FlowFilterFunction.txt">

  <!ENTITY Identity "PIRequisition">
  <!ENTITY c11 "Phiếu nhu cầu từ ngày">
  <!ENTITY c12 "Date From">
  <!ENTITY c21 "Số phiếu nhu cầu">
  <!ENTITY c22 "Requisition Number">
  <!ENTITY ext "91">

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'PIRequisitionFilter', 'Filter', 'PITran'">
  <!ENTITY CheckRelativeQuery "
    select 'so_ct' as field, @$none as message
    return">
]>

<dir table="m91$000000" code="stt_rec" order="ngay_ct, so_ct" id="PR1" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn phiếu nhu cầu" e="Select Requisition"></title>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcEmcSYdxtUe+PSCBg6yibYyraQiOp/zqF5sxS9r6EbNtJyqLg40MCp+Irp3G3dWyjA6TU1gCfbzpOju9bAUrkE5FrLbLQBZsNerqk2egLVl+3KVxdjfW5MXB9mKayus/d7RBQ9qxv4ORewfmZsOPtivzqU1c7w3Nf/dZXgIEkHUfEsrX3pJqSDzB9CAOLLBADCXOc/TjGImHsy7mV8yptj1f1BIgoHLDm83efc2bed2AXaXYKtW+BSdpnOLb4jRhyZ2pDONiaa6s+bu/BYYwx/ui2FWKHP6sLzBoS5xZqoHsaDW+4e40GMUM7UPhizyVPpM2qDgADhLpZTkp/V9Xd8WDmcaSnhueydkwPqUOYr0uT2+QvWcftqF6bLv9XQzUsg==</Encrypted>]]>&CheckRelativeProcess;&XMLFlowFilterCheck;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cTEHAvAq+gidm2OBN9//gMQwRrMnnY/tBE1Z8/AJV6pfUCh6Zrq7nTSxCsWCGGWEuUt5mp1xhVBwJcPXXLa/nM=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3hBvhiM3L1mWpQV78FCxGrIGZN6GqhMo3sNDsk4V/dVQfcY+TLoHUQdukE+nMRErkg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&Jl3E1PKXzK66ePUEZMCi8/qcujwKVF6jWLTpNH/gey7pY8SQWs9A5nbUAdv7oWjXRUjP+K+SON8lazouBd30jXeoYCK6UOAlFKYADcSrQLAAUZse4NXYvVdGpKTtTu8YGKBKEujBETtlST1q2bfMLA==</Encrypted>]]>
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