<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  
  <!ENTITY Key "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+4nXz3lbr6yDZIawc/Xso7QAolUhQGyivITZWwuEFlxX1q2Xj5u/Dmfsldf1fcNmtdx3EdvvV3TdkVienM2Btwi40T3hNzDcNAEjMKy7E2CP2Kpj8Pob6I9/Fgrl0N3eB7GOtOLPhbRTaggDqZXddR4UilZQKz4vWEMVwwo89hFOuC0yyGvLyffYWANPnXz58A==FastBusiness.Encryption.End">
  

  <!ENTITY % CheckValidEmail SYSTEM "..\Include\CheckValidEmail.ent">
  %CheckValidEmail;
  <!ENTITY CheckValidEmail.FieldName "e_mail">
  <!ENTITY CheckValidEmail.MultiEmail "true">
]>

<dir table="userinfo2" code="name" order="name" database="Sys" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Xác nhận" e="Confirm"></title>
  <fields>

    <field name="e_mail" external="true" defaultValue="''" allowNulls="false">
      <header v="Thư &lt;span class=&quot;LabelDescription&quot;&gt;(Email)" e="Email Address"></header>
    </field>

    <field name="cpass" external="true" defaultValue="''">
      <header v="Xác nhận mật khẩu" e="Confirm Password"></header>
      <clientScript><![CDATA[<Encrypted>&i8xXBDxrUicbWBNXbvDJpliUSApVTzvNdiT+9b8CvmXDltvBhUQH36jT0VaktnNrg0qaTW0ujiw0weSAP8BIvw==</Encrypted>]]></clientScript>
    </field>
    <field name="chkpass" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 100, 230, 0"/>
      <item value="1100: [e_mail].Label, [e_mail]"/>
      <item value="110-1: [cpass].Label, [cpass], [chkpass]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &Key;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvloinkQhbUFXW8ogMB3KLjwGnNftRU5uXaJ/yEwX7tSQbHaoMJkDj2Qvw59PgtThQJx4s1ZjD6Q1f0mDo1JyPGdBR63u8jYqMkqJoPq8aaXIzKjijZm57p5gW1UroLtkK5h8A2Z2MZ4lfkYUkPCviLDDtgtBp3FMIaMQI2TjzVZCSN4z/xwp/sCiQv4DxJk9lkfcuLTPArMmjSvmaA/n6AsJOwRmoXu3NhAnsLXWKS8dKWO2S1m2rKN4Wkire1GJss=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPRbB5mzzhVQxydv75n/Vm2lFkhV8N+l2A90R772qeVMSMgAV4P8UcTJcYa1OLzXOpVM4v/BUPa2a293+KogQ1s=</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WRjX5/6Pf0s6QTuF9Uw+uMyDWutOvw9S7cnNV+olGuVc5+C5XTHkKRWKwOPsG58SCLPBvqLe852oqQL5QH9G+vVuhDXTDee9AQRgXg1nNTXnaxaYOjaTrQSVAJtWTPBrg==</Encrypted>]]>&CheckValidEmailCommandChecking;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMH50ux/v4Yz39HHBEsICFjvn1F23nCNmlmFl5kKIeoMlvkH0wuY5HZkAc1eJnaWThsGhHfxLc6GPlFVGyJWB0gCWIP97SW+MNbY3doPrC5rnkgFlPf48DKR2F3mPbOWXg==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WN9n01nX7Qez+MzFmPCM1cO7LtkA7ikf8hum0xDfrf5PLafwNb2Hacc9PiyyifZsFGDaTyWD5F9ZEMUsYSXANw0i9fVPN8sSGrvg7AtwPLXvzrb7IEFwF+1Vh3PqN9uOAnX+E5yXYLGrIb4B85cpvZSqxemTt+QzjBqhbdUUoLs6IXTMt0K14hpmlp3nq28KdzgzzXWpKMSfK5ZCGX210N/1CgYzYdxWl1dmsxa/Ldu/3mwAo0PKs3FVTaPO5OSDyZCSegNGqH2DmChsueMbhXkY1vJ0MTNLEuwsKki/htfHMmB9859cPmYQtO574QAao8ukWBquFXdT8E3lZt5aaR8hi5iaP/yVuXpbdTgTMxndmiNmcHZLri12KNCSyzPbSYg+3hPO5eT6ND4/eQAVLs/bSKX/PVUXWYbWb+0Je4ylJevE03V62Xqdf2Z/FMUFXpxwmSE7oWU7mJoo2cjj0NTvMZEPA8pxM2JlSGHcXWNSwSfaR8y+0yuWMht+O3DJGMfSUIbYLNnh1FujvA+N+7h8avM8P6RGszvn52KxiiAQWo1JRG2HUgJwEcg3PaSuyBlx81vjalLAeoYyVrn2hvMwYGVjEhOEuvZ9g7irEOv3x3Xjylr9+iD/hGnAfEMcpPb52AlR1PR13kJeLq6zCMVq9v5i3MqL10ykluLTxsuH940mjNYkZaMe30D/FiNEcxZ+P+aCZGcRezPaB0p/rXp3fQUo0xVv9XFUQu9QnwNO9an2j2SXUY1W/NKCPcEYeEoxflma5YzPbGZxoBq/OP/KdshMIOEip2icUOcHbNo+sMJ51JMj550P7J3hJXSpJGQUa239YpGRtdZPzUtqTDG0AjF3kH9d2JJTYVpKzXPI1yiV46d75jYncOSlyc+juWMOlfiWxuCYr4pnLYWAl8IhMdj6KjPYbFBv+V8QDZkDsxgHUiGRHg87A5LmbZFEMrZ5FBCJJNZfgHMIlHOKTnuEIPh1qhZmDi2C7hdLgJRkSHhDfQkRZelA7VyAGSpS6MFMFx/Hg6gcKb6M2xcsgZz4e/90ToF8VqcXe8Fg3licFOqsLK3X6B10hhr3Tr8QcNTgCOgaMo4Pkfj0FlEIAw=</Encrypted>]]>
      &CheckValidEmailFunction;
    </text>
  </script>

  <response>
    <action id="Key">
      <text>
        &Key;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFSBQg/pBQX51W2+SC6JFeQlYux5/aJVLXn3tCW+LRjpfAIianrkMuFLLZ95pGw6gw==</Encrypted>]]>
      </text>
    </action>

    <action id="CheckKey">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2QFC2P1K/gBCoiwOZkDh31ai1fCIQGArLLgWYzIt0jkNsqh7ob8MrP2CF+e9X/+iPcOhieCfYFZERiaQJIh0XAUriVNnCzT+Vwgg2pcWDPtBSziZhbq8QqSUNUR/PA1v0Kjonrp9ascrICM0l79ryLadETLrITsr0/s3HUF/EP79Fx/T8J6noW8qYDdf1H4EhxQNO0osV9DAgzDRDjboC4=</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>