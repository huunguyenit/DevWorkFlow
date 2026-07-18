<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY Identity "WKInvoice">
  <!ENTITY DetailTable "d81">
  <!ENTITY c11 "Mã khách">
  <!ENTITY c12 "Customer">
  <!ENTITY c21 "Số hóa đơn">
  <!ENTITY c22 "Invoice Number">
  <!ENTITY c31 "Ngày hóa đơn">
  <!ENTITY c32 "Invoice Date">

]>

<dir table="m81$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Hóa đơn bán hàng" e="Sales Invoice"></title>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OxtLgDo0Qc9xaVo2DGXWD9uQsOqLbYSTi9QaNQgFC4h</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9O11Ok+FM+pOodAeyr450QWpUKIdOJChu+Z+yqvJnVo+i6n6BJtfR51IdFIqNnW2xE9YAByBjELNiiMtFW6SER6rqrg+8mWiN7DboFrwqAsRIO/O9Nf/KuIASuJLn6IAYfwiJ10+/iqHhHOvhRYHx+SGT7xrFnwFCa6GfRnUyqVExkv09By2GkxXeyO3cdGCBgtF68JLj3wZe4Uss6uldOpkKiEZuAsoqpCQuSuisZbiqZXmQDkThl7CJoru95MBvAk+WGgY5Q0rNA+j1Hdfw0fB1x2RmrA02Zrx5KqJFtF9YaYWwUYMAgJuMkMw4xnlA6nQPstobuRQ33Z2ThABUJ/3Jut7i/Ailsh1jLSdPAWazw3/qjlpkf4f3Irg2VdGM6scGckOCXIWfB5iB3b+AwcE6qYb7f5Gj3Ksf1Rxq2WhotetRaaPGn7k5xXvs4YkKlttEAdMwxYyjcsScrGjdAaWy9LF4Xjkz/+RJ0F7WgESB/tkDtVYyCIc2Va0FDl0Xg==</encrypted>]]>&XMLHiddenFields;<![CDATA[<encrypted>%vnXNQnKFn7dQrzyC5NbwfDTky1YLv+7c10nna3oLp/jzbVWKGK1U0aCy9YQ3r72hViFu+oTkx5gF9REJ5WZaBhnt645wmng3jqhyK5K6MV5kSTznlNtg9t0ZzIZzaiTR8JaozdPIAzkZ36nmkT2rKxDrOJKAk/6nOv0dsfyoZHH/kg4CDoB88F4kptupf+D0etA3BDlFu5NZ9gtcN1KZrsJXFqtkaMtEqst3UKRRGkAiASLijoZQTxQjRfXeft4sgK2r4c03Z8AfLJbjGaSZZjNvVawTIlm31XlNzZiKQ4xC8FykrZ013S+9pR0mnZYpbSnPeR36WUTX3De3jCqtqVh4mP/jNP2U6NfuWo24Kr9PK9B/RkV+VBbOSsg+SRa4x8iIX9Om/c0kzD/JRrCJD5NMRFmQlfVZ6phJXN6xNhL6TmDSA4L8KeQgp3C3aMFuzk/e9BcB8JSoFy2Ija6QqtEfsocEKfoDBWzKkrCKQb0vuregK7tYsBi6xNDYTvYt/G8od6oDRDrd6flg5oKY1Gan8nfE4lVE9MY7qHLKte8BD7qh+XB4nL3UoajSOWOwqs+U7pQnG0IM76/4NGvQq5T9XrZBsVGyrtWLKStsy0cvAsxsRLQyZKEA8wxA7l/Tj/3++i4FFNp+var1GKUirPkzN/OopE9qOLBxb3uWPVM=</encrypted>]]>
    </text>
  </script>
</dir>
