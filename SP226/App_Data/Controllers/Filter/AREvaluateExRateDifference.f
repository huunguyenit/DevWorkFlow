<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\ProcessLockedDate4Unit.txt">

  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
]>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Đánh giá chênh lệch tỷ giá cho các hóa đơn" e="Invoice Exchange Rate Difference Revaluation"></title>
  <fields>
    <field name="ky" type="Decimal" dataFormatString="#0" allowNulls="false" align="right" aliasName="Period" defaultValue="(new Date()).getMonth()+1">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZQyrN49lOkd8l1l/Y+bIS1rxgcEuqYDaF+RPS52qPu9wM3jM/HL0eE7jyde/x8JX+Q==</encrypted>]]></clientScript>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZQyrN49lOkd8l1l/Y+bIS1rxgcEuqYDaF+RPS52qPu9wM3jM/HL0eE7jyde/x8JX+Q==</encrypted>]]></clientScript>
    </field>
    <field name="ma_nt" allowNulls="false">
      <header v="Mã ngoại tệ" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="ma_nt not in(select isnull(val,'') from options where name = 'm_ma_nt0') and status = '1'" check="ma_nt not in(select isnull(val,'') from options where name = 'm_ma_nt0')" information="ma_nt$dmnt.ten_nt%l"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZQyrN49lOkd8l1l/Y+bIS1rxgcEuqYDaF+RPS52qPu9wM3jM/HL0eE7jyde/x8JX+Q==</encrypted>]]></clientScript>
    </field>
    <field name="ten_nt%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="Default" defaultValue="0">
      <header v="Tỷ giá" e="Ex. Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="type" dataFormatString="0, 1" clientDefault="1" align="right">
      <header v="Loại" e="Type"></header>
      <footer v="1 - Đánh giá, 0 - Xóa đánh giá" e="1 - Evaluate, 0 - Delete Evaluation"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit(s)"></header>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1)"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 100, 130"/>
      <item value="11: [ky].Label, [ky]"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="110100: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="110: [ty_gia].Label, [ty_gia]"/>
      <item value="111000: [type].Label, [type], [type].Description"/>
      <item value="110000: [ma_dvcs].Label, [ma_dvcs]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1AoAmRGNTAzHeFxkPbwLwS1nU6g7IE8c9xe0B7CkCi4qfEJ1RhoGZrDWK0aZJh3tXVg5hQvdmv3jJUYvI6VpRh5PmOQQpKdwI4mTlSUkrNXah4QNHHEXTwj7Dc/GLOojA==</encrypted>]]>
      </text>
    </command>
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYU3jg67mYTmJvr0ghQ2FoZbHIzklYnV8t/i1gFxjmm4+SpeCuq5ic4WMUrthGm0QpG58M8j4M/exu0F3QaxJygyrCahMmhfnrrnoT1ODe+uY3gR69Rf1EeK2iSoTJlPldtO0ESopqdCgHF4x3eMTSurIJwUhxJsaCfVoX6eE9QLzfhZAMAB8LiD0OiL64WK7gB/naqbfbRHfNjntQ8w6d5RU8RTWXRgDxGedSAWg3uHAHCMMtD6FEHUlbcgqbVnmlxFeTTyCRuaHUQHS1pl9YECT7OR1Qr3RO9bad5ZfLl+HACtwCRdzWS6N2SSEi7n7F8KulfNdXxZ3mmBCqJSFOpHa1AmdFp5VooZWF5xXgej0BJ93pNQXHVyWV27PNJU/fGd6u0l1uiD8oUAaf2LWXJMmQ58j+GIrfZO8GoZ/iGKbR7zgqGgDVGgTI3lyAlFcgQve3azT/rWPHnXSLLX7XXA==</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetExchangeRate">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6ePvDEiPLJoZDJnB0zrXDojcaaSvS/FSzgztVLhQyHDDA1+JDtpHMzXaHLAh1eSzBo+xoh2DHHjqiKeMZMAAptVyznjuDcFG7G3C4WICGwCcE8Y5mgq/9/zEqyeBJm8oh7Nr/VesoO70bj7npyXybBg+u4VMM+RMsFOGvgnfCT0TJDdZHE2SzwJRH4b+duvi66gV+8vngq7JWwqI4otTnDSGjPlKvVShxuked4Y6HtTBAJOgywtNQt49BOzVuXF5hHP1dlMEJQnlaEgZz0dU7JvgyMcX932zRJ0DrB/vbzmfa426M+Yjsn1bwm57C+9P5mUPAXLrEONATUHivFufKPP1UEwJoU25LQqd2Cl+V4GP1z7+kEHm2LwlznsOmhWPHdbUq1XF4RCsiEhiIgEzEG10DZR91z56TcBQjM6dQGbdsfEwgY2mq4DRPzzsaBid+ftj0elmuB73Ml/IFam7YKM=</encrypted>]]>
      </text>
    </action>

  </response>
</dir>