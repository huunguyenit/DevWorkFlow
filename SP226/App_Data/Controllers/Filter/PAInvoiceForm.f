<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY Identity "PAInvoice">
  <!ENTITY DetailTable "d83">
  <!ENTITY c11 "Mã ncc">
  <!ENTITY c12 "Supplier">
  <!ENTITY c21 "Số hóa đơn">
  <!ENTITY c22 "Invoice Number">
  <!ENTITY c31 "Ngày hóa đơn">
  <!ENTITY c32 "Invoice Date">
]>

<dir table="m83$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Hóa đơn" e="Invoice"></title>
  <fields>
    &XMLFlowFormFields;
  </fields>

  <views>
    &XMLFlowFormViews;
  </views>

  <commands>
    &XMLFlowFormCommand;
  </commands>

  <script>
    <text>
      &ScriptFlowFormFunction;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OxtLgDo0Qc9xaVo2DGXWD9uQsOqLbYSTi9QaNQgFC4h</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9O11Ok+FM+pOodAeyr450QWpUKIdOJChu+Z+yqvJnVo+8PpGg9tD5TfM5HRyeb4GE/OWGCiM9nj5uPkRrOBLXVYdU+iVqRIyBkhSNOTn0VhSn0NPN8gN6tlhxZ2UYeivv3NyWN5ustljey8VD+mT9e0u/P4CITGbUxTZriddmjaV0nlLOi6eyTWGbbiLW9VRcMTPJ5vCDABAo8Q8sbgDQ9Am5gdS/DMt1PNMSa89oyUWb5YkDjqUrsciiqr9AhD7OisdjrSiWOseLZPefTvNx2rlw8r7d0SL3dzcl4kCSSxuEfZnd7PyTXrgi94dv8oEwOPn/lbWGpypsh5ks4PfKCOzNsyZeXKxO1wJlf7THM68lVEGObRqRYc0QK8/lEajHZ7CrcshqPXusotPA0nckBRamd2emoFlLEw+SqnZMdpdyAaKrH6m5V14D8elbDWrPDWd3LYtAA7FmRFLBIKAHv0=</encrypted>]]>&XMLHiddenFields;<![CDATA[<encrypted>%bTwx6BwczM9aR7zqTp36Mwr7WNJLHM/6KqhEDiUbxKEJU6LfVXWhcfGwb0sQHyXFlVbRcCPtTDPRjsN2GtqnVjhTspz9R4jW08OLpB7JnzU3I1EiifYhozJ8wanSSgnE27hRT7xhwStTLzLhSPm+W+qTNv1gx+Le0eqTU/AohfwaIhZp5k79rMgkFc/nOlz/U+4HaZoyH64aGSf8nzxoR9FglbxpLcUiQqNo8DcpuOXKkuJCjIcVVxeyoN9m1kad9AFwV3xy2gQnWK0qXGek1m/A36A07h7yPiounXmURgebjhINUIGCe+V09CbtDbNYv13Sr5XqGJrUvoOsldU2vn3roCW7M+ARt9oWGnX3o8np2+0Q/BwGnJIn6VpWTSCACPbFSaotf4IZQ5LW81bBFJIaJr4wjeaQR7HtBjcGCEwZCf5wx2L48kWiWt4DSOVUliQ8AVDxo6736+wIc1SS34+J0Svz0GNeGnRZ7lNAWZElslSphBJU97bL6tOzJD1Ot+AKc3/+4L4WZCjlNjBABQ==</encrypted>]]>
    </text>
  </script>
</dir>