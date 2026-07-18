<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFilterViews SYSTEM "..\Include\XML\FlowFilterViews.txt">
  <!ENTITY XMLFlowFilterCommand SYSTEM "..\Include\XML\FlowFilterCommand.txt">
  <!ENTITY XMLFlowFilterCheck SYSTEM "..\Include\XML\FlowFilterCheck.txt">
  <!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">
  <!ENTITY ScriptFlowFilterFunction SYSTEM "..\Include\Javascript\FlowFilterFunction.txt">

  <!ENTITY Identity "PSInvoiceDomestic">
  <!ENTITY c11 "Hóa đơn từ ngày">
  <!ENTITY c12 "Invoice Date from">
  <!ENTITY c21 "Số hóa đơn">
  <!ENTITY c22 "Invoice Number">
  <!ENTITY ext "71">

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'PSInvoiceDomesticFilter', 'Filter', 'PSTran'">
  <!ENTITY CheckRelativeQuery "
    select 'so_ct' as field, @$none as message
    return
">
]>

<dir table="m71$000000" code="stt_rec" order="ngay_ct, so_ct" id="PNA" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn hóa đơn" e="Select Domestic Purchase Invoice"></title>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcEmcSYdxtUe+PSCBg6yibYyraQiOp/zqF5sxS9r6EbNtNyrLCilDT3R8TlXDOn5gFyc/xGuSalXl7byqi3cVJOKBPp1NUt1nqlfRvmnvIt4jERNWD08MPFT40QZffNCRzNUsijcQP+KOfQR9ZdjXpPCbU9Buwhteoe9FPNGwyvkQZXM2bmAXzA6pwlnAVe6afppW1vKRkJVhSMhd5SHRYa+FTjozB8KDxZusDu1cx/eVWzOy5wiIT2CWZEAUQtQEt2RoTQ3GSeq+zMXZ4Rprm0dOS6nngR7yYlbFVqiCIq5jO2lMYvHpdVD7Z2fpmM4hEnI7QsbIqPSICXpighT3f14iUe48JEkRRTn1l+4zSarZ2jruh7aDzFAyr0T/FpRGFS/3eVEJoqM1/gkKv7edUVk8tn+zYMBr9Sk5Yr1vT6bD</Encrypted>]]>&CheckRelativeProcess;&XMLFlowFilterCheck;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cTEHAvAq+gidm2OBN9//gMQwRrMnnY/tBE1Z8/AJV6pfUCh6Zrq7nTSxCsWCGGWEuUt5mp1xhVBwJcPXXLa/nM=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3hBvhiM3L1mWpQV78FCxGrIGZN6GqhMo3sNDsk4V/dVQfcY+TLoHUQdukE+nMRErkg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&Jl3E1PKXzK66ePUEZMCi8/qcujwKVF6jWLTpNH/gey7pY8SQWs9A5nbUAdv7oWjXRUjP+K+SON8lazouBd30jXeoYCK6UOAlFKYADcSrQLAAUZse4NXYvVdGpKTtTu8YGKBKEujBETtlST1q2bfMLA==</Encrypted>]]>
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