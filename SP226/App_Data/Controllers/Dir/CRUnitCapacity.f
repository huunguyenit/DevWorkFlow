<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">

  
  <!ENTITY Check "FastBusiness.Encryption.Begin$ubZtUSPJWC7E3qu5YQA22XCo8G6lJt/XWijnE5FXTjFGvKOXmyHrRozK6Wqu2OiPnRn6jq1iqJ4wdEZ7RtJmZI+SSukfeLqeVJnERQt028CFUxXC/TwpKg2LSVJW4HhknaVQ/Q/4thuUBYhKKdyPRLB4RLdxHNsCK4S+qpXo87AhsDh6u22dS+A5JYUH6SOkyVSDYPoW2XKChxav+aXdGkdXx/YhezjpM+pdWTtHRcst0Fp0FtQMCDlKQLVaFLnle4CHnmz1pkGqrXrCIFiR1ARODsQ2S9NMhTc2Y6suTcxRyKmzbsqk7v6496TUg+/YK66SzlfUXNHDWtBRgPSADkG1nQfyKmityXmjO942YqZ/CWzU6D9RsKr3wff1vDyCThgQCvtBDtQD1YJFtQj2xQXQDh9PhFoiFkvcrIzf1MI=FastBusiness.Encryption.End">
  
]>

<dir table="crdmdvt" code="dvt" order="dvt" xmlns="urn:schemas-fast-com:data-dir">
  <title v="đơn vị tính công suất" e="Unit of Capacity"></title>
  <fields>
    <field name="dvt" isPrimaryKey="true" allowNulls="false" dataFormatString="@upperCaseFormat">
      <header v="Đơn vị tính" e="UOM"></header>
      <items style="Mask"></items>
    </field>
    <field name="ten_dvt" allowNulls="false">
      <header v="Tên đơn vị tính" e="Description"></header>
    </field>
    <field name="ten_dvt2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="he_so" type="Decimal" dataFormatString="# ##0.00">
      <header v="Hệ số" e="Coefficient"></header>
      <items style="Numeric"/>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330"/>
      <item value="110-: [dvt].Label, [dvt]"/>
      <item value="1100: [ten_dvt].Label, [ten_dvt]"/>
      <item value="1100: [ten_dvt2].Label, [ten_dvt2]"/>
      <item value="110-: [he_so].Label, [he_so]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6i2Mrp2z9fxxSBVIFWWROzN4ZrxjQr6bSRQWdxaIEm7zYQme2xu0M4EBC9ujXdpOvi3b5noaZbArqvvzz3YGHVJA==</Encrypted>]]>
        &Check;
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6inQs3XqcPEonl0E8ujOgeARDaCnHr5u8JVXq9x2yBsW8=</Encrypted>]]>
        &Check;
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcGYSs7vtnfzbBlxjfW4SUxlGgEyPWGxok54/oNaK2RAt+Dxf8L2svhXO2zZ7mPZbWeePFV6ZlqH2uraC7Hbfon7oRypvk1PEiHN8XdrnSIXD</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3af99XLCv10PE39uENjugvgjGlsRTUGxoPhirmhCio5g+oL+NiiXRbfrT4zEroRgNI7MmU4LYahXZQ2pNs1uDSyOZ0WKD3JPd/edSGkBNSA9QDTeYl0/A+9BATg+R4+A6F/vaKc6y/NZOGYrU0NF7X3eJ2xD7Rfg41H2hQdxPx0NDtIFgSkTF+1UlwYK+s0cYQwwFLlQ9+7TCWrlqJMS9nNKyJxnkncVs2bCyjnvN0bYXxX6U/LdMSgcCtIbKHRLdoPW/qMIO+Q7EVdx/4Uoj2hbr6XlobZQzH+rA8MxeBv8bEYSm11+nsYNRJ9pUPh0hKpLAP9hT+J9UyvfGyKnZBlqdEktUvfekzOTh0ahCPgdSliQ52inHEpDLcLIdsIEDiV6ThxFfyXl67qKrsgHUUPVJMCR4goriOXGGfoFK6+2njHVQktcYRLy3VnixYqxFi</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5+QRWddH3AlR+z9nDTz+7CxkgcxM8M59IjjM+E0OWREBzL2s6Wq4UuEjFPl0jyQVCYVXnRoAsxFYiqSglWtoyHb7hcdd4vq+zW9xGVwKIk/cw2IM54d4WIuk3fTEzRlsmDn3WYDH4o/V7PmaAtIjVcrdLNWm3gQ+BOf+C9EOaY65PyFfyqYlVXTD3IM7wjsaa2EM8wegJ6wqQQX216vktBIkPK4tlCCeTs3omeMqFBKA==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5xO6WIo7TKNZH2TluUAiS8OPajHve1bf6Uh8ckLv6TKkmpkh5vzCOQXyeg2r53MLes=</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp9ozwmNWaFXFGEKfmQZvzteqeNP3JtyhxR1MVFLM6fy3/yBx6RK32grMwjKKX0nX4F4TXUG97yX1t0Unl8Bgtoa6Ls5L06IT73ttCE7W+1CHQPeirjegOm5eo0t/RjCN/U9noWZBbMIlhy5S9iJhQQbbwbn7be1/a5wCTOWxTYirfqSMz+nJsgnnMXZ59BnGq5AU9BbZCeKcw5YB0rykPqdorRHULK9yaBnl0sSXnvcfrf4NB+75wzCg2xhZ9y12nrCp53R/7MqikEt5/93xVEs</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5+QRWddH3AlR+z9nDTz+7Cy6qZ6gOgQYcs0QDhN/azI5wlf617/HLK6tt7QxKFdz5DSXe1Bgpcwa5rC233dwqjgtV2/p8d0jjWA/GDfWlMfogaFxB4r7lpqGSMDIMaT9mF/NVJ49T3jMxTb1/EDSWn</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XVwa92o02DsEse2bMcQHp2fmE+WgxtQn7bhQSC+NcFqFq</Encrypted>]]>
      </text>
    </command>

  </commands>
  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtYaCfw4Fv3T4Hstg44FwW6Wte5N7seV5/Z5dN463MXj9pTevA6TC+b6smyLNVxl7XsQ5uV+Ne1dnDNuxErU3qwNHNGZ24rdMY62JPR3EL5AWDqTWPocQLI9ILgMa/xIHBAggr572zllD5Z8J7DyDoTw/B86DaLwhf3AY/kXIYE8YVavx8A5w3aYH041AlJqpmpHHhHfqbp/6TAeT9XytxDduYDdTnjN0BcWgaZA1SyhdIbzYr/ORyf38/8Geh4lvlSGW2dJRiDXhA6d5AREDMlA=</Encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>