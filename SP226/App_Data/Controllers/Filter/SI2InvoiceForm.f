<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY % DetailTax SYSTEM "..\Include\DetailTax.ent">
  %DetailTax;

  <!ENTITY Identity "SI2Invoice">
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Yu2lGxHKUKCi4ICByL1LNEKJJtxt13s3AElWpd5NAmC</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl//VVNNvl4XCgLv990U/48gobbG9XDQx/mSGrclDfjIq9Bw87cBcUmgKd8TQu55UmP0Ur0Qqn1PMvIAHE1dU1BS0YM7axWRsch5IR7RZ9t6qEdn5Ow1UBFw9oTQDBKSDHLN47a7ZISi3GFOZRn4VFKHmjeJhIzwYtU1biuksaeSpghIhhCrmEcT7Rq9JXktq3tYt79FEZyQ8Q3mfjoHzdtajf0toVwxhHxj6+yWtGbrmu+eJwoc1fgYqyMX4qPq9f4RkzNbwTV1S5iML6MgsUAa6gVYEJlBF/BF/ET6gDlu/YIl/1xxgNRqn0eQ/CaaI4ZQJhLs2rRrqLtyqDV892bI2+9MUYQKm9dwlhvd8G7xE9AdKUuERMM0GimqVpeq/A5vq6SEOjjGNZ+xLbyW+bGuwe3epyKUQQUTOjHRaBuTaVxkDhNrP1sxS1oG2Do3ssf1HfS1Uw/g1ShfBHHA0Bt5ltre2mK0gWIMwYwheXWs+UbPIAHD9lgZiUPEmIk3+R2BCuCxHxMmR8/A+Wwk0KOCg=</Encrypted>]]>&XMLHiddenFields;<![CDATA[<Encrypted>&BOZjxW2GeBQn1R6O6BtYghFEyvsWkNhw/Eq1M1mmFWOTYQgwnbtG5u+z7s3SHh1lj3S62TLkBDkAEYlSYTN6vLcsJj7qYk+nog8RfvYDv+A=</Encrypted>]]>&DetailTaxFollowCopyFieldCode;<![CDATA[<Encrypted>&+yRcV3XtE2MrYJ2A84tg6L048v8GIgrjXW6VgADNzZf23MR3hBaaKENCaeK+quLRnRyiUicki7yR+GGYRTnTeC4+/Dm8qY386irKVGiBPyZ1SBRDzFsgLXu2I730vgqyS+2mhuo2v8T6l/pJjr4wdVCLibkonN1K1iN6+wJJoeSXu4u4msUzkmZtbBoOJkDa3CSrPWvIizk1DcbWYOqlbIAy2honJaz6V8ulPk40Bq+0PS6R52cOklL9nOCVflZf4XpYGk6TTXtJtpjWEQNwyOZRqKgFJCMyMIlV9fHpqhA6so0mmh+OS4Yv+y0krO6hm/dYD61td94E+DXfSGA8sLSkIEKGOX5S9uF+EFcB5A3erMMOcB/XsfoGliOrpusD7kFchYbAeFNLySK7iR/ZgKzf1UozqwjyED7nfUtr1CjxdzAcRDYiOf3WIiSmi7MSHfvW4pohEwUswQ4xnkMH+Bu08HdZ5Dqbws2LDKKyE4roanVI0vq5bqbA9km2zsOFS+LjTNRR2IcD1b9oIasFFoGX5dF6+wBBfBOPuqzjbWHPJljkq+qG/c5f6zSbdpe8AN0+BKLhh58hz1kG7dF7YrduoHIPDFSW1fGK/XX8MIG37XcCra6IaJb3XQ1e0GnCd3Rt3Cko8S8npkjRxuIgm30tPFMvPADZb1aZkhpoFkLg4oxDdO0rCmtw0MTRE+df1Q6cw+CV4eXmKRYvSSiSGS7FRcGA2sIVVqodoiAOxif8pgiuoV/gjsAG+iTyU1dmIk1akcpZohDmD2JH5RLIsJCuO8UKK3JFAQXGag2Rz0N/Uqymg1eUMjjnA7Z7+evNElMw9M94gDmUVgTRU6HUqlK3pcyJdebXaXZ6oAb60PHra7H/Upv+/FgcgjKoCGpPkL75dWPJYeEzDjgJ5ifXl8DE5YPTrr5+F8+xIF57Ni0sZpNIty6pVDF67Ee/Igi4/j6XF4v47aUC6IxhCIgA8JkjMPX057voLVn9lB5ns8VvUkdQLj74wFqg9Y9lvoh+tjnb/pBvcd+JXnS+ReUSiFOnKy0zsa0vd1FLb6Lp3bn7y7i8nPYV//hvAk3SUQBAU2skXU6vt477bH2WvoflOlHk9vWiNQ57CnAv6kcueKhNfXOxDCGlQfQ0urf4NWI0fq2eY7HHJZoDDjEnzsPLc41uvTMNkmoQwa7ZjMw5HxjZRhnL5Ec07+6TTliTiTPchdQiP0eGmrhXzWMekUxysS+J3sIaf8QqzfoH/UkJWPQJTFT4TNfY/F9KTSxhF2vP</Encrypted>]]>
    </text>
  </script>
</dir>