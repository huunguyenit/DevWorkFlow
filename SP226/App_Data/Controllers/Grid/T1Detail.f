<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>

<grid table="d01$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="CN1" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c01$000000" prime="d01$" inquiry="i01$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="ma_ns" allowNulls="false" width="100" aliasName="a">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="TaxEmployee" reference="ten_ns%l" key="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}')) and status = '1'" check="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}'))" information="ma_ns$phns.ten_ns%l"/>
    </field>
    <field name="ten_ns%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b">
      <header v="Tên nhân viên" e="Employee Name"></header>
    </field>
    <field name="tn_ct_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Tiền nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tn_ct" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_ns"/>
      <field name="ten_ns%l"/>
      <field name="tn_ct_nt"/>
      <field name="tn_ct"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75zYoXBjtLCfuFJhfaX79HdwFAx5OVbQ+jTUUESwFkfYbPs3P9K5Y+XULO/oJbfc57BB1xGnusZZZlkvf/JskCbaz6VqXVVlG/IxWEuUNoazi</Encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL756/JB6dPeVkwCfYuq8ju3IgTyvaYmP5SXM3CTuGAFlasExTxCBQbPEXIWZA/Ry229hH4j2n/gnYZn8ybEUcQSpI=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ6AUMZqevdhU1w9/FmVctxKTEfy8nSMu+uMpM5NcrEaLQrrRYe5DyoHNB5lDV6j9RN7dNUJAu3J/qVXijNO+HEJNj7fev5ze0vzAEuDyqRykOBekL5C+pHWydkTTs6yNEdBlz9U0fsZQ2eJsqBWeyDE/pYNUrbWDmitHwkD8q7Q8por016S1Ty1WDEJ4Dmb7t4vZiYshhdGcsLUjSauWxF0BsDDEO4zlw4DbzSDv7vGzhYD/6yeIQ8qD9mj/XTaY6MqitlVPELW84jSjHFY6JZYnu0N1kV/xQj/q+VxtPy2uasHWFJu2zuw9pcebjlIOCNwtTksvamOL6A9+rDo6ZUyGsSnCBrH8zs2+wmS5a3mWe9fjK81cdO39/ylEJgoBoVFeltMPkRyYwc7669GbVX9E43bLLEbLN35nNOlgQho3Oc4nfXGO6r/WMSz/dtHYMZuZsp0teQgqwN0ySuiuekB392/SE+5n1bCSBPjymvqcx041Ei+2COPrKO+WKeTdywhZjdaVc48ooOf5Ym1Ej6u7akAV0CdPVtDfUm2trVDRBpIU5H4oicGxTjiO1rM3pu9oYf58JPvSL6PDbcf1pdeEJTrqgppSaqPLAwKMfe/IQ==</Encrypted>]]>
    </text>
  </script>
  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/KWW0H3wllwc+j4G03oLj1B66Jra2RsWCSZPM3/TkJSNQbuB/THrlOZdsnwoEwpRZIaS+rpQs6H0Q8ZhIHSP74tFdJuilOoHkajjni1cSJkgNbZPrW5oVZJwebUr4VNTGjFXwiLBHKJt9EiEnXPuRf</Encrypted>]]>
      </text>
    </query>
  </queries>

  &XMLStandardDetailToolbar;
</grid>