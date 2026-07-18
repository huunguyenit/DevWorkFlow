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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtYSqE01NzeJhLZfwoXbIa4LXYM4BpfvodhvGQZWMKAAMxWf7dG9vg78uW+6NRewum2LiKNsWFijLYcoxtTN3MQ5GwKTcCZ7iDJ6FrzahZRihGn7oBknBtTAm6WDPjHm3NQ0fR5W0/q1UYfcOLKW1IdhnenbQyPE8+OlAjSB9YOwmgL5985l6br4UoKHqjYJQGreldbHbqi3cK56z/uwrDp32Qj6wzaSSfzBYvJrhPRhBaEbrAgnEtY14+mEn3bcBQzWR0ARuqB/MNaLPWF6Fnqs5b79yRvLdg80bGmrrhDIRNCKF4pJT3teqSPDu5ZZVFqC6D52ZA/hSPue+iClgjTrsKZ+rMZ9q+bOSLiGVz5xRYKoI4WTYWxNp7+zXTr3V5mghQ7lmajo3NDpSrNTEnA+OE+BdVqnLePS+PzG2sRw9ihCIrYPqA3uXm0ASvYzkIZ1r71jeDVT6E5E3qwpyJzYhVOb7ukOiDaDREUMb9U7mcP+Qkwqz4PdP2wyEQ9tmm43pOWi73o+Nq+dUVIGb8+pSzAMMeA9m/LP/16AGC60bTm4APhacfqAdHS9S+K14hdVmAl/AentxorExkAIAOkwGnu/ofgvYU4GizLe6+2rl7W5QA/y+IfUeGuMCu7KWEJXRjg5ixiH/LHZwSKix0qVrFrETaCpE7kzb5ajzACBmlQ4qXrHjzEPj/o1YhOgQVBFGmsXu7Ogq0NYHwCZDoJlfRW7+k3NnbGUAnW9KkgRh6He7qnsoL9/4EKvwW9ifZFe8yM3OCOXSZziFDSeoeqofrot5ExGb37jWWPPwwLlqQwQcx10nt5huJ224wu8BmAe5gZ6tGVU47H8hXR4CM29E4TmqXLHWDlkIhHpQ4NGiJteTE6CRjSHUTUpUI92gQzkmMHZUel3iV9MvcvG913IodI27MrcfbjVu8YZrRmKjVQmji48AA0kfYR/9vQeJafhm9sgZwbK6a43xT3nNAko=</Encrypted>]]>
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