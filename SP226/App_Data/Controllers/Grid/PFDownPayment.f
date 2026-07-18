<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY ScriptCheckGridAction SYSTEM "..\Include\Javascript\CheckGridAction.txt">
  <!ENTITY DPGrid SYSTEM "..\Include\XML\DPGrid.txt">
  <!ENTITY Tag "73">
  <!ENTITY Code "PNC">

  <!ENTITY f1 "CDDownPaymentFilter">
  <!ENTITY f2 "CPDownPaymentFilter">

  <!ENTITY c11 "Lấy số liệu từ phiếu chi">
  <!ENTITY c12 "Extract Data from Cash Disbursement">
  <!ENTITY c21 "Lấy số liệu từ giấy báo nợ">
  <!ENTITY c22 "Extract Data from Bank Debit Advice">

  <!ENTITY c30 "../images/Menu/Payment.png">
]>

<grid table="p&Tag;" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="1" id="&Code;" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  &DPGrid;
</grid>