<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY Identity "PFReceipt">
  <!ENTITY DetailTable "d73">
  <!ENTITY c11 "Mã ncc">
  <!ENTITY c12 "Supplier">
  <!ENTITY c21 "Số phiếu nhập">
  <!ENTITY c22 "Receipt Number">
  <!ENTITY c31 "Ngày phiếu nhập">
  <!ENTITY c32 "Receipt Date">
]>

<dir table="m73$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Phiếu nhập" e="Purchase Receipt"></title>
  <fields>
    &XMLFlowFormFields;
  </fields>

  <views>
    &XMLFlowFormViews;
  </views>

  <commands>
    &XMLFlowFormCommand;
  </commands>


  <commands>
    &XMLFlowFormCommand;
  </commands>

  <script>
    <text>
      &ScriptFlowFormFunction;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OxtLgDo0Qc9xaVo2DGXWD9uQsOqLbYSTi9QaNQgFC4h</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9O11Ok+FM+pOodAeyr450QWpUKIdOJChu+Z+yqvJnVo+g53weafKYuYLaw8PDUCOBi5BYjcv8/kH6jejJub0pZll9voD0Vy1xJ+eXALe2itQ4QPkO5IQX3qclsb5B+VtXqpCGcJ4ZF9mtWovuOedpPOrHqFzkLCpDZ3uy18fLdO/12SxdceC2WUQc0lH34AQXaQzRUQjLk3VULzm4M6muK20dqUiXIc6Bv3hd5O7QldEETMvWnDl5kERMICs7Fr/NZ4SU5K6r0ni646rYQeKpYk=</encrypted>]]>&XMLHiddenFields;<![CDATA[<encrypted>%bTwx6BwczM9aR7zqTp36MyDlSSuhLv77LBzqOZly89+CgXDfyVWMY/+6bzneudDZA0VKR10gLaaMELKvZL9EDt4PbGyaLKjaoxvRahB+bycdweSpDJ4zLgr3H2pvc4aXDVQ96/CD2e20gAt43SSf8k/0VmCWptF5shtL0Kd4+zSLG9ylm67Kh5Mdp7lZ4s/SGPOpYXCEAe+OFs+CgQ+/1cXF+hkSz632fGSZqD0k3b31FXajUJHUx0wYDMEwL7y3g7qPk5igE4MAqhBMDm5+nkv5g/Dn6Ck4eTqsVXSamf94gqLr0dmzTV2JG/ifzIcB</encrypted>]]>
    </text>
  </script>
</dir>