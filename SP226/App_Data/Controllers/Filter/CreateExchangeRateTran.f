<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\ProcessLockedDate4Unit.txt">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
]>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Bút toán chênh lệch tỷ giá" e="Exchange Rate Transaction"></title>
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
      <header v="Tỷ giá" e="Exchange Rate"></header>
      <items style="Numeric"/>
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
      <item value="110000: [ma_dvcs].Label, [ma_dvcs]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;<![CDATA[<encrypted>%QUk/b2XzXW4SkIBsdbQxE+wYBC4RcPiWnMULqXh+v3bxxP/qtIImSwMBu3G5cAbHeVK33lo6ouScb6JNg4+lFQ==</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBZ6BzPonTyq1dLDhtA6QszE1dNbzQzOTn4QRiYLu+PlW1e4q+w6fZFnGauwiiH2Y1PHsqnjCOKealX9mPloALln3oS3YpX8LuWSz22gV71Ok9ZxN7/hFYrJzNWDodK32aRzgrO4NkKHN268l6kc46VhipRROWC9FirO6WmUIyPF5FTYf2dDHdabeRxEVwXRjmJzbhA1s7/PjQTUtkWYcWcJ/4xqxVRuPtLqy8p/1oxQDVvdwVLpTokymfSNfgXTVteD4681hOkyEpogUrzA4j8gX3i1Yv/LmpT9kQ2PHLvAHOO+3GvHKo8/2hV/BI0qqEMxcTuY7Mk/lK0ZToejmlDcUODPPTg2tqoPHXNM/PeQocX51Wg2cY8eD/cppoJUE7r+JunnJAwVEIBR3Tp3KekXZIzreWrWfldTkbxxryO25Co9AEcCILq9RVW93Io+22STH+2WLECGJ42u7VdpGku/KgP4K+VACmee5ZFOzi+AeM+T9Xj+8PJkpuZjllks+EE5Lg0BTNonULVC3AWMNK8olcFirpVam9kWTv/z5L9ISyHAjAtv5Hcjzb2axxHRJlThVTc7BG9yAPQajabfzGwSmz7oUftlHQT0S7q219DcFrzVsFuioNGiMgDr2LYiGhglmrINcYqx3kGJSxVl2iosVj2+hiLFoO6Y2RO016c6gv2a9yhuVjglg8OD3dcMroKFSx1D22gtT1yrHK9kuF81AxyqUog7SxzSw5TBED2TVqPWJVVn7K0ekMWsfgvDDQrrDTLS22M6t0J2r6Qc6Dd2t0fMsScshgvA6o9OIaW3t47qBkSuzN4EJBvA7sFmSLZzoupZgfVxebtNd7C98m3N</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetExchangeRate">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6ePvDEiPLJoZDJnB0zrXDojcaaSvS/FSzgztVLhQyHDDA1+JDtpHMzXaHLAh1eSzBo+xoh2DHHjqiKeMZMAAptVyznjuDcFG7G3C4WICGwCcE8Y5mgq/9/zEqyeBJm8oh7Nr/VesoO70bj7npyXybBg+u4VMM+RMsFOGvgnfCT0TJDdZHE2SzwJRH4b+duvi66gV+8vngq7JWwqI4otTnDSGjPlKvVShxuked4Y6HtTBAJOgywtNQt49BOzVuXF5hHP1dlMEJQnlaEgZz0dU7JviZDp9nD5lfKIHPg6/F8c33drJfqj6fQqyPTStNAuynWSdcpiJXjhZIIUTWEAGzxuD3cDmfbO62TIgIbfWmEDR+dY87nyoG+xlCJ0WSOK6+mXqQkPf2bcVOfNO4+ZOCNAtc+HTjYVQYJ0mgm9mwove</encrypted>]]>
      </text>
    </action>

  </response>
</dir>