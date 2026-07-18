<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFilterViews SYSTEM "..\Include\XML\FlowFilterViews.txt">
  <!ENTITY XMLFlowFilterCommand SYSTEM "..\Include\XML\FlowFilterCommand.txt">
  <!ENTITY XMLFlowFilterCheck SYSTEM "..\Include\XML\FlowFilterCheck.txt">
  <!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">
  <!ENTITY ScriptFlowFilterFunction SYSTEM "..\Include\Javascript\FlowFilterFunction.txt">

  <!ENTITY Identity "SRInvoice">
  <!ENTITY c11 "Hóa đơn từ ngày">
  <!ENTITY c12 "Invoice Date From">
  <!ENTITY c21 "Số hóa đơn">
  <!ENTITY c22 "Invoice Number">
  <!ENTITY ext "81">

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'SRInvoiceFilter', 'Filter', 'SRTran'">
  <!ENTITY CheckRelativeQuery "
    select 'so_ct' as field, @$none as message
    return
">
]>

<dir table="m81$000000" code="stt_rec" order="ngay_ct, so_ct" id="HDA" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn hóa đơn" e="Select Sales Invoice"></title>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcEmcSYdxtUe+PSCBg6yibYyraQiOp/zqF5sxS9r6EbNtJyqLg40MCp+Irp3G3dWyjA6TU1gCfbzpOju9bAUrkE4TAEvCzo1LX1CP08y0XS7sCRjDQFR8Fb6kOyu45ty9QvQrXJreT44vGbqQ/yIVQc2V6loZ5f1eLPsi1lbnrdO0IcvLKV2U1nDQpk8K/FtxTNqNB+a1ftsV5eVQKWSDa9M6VOmDiokfZplDKv10RBvQj0+2Y0usoLmUP2l20dz1kqghwzLG0r4WUO8ZekalIAgLhFnGWeEIoR5QBt2+FArBpFBv/swTeVqNAPMmLH8kQPCUZUEAz1c2x4xxGFmQWV8uE4oI/5ACRqKhSasazJBkVlxaqdb7RNLdLERSM6qqGEPiiQs6h3TPG/TeZ3np9UfnFVMZL2ihio/a6hrgqoBZ</Encrypted>]]>&CheckRelativeProcess;&XMLFlowFilterCheck;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cTEHAvAq+gidm2OBN9//gMQwRrMnnY/tBE1Z8/AJV6pfUCh6Zrq7nTSxCsWCGGWEuUt5mp1xhVBwJcPXXLa/nM=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3hBvhiM3L1mWpQV78FCxGrIGZN6GqhMo3sNDsk4V/dVQfcY+TLoHUQdukE+nMRErkg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&Jl3E1PKXzK66ePUEZMCi8/qcujwKVF6jWLTpNH/gey7pY8SQWs9A5nbUAdv7oWjXRUjP+K+SON8lazouBd30jXeoYCK6UOAlFKYADcSrQLAAUZse4NXYvVdGpKTtTu8YGKBKEujBETtlST1q2bfMLA==</Encrypted>]]>
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