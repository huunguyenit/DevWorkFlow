<?xml version="1.0" encoding="utf-8"?>

<dir table="dmtbnsd" code="ma_quyen, user_id" order="ma_quyen, user_id" database="Sys" xmlns="urn:schemas-fast-com:data-dir">
  <title v="quyền nhóm người sử dụng" e="Group Access Control"></title>

  <fields>
    <field name="user_id" isPrimaryKey="true" type="Decimal" disabled="true" hidden="true">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_quyen" isPrimaryKey="true" clientDefault="Default" allowNulls="false">
      <header v="Quyền sử dụng" e="Access Right"></header>
      <items style="AutoComplete" controller="NotifyAccessList" reference="ten_quyen%l" key="status = '1'" check="1=1" information="ma_quyen$dmquyentb.ten_quyen%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Cpi01Gp+/4htKColAgBMFhG2ZcQ30iXPRZbt58EtYdUQw9phDxwZJdMMVpoQAj87w==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_quyen%l" readOnly="true" external="true" defaultValue="''" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="name" dataFormatString="X" allowNulls="false" external="true" defaultValue="''" allowContain="true">
      <header v="Nhóm" e="Group"></header>
      <items style="AutoComplete" controller="UserGroup" reference="comment%l" key="@@admin = 1 and id not in (select user_id from dmtbnsd where ma_quyen = '{$%c[ma_quyen]}') and user_yn = 0 and status = '1'" check="@@admin = 1 and id not in (select user_id from dmtbnsd where ma_quyen = '{$%c[ma_quyen]}') and user_yn = 0" information="name$userinfo2.comment%l"/>
    </field>
    <field name="comment%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="132">
      <item value="120, 100, 100, 230, 0"/>
      <item value="1110-: [ma_quyen].Label, [ma_quyen], [ten_quyen%l]"/>
      <item value="11101: [name].Label, [name], [comment%l], [user_id]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu+XQz6F1s/O0r19h8e4gbx+rZFSNi53T0KYEWAJ0SvQIUh6Tdww3kktH6Z5qsMzMrEW3ol+xgm4dhfDIX+IIZS2IF6jynuS0RhhyGKUUiDUw+ZS5WQxYt6ez3nvHcAg5VIzmKksM2/ZregwgU1fkVg1jyd1MlgW8vOHqiIRXX2PG8EF7+UoLTLMd8u2Lj+305LBNy3iAJ3y00goNQYPtZkth+Iz3qeoxQ607b6ua3ZdGxkBoXjJO9fx2/oPy/JID5FHcmquCMD6npJav/fCPP19vDCkUOfj/iziPwO9FHMloKwMugv6xRl1JbwImBTvOCu5ioef7KXPN9J7GgPMFcMVnLR9FhAXDTGfhQ0XLuyhqUGmFnyxfYNyZa5V8utXKig==</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9HkG/Gwq53+4Hb3kB7wrPx03lJkm3XjL/O4okl1e1s8fwfGPW+yR24Uv8Zla9uxKF+pWT7OMIidOFtrr4M8NEYsbf0LJLets42iEBGy1sSdZrq29R/JxK/CL2Sg+TUTt50UfBdvAUkqU82Qcfsi7yG64zuvkc0HdMCWkORu0hvvtCgVFkbTR3d2pg0pVzkwfyAfZJP2PrKU3j3UJQkhTQg=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22alPjDnV4JapQMqYNEp52dXN3KY1ES2Y9QbPT55KJ1Zd6sTeS5wHibMjtGjLG0d8mnaWdvFCQoyKaSmlXowkCLsQtnhroV3iRsZimDbBX3jBqwiH/PM8MXU8HYM2IJiFyKXLklyMNzLU8On8wzuKD7uCdAv7DutqPVTPHTE9OWfI+jLUHK8t+Mmvi7kJMAkl5aKFu8ILH77ZuFDbt/QBZba/KccdoQQ0kQ4ItB/QnNqcEm5jonHRwjgmb4e+nraMsu03ttR/DGRw1fr/j/rnPaA4ANmOf2AhBit9H9w1KY8ktq/zEuvjjmhTfHXjMxQ9nA==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcO2iHcutzBmMCXAtJXFGiJjKvXkh13sIFaZIlOCR3zVEXVVlpcLbXTW1wSohxjXIcw==</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22alPjDnV4JapQMqYNEp52dXN3KY1ES2Y9QbPT55KJ1Zd6sTeS5wHibMjtGjLG0d8mnaWdvFCQoyKaSmlXowkCLsQtnhroV3iRsZimDbBX3jBqwiH/PM8MXU8HYM2IJiFyHlPpH3IwE2D3Kjv/4KaqfpSlVDO5jhdCxM0YuRIScSyVB24nRN780qq+6HChyXkOVXguKOc5Wuaca3hMVadsMdVl5qkmFbVfPyOUvIgpysKDndXvoyMOWVL1ZSpINFlak9C4oi/oEcRgVOJyPHTH6CWMn4/JMjc1IB9lM8pqKjqCCBt5fvCmkTGnvTFEE5UZ2xoWIyniwTa4ldcSfJXQk6fNbtX3w3WNj9Lda8U1OvGKRPwH6WrZ2ODMT91dWYkIg==</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XV3JR9zRUtoZUg85DuvSRK57Hp2ahd62gfgYajSWCLb1bW6M9nl4Oj/LfsNy1LJSIjQHx+qlTTRiJLaWcOgtRAcM=</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22alPjDnV4JapQMqYNEp52dXN3KY1ES2Y9QbPT55KJ1ZdcxV0d1cdWJIu6aRBhcTvGXSu8qU0tJbjnBUJ/SwLBQw=</Encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtdCZ0og3+rn/xGOd9dNjdtcSeMJ9FrSeCGuXlMkPyHxKEZeIv7rPDl7BItH6E0Pulb70LGQW9jyWgp8CepwpQuk+XAJQvB6AeUXZKeRGdxQ5KLRc/lXdXB1R+hN7TTXdbNrmRtW12ZH60FGswdmxIaH9BenvUJgrDRIJQxsSrXgGmFnT9eMmwkaNCY6Y4Q8A3jhssaVheFx1jY64bdXz25Ko2p9Ez1UltzgE43VzPkCQLrxuyltb4lk14N6LTa8oXIA37JoANehJiMsVurdjnsnWNatRaebzcNKFZBi1vYcb</Encrypted>]]>
    </text>
  </script>
</dir>