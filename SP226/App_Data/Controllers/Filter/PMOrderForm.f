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

  <!ENTITY Identity "PMOrder">
  <!ENTITY DetailTable "d95">
  <!ENTITY c11 "Mã ncc">
  <!ENTITY c12 "Supplier">
  <!ENTITY c21 "Số đơn hàng">
  <!ENTITY c22 "Order Number">
  <!ENTITY c31 "Ngày đơn hàng">
  <!ENTITY c32 "Order Date">
]>

<dir table="m95$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Đơn hàng nhập khẩu" e="Import Purchase Order"></title>
  <fields>
    &EnvironmentTaxXMLFlowFormFields;
  </fields>

  <views>
    &EnvironmentTaxXMLFlowFormViews;
  </views>

  <commands>
    &XMLFlowFormCommand;
  </commands>

  <script>
    <text>
      &EnvironmentTaxScriptFlowFormFunction;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Yu2lGxHKUKCi4ICByL1LNEKJJtxt13s3AElWpd5NAmC</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl//VVNNvl4XCgLv990U/48gobbG9XDQx/mSGrclDfjIq9FRCNYAdW0u5ftP5m8cnrBFtx9PclsHuia/UWiuwpwLM4G9UH7Ds7ScL84mJ93y8Nqndrj7nRnrfruGwQgISPqD+VLq8QoIFf8yJJYgXee6AHxN3FT/T0iHk/x4lh0xZbs2hxwBmzLmlbhhWWiF0iPSWvS0ruaA+RQUWJwI3imypi5hNtg5KeeNbbk+u6X1x3ECz1u3cd1psLx6PSRx0/w1DEC08+yst/oyp4S/HG9JHctvW7MXuMaWg7zHlyXtgKvv4FZexWgVR17K+zPw1KWQM6vGtQn3E3FqFvMZSB2zOuOIR4QXlH60khQFEnbPU0a0iRBTDdK1ahaRlA4DBQ6URdWCACN+LEgAr3ptkd+VlqCT3vnA3WiqJ93yRW2WPu2DQiNu9G4mKKv1YdcHks5flvnrQtNYBy6TlzJ2B33CScZd9XbPdHeMqY2+U06K4g4w9+fBCf1ymH1D71N2GVIA==</Encrypted>]]>&XMLHiddenFields;<![CDATA[<Encrypted>&3t3N/5ofOgok900XO0gvbHTwY8vGihka3WVRS/+JgD/zoildWvg08L71SAGU+4FaRb0fdxGKYbzviZ31GHXBkp71ULoYsbqyHnX73EuIAjKcLc2NqubnxrkpSJHh1cHW</Encrypted>]]>&EnvironmentTaxInheritanceColumns;<![CDATA[<Encrypted>&+yRcV3XtE2MrYJ2A84tg6BzYhKqIRXvmNG0V7OYAQgLMbng01Ei7h5GqPB01DRTCSy9hBzq5LsIzbHqyaSpqic0O0MJBMtu0J/i9C1zA/tBmXJYkBfuOTxJ+z4w5sAIPw4Oh++wpU4Y4D7vThvetj+dbT1QCkyFzEwuyacCDQrESGOMDtmI0qL4OrmNisEDDZpT2LzRpnqRAwVyw/p4DrB8fGEatbbS21AEcvkhIpx2TRm8gQtRP08lFNGx+ZQiIfZDeyDDMRYX3+KOvbjQt49ek4oZSRpjgSErbchYAxkKzGVZwBLwPudzUvQhqZVKrlf3mL3kJbsr9sdlwUeuMMLwitqsiNjKnmJVIqFHLKqf4ACiTJIKEH244D5Xks3wxCtjvpdfpVsanftYvqNYu9XQTNnZlotRYhVZT3J7FudC8r661caKgVP57Fw+b2v97njQlJkry/QmFjpc5j/suLQ==</Encrypted>]]>&EnvironmentTaxDetailChangeQuatityInheritance;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP8yvsDyaE4686jIusJTaDTcW9zsyVgg1NNHRJPNGKw7XSH/CdffXkrASgCKvGMt1xhSNNr53smmcMMniTMggY2DGvc3MwHdUOyqUmEiJ45enRd/QV9YqBBctcfeSjM+e2jlAt1R5scyyucSOrcAenGlzZVPml94cpXV/FQSVzmhNLnqn4rqXcxPKfXeU0wIwfg==</Encrypted>]]>&EnvironmentTaxDetailChangeQuatityTotalInheritance;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wPzs0I1NKnO06jY34lkA5Rh+f1U2wJY8r2VMUpoT/JJu2dVvO0JiHo/RTLbnqQEOY24juzWfAaQ+THSeMewcrzl/JjOYH726Smd7LqGNbuICDnFDuVQvh9cIqo8fPQXBjfA==</Encrypted>]]>
    </text>
  </script>
</dir>