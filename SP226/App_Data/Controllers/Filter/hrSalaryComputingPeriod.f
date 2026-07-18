<?xml version="1.0" encoding="utf-8"?>

<dir table="hrky" code="ky, nam" order="nam, ky" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="nam" type="Decimal" isPrimaryKey="true" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_bp" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 25, 15, 60, 100, 100, 130"/>
      <item value="110----: [nam].Label, [nam]"/>
      <item value="1100100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6eY49RHeGAbpnleV6V3x8cCR9fARsfVd6xH04raX4TeAP2e2f8Pp+cJQvzolEPyugHAHnEDw16SEnFiJJjZG0h3+Hw5rH6P+2yPc8erf55v9zQpAmQpfSgq+LylXbrz2ROMS2VhxMASUGp4CeKDAVG/GAPqsUiqBUc4lmzubDfzUfIGTnb92rOTc4k0LpSQbg0kysXRnFMsxD4BY1JYVFn0=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf7Bbvcu9NMJJ69NSEFLz4euWA92FCx9V2YZuIPgdL/7I9W/Cj9uPn8ovPzAX1ydsM6AyJ4mpO000PkPt6z5aUfPB3ZoSsmRQGrCjmjgQZKBm</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6ePvDEiPLJoZDJnB0zrXDog/gdfHTv2ayMITCshLQQMfQ0u0zVjiexMtMlevAJs2A74NK4rRaqI6tYz42/+Stt/tnifVxuan70ytOsctCnQcLqnPPpF9HWJdQAdZQ4aEOw3xMmBbzr3PnbbY43Zalowy8JeKLHMmdDZSzuZWCXbPZo1BhQwlKFSX9/chciUKO76nua2voHC42ZP9+wstqc7UZN/UQOWShZLE+DaCQrkd</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70KInAnqcXJOY1YJQqLL4kriXqlpT43zzRYvHwIfFwGWlLFrjZJLJJYLJpUW+HX1jj4jOc12KtaUux61xn0jk7g42kJcmAhrmwuYPR/duEysLXwwJhrLwv4YZy/f9n8zTvotfqNiDtpvszbgynSXbdXcTPlmMjJxc914kRJs6RcAhflubPtiBG81gYD/JpkQ8647ZuiDn0ah4BvKpJDvol8khRmMv2ga8rNyk+wES1sbzzinPmJ8FcEs6BWDfh6V/B8SqSOTyTqbF9bT4MGBBxwHqAnkAh1WP7rORU6WFHac2IgOg8VC1J2UfO7+qDtCnjqvx2FCap7MGEQ47qzIB1LA=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70ApdFkqajK05i9SUWmzDG8xTAg7qJOxIGVrjMBXEiqBFxPrPCqMwM+gbIetFDhY+t6Yq+WrOxjA2f9vBGfT6npCtFSx0fBk9xlKzJHuTNXZIhdekhICqKMfN9SLOb1FEFqIPoPE6oUaX1RJSCZqjMP3nCoxnPJlbCfN/+dR6DC+zl1vh/gCK9zxKXeBoDaw+CbuKkEHaZWuWFE1mqaOkIywwmYsLqkrtPT2awzeijNuPsW/iLGxhi/5oW9nFZJ/QGCSvW+dBqQximF85E43rZb7kA/AVoInQyQ9f7+frxxtnKffMIKoxntbo8WDNuL4bTNTdDF7mBwl6xGIR2EYYYzPdEwb9HSrn6ZBItCxw4IwPjFPTXaOgjD6TuSicrIKG27sdq7yL6kfGlSVWX6Sjkz539yGv5gDT4vR2Mk9mf26o6fFOq0/maQLxdWhQS58S17cQcpz1GmJ51a8ysvK9dS3LUEosV41LPucnJZMV8C/xuvCMASyiwbz/RiLRqLv5b729dZ/d2zHki86fBex+eiwwUxAzQG22iw5IqSIfBwPhQS71qF+mdek4mhEb9xk5ntGCPnx02ZA92LbbP7TjThbZEusLsakrSMX41oA+qf7xL/zQ7VaemoeZ/IwfRGgtsCFCQbAFOFUUQbyOkliOtmTrIc90p59FE1irP5qdFPwQUbtP1vx9iqls8/Lz6B8pew==</encrypted>]]>
    </text>
  </script>
</dir>