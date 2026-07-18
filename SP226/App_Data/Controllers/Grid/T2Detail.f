<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>

<grid table="d02$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="CN2" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c02$000000" prime="d02$" inquiry="i02$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="ma_ns" allowNulls="false" width="100" aliasName="a">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="TaxEmployee" reference="ten_ns%l" key="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}')) and status = '1'" check="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}'))" information="ma_ns$phns.ten_ns%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQo941MJnugbci8EbO7nptzt2/hXXtdXPo/fyja26j4d5x1HIbHYYEHAft5eBfNXrGY=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_ns%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b">
      <header v="Tên nhân viên" e="Employee Name"></header>
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
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="tinh_thue_yn" type="Int32" width="0" align="right" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_ns"/>
      <field name="ten_ns%l"/>

      <field name="tn_ct_nt"/>
      <field name="tien_gt_nt"/>
      <field name="tn_tt_nt"/>
      <field name="thue_nt"/>

      <field name="tn_ct"/>
      <field name="tien_gt"/>
      <field name="tn_tt"/>
      <field name="thue"/>

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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ6AUMZqevdhU1w9/FmVctxKTEfy8nSMu+uMpM5NcrEaLT0P/tQz5GcPNIoVQeIOg3ppW6JASPSCsXNqUXhkbW1qJq1RlgxuJkKGVxeFKJqARoIUKRwSKujaHgIE6m4OTDBmVy8405NIi2IOcTzhsReiBQco9QifiXexssfrT5W3ycLdgMUeeY7IHbgIEWpMt23R+Z5wsgQFJZej/e3zk6Ug+A2ULwYjrVxj9K3qYU+PnGBDayNAi7F4mkWoLiI4qd0OMqqWJH1QqDnm/b1qK+0ytePKZHfoTCWBNtqXLzd2b6oD7f4AlpiK8G3uEbIEJQIZLcX+gKudJVNIChIP2BfkTx8wWQr3DX9ZzC5VEjj9dlkzCYYFglV3bFuQ+lNEgMDEtIizRLpO1SvBGgMhCMcZ9WOxGIZEMq4DBROTE30lr27B8K1WAStPb2dyovpqRWk+j7ncmiZ9ks5D7ztdzH7D6cZH8Kw/MEjTHm8ZxVav2oK+O74iF4tjR/sUWWENmleVMHSAOevRVkqGagK1RmBhSrvAWJIcXJj9APWGy7QZQO3sRflB4f8q/yMu1EDUQ/fosBT+AwRkbwAdZ3zMxymCUJ6ASGcRRUBAnjer/TO9ExEKVvaHwycJkrpQHflX0z34vvPPY9Wq3F/nFoZ4ES7UXzLLaVDJgsgIIBvnApGtKx1nTv8ng6V9k6XgSYJ5Bu1jKi5Qrbptj8wqHKUmsK31gYxEYCkVDN24ix0/jjrwtut3lRmFouIUVkMqXFvcCXAVJdjDYDUbDBmoK35HgiNXszraO3u4KQLHr2Np2+HHBBjEzopgSVRLmI8tfwf6WDKHEB/rewcd2Qt/3GU0pRi5dK6iSOW7z4rQ2lpDlE0eP7Xun/niHEn/dwlhzyoy5Z7mjwsfWQ55R4BlFyq3QTAl+VW0QGQoWPgh3SUsEG10q1oph2RaN5MC60+mx7bwnY+BPud7lA7524ijOsLdLxegwBzIxJGWucefLNlP1qYOkzpbniNNgMo3ER7AT0g6YzaOIpyF3cgOXT7QlbWpxrkpUqXzwdv+bvM/xif2hQK8yaHSSDvdHPqaVM6T6LnjAO1WeBWGbh74gHA6RAzJet5KQSwTM+nD3pqFNOAsXslw2KxQ08jO9osQ22wSBbc0zYeJDfeonRog7shbAtWCVNO7b38QocE5nx2xwRpQdKs2G9yZz+FmARTh3jtNy4kV5Xzxnfx2WOiedVBgk8vYRdekJThgJu/WO9eyGBDFHU0/HT1083inO7J0YQpZS+xF6SJEV7oIHftOnLi3XygiFnSJN+J3EoJO5H3DBoOvqojJAdGBKbSd3OVygEo50jV6m2fLGqElYmqOL8irjfXb0eghKD5JituKR+7hoQF/7Z818jDSC3LScNi6MTKqKTEqvFfP2OiVxunFQr/bJsZ6W9xq</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Employee">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5ke3WMDeL4T1VN6aLVp4GBAxx7ycP5zw/nY51+DgC0qUTRYANuQaZqc9RsYPG9ebHhc4w1O2YkAU6KorIHHdwdJjZVT8Ma8JJycqXiI4XWqoH4DEII7soK7KUPPp14cS0=</Encrypted>]]>
      </text>
    </action>
  </response>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/KWW0H3wllwc+j4G03oLj1B66Jra2RsWCSZPM3/TkJSNQbuB/THrlOZdsnwoEwpRZIaS+rpQs6H0Q8ZhIHSP74tFdJuilOoHkajjni1cSJkgNbZPrW5oVZJwebUr4VNTGjFXwiLBHKJt9EiEnXPuRf</Encrypted>]]>
      </text>
    </query>
  </queries>

  &XMLStandardDetailToolbar;
</grid>