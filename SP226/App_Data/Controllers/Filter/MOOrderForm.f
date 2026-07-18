<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY Identity "MOOrder">
  <!ENTITY DetailTable "d64">
  <!ENTITY c11 "Mã khách">
  <!ENTITY c12 "Customer">
  <!ENTITY c21 "Số đơn hàng">
  <!ENTITY c22 "Order Number">
  <!ENTITY c31 "Ngày đơn hàng">
  <!ENTITY c32 "Order Date">

]>

<dir table="m64$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Đơn hàng bán" e="Sales Order"></title>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OxtLgDo0Qc9xaVo2DGXWD9uQsOqLbYSTi9QaNQgFC4h</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9O11Ok+FM+pOodAeyr450QWpUKIdOJChu+Z+yqvJnVo+1Zl+E150Ws5MfrWREfQsimZtzwmvojzAlwxUH6jvMVAstrpv/cxhR6gpvQ6fOmPfczg5D9WxH8VxM0imAML1k6SUqIKvwUMLGDAHHSKw9iEKZdfzpcPbyv+lbwM2Kc4aEcKprvOBIktFM9Ige0dKmqptcnBaTt/j29RZc5tN4se7NbohgkcwuQa8G8XeAXQDcNll1j/QnojFZqsWfAqj0+Oxlx9AlL5czO9By6U1lpPmS6Xzfb2oiraGPPkWHLKh4gckcu1vJ0MJ0jGkRKKwaNTj3waGcJkWJN8mh5VOuWDlp1JRlUbp87UqRM56gZA3qnmwy+KPGyOIRImnvk2uUsL6gjE4yzcNGJvIM1iA7+g=</encrypted>]]>&XMLHiddenFields;<![CDATA[<encrypted>%QFirECjU/RgLQ4k5nc6GM2LD+aIDIko9ADdorcZ1Y49UuvScGj5+qwPr7EO4ron9l6XJMJ21YzS3JHCvQgciTniUHUMfqHASex2bW6jhF6afoEevaTyiThJLXi8MoH8rvVtoH8UfATtM/7asOHXkLGofb6+soDlrxB6aZCmwsbo01i7wkkPFCr/ssedw0TTihsO4vVO4YDvLnPc/dSQslOXMjswG2eqmGPMhW9g/E8j4WTIt+SNIlGsu79Wzhpb7zB5EwupPgX2FIFuRRJwv1yL9DFItv72KA3v3xxNzoF8nFX/tmHa167RMtcfUp4jvNKG9DWuzq1q5EV7TLictohNBfR/P0jRj0eEF9L1U8UwxEEMah0VQXDlGuf451K9NXdc8Jadtz/T+3zubZ9ZaSm3q4+o4e2Kb4eLjnJLfiglpbtxhbGo4BRI1YWKQ8ODfaKUwHmM/GvXcI2eOZlGUlVFmh8TgCdrdgmUDUpZ1wrmqfzY63eqLzXknVRbGx857</encrypted>]]>
    </text>
  </script>
</dir>