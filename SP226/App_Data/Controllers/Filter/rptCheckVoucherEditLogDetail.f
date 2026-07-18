<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">

  <!ENTITY k " and ma_ct not in ('CR1','DM1','H02','H08','H09','H11','SF2','SF3')">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<dir id="0" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="thay_doi" allowNulls="false" type="Decimal" dataFormatString="##0" clientDefault="1">
      <header v="Lần thay đổi" e="Revision"/>
      <items style="Numeric"></items>
    </field>
    <field name="ma_ct" allowNulls="false">
      <header v="Mã chứng từ" e="Voucher Code"></header>
      <items style="AutoComplete" controller="Voucher" reference="ten_ct%l" key="exists(select 1 from @@sysDatabaseName..syscheckfields b where b.ma_ct = dmct.ma_ct)&k; and status = '1'" check="exists(select 1 from @@sysDatabaseName..syscheckfields b where b.ma_ct = dmct.ma_ct)&k;"/>
    </field>
    <field name="ten_ct%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày chứng từ" e="Voucher Date"></header>
    </field>
    <field name="so_ct" allowNulls="false" align="right" dataFormatString="@upperCaseFormat" maxLength="-100" filterSource="voucherNumber">
      <header v="Chứng từ số" e="Voucher No."/>
      <items style="AutoComplete" controller="VoucherLogLookup" reference="stt_rec_ct"/>
    </field>
    <field name="stt_rec_ct" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_dvcs" allowNulls="false">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = '1'" check="1 = 1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99AlW86vAFmF2VXMWy81BMLxY1Kzq3dKoUlHX1CXftUG1JdP3PSB75Z+BpYX76SpL8glJSjiUC0tU9++tPWt4u+w=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="maxLength" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="11-----: [thay_doi].Label, [thay_doi]"/>
      <item value="1101001: [ma_ct].Label, [ma_ct], [ten_ct%l], [maxLength]"/>
      <item value="110----: [ngay_ct].Label, [ngay_ct]"/>
      <item value="110---1: [so_ct].Label, [so_ct], [stt_rec_ct]"/>
      <item value="110100-: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
    </view>
  </views>

  <commands>
    <command event="Created">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcOrX6fcpM/Vf5sOxM1cHAvqirfrDdnS+OJNJf34mrwXijjZmH94YGztZpzzsEp1UO4aWxaGoQUMInjUgVK0JznOzb82BgTtl0fOwprRe6gJO</Encrypted>]]>
      </text>
    </command>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22alPjDnV4JapQMqYNEp52dVk3waJzJqFnYvAIGzHRkQy+IJeP+Wid7PtvdBz0Hh/kO8v/qPXzqp7V719H44P+7whZmUWb2s9VB0UBw6YBp08X7B4maHFcx8OueN98kqjY+3L0oLrawfBYRMbSxcxoDFHg3DHEgJI6fI2cedU1jw4ZbEy/HP47Xr/PPTOLgnlYK7QpWs1cPv3p3wiPQoRk9/vYsM2bzve7yKp8fi1oN3A7yuD+12PcgrOwZASBuJ0+VtHeqqp3wBf1KM2LeNfJxeRXLCPaAqRWIOyd92x/iBowwogmc7ewcJB7iISOtXSdu6r++nSl8490dLv4SUL3hoaFHYiq3tURmKoGqnEpWBFiFDXxZkVyKRZM4YD2M8sZ4/7V2c+OrVpe8lP6IOa100=</Encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcGeuoNfgpy/m11KHslB8AFu6A/7ZRY89UV5u4LIMvQ5XnhvWjmGueu1P7t0ihmt+WqyBgMov5PaXV0jGnqmc1fwwaNCJD06LowVtQWPaMadz</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcCFHY9nSs1JD/D38PdmPXwbfGHZyxR3RVaBJDibv7m/FNUzN84modR6p56wxujwy4lChyOtCd3pWy+9c3x8iJoazABeexZYp9DrSS7hY7il+DCfgnsJujfSn8HZYQbnEFxkH/zo+YEgk/8DtTudKbUYpEg0HUpYCDxVzzMfiBHiJlx7Vvh6lpTu9nW6cN8vflnjpdLvOVZghchCdY+OvSZeTgGf+CYt6UOSwf33F3dyNs9Nd2us53j9lDgD1LH//PT+A6Ac98TV4eKSMH3zJ8MUur7G0IEYkNKYh41sTzreRRDV5paYKe/WQwVfKlKiYKA==</Encrypted>]]>&k;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLaRRsEIX+tNCgD0ftekPhNQz5ZSYqa8erdud02WB3OJ/nYnPcKj8qKEWQYxm5RmSm2Aymzd13+7KqRo/WKkgUllfFfC2zHVQtfjRPL12aPQT3noYO2i9aLbmhlrWGUXR9QKMCgM9MchX69J1AR7VRWS/qyc0IDnp5BjnQbQauCTUt3vI5u0ueGxNzHI7DBLyQGFFLzjdWiWqZrl09hRR8enWh8kq/PNeSF80Eq98NdbfqSsv/8auDLuOdPaKUfiGQJxluG1UFMmAvH3ichRwF5lYjLyz4847BmbZi5uO4uergkLcS5FmUZMkC7IW1m2uLFfYHPbgeKMkm1+HcODicwHADQF8drFxEGwXrImRhGP49uOW8FQ7lE0Ul6t9v3733iVbLZ95hrprk8TGUISYWYczZ8kTBSlf3jxmn4dyPQPe+wlJQEvcSfQk1MoM+8UKHAf7AmmMZ5JHBTkpzcaV3YNNOlM3YzS4w1WgIOq802cITW4mvkcJ0Qv/A7IuZWtRdOntcapkxw7og/i5L5lAJMKlx+q6pD8ds4qCRYiYsBTxIWGBGk3IOJocnxCMd3HHOPafZANFGq0h79QeYqQ+yyWg+Fn7Zbd0+kSEC2rNuxJ6dx2XRnGGlzeAxiCHg773+3QodK2qhRLl4qZFkbSqwZ/QG56WBY9sCADqQZGtoMJL</Encrypted>]]>
      </text>
    </command>

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1+Pgf9NIWpQIcrgh/QGVitrrfKmomZq0d73SyPBy721GtxlSiRdgLqcCaXOJYq0eFnj6d0TQbvACMRtM1qWcjuNfGMr++Kcn9g5w+PGMgeseCGfZ05FogEq2r0dj4HPl//PuXcvlIyOTm8uVcuWdgeGVur3MpbKGYNoestV/T354wKO4MNt/3fpIje+vJitI6o9WSmOhX/lV+npYAP7Qj1FrgYBrwOPa71TZICY00gt+sDuToS3AjYnx3RiEVxIRteH5JZHEgdLmfg3z9r0hLrDyiLl4EDEpKypoWHkaxyp1yeyz1ntjw4Yl6y4qbom+LPsdK7jGJalWZR++PLP5/HDFbGobOYf4+E8WvgNeSPZK1ssP6Q3zGC2l/1OS1oilaRcsUdq9eQncFVcFoY3tmejEG+Z92JedfExNFiiJUy/dkI9Bpoxm+D0V6MIqoyfckFsPemO4DHTyUzbYj6z/fDyfq8agCBLJYQEFILpgFB5QigLk0WkxkVmjcxG0RyFDJoA6BwbQ9SP49F+KFT72S2zd5ZExGtw0e8DKLG1qqdKv4cxdE9kRJPCueBWDAVmf0HqBSnMgsmdrB9F46nbvZqPaPx5xlLN/JRdfhEgPbEreromjz4MOO2DYI21R7FRUgYaRg2BCD4RZNK+wkoIpyqHXjLxzPeuHb7MoYMegBAc1I+jboCqS4KcVjlJLNuMHtzMpQlNrIqvNe2VQI+1Prsoc5o3CtSEMhtdJdQIovV4f6y+ocdj5LXQb6YrkgmfdQ==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtZ2KYx5kCdrYW1QOmvbjNVgmDcAQdDTrC1ETuw7hvqCPWlprx6bLMihM/LEsxYP0F+LPyLLVjsndkkAH/ncWpkjYECAA0WW9D5QPDt6zt0t4UXeLSg3Xvoydx+97/1Zk6Us7q97bIHRZZxwREmzLWusstUC3ST9Juxc6EYTRUM5Oue2CRXX1zS8oj76NGE9Vus1g9wvs+JMJ7tPNu6tw1A84wXysyjm5yvBNYVj8a5y8MqKBQiTR/NHWhwBsO68KM04Mmb0gT9XHExMI5/RnAqj/JF5Wp8SkyKHlST6P14Jpe3I2e02YqBw3nJp3Cgzg9opLzWcPtXs8fzowQqB6i8iZR/janpKq3wrLpYqmcX8avHTbrR9xDBk8JkcpV/CKs7zegrNqyhx2HPxBpnFHLtErROHYj9YMOtWEOeALN30kAVwoWi/U4Ee08MMB/i/9QpKOFUmRfeRHDsXcu2CHAO4hdJMqTh4DUDdpVkfETLVCnTrl8RPSnmx9sErCAqamqJFNSSCyQNrKzSW91g/pSvPZM6cN9doFvs8HtJTON/BZ37KIf0z55OOVF2eIPqkHcOKCxmr0irWZNggGNC8FE2hL1Loz1Q5vRkJvW090V3vEhtaEY5eXhpOR/Wk7exXAu1p5l9V4nZyKD409IaDtb8HyHBFQprgrwwM4phCLFN5yLnVpVqNFmRhnvoIw9b9iXVxYlb2qhJ9MovVQP28ztndUfLZAkPV2sG8Io4MvwQNgl+AIawaTc6jITAwjW/601rojDzDLijxK6/NGV9KQQoyyxjDh+Q0ygwe9E5j1DR7cw+7iM2b4XeuRSXJg5j/Xe4lF1RDtHIfHd31xAkFOufEKzd0K1X18t6WGdyl/UzvEyIO1t2KLCgc3DCWvpQ5QIlymh/iRvAV5qmO3potEeXRcFUBi2vC8wNNfD1oEa4zgbJYsj7TfhSWv84MjSRaQnyoUoxfix326xY5SE1sslFvAEcSZ200fkLGsGE/xEyllHc0BjTbTWTZu8Pgw/aBBsQ==</Encrypted>]]>
    </text>
  </script>


  &ScriptFlowFilterCss;
</dir>