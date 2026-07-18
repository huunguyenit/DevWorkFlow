<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>

<grid table="d07$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="CN2" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c07$000000" prime="d07$" inquiry="i07$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="ma_nv" external="true" defaultValue="''" width="100" allowNulls="false" aliasName="rtrim(b.ma_nv)" allowContain="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten_nv" key="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}')) and status = '1'" check="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}'))" information="ma_nv$vhrnv.ten"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Bb/qspxo/In64/zacjRF5X0sQs7qjzsK/7ycA1fO/E2hCBritmFMBqCB7q4j2cRoj8JJTybAnIhdrhG1LEorqk=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_nv" readOnly="true" external="true" inactivate="true" width="150" defaultValue="rtrim(ho_nv) + space(1) + rtrim(ten_nv)">
      <header v="Họ và tên" e="Employee Name"></header>
    </field>
    <field name="tn_ct_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Thu nhập chịu thuế nt" e="FC Assessable Income"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_gt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Giảm trừ nt" e="FC Deduction Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tn_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Thu nhập tính thuế nt" e="FC Taxable Income"></header>
      <items style="Numeric"/>
    </field>

    <field name="thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Thuế nt" e="FC Tax Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="tn_ct" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Thu nhập chịu thuế" e="Assessable Income"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_gt" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Giảm trừ" e="Deduction Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tn_tt" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Thu nhập tính thuế" e="Taxable Income"></header>
      <items style="Numeric"/>
    </field>
    <field name="thue" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Thuế" e="Tax Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="stt_rec_nv" readOnly="true" width="0" hidden="true">
      <header v="" e=""></header>
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
    <field name="tinh_thue_yn" type="Int32" width="0" align="right" hidden="true" aliasName="c">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_nv"/>
      <field name="ten_nv"/>

      <field name="tn_ct_nt"/>
      <field name="tien_gt_nt"/>
      <field name="tn_tt_nt"/>
      <field name="thue_nt"/>

      <field name="tn_ct"/>
      <field name="tien_gt"/>
      <field name="tn_tt"/>
      <field name="thue"/>

      <field name="stt_rec_nv"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
      <field name="tinh_thue_yn"/>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ6AUMZqevdhU1w9/FmVctxKTEfy8nSMu+uMpM5NcrEaLT0P/tQz5GcPNIoVQeIOg3ppW6JASPSCsXNqUXhkbW1qJq1RlgxuJkKGVxeFKJqARoIUKRwSKujaHgIE6m4OTDBmVy8405NIi2IOcTzhsReiBQco9QifiXexssfrT5W3ycLdgMUeeY7IHbgIEWpMt23R+Z5wsgQFJZej/e3zk6Ug+A2ULwYjrVxj9K3qYU+PnGBDayNAi7F4mkWoLiI4qd0OMqqWJH1QqDnm/b1qK+0ytePKZHfoTCWBNtqXLzd2b6oD7f4AlpiK8G3uEbIEJQIZLcX+gKudJVNIChIP2BfkTx8wWQr3DX9ZzC5VEjj9dlkzCYYFglV3bFuQ+lNEgMDEtIizRLpO1SvBGgMhCMcZ9WOxGIZEMq4DBROTE30lr27B8K1WAStPb2dyovpqRWk+j7ncmiZ9ks5D7ztdzH7D6cZH8Kw/MEjTHm8ZxVav2oK+O74iF4tjR/sUWWENmld7Apa79yfQNdSYMuO6jZgYpWlvAlygL3Y0A80KZ26PbdrKHuCalG7XT0PfI+fqPDXuJD7IiWE1XkUe36C1jU9M2yQ6Rmzyy2pQunijKTXGQ6md/7e8t1gJSS80c8cjJBGwUV7AmtaIstLz/fPEv8flu0eawtPWce2BXpOZFenK3i6Rioc01mjjk1Rt7qVUAPdw1pOwHMMW5k7AdkcnxWAVh1jEbaLKKYCgMarQmZEfNHtdCtVmY0dJCd4xbMG5W/XwApkCAPmWGbyEs8ykAZOBjSDeyZV2BgIdNAbTrZ4lWzMJZX41QZrOn8JRc6Dex0uVAk1YS7c9HC6MceLS0YzEAvekg5iiFkz0H7Sukh+reE5eOpicy9Cp6r4i/t8AmzlvRKpYxMbCikcqFEZUq7OUKuGyZ31a1yag+Mg1IOI0L+a6wCTPNpPyQy2MPR+Q+iJtoaAKG/vIlIpOuPgPQq+lYXcZ46IE0STggiGTtOGDzPJF+DdR2TszfbfTu8Tms7338e2mOW1fisVSVDSQ8nWgjujChntm15S2FdbMajx4M8cyQQyHCo3fM0DBvzqNTsdtzF+SqmMqA7mJ+Kmr4UawRxfb9yMIutsHPjmfSxd9mkTAz0Ozk0qllvj1HaxasiYfSXQeRjnjM+BQJU+GX6G0BuHfU/rlVc7ugki4Eu7AV16+0t+yyGIRZ+biu7eN3rovk8HF4Jb2RaD7lr/n4VPePx7eNntye70tqqiJ2ekzzxTr9uy6r51SdLaxjwnh7gScZHQ8aiOuimAKFe6R4GFmdS/YdtY19dKFI7J0xVgE5STgqGxTdSVimDtImriXj9tgP6SAKR5CALJVqWvwG9reWSzeakLVZu2zOWd0H9XZVBH7ZxHUDZh0598zkyN8TwuwfrmEssWrh6cqAurFNjm+g6gguzsRz1jegq8hqXFCjA==</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="EmployeeID">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5p1ONhnQ/dVeNDqmQY5tBTf9gniI5ZdZXG2dYHCvwCWBXcJ2v5LwZ/NNYOnx3hyTO09Cmft5ijvpUpwmlG1oD208XLnjuTCv+/OrXAU7DC6zAanDl9c7LvDmIhtXhSRyM8GGfN1mlYudT1rwpUNPSUPWGxtAIi1Ym9mtFUh+V+GA==</Encrypted>]]>
      </text>
    </action>
  </response>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/KWW0H3wllwc+j4G03oLj1B66Jra2RsWCSZPM3/TkJSE9lpqvYo/pe/te+bQwVILLwzF5t8H+o2aDrlhsSVUOjKzOGZnPOeZ6QMqCRNAXYsCsWDR1DOJiKUpbFrp4QR+9Gg+hjwXzybk9g6DpK6vD4QsS7DJskXxKT35LsZhkwGg==</Encrypted>]]>
      </text>
    </query>
  </queries>

  &XMLStandardDetailToolbar;
</grid>