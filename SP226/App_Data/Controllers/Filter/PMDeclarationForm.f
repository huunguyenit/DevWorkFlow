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

  <!ENTITY Identity "PMDeclaration">
  <!ENTITY DetailTable "d98">
  <!ENTITY c11 "Mã ncc">
  <!ENTITY c12 "Supplier">
  <!ENTITY c21 "Số tờ khai">
  <!ENTITY c22 "Voucher Number">
  <!ENTITY c31 "Ngày tờ khai">
  <!ENTITY c32 "Voucher Date">
]>

<dir table="m98$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Tờ khai hải quan" e="Customs Declaration Sheet"></title>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Yu2lGxHKUKCi4ICByL1LNEKJJtxt13s3AElWpd5NAmC</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl//VVNNvl4XCgLv990U/48gobbG9XDQx/mSGrclDfjIq9nKWarov/JY/8Eh6Z2Pdzjq5SrF+YunIohxMTKd86mttExY0V3by75K1yj7D0lrjMHSmCUpjc3JStp8n5MkBOIknjKAdR3hb4+p6tPzCaLQFTqF0BloyE9VHr1vJ8b4pcG7DDQ+itwhbRslIj+QzoGt5MJYAHUTnWhJepMTMNGqVs7cGD9XqoDAuYOy4Adk6rnNQvf1Ogt2aHAt5hcrd26codmkaRfOytpbgEo/YEUhKiEcowrMNWYEuHLUND3ocawwaw/oZ2+oLGkNHK0entLP9J21AYpSFYLyFf0Z1vVIiUG4CZ/RMcflVzC5kiBoJsLlgcV1V8UhL9MRK+oYQ+USGDHslwU0TzINUESYEej2uxpZOObX1+9QYtOjoSMiS/SQaLid4tGzsHPN7qk+YzzqfEbYIZxOM9E6yb0WaF2X8ulTPONtnjFa8EAfeK/BRgGkGkof44idknnJ13l408tkBy9CgV7mbNe3FgeB4UBpaI3IhrTjTLkp3pFZsfHAAD3sqwng2RilNJWUV6LC6suT5wcIrldO4tnBhdpyZwxNg=</Encrypted>]]>&XMLHiddenFields;<![CDATA[<Encrypted>&3t3N/5ofOgok900XO0gvbHTwY8vGihka3WVRS/+JgD/p8LWzpA4AsaA4Xa5ttLXehNUWZPKpfYnKRBsgd1Cb5J6Mw+fkkpsYR1dBGCZo4m4=</Encrypted>]]>&EnvironmentTaxInheritanceColumns;<![CDATA[<Encrypted>&+yRcV3XtE2MrYJ2A84tg6L048v8GIgrjXW6VgADNzZdIMwhwJ9ty6oq3dXD1FtErjdbuH+Lt2vCO53nP1jm6SUQCdAW2TcSt7CpoWHXxoUsdovlYLWQEFpFeN1aTTdOlGpPICcSCjG6IGuJxs2QOwoIMn23LVGHc41BAfnUDFsPfqapj97BN8UmT13sq+6FjbBTihJx0vb915qr9du1T9qJJQ9cM6k6OUbjebHQVn9tHkr0w/BNseZeMJmtZb7BctfOvtHlHlTkjSGwzV8GcQdMJIOa1AXkgQqErTpULgS7S2zdUJHywMO4KuFY93c/rhvvU2nrY3NnJHWhhIlFax51cZCN8JtstAKpp9dnHnZY82RK4GqaIp8Ditwm5GLZGGvrkxjsWBrEWAOm+fKlgwY/9inn1bVI7ZC7mc5nRK38=</Encrypted>]]>&EnvironmentTaxDetailChangeQuatityInheritance;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wPyE6c4WJx8uCf0Oryvu/aUGpq0oAOqOpIzJYXHyb3C5HRddlTxVsIBweXkA1aCnXWlz5uvrfkW6xfAYQyoEfB22ODDLSnNSn5sA9CWIdNvmNmo21iIPyZPKNGoUka+2v7uucaYG4HVwHxY2XPP3eWlqVbRIAiSV2dsJvoabWJXBoxSzrcwSZ6uPk1bhil5MkOLFk3ks+U5lQm0NLeOMNs5I=</Encrypted>]]>&EnvironmentTaxDetailChangeQuatityTotalInheritance;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wPzs0I1NKnO06jY34lkA5Rh+f1U2wJY8r2VMUpoT/JJu2dVvO0JiHo/RTLbnqQEOY24juzWfAaQ+THSeMewcrzl/JjOYH726Smd7LqGNbuICDnFDuVQvh9cIqo8fPQXBjfA==</Encrypted>]]>
    </text>
  </script>
</dir>