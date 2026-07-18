<?xml version="1.0" encoding="utf-8"?>

<dir table="v30dmsnk15" code="ma_snk" order="ma_snk" xmlns="urn:schemas-fast-com:data-dir">
  <title v="tham số" e="Parameter"></title>
  <fields>
    <field name="ma_snk" isPrimaryKey="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="tk">
      <header v="" e=""></header>
      <footer v="&lt;div id=&quot;Label0&quot; class=&quot;LabelDescription&quot;&gt;&lt;/div&gt;" e="&lt;div id=&quot;Label0&quot; class=&quot;LabelDescription&quot;&gt;&lt;/div&gt;"></footer>
    </field>
    <field name="tk_du01">
      <header v="" e=""></header>
      <footer v="&lt;div id=&quot;Label1&quot; class=&quot;LabelDescription&quot;&gt;&lt;/div&gt;" e="&lt;div id=&quot;Label1&quot; class=&quot;LabelDescription&quot;&gt;&lt;/div&gt;"></footer>
    </field>
    <field name="tk_du02">
      <header v="" e=""></header>
      <footer v="&lt;div id=&quot;Label2&quot; class=&quot;LabelDescription&quot;&gt;&lt;/div&gt;" e="&lt;div id=&quot;Label2&quot; class=&quot;LabelDescription&quot;&gt;&lt;/div&gt;"></footer>
    </field>
    <field name="tk_du03">
      <header v="" e=""></header>
      <footer v="&lt;div id=&quot;Label3&quot; class=&quot;LabelDescription&quot;&gt;&lt;/div&gt;" e="&lt;div id=&quot;Label3&quot; class=&quot;LabelDescription&quot;&gt;&lt;/div&gt;"></footer>
    </field>
    <field name="tk_du04">
      <header v="" e=""></header>
      <footer v="&lt;div id=&quot;Label4&quot; class=&quot;LabelDescription&quot;&gt;&lt;/div&gt;" e="&lt;div id=&quot;Label4&quot; class=&quot;LabelDescription&quot;&gt;&lt;/div&gt;"></footer>
    </field>
    <field name="tk_loaitru">
      <header v="" e=""></header>
      <footer v="&lt;div id=&quot;Label5&quot; class=&quot;LabelDescription&quot;&gt;&lt;/div&gt;" e="&lt;div id=&quot;Label5&quot; class=&quot;LabelDescription&quot;&gt;&lt;/div&gt;"></footer>
    </field>
    <field name="title">
      <header v="" e=""></header>
      <footer v="Ds tài khoản %s/Tiêu đề 1, 2" e="%s Account/Title 1, 2"></footer>
    </field>
    <field name="title2">
      <header v="" e=""></header>
    </field>
    <field name="title01">
      <header v="" e=""></header>
      <footer v="Ds tài khoản %s 1/Tiêu đề 1, 2" e="%s Account 1/Title 1, 2"></footer>
    </field>
    <field name="title012">
      <header v="" e=""></header>
    </field>
    <field name="title02">
      <header v="" e=""></header>
      <footer v="Ds tài khoản %s 2/Tiêu đề 1, 2" e="%s Account 2/Title 1, 2"></footer>
    </field>
    <field name="title022">
      <header v="" e=""></header>
    </field>
    <field name="title03">
      <header v="" e=""></header>
      <footer v="Ds tài khoản %s 3/Tiêu đề 1, 2" e="%s Account 3/Title 1, 2"></footer>
    </field>
    <field name="title032">
      <header v="" e=""></header>
    </field>
    <field name="title04">
      <header v="" e=""></header>
      <footer v="Ds tài khoản %s 4/Tiêu đề 1, 2" e="%s Account 4/Title 1, 2"></footer>
    </field>
    <field name="title042">
      <header v="" e=""></header>
      <footer v="Ds tài khoản %s loại trừ" e="%s Accounts Excluded"></footer>
    </field>

    <field name="title11">
      <header v="Khuyến mãi 1" e="Promotion 1"></header>
    </field>
    <field name="title112">
      <header v="Khuyến mãi 1" e="Promotion 1"></header>
    </field>
    <field name="title12">
      <header v="Khuyến mãi 2" e="Promotion 2"></header>
    </field>
    <field name="title122">
      <header v="Khuyến mãi 2" e="Promotion 2"></header>
    </field>
    <field name="title13">
      <header v="Khuyến mãi 3" e="Promotion 3"></header>
    </field>
    <field name="title132">
      <header v="Khuyến mãi 3" e="Promotion 3"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="160, 130, 70, 60, 130, 0"/>
      <item value="111011: [tk].Description, [tk], [title], [title2], [ma_snk]"/>
      <item value="11101: [tk_du01].Description, [tk_du01], [title01], [title012]"/>
      <item value="11101: [tk_du02].Description, [tk_du02], [title02], [title022]"/>
      <item value="11101: [tk_du03].Description, [tk_du03], [title03], [title032]"/>
      <item value="11101: [tk_du04].Description, [tk_du04], [title04], [title042]"/>
      <item value="11000: [tk_loaitru].Description, [tk_loaitru]"/>

      <item value="11010: [title11].Label, [title11], [title112]"/>
      <item value="11010: [title12].Label, [title12], [title122]"/>
      <item value="11010: [title13].Label, [title13], [title132]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAWaZWQ2Vlllm+HxGml5U0BUTduL4zLIGNNq/aTMPxf98+W1Zm2pgfrVl23KpJqnuOfhO0NQkFlajlnfAbNUJikKFSjZTsErbv0p9QdUm79tgus+lkx9kP7JjMKFyMdAVuztNG+aO+GtvyOW5fjhS5iHlo7v5L68NGFFj6wBgWI2R01N1dxAQy80bPeUktkasocNENHjSplbSjBSLszwdP7CMGVOdcPvontuw1OJgIzJvq2o4jGvwSsXsl/68hBHxziWLQ2tz0KNL5aem2VzOUf7yebzb8cA/Z4doFPch/oO</Encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtVMNsXaLdMZ6dcQPnIZWaRTpl4QjBl78RGKZVEs69Xg42fdoInH6NiA1C+MI6MOB8U4RjNPYmskPCvwtv1vJXqzEE8/kBQ0MghMlx+pbEC+GYhf3oEpnvCjUgjwcejxQ0XBhKlS2fSz7m23rOtVj8rxqsM18GLjnMEirMx1Xfr3De5U5Vm5emQF+tczUdrDLejltH3nkcO24C9sfKvM2RluKBNdxGswqyyZ+cARVwAKuJwk9gEGkHAWwqv6mcCR1x0JdM9JIHt6Je2RN3fOiQA35O/OEpeRXhcmI7QgbByKd9sTXHGgDP2zjgNrad5SVcnCJ3Tn1HAY4r9vPddbOzvjygBowZS0vLmvsPjVgPcwGzegfvVbmqq2VYs+vlMo3PNLqR0+vqHECX2JWhFw2D/jJh/is/VkA8VZodC3YM91o6UVhtaUH8ydNpbgvTORWze12e0IL4aIjaeW69AFprv/JL+CPTlBX5PJvA0YCK0hu2FMqralRdBZri+Nip/sPY/c/Fs93mey321s8dpUzjMZY6quZbucc8f9+cc5sWAqO41UV638MiW4UOm86ApyhOr2QjipcX6ZFiDAqPKx9MTIsUwhuynXcEo/MhXtFukhlyPiXEukTAqEu6SGHBuMr8dOEPh+9bkEt1kEZ9jOH/PrZcGb249KE1Rqv3bkePu4r</Encrypted>]]>
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1jG6VWeGAcv3M25z+vBq/YUELg3A+LaU/g+75YddH2MioYzVSZN7XIVuLwZdRmGe43KKROWWuTQdEAkAhQTXjONP71kKI9Pdmf/NmL5suGS0Rod7Nj1cdsAki5F7RbXOskQ3hJlHTERTjAiK3UXElAkfOhwoBZKQU16Y3qXo5wMdt7QQmvbFrtZWsSwv3SckIeEzNb5l3TxIphzSBjHd4pd7oBq6Oe3ZmlNE0nm7Nbl</Encrypted>]]>
    </text>
  </css>
</dir>