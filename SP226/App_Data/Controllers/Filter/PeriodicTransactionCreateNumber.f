<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY SysID "PeriodicTransactionCreateNumber">
]>

<dir id="0" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Cập nhật số chứng từ cho nhiều bút toán" e="Voucher Number Mass Update"/>
  <fields>
    <field name="so_bd" allowNulls="false" dataFormatString="X" maxLength="-100">
      <header v="Số bắt đầu" e="Number Start"/>
      <items style="Mask"></items>
    </field>
    <field name="type" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Kiểu cập nhật" e="Type"></header>
      <footer v="1 - Chép đè, 0 - Không" e="1 - Overwrite, 0 - No"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330"/>
      <item value="110-: [so_bd].Label, [so_bd]"/>
      <item value="1110: [type].Label, [type], [type].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPS6o0FO4oa0V8ggf7RVJkjpvu5lLetaENfYXcCme6Jq</Encrypted>]]>&SysID;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l16dCzkPCkdKPBNy4yMInqhFbmGwKKj7TWl9MVMGdvkN3lhjYoeyS5Lm5OCloznxTnQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMq6Xh7xds9o+3oCl00TufVGLE78mW1GUKVnWVD5XSrl</Encrypted>]]>&SysID;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l16dCzkPCkdKPBNy4yMInqhFbmGwKKj7TWl9MVMGdvkN3lhjYoeyS5Lm5OCloznxTnQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2EQmJBK1F6ijRFWHgVUicNsoCZBqyk4+3lK04r8r/uiK5mvN82jXPRQ9KuKanHK5ltVd7FvT877sHpqCuBEU55f21tK1/jPdVoVCEDvseqNkWJILkyddTNe2DySNGgxVd6i9pR2X01aqblTS89YPr5bcfq2FVAEI79qAWB+eX8pLFhdMKWNZb5c435dDxWTDEYlcV7IiCHKVNgnqhPP2bGF4=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22SAyB0lrLIl8l+LB5Gl9ES8J7BXWwS26JYkGY8fKh3Vm</Encrypted>]]>&SysID;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l1+QE5+824HsdlLYDaZfqrNdg22zIeL2+lacyL0eUcOyjx5pBOeNdIdiqW/GW2NhyUg==</Encrypted>]]>&SysID;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHVIL7HkouhE65bfnddYX6NAmRTm1NSekoNeqRvtNwaEIan4joT7vr+ZoFanfm5DaQA==</Encrypted>]]>&SysID;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l1zmcirVXzLesCZci/PpW2Wm4ojpV3CJiN+mVYQO2L2MTUQLpZp0sgq7UqjxftOviFQ==</Encrypted>]]>&SysID;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHXu8ejmCjlg4le7f8HVshRv/MctzvTJT9MrMoXn9GkHpGGDGCO4/WAVhqjSWXbU8hA1In9UxfBTjCS71iwoDKBo=</Encrypted>]]>&SysID;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHc7X/84zX1ElDBQ0Oio9BYhpU71ALmfk5ffMVXbbEaC95FDNPuPVyyo0paJ5AWSXOQ/onvbV5bNXYdtHuIDX7H8tJCMPycHNw70HyHGT5sC32Cls+hyXMqVFgstjqHWOf7y5Sm3sFQSoYgFTHxoyyzMgAICuFPXgkq7ezW8pVKQRu+DylrD2eMGJsXVEd6dUQg==</Encrypted>]]>&SysID;<![CDATA[<Encrypted>&zUpOjW5SsWLifX9NoDzKgh3sdd90n91j4EGP9gqMl+yPlDp0L6MYaL9o5BcTmbg1T4lmJ/MQ+CrPo487Iujyuls6lhP1gndPZZNBGhwQsu762T8UXVnRjxemDz/aPRqz</Encrypted>]]>&SysID;<![CDATA[<Encrypted>&zUpOjW5SsWLifX9NoDzKgh3sdd90n91j4EGP9gqMl+yX75Q0p6Lhlh/V40AAFFhqBHva0SKGk2Bx8pUeRM3U9RbiE/A8yqa3549zl8E+zgIuPax2o2nIMUElIhtI3JMiHfZ5cF5C8gKH7WPpzO20hi9FLF38UnyaHLqtBaSiHp8lmEihGfJ2FQo5tyTc6s3dxucVsx2c+Eygy7S6a4W/dTDoa0IGMcp6OwYSkjTWxgyz9o8qoNMBrWDVcT3nyPJmOBYLl8NbKezxcYvyIwFAda2QcB03Vf3lizCyAI48zdL9GnX7OeBMy1o8HTan5ZO2ulTpzroq5qWYmgpqOh0DTLUiSH4Dr26VjKheviST5ybZxUN2ZxY0FjX7wC7S7qOx0M7dS3o5yuVYoM91jIHZuEyW1pQo0Z2hVdEBaitX6PPgKIJJNCVyD71RaZAyIW792Qd6Uexe8DqwOhHf9v5I8O1CkZqBOfJe06onQgMkfi7xWkX46xBSTlRnzohHctRPwdtg2OhVCIKrUfj19jbLSMhHZihRCKQlqLMbARNZz7MueKIKWWJ0QosznPrjlu3C27P5P1AJAANh5a3fHyx9E5WP0wlVpNuEnwX7Dc14X7c=</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="CreateNumber">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1+Pgf9NIWpQIcrgh/QGViuGQ1v1Xy/LvYXu7y1jdJBin/WCtc/QADkN7dzgJ/mk9+APsN7ZpWRckXc3sP5/ROXzdDx1JO9QDz0erT5J7jmb4yWbFm/CnLSvswbwAYYqhctAyHTWmSuNlllBP3nQTetwVw/zpbj0UANqH5OVDJpylZA+MsBd/KgazR95h6ny09c5oJRqpTc4+X9KcpNTYf03ZU6X96ifAUmFibDyt5/h06UCiTyq1hfWhk9LoW6/RoOJQahuP9czzw0wI7C1xEzGwecsXJYvzK0zo0MbJyzCMYpP1GdMu95BsQtJ/68SzDZHVj0JY0lOJzLrnlfzO7JJ8+Ft2ZOiKiNezLwle2wWoM4A309MDg55tQWpnatovg5C9MjV8e28ne2EIeVMI/APYwgS8Kz944Y5PU7QXRNAbGoQ6TusDGs4V5wQXeNeeqtZD3hXAEXH1ZS5pM8HHrJQGVJsSKHU4jGFl4IdfNGCZniEoEdnSwHspXR+7ZtOHYqz6TUnY+xnaPlkhBRg16DSYSvfnHpSta6XMQBuoev+nuZ8o7aWv8Q0JIpOCN/ni5EV7OmZ5qPGWc+L4Wqr2POQqsJS1zH7IW+GkJ1BF9pecdwO0l3bzSn2jUrjCGZUpybH+pt+eMj+nQjVnsE6M9kki09X2RqlhZBfdLXYPJNlisEQjaAZkUvCx0NO5eC/DFWhv1NAjFqYYewpOX9aCoESZXw0tp67lnzCPblz3yizfnNA0I9twxSgeQRtjr6YaMZ7pEl4hixdHIM86//KErke/rORDcLbAEbWtOQXYomvGQ0qMMtp6T8KYq81PXGGgEcOU/8CrW3gx/TDKOkVC4pTQShUrZ64v8xeMPgYRBqwkpDcVYEoF5kuC4lggKtDfYeyinYccWupDC/ANkHF5fnX9n9xYMZ7m6d7XQx9CY+FZdEW2Cod8cJXzVlKnyXpJuFTxk6PbR03VH0y5c5daNT2atWfz/Ufwb7QKS8l/RHGlD1Ybdfd7NxWcPI3BQBO9oJYRwRC0nm3j326xJxPB8RnTyW4E/T+9XqdwKwnYDLV4zWFzZsPaEzabwDEiIu3QNihIQnVQWTuyIarHrHJ2y9VtzQmA1E19ehL2xfiBfSxVFfQx1ATFhrI6Axm8txRGbBoNumq9MOt6z2vW6wbpHIQAiz70kPYt9AqyMyjRmjJeHU5U1ujFnT8lFP/jLRrSbfwtPqp75w9cPMYbSRZKXLal08qn+TMkoAvNX2U/O8Wg2a9VcS4ifAKiHPwkW21jqCvg0asLFdkVXDpDs0a6TIkhO6AuGIzfnURoG1rAaWItOS2PWSYHfqHEr4tKbtTxUCuDeqvWrFMXZ5soqI2HQPUVyzRi8r0PKQ5fMGMAHcsBwttW/u7i+TgQZbCk4J1fQ==</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>