<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY ScriptCheckGridAction SYSTEM "..\Include\Javascript\CheckGridAction.txt">
  <!ENTITY DPGrid SYSTEM "..\Include\XML\DPGrid.txt">
  <!ENTITY Tag "81">
  <!ENTITY Code "HDA">

  <!ENTITY f1 "CRDownPaymentFilter">
  <!ENTITY f2 "CBDownPaymentFilter">

  <!ENTITY c11 "Lấy số liệu từ phiếu thu">
  <!ENTITY c12 "Extract Data from Cash Receipt">
  <!ENTITY c21 "Lấy số liệu từ giấy báo có">
  <!ENTITY c22 "Extract Data from Bank Credit Advice">

  <!ENTITY c30 "../images/Menu/Cash.png">
]>

<grid table="p&Tag;" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="1" id="&Code;" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  &DPGrid;
</grid>