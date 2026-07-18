<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY % DetailTax SYSTEM "..\Include\DetailTax.ent">
  %DetailTax;
  <!ENTITY % EnvironmentTax SYSTEM "..\Include\EnvironmentTax.ent">
  %EnvironmentTax;
  <!ENTITY EnvironmentTaxComma "">

  <!ENTITY Identity "SVIssue">
  <!ENTITY DetailTable "d66">
  <!ENTITY c11 "Mã khách">
  <!ENTITY c12 "Customer">
  <!ENTITY c21 "Số phiếu xuất">
  <!ENTITY c22 "Pick Number">
  <!ENTITY c31 "Ngày phiếu xuất">
  <!ENTITY c32 "Pick Date">
]>

<dir table="m66$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Phiếu xuất bán" e="Pick List"></title>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Yu2lGxHKUKCi4ICByL1LNEKJJtxt13s3AElWpd5NAmC</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl//VVNNvl4XCgLv990U/48gobbG9XDQx/mSGrclDfjIq91JFHtZzQwwXNy5tf4x3GNPpxAquIU35hTRRZ6+UoG93yzb7ELkRE3HYEMS5ibleU0gYARw/b+6VDrPEz9+ZN1jDbhFE1LL8ZFSTvukvq4Vci4GofatNWLudu8fBE728/p0GIBMkicXEdbqIhX3FXHt9kunUiIMl6GWXRfdwQ1B18H0OgXcG2RbWa4YnhIKsL21AZC8MGa4SkMwWdpVmcTEnkL5rH1JIYAWSb5m/Dq24ZK180V8btm0lb33dolHVpyC4BSEuLPyr+zPLO5m4+ncD5FKNqbfh6Aw/FcXu4cTbZrAtqvw1rI0DN40D5qSy66NYJHIElbXHAl970bgepzNB5VG6MboQg0FLEAu2fglNtgZ1VxyHpCr7KviCGWFmRilINdxOagu+OePzB7EMVBN2HP2KQ3SModoy/I8sy42MvqpDXPNIQAUhD5D4QQeN/fYgEiQvKV8j3opyKwfoDG66Kp0blWnmSAVOYHkJONJP7xNJ3RdJarWv02gI7hvWa9WPGRu6sZqENqJc8iQ5aGtG0jr4wSo667XSCkfOe/kGpEhTFVu8M3O7LcCToqIBBikLwUGXSIUTxlBhlXdhddQF8Km6vVOjtC1RDalOXTJmCXsffNFu9DumPCcDVNuy1Iltd4FaSboQU+9/jJmrxJSu+hKWoil2iNPmgg2LqMYUDY2zXq1+PW2pfECQ81tJcHEpociEFDSERP1JTQsoKnuTpnNmVhk29kmbrCoacMuS/bp7hpe/rqWPYeQc81Psirlu5ceoCPAFGBTT82mDWLoJOEXpTAkyUVoCi2QL7N9FtiZtXM0iWwaehfKI1hcYyon/hc7+nCANFpgAGrDgZK1UoyG2XXoInQE3466+eeroqzB2nzCYTt4sZl4X/nTLH</Encrypted>]]>&XMLHiddenFields;<![CDATA[<Encrypted>&BOZjxW2GeBQn1R6O6BtYguvL2wxF38QF7VOkZHAkBQ9whmcqyvLYEi4zRbHbwE6yjYNohTK2TC2PfAiBsK6sGg==</Encrypted>]]>&DetailTaxFollowCopyFieldsBase;&EnvironmentTaxInheritanceColumns;<![CDATA[<Encrypted>&+yRcV3XtE2MrYJ2A84tg6IkGhvq87gsV6V8lEPBLz60Db7PLmfJFKEwCSmMiRrR0FEYTC4AB1+TffqAk5YpohaIbthhcGTfnMVirGffskgw81zPa/CrH5C442ZcUWycfKt07CbSnYeouUQAyoVQSqEjIKFJIIwZJVt8O2Rjd1U83chY1e6a4daYpa9PrPj/fGdMmPYvZfjRQT0nmZHrJHA5TCIqLr0JmVKEPSTtJL9TiFIGo8bga0Ga5SneeYhXs8VZ6rfMkpR/GwdJOy5Xe5wnrtWad1F7lqlKJzDCFw/pI6k9yFPvbY/ZyzPPveBy68cI5py3gFQfUMSkzOwpCZ/qlsvEM9hczGwVa7CX07ojQIBogiuKCcTmtpMytNzVCnaA0LxGz0eBN3H+0UWVSW/k3PNhL8WesiRoqIpxOb1Rk+gyJcGHBp5Db8G1yXIiu5HhzOzETA8mpVXZ30yNpby7iTZOgzb/WLgj8M6N75EBRr6LqqH9fmGqHmUp+xYaeg3j5hpjGntCFrU1lSe3NMmYF8tiUzKr3JIm93PpLbVw=</Encrypted>]]>&DetailTaxFollowValidDetail;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP/PB9PzfmnPB3zSD8G2EIrqwmH3U2Skaw8ouIefi2To538Bv3w9J+E7uFDi8apCWpU/VxUS4/n24iGxmKafZVTPsXCCF3CnJ/x21aW7/KoFb</Encrypted>]]>&DetailTaxFollowValidDetail;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wPx53rtj3AgLrbJrLA/ITavt8QvcZanahteFabkd6H8KpwDmro15a4v8hcWVcuuLwwQ==</Encrypted>]]>&EnvironmentTaxDetailChangeQuatityInheritance;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP/gGXjltxUum96kSYcnz3wzmeuFwBYlYywK5CUhUnoUV/iE2g7uYvSr3Qpvxm5OytwXdkkkK4RPNNCiIU4wHHwjDUnBycd06K9gSoNwGh5Pk3Nl9VVSl6pUiw6q0odp758zoCs7qpRub+1WPQzOpxP8Oo88kcz674BL6NfzJ2/nvfKROPApgS28V9DnCMrUxtXTeOwJLNT7Y6ZWB1WselMiNLu5Tex8os94fqf75OuOyR5kqNPvkHDjP8FgFIg+QmDssOcNiBQ/Z/V6yrdJYd9+2PJeSS2q1UiyRAsrWqyr4lCs+U68iZ5XkHYI6MhXgbndzanc4XyFLeEoPBwit9SeXWdZ0eNecz7XVin3/rZBL6y5V1m4LFWvhPCogN+IyJ0Whj82+8cQ3oB2IFq/AkUEWYLUtpIF1guj/VeiiMHLBdOTS5nEe2ryhDFuOA84KTMNtmu11PXao4ueqr5VDTCxv9GyxgnAHTB1OUQvjJfZ5nMV3RsXC+rjFpyslnJi4uOOsIM6YFC4dz2g/xeCVhbQE4ve+dIpXN5VSSi59ShcR29g4pUqX6DCupG/1WDd5PT3ntdP/JZJU4Q9uJHG/bJv7jGyzaevEBNEJoIcir7FE</Encrypted>]]>&EnvironmentTaxDetailChangeQuatityTotalInheritance;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wPyUIWZAnb0xVdoMhqOX4XhYvqZz3N2DUTo7IWY6g7wohk43mkg2rk79Y6drlXdUm7Bgo5IyDU3hRaiGTMZ117Wz9NRSVeWLm8hjHauurDsZP3vkivy0aXW599JnxnT1rM6ScbuVQ42O/57OO/vEELJo=</Encrypted>]]>
    </text>
  </script>
</dir>