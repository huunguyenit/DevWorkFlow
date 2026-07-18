<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY % DetailTax SYSTEM "..\Include\DetailTax.ent">
  %DetailTax;

  <!ENTITY Identity "SI2Order">
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Yu2lGxHKUKCi4ICByL1LNEKJJtxt13s3AElWpd5NAmC</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl//VVNNvl4XCgLv990U/48gobbG9XDQx/mSGrclDfjIq9M97pMYWDbYscck2MFyyuNwBMS2bSUZTxqR7sXpn/szUFCaN5vmmdtd84LK/AXqA+ImRbgZzt7y0h78GBxkX0aKXB62DnlbJYu2/LnSzbI2RRJFWWto2sJ2+NrlYWKkzxQd/n+ZkJqojvawePSAHiAkF00W1lambAHGuPi5dYKMnJdKtmEr0hxUIdJcLoGZ27bq0H3rXt5qP+ZFkvHN8pnBsLibX3y+2H+ntIZ0k84ewN6RyY5CHkA3TXudxWXUadGEhdWh2AEhwmbnGtKU64pLI30uyTbAfI8H767sRNXRdBnClQMGTmHLX8pzh7czvjPFogZR6aVdjhwsje9G0UufXpx/BaNscnfloCQi9jiKen/rX0Z1X0aZcpjcSo2iECxkeFjyLkNayZ8CPTNcW25Ox9piMZVFtvHDMBxi+Zhi8K/UE/OhKlfwO+M7X0zovMvzVGEhrROFlz5FbjQdMVmHUksiWmIJAnmIItLK5Y3vI=</Encrypted>]]>&XMLHiddenFields;<![CDATA[<Encrypted>&3t3N/5ofOgok900XO0gvbFMUNZUTcT+XfC+WH+fzJLoH10/8YUkcCZOfbcMYWm8ZxTFZCGYBNR8hIeFxPGSS8ATCnfl0X8NPIFnqgFXNlX0=</Encrypted>]]>&DetailTaxFollowCopyFieldCode;<![CDATA[<Encrypted>&+yRcV3XtE2MrYJ2A84tg6L048v8GIgrjXW6VgADNzZf23MR3hBaaKENCaeK+quLRnRyiUicki7yR+GGYRTnTeC4+/Dm8qY386irKVGiBPyZ1SBRDzFsgLXu2I730vgqyS+2mhuo2v8T6l/pJjr4wdVCLibkonN1K1iN6+wJJoeSXu4u4msUzkmZtbBoOJkDa3CSrPWvIizk1DcbWYOqlbIAy2honJaz6V8ulPk40Bq+0PS6R52cOklL9nOCVflZf4XpYGk6TTXtJtpjWEQNwyOZRqKgFJCMyMIlV9fHpqhA6so0mmh+OS4Yv+y0krO6hm/dYD61td94E+DXfSGA8sLSkIEKGOX5S9uF+EFcB5A3erMMOcB/XsfoGliOrpusD7kFchYbAeFNLySK7iR/ZgKzf1UozqwjyED7nfUtr1CjxdzAcRDYiOf3WIiSmi7MSHfvW4pohEwUswQ4xnkMH+Bu08HdZ5Dqbws2LDKKyE4roanVI0vq5bqbA9km2zsOFS+LjTNRR2IcD1b9oIasFFoGX5dF6+wBBfBOPuqzjbWHPJljkq+qG/c5f6zSbdpe8AN0+BKLhh58hz1kG7dF7YrduoHIPDFSW1fGK/XX8MIG37XcCra6IaJb3XQ1e0GnCd3Rt3Cko8S8npkjRxuIgm30tPFMvPADZb1aZkhpoFkLg4oxDdO0rCmtw0MTRE+df1Q6cw+CV4eXmKRYvSSiSGS7FRcGA2sIVVqodoiAOxif8pgiuoV/gjsAG+iTyU1dmIk1akcpZohDmD2JH5RLIsJCuO8UKK3JFAQXGag2Rz0N/Uqymg1eUMjjnA7Z7+evNElMw9M94gDmUVgTRU6HUqlK3pcyJdebXaXZ6oAb60PHra7H/Upv+/FgcgjKoCGpPkL75dWPJYeEzDjgJ5ifXl8DE5YPTrr5+F8+xIF57Ni0sZpNIty6pVDF67Ee/Igi4/j6XF4v47aUC6IxhCIgA8JkjMPX057voLVn9lB5ns8VvUkdQLj74wFqg9Y9lvoh+tjnb/pBvcd+JXnS+ReUSiFOnKy0zsa0vd1FLb6Lp3bn7y7i8nPYV//hvAk3SUQBAU2skXU6vt477bH2WvoflOlHk9vWiNQ57CnAv6kcueKhNfXOxDCGlQfQ0urf4NWI0fq2eY7HHJZoDDjEnzsPLc41uvTMNkmoQwa7ZjMw5HxjZRhnL5Ec07+6TTliTiTPchdQiP0eGmrhXzWMekUxysS+J3sIaf8QqzfoH/UkJWPQJTFT4TNfY/F9KTSxhF2vP</Encrypted>]]>
    </text>
  </script>
</dir>