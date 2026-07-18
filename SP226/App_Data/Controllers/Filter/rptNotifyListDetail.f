<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY NotifyContentCss SYSTEM "..\Include\XML\NotifyContentCss.txt">

  <!ENTITY Identity "rptNotifyListDetail">

  <!ENTITY FormNoPaddingWidth "753">
  <!ENTITY FormNoPaddingScript SYSTEM "..\Include\Javascript\FormNoPadding.txt">
]>

<dir id="0" type="Report" cache="true" database="Sys" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chi tiết" e="Detail"></title>
  <fields>
    <field name="noi_dung" external="true" readOnly="true" defaultValue="''" filterSource="Plugin">
      <header v="" e=""></header>
      <footer v="&lt;div id=&quot;viewContent&quot; &gt;&lt;/div&gt;" e="&lt;div id=&quot;viewContent&quot; &gt;&lt;/div&gt;"></footer>
    </field>
  </fields>

  <views>
    <view id="Dir" height="279" anchor="1">
      <item value="&FormNoPaddingWidth;"/>
      <item value="1: [noi_dung].Description"/>
    </view>
  </views>

  <commands>
    <command event="Initialize">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcNSKJPlSnGN9/aYKLcBiqn6WuICZCwAgZqVRG5fIk5pVjGS/gAYFnPDFa6Qv1QY2PJu+Gm76bqqMc8daNhheBRU=</Encrypted>]]>
      </text>
    </command>

    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcCOrNAhQ7z4EAlNrsxYKo+H7CQpN3QNmaobNu6pLzf57</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l16dCzkPCkdKPBNy4yMInqhFbmGwKKj7TWl9MVMGdvkN3lhjYoeyS5Lm5OCloznxTnQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPS6o0FO4oa0V8ggf7RVJkjpvu5lLetaENfYXcCme6Jq</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l16dCzkPCkdKPBNy4yMInqhFbmGwKKj7TWl9MVMGdvkN3lhjYoeyS5Lm5OCloznxTnQ==</Encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcCLjOzEBOw7WLxwsZmNVIhdyKUhv/DDvGaGbpwHJkbqg</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l16dCzkPCkdKPBNy4yMInqhFbmGwKKj7TWl9MVMGdvkN3lhjYoeyS5Lm5OCloznxTnQ==</Encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22a0RigBl0C6zqtZ04HP3YHWVvPlgHiRhpaeMH1Dt0Vpz</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l15ARgEc/qdq/IJ795JdII08ngco7hY8wRjGUDRC1aCQHFE+P280wMH8uWDwRl2e32sy9L9C5Hs7cqE+GBhdazrO95m3ETct8BVCUKPyLFSOv</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l1+cNXHP9TlPck0SILQjvjfbuxGHuWT+kOrGvaJ7cKGgCK2Vs40hpE39eJBwE/5nJbyP2zlmL7FFctdkkB0jaSem5XNGtyBAvHOIR0eilnVQIm483nMzAK5ZN2WWqDiB4UO96cMlWLTWP34HuHw+C3LpgPLz5s7Ohmbe6OKyA5nOEY+hmYeeeZL9PYaGGlBYRiW41KstlISEfHNh/y1EWQwf2KOnhaYRAN45z8k5RV/S2Uuwvc9ZwLQXL8lYCqxLXGQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l1+9iNp/Z51/969CCfE/hwNgZf81EA+zR/eUiQxUzuYomm2ir5aOQQSncKShjzFMM3g==</Encrypted>]]>
      &FormNoPaddingScript;
    </text>
  </script>

  <css>
    <text>
      &NotifyContentCss;
    </text>
  </css>
</dir>