<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY % DetailTax SYSTEM "..\Include\DetailTax.ent">
  %DetailTax;

  <!ENTITY Identity "SPInvoice">
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OxtLgDo0Qc9xaVo2DGXWD9uQsOqLbYSTi9QaNQgFC4h</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9O11Ok+FM+pOodAeyr450QWpUKIdOJChu+Z+yqvJnVo+i6n6BJtfR51IdFIqNnW2xE9YAByBjELNiiMtFW6SER6rqrg+8mWiN7DboFrwqAsRa3GwE51Rzt0wc20l5/VmbbyjCX2HXLFV2ui2eYPmQ2lqF4Z9hcK9WMtfntFgTKeu2VJ2gVzPVRgve07Ikomq6RmEHgXUDV5kPfmcBM68xuLwBOuh3ZWEzlZbjVY7zfTj7iDwUNKihJiulfvuikaour5/caCjm1BmE17OMYTNXaz7MnIQf50V6tMr4fstBSb5m0HNY180mZfuM/obXC0CoHO6lFquaQAqL+jHLu98IQk5wq3piyoqLL34t6a7zquXTd8TtkYwroIgh4w0fnaWxzCy36PaOdDFWj2qczAdQ+T2RffqnsFvZf8y42G+ETEZ1EJ5mKFzfzu5oXrqHWrZHsNZ5+mftftn/RU9pwigE9ynRpq+rwU8QyO0kltS9feqsENnFB8eJxxzvBhzt8/G8oXbtF3NChfHiMICgFzuG0v6/Y9Qjg/7LLLv55ACt0FRcr/265cSxJidVw+Lhwt8P1kiX/YDI1RaHWHS4zdNuoU=</encrypted>]]>&XMLHiddenFields;<![CDATA[<encrypted>%bTwx6BwczM9aR7zqTp36M0kx5xqjAIqCdYCrXXSH8L+pMQcG3pIH3qZI0G+OraY4</encrypted>]]>&DetailTaxFollowCopyFields;<![CDATA[<encrypted>%QFirECjU/RgLQ4k5nc6GM5R73lUdvaH+RpwjgqpinA6Fs1GtAGCil7HIXJA/G2h7dmziqcVNStAAnEagKAZNGvT+JbH6S5uywdItTNexWCGu5ya2eXF97UGniH9Exzb2RwsuzTf+gqdMgp7zQU8U/L9t2VXeKQYS7eyDbZUSO1HauAmFyrk57F1a0nDA6z21rwO0Vr90548/fWnB8ooutVV18HC38gOir5l6dYpYRB6O9w0nMVOiqZL3QDhAhntdhA1AQBHDfwQJ/cPa07rZRNT5Drwjnk4xpcxR3peAgQXvN3uOho01x5V+RXjEd3sdUEQ52ADLYhgxJ3Qs2GX9SRrWDROfekDFrQpuWHoiHHcyxLwWYSNzWxM+ngnxnWrLm4Fr8JyDows858SP/bKu4/bubTZajwVnT5xIxeXjM8Fc2OR0qhxKbAyK0CHoUP+0GikMs63fUjUcFZt/Vh5UrGYFfVeWuhnDF+plHgk2czlcO17Nd3zP+zjVxCRL6CHX</encrypted>]]>&DetailTaxFollowValidDetail;<![CDATA[<encrypted>%61y+52s3m4pBDaUfUlDboEUO9mpIcVmP2hWwMuC2iIOqnwEfWjNzTbA8ff+pojWrRnC+EjFCUlp3KXbSOtpzRRW9w/QqJ9acO8Y38hQNglhDo3ETALexWhl6wVu4lmpnHwCbFi7GoPts2fugee+1P1nEvZkDc5YgVyIABTSmtMg3UiTlEltM7PL/lmtOPoNYqtBAb9WHDywhPSTcTs+OHsiHyDhv7Hf4r241C4+cJY8XL4GTA6+K0ftPO1Ywxxaou9jKVObOHOne7gzKlDfWKc3tjTin6EryK37sBzoDh7jibjgeBmVWFYZGZAEsbG/7sS3bVQ1guDRfJhhilbXLokRkThTELKzQyz14sdbZaP0=</encrypted>]]>
    </text>
  </script>
</dir>
