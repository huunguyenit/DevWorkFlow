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

  <!ENTITY Identity "PMIR">
  <!ENTITY DetailTable "d74">
  <!ENTITY c11 "Mã ncc">
  <!ENTITY c12 "Supplier">
  <!ENTITY c21 "Số phiếu nhập">
  <!ENTITY c22 "Receipt Number">
  <!ENTITY c31 "Ngày phiếu nhập">
  <!ENTITY c32 "Receipt Date">
]>

<dir table="m74$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Phiếu nhập kho" e="Receipt"></title>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Yu2lGxHKUKCi4ICByL1LNEKJJtxt13s3AElWpd5NAmC</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl//VVNNvl4XCgLv990U/48gobbG9XDQx/mSGrclDfjIq9gLDhYxoKueO3/ON6I70dIDZT3nT5z4SYvP1J0+SCcAiTcVu975R22oNOcX0zDSDBQE4s4fnILGmByoBtwptYQctHrO6PTKhGacf9zpxz75e8AQx/GELc+RoRKzw/CR7P7xGEl0MAu8nEOg7e233jqDkCKs12IpWlCQwrqKvrlLgg84/yuvqzDQglcc+Vl070L4fHKvfK67st8FmxY00+wK/aR5zWwY8G22pXIAnVths1vKQsVF4/TblF5pyUNDWvz4w/QqcAi5lwhp8Bq1oQ8CJdi355PcWm/tvlDCGJVEJ5TB3lfxowfXA3k9Mh/8zodaKXZNm5KY3ZNBpYl/dV/+Idx1xkpxlMQatmzO2seuxVhxLJMQ9VDJZlLFyGEUOG3u8d9lUQQ7RaBHV/HsZ0TnkBATmGyqLnrcZ2go4vGImS1iMD+4/Qg17TGO7oBhx6eFmbbfgFP+VU1dr0AJus16z1p9XjMLLC1ctB2xXznrhJ83BDowuZ3ODodadHrCQX</Encrypted>]]>&XMLHiddenFields;<![CDATA[<Encrypted>&3t3N/5ofOgok900XO0gvbFMUNZUTcT+XfC+WH+fzJLrnJ1Wb65SwFAZUbWXIW2zm+o7qQlMGaTJbc8yQsEhEFgEof0QIhKN39qG48KZ6QCI=</Encrypted>]]>&EnvironmentTaxInheritanceColumns;<![CDATA[<Encrypted>&+yRcV3XtE2MrYJ2A84tg6BzYhKqIRXvmNG0V7OYAQgLMbng01Ei7h5GqPB01DRTCSy9hBzq5LsIzbHqyaSpqic0O0MJBMtu0J/i9C1zA/tBmXJYkBfuOTxJ+z4w5sAIPw4Oh++wpU4Y4D7vThvetj+dbT1QCkyFzEwuyacCDQrESGOMDtmI0qL4OrmNisEDDZpT2LzRpnqRAwVyw/p4DrB8fGEatbbS21AEcvkhIpx2TRm8gQtRP08lFNGx+ZQiIfZDeyDDMRYX3+KOvbjQt49ek4oZSRpjgSErbchYAxkKzGVZwBLwPudzUvQhqZVKrlf3mL3kJbsr9sdlwUeuMMLwitqsiNjKnmJVIqFHLKqf4ACiTJIKEH244D5Xks3wxCtjvpdfpVsanftYvqNYu9XQTNnZlotRYhVZT3J7FudC8r661caKgVP57Fw+b2v97njQlJkry/QmFjpc5j/suLQ==</Encrypted>]]>&EnvironmentTaxDetailChangeQuatityInheritance;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP8yvsDyaE4686jIusJTaDTcW9zsyVgg1NNHRJPNGKw7XSH/CdffXkrASgCKvGMt1xsY/SVKXfEruq0qdxRFBdGuOpvevXDRJoknGoxyUVpumnsF9eRUiFuWf8Tp9PVTrACzLffwxDC57WgTj+uASbhA4eBuCnjwbtX4Nv5BbRJkBD0AWG4ycPK/KfmkeP/ZE4g==</Encrypted>]]>&EnvironmentTaxDetailChangeQuatityTotalInheritance;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wPzs0I1NKnO06jY34lkA5Rh+f1U2wJY8r2VMUpoT/JJu2dVvO0JiHo/RTLbnqQEOY24juzWfAaQ+THSeMewcrzl/JjOYH726Smd7LqGNbuICDnFDuVQvh9cIqo8fPQXBjfA==</Encrypted>]]>
    </text>
  </script>
</dir>