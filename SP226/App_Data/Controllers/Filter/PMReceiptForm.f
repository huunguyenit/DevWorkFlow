<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY % EnvironmentTax SYSTEM "..\Include\EnvironmentTax.ent">
  %EnvironmentTax;
  <!ENTITY EnvironmentTaxComma ",">

  <!ENTITY Identity "PMReceipt">
  <!ENTITY DetailTable "d96">
  <!ENTITY c11 "Mã ncc">
  <!ENTITY c12 "Supplier">
  <!ENTITY c21 "Số phiếu nhập">
  <!ENTITY c22 "Receipt Number">
  <!ENTITY c31 "Ngày phiếu nhập">
  <!ENTITY c32 "Receipt Date">
]>

<dir table="m96$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Phiếu nhập mua hàng" e="Purchase Receipt"></title>
  <fields>
    &EnvironmentTaxXMLFlowFormFields;
  </fields>

  <views>
    &EnvironmentTaxXMLFlowFormViews;
  </views>

  <commands>
    &XMLFlowFormCommand;
  </commands>


  <commands>
    &XMLFlowFormCommand;
  </commands>

  <script>
    <text>
      &EnvironmentTaxScriptFlowFormFunction;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Yu2lGxHKUKCi4ICByL1LNEKJJtxt13s3AElWpd5NAmC</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl//VVNNvl4XCgLv990U/48gobbG9XDQx/mSGrclDfjIq9M4aVspyeKfDGMKVXqIdbRRfUAUvNu0cQ+9D844jnvGqP/EH3g3XQwnnxcWZXDPf6nGagjVRWVjzZCy0Gt4EInOZVguVStBXAvVKNLyr23EZZoTaoxHpnWstAl2YvpD9cj2Si5F19TOnD6py0kjPMVidauu/vW3z/hF55rHd3831GZsqXLKgSXPFun93Va2Z6t6bJ/iifaZbqnfU3J+RAmb61d2SX8iLsNoemiAixeED/lpRgnHTCPJ/NdkZTWwqYaJ8GgX04dsl8D7LkxnuI8J7ef8B6p+1Mp3+L3f/edhdC3s7//qUU5M3xx1aaxr9ga8Jx/P0mhG70K6MWxFu2FmT9dZDpvJjxv6H0E/RjXaD18L/K+KkHs9lMtMCsZ0YvY/TDJxQD9Mdck/GYXevqTlS94EyaQpTTW3E1Y3NmKmAHjwUCGvZTwKBPaMDTKji/7zMd3PohG+mlyVuiVoqF9A==</Encrypted>]]>&XMLHiddenFields;<![CDATA[<Encrypted>&3t3N/5ofOgok900XO0gvbFMUNZUTcT+XfC+WH+fzJLqC5BBbY6E+jTq4KZNiyG5IvdO7xo+EsTdi0erD1kRtEpnisyhk1zzl/O8SVi6XxJTvTSgFIvBxeu7ucC77PA+xuxiJ0MW9dkXY/2zvuIvKCQ==</Encrypted>]]>&EnvironmentTaxInheritanceColumns;<![CDATA[<Encrypted>&+yRcV3XtE2MrYJ2A84tg6BzYhKqIRXvmNG0V7OYAQgLMbng01Ei7h5GqPB01DRTCSy9hBzq5LsIzbHqyaSpqic0O0MJBMtu0J/i9C1zA/tBmXJYkBfuOTxJ+z4w5sAIPw4Oh++wpU4Y4D7vThvetj+dbT1QCkyFzEwuyacCDQrESGOMDtmI0qL4OrmNisEDDZpT2LzRpnqRAwVyw/p4DrB8fGEatbbS21AEcvkhIpx2TRm8gQtRP08lFNGx+ZQiIfZDeyDDMRYX3+KOvbjQt49ek4oZSRpjgSErbchYAxkKzGVZwBLwPudzUvQhqZVKrlf3mL3kJbsr9sdlwUeuMMLwitqsiNjKnmJVIqFHLKqf4ACiTJIKEH244D5Xks3wxCtjvpdfpVsanftYvqNYu9XQTNnZlotRYhVZT3J7FudC8r661caKgVP57Fw+b2v97njQlJkry/QmFjpc5j/suLQ==</Encrypted>]]>&EnvironmentTaxDetailChangeQuatityInheritance;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP8yvsDyaE4686jIusJTaDTcW9zsyVgg1NNHRJPNGKw7XSH/CdffXkrASgCKvGMt1xsY/SVKXfEruq0qdxRFBdGuOpvevXDRJoknGoxyUVpumnsF9eRUiFuWf8Tp9PVTrACzLffwxDC57WgTj+uASbhA4eBuCnjwbtX4Nv5BbRJkBD0AWG4ycPK/KfmkeP/ZE4g==</Encrypted>]]>&EnvironmentTaxDetailChangeQuatityTotalInheritance;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wPzs0I1NKnO06jY34lkA5Rh+f1U2wJY8r2VMUpoT/JJu2dVvO0JiHo/RTLbnqQEOY24juzWfAaQ+THSeMewcrzl/JjOYH726Smd7LqGNbuICDnFDuVQvh9cIqo8fPQXBjfA==</Encrypted>]]>
    </text>
  </script>
</dir>