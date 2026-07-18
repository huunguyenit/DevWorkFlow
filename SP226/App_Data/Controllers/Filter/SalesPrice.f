<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">

  <!ENTITY % CompactMode SYSTEM "..\Include\CompactMode.ent">
  %CompactMode;

  <!ENTITY FieldsList "ma_vt, ma_nt, ngay_ban, loai_gia, ma_kho, ma_kh, nh_kh1, nh_kh2, nh_kh3, nh_kh9">
]>

<dir table="dmgia2" code="&FieldsList;" order="&FieldsList;" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lọc chi tiết giá bán" e="Sales Price Detail Filter"></title>
  <fields>
    <field name="loai_gia" allowNulls="false">
      <header v="Loại giá bán" e="Sales Pricing Type"></header>
      <items style="AutoComplete" controller="SalesPriceType" reference="ten_gb%l" key="status = '1'&Operation.And;&FieldsFilter;" check="1 = 1&Operation.And;&FieldsFilter;"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99NaTa+sGe9iXhqI4AF4hyy3gWy2WnveJWcpdZIWrwqTtrx0qqBeG7OUZW7Dtqkwbi8Ne2KzdrnAWtHx3Tt/BMx0=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_gb%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_vt">
      <header v="Mặt hàng" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_kho">
      <header v="Kho" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_kh">
      <header v="Khách hàng" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="nh_kh1">
      <header v="Nhóm khách hàng 1" e="Customer Group 1"></header>
      <items style="AutoComplete" controller="CustomerGroup" reference="ten_nh_kh1%l" key="loai_nh = 1 and status = '1'" check="loai_nh = 1"/>
    </field>
    <field name="ten_nh_kh1%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_kh2">
      <header v="Nhóm khách hàng 2" e="Customer Group 2"></header>
      <items style="AutoComplete" controller="CustomerGroup" reference="ten_nh_kh2%l" key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
    </field>
    <field name="ten_nh_kh2%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_kh3">
      <header v="Nhóm khách hàng 3" e="Customer Group 3"></header>
      <items style="AutoComplete" controller="CustomerGroup" reference="ten_nh_kh3%l" key="loai_nh = 3 and status = '1'" check="loai_nh = 3"/>
    </field>
    <field name="ten_nh_kh3%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_kh9">
      <header v="Nhóm khách tính giá" e="Customer Price Class"></header>
      <items style="AutoComplete" controller="CustomerPriceClass" reference="ten_nh_kh9%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_nh_kh9%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="ngay_ban" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="effectiveDate" defaultValue="new Date()">
      <header v="Hạn hiệu lực từ" e="Effective from"></header>
    </field>

    <field name="kieu_gb" readOnly="true" external="true" hidden="true">
      <header v="" e=""></header>
    </field>

  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230"/>
      <item value="11010: [loai_gia].Label, [loai_gia], [ten_gb%l]"/>
      <item value="11010: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="11010: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="11010: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="11010: [nh_kh1].Label, [nh_kh1], [ten_nh_kh1%l]"/>
      <item value="11010: [nh_kh2].Label, [nh_kh2], [ten_nh_kh2%l]"/>
      <item value="11010: [nh_kh3].Label, [nh_kh3], [ten_nh_kh3%l]"/>
      <item value="11010: [nh_kh9].Label, [nh_kh9], [ten_nh_kh9%l]"/>
      <item value="1101: [ngay_ban].Label, [ngay_ban], [kieu_gb]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvnMT01pUxfTs42muZuIJqWijpDdNV4I9vj4umQfwnnUG4zWE0dwbtJ6AOU1J4+GwdpkW6mz9jCDUZ/jRBp66yI7qmlVx0Lui2NzrCFslk1bQqsTFftg5dVlbeaemmH5I/oOXIHoa0LZtqMsOjkiIy6PLgSHmOFE4j9TAq11IBAtg01aD/Pw2M6WCIXrpILjYiZ9uLINuEKghrrV3Rg8g+Nrj03Hgdh9Pf+uO4nqCT98NsIcydSwg8N2NeZWf+CA4l3lC+Gg6CssEM3nZ4iLLiV6PPq929sO7q8VLCM/ZtcRvNUn6d8/MWlyudJKvgSeg/SYoDSt8F7y3dBAOXCSiVIcE4z912aSP2aEA0kEdpott6niCJc0C5rC3A6le0bxVCzNbKwRlNFA+8Qs3s4FjEPTQKhEQhiyNwtEbzy7xEKaHDJu85myVFv0xfViryn4ELdmDI9k+9/NkgNfrI7VJ792HKJ6NOklv1HZl60JTk6KaQ==</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHQHZ1sEfLBLAU7ylm0Tw/ITb1SeAHvMLhmvPMjy8CRlbFa4N3yzwWBjPdl8yXTFQNum5fti0Tck8zoU9Z/b0xzJrf3bypauFmrafKT5X7Q0gajjMobAdaYXaLhksZotfw==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdPzybVQ8zyLx6JMMDzWp/u02cW3ignabIx3yph1UHRuFHYVQDUeTETR7W9zrKOvmThxPuXmlUuxTd8BViuHDCi1Z3oviTMyZVc0qA41+9mnmxUfUk59J7k9yNONOt8fM/xZ+ng/46KXEVKdWJca+U64ym3s/9ak9ZiqWniEb7+bNe3ReVDLyPxdfme0wH9Ws2Ce6Bd6MtcLj1OXJP92DYcHPVleL4FF0suCga7BNzOn/5B8OM4MYGYdL1YV8otVFbV8X0yreomNttnI/d/lpTAYjUjhmoSB8sg8oVTmiTlLZj/tdHIWys7qEQjRirOAS9SKF8kvOLBhoyW0i5I2M7SiFNWkGZhlvAoWeC8IWgw9iSO7ouDKAGJPZKmjfFi8EFlL9D49HJSwwdh/F55+vUTZRUouFenzL20tY4a8nZp2zkrC3fhTYTrqjJrASI5bNT/LgH7YE14fucmh4nkuFkCwOkflycPfjmPMnhvfXLH985gVjezpYkX1imwDBuYWmwD1mTCOTJaMe7Swn+Tep2KUEx1+1TALjVvueeiF2rCs6BwVbCl0VjjswF4HG+EiENKetUCNyWABzvWiGT31fDLWliKvZOrA2vjyFohPjES/XGYelvfWDE6VJctv3GhD4Dbp4jgAzK9LUOvjEeC98YpFPlu6k70nAJ50O8jxHkaVu2S9x4vu+QV1vamcXsA1Hddxmzpm4PK7SjfJE7c6OHqVSl+rutsH1SL6oK5IyF1pVNPNpf1GzkglIW3MegKBzs6GzS9iDdnIa02J/K4904CucngAROhCfjyEaq6gMPO6LItJAtlUwHgtD4NnXepmzLCIK4cXFM6lmp9t2cYi69RaLI5Le4XkjgGibS83ATM3K+D/x/fnx5WxfH/SuLLXg35p78HLOfgtwCgsNSk9RO45MQvXLEckgXOOAnEbxDYu+gDBzUgy1tv0y4mHOhEJK4FBBzBS0Oi9HNEvgXaFOTCU1+3jKYmj4CRi1v24P6/yAPnC9fReCMZNSMEg/ZjoLum9Ya3wD76k3JGbWcf1dNSBZuuS3Vah4TTzqIuWyL5fVSDgran8QcmTnBabuJvu/SvHKVQGaLbUmZqvdgfGj/Rps/uLO/BetTsWsRL/FqXAz0Bg/XyoM7HBWtA4FTC1veZTuyDLHCIuHjvpyFSM4dQKGWkaN58i3QiZVf307aUuF5AhqwSyZ06PBmSwT8VXAvkNhsh3HW3v0Rdnr/D6xwglGc3znziAoC0+TCFCtDSg1iaSVbcuvRbwTJQw5yKsbbLc+OCShq2nXUafBVb0KygN9sjVjSW9PY2wrojdJfbcIwR/mHjrw8jd5tKHUj+SIbyM1SwcGaTC3VswO7qO3/h/sLX1HqolPRZbLNH7molNqwmTAD/6ZMqkJZYFS1qxNViBzY/jPwSNVzgaWue2lrwtx0tWHSXcN0+FupdtxFfw3vaF1Ec1nlYrrenpHgSC1iShVQmpOnvvfPFsvywCA9jYi/w2sBVaxPGg1B8Mz6ITb</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="SalesPriceType">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm51egYgXzzX6V6CycJdZwSu7DiH6uPMPAvPNPgR8QqcbsaQLWuMtE7P37BUbB2RA1DmGrIP5XEIEKAWuRfqSx3Vql6LgVXe9AQaedv4PqvgkB8A5vEoi4/e9Ijp9JWxkes=</Encrypted>]]>
      </text>
    </action>

  </response>
</dir>