<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir table="vdmduyet" code="ma_quyen, user_id" order="ma_quyen, user_id" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lọc số liệu" e="Approving Officers Filter"></title>
  <fields>
    <field name="loai_duyet" dataFormatString="1, 2" clientDefault="1" align="right" allowNulls="false">
      <header v="Loại duyệt" e="Type"></header>
      <footer v="1 - Phiếu nhu cầu, 2 - Đơn hàng mua" e="1 - Purchase Requisition, 2 - Purchase Order"></footer>
      <items style="Mask"/>
    </field>
    <field name="name" onDemand="true">
      <header v="Người sử dụng" e="User"></header>
      <items style="AutoComplete" controller="User" reference="comment%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="comment%l" readOnly="true" inactivate="true">
      <header v="" e=""/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230"/>
      <item value="11100: [loai_duyet].Label, [loai_duyet], [loai_duyet].Description"/>
      <item value="11010: [name].Label, [name], [comment%l]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6ewGKrqbDYzMmFKs8xTBf1BRetE0DtZWJkJ4vJ8QVHVkSw4Bx7fSEu+6CyVzXOYjzOGrCkHpXngsKfDPofHltCmdsugvxmPF0J1rJdzhwVc5j55txBXYVSlsxmlswtK1ekTu+MAKOqlvmezRjNLcFCF3buzHSsHys0X6LfrO3MM5gGwXSDgcagqSGp6bxkTOCMj9dt78XKO8Gt6PNe35pqB2PtUUKOf1QBLBXNFMaU1</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdGm589nGw3hgv2TNtZkkZj9PkaC1rqAwOgJ0qbuVn8iP2sUKFEW7XfAxLB4btBDfPCb3Lmf5XdkJ/S8agVgJxlmr/jtVC2BNwikzrZaHwcIXKeJCKpd/Jn0J9s2Y3vGQ9sIipZx8hrBnD2Bh0cJsfCvf7Z1arACeIgxLNfQ3WT2rMQCVKirOHtEu6eoMZFs7Y0IWoxUpeMH6uJxAfWA1BHjejwGtZOO5d23kMqApR1WyI9Jqq4MoNQ/NyxAKEs0QNidA83SIja9w6jDMznCQ+JqU7bb2dfqgvZXFpmY28HWQyYXXvH1i3mr5J73A93/qmB7ADNo1+Fsgp2JTonWdSbCZsPk6M/mAYdtEG65kbLb+5XjRH6kcaKTdk1yG0eUmYJlL3Aih+XYdZE6AuXJ7Rtd48xYvX29nxaFw5RUIwhLos/oecOqfuPSp0EosHPAtM0tbIuDLF4QW+m7kM21R6UcE4Sl3gF1MGc/kBcb+qUZ2XePmLoAlI0ILfL8HZxy67q9E8Vw+6vuN3zDdLFs19TlJ8wLCKBHCKajO4w02y7yXLGIZ3gFTPiOgoh1tbM/Cey/epudjcR+Q22p84V93kw1viuKMcZUNNhnkdDB6oBrvbc4j/trYBAfx4TlCKV0mFkQzAZ5t3fsY7JPzCrZle8GWr+l4firICE1vEtmaQ1c+91SNQchZyxo8qVf6ShCA2G9ZwJxhoe53W3FJxZAoUYw=</Encrypted>]]>
    </text>
  </script>

</dir>