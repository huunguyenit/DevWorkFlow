<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY Controller "ApprovalCategoryDetail">

  <!ENTITY k0 "@loai_duyet = $loai_duyet.OldValue and @ma_kieu = $ma_kieu.OldValue and @dvcs = $dvcs.OldValue and @ma_bp = $ma_bp.OldValue and @ma_md = $ma_md.OldValue and @nh_kh1 = $nh_kh1.OldValue and @nh_kh2 = $nh_kh2.OldValue and @nh_kh3 = $nh_kh3.OldValue and @ma_nt = $ma_nt.OldValue and @tien_tu = $tien_tu.OldValue">
  <!ENTITY k1 "loai_duyet = @loai_duyet and ma_kieu = @ma_kieu and dvcs = @dvcs and ma_bp = @ma_bp and ma_md = @ma_md and nh_kh1 = @nh_kh1 and nh_kh2 = @nh_kh2 and nh_kh3 = @nh_kh3 and ma_nt = @ma_nt and tien_tu = @tien_tu">
  <!ENTITY k2 "loai_duyet = $loai_duyet.OldValue and ma_kieu = $ma_kieu.OldValue and dvcs = $dvcs.OldValue and ma_bp = $ma_bp.OldValue and ma_md = $ma_md.OldValue and nh_kh1 = $nh_kh1.OldValue and nh_kh2 = $nh_kh2.OldValue and nh_kh3 = $nh_kh3.OldValue and ma_nt = $ma_nt.OldValue and tien_tu = $tien_tu.OldValue">
  <!ENTITY k3 "loai_duyet = @loai_duyet and ma_kieu = @ma_kieu and dvcs = @dvcs and ma_bp = @ma_bp and ma_md = @ma_md and nh_kh1 = @nh_kh1 and nh_kh2 = @nh_kh2 and nh_kh3 = @nh_kh3 and ma_nt = @ma_nt and @tien_tu &lt;= tien_den and tien_tu &lt;= @tien_den">
]>

<dir table="ctkieuduyet" code="loai_duyet, ma_kieu, dvcs, ma_bp, ma_md, nh_kh1, nh_kh2, nh_kh3, ma_nt, tien_tu" order="loai_duyet, ma_kieu, dvcs, ma_bp, ma_md, nh_kh1, nh_kh2, nh_kh3, ma_nt, tien_tu" xmlns="urn:schemas-fast-com:data-dir">
  <title v="khai báo kiểu duyệt" e="Approval Category Detail"></title>
  <fields>
    <field name="loai_duyet" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kieu" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false" inactivate="true" disabled="true">
      <header v="Mã kiểu duyệt" e="Approval Category"></header>
      <items style="AutoComplete" controller="ApprovalCategory" reference="ten_kieu%l" key="status = '1'" check="1=1" information="ma_kieu$dmkieuduyet.ten_kieu%l"/>
    </field>
    <field name="ten_kieu%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="dvcs" isPrimaryKey="true" clientDefault="Default" allowNulls="false">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status='1'" check="1=1" information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" isPrimaryKey="true" clientDefault="Default" allowNulls="false">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status='1'" check="1=1" information="ma_bp$dmbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_md" isPrimaryKey="true" clientDefault="Default" allowNulls="false">
      <header v="Mức độ" e="Priority"></header>
      <items style="AutoComplete" controller="Priority" reference="ten_md%l" key="ma_ct = 'PR1' and status = '1'" check="ma_ct = 'PR1'" information="ma_md$dmmd.ten_md%l"/>
    </field>
    <field name="ten_md%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="nh_kh1" isPrimaryKey="true" clientDefault="Default" allowNulls="false">
      <header v="Nhóm khách hàng 1" e="Customer Group 1"></header>
      <items style="AutoComplete" controller="CustomerGroup" reference="ten_nh1%l" key="loai_nh = 1 and status = '1'" check="loai_nh = 1" information="ma_nh$dmnhkh.ten_nh%l"/>
      <footer v="Nhóm 1, 2, 3" e="Group 1, 2, 3"></footer>
    </field>
    <field name="ten_nh1%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="nh_kh2" isPrimaryKey="true" clientDefault="Default" allowNulls="false">
      <header v="Nhóm khách hàng 2" e="Customer Group 2"></header>
      <items style="AutoComplete" controller="CustomerGroup" reference="ten_nh2%l" key="loai_nh = 2 and status = '1'" check="loai_nh = 2" information="ma_nh$dmnhkh.ten_nh%l"/>
    </field>
    <field name="ten_nh2%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_kh3" isPrimaryKey="true" clientDefault="Default" allowNulls="false">
      <header v="Nhóm khách hàng 3" e="Customer Group 3"></header>
      <items style="AutoComplete" controller="CustomerGroup" reference="ten_nh3%l" key="loai_nh = 3 and status = '1'" check="loai_nh = 3" information="ma_nh$dmnhkh.ten_nh%l"/>
    </field>
    <field name="ten_nh3%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="tien_tu" isPrimaryKey="true" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" defaultValue="0">
      <header v="Giá trị từ" e="Amount from"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_den" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" defaultValue="0">
      <header v="Giá trị đến" e="Amount to"></header>
      <footer v="Đến" e="To"></footer>
      <items style="Numeric"/>
    </field>

    <field name="ma_nt" isPrimaryKey="true" clientDefault="Default" allowNulls="false">
      <header v="Mã nt" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status='1'" check="1=1" information="ma_nt$dmnt.ten_nt%l"/>
    </field>
    <field name="ten_nt%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ghi_chu">
      <header v="Ghi chú" e="Note"></header>
    </field>

    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 220"/>
      <item value="110101: [ma_kieu].Label, [ma_kieu], [ten_kieu%l], [loai_duyet]"/>
      <item value="11010: [dvcs].Label, [dvcs], [ten_dvcs%l]"/>
      <item value="11010: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="11010: [ma_md].Label, [ma_md], [ten_md%l]"/>
      <item value="11010: [nh_kh1].Label, [nh_kh1], [ten_nh1%l]"/>
      <item value="11010: [nh_kh2].Label, [nh_kh2], [ten_nh2%l]"/>
      <item value="11010: [nh_kh3].Label, [nh_kh3], [ten_nh3%l]"/>
      <item value="110--: [tien_tu].Label, [tien_tu]"/>
      <item value="110--: [tien_den].Description, [tien_den]"/>
      <item value="11010: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="11000: [ghi_chu].Label, [ghi_chu]"/>
      <item value="11100: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMHsGyglwDXtpADs1rLNOrEuFL6L4hSbyyL8UgIBpFHW</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQuo0eS5b8e+DofV8FmhQ8f5+a3+Ekd+oxpqkqpDJ7hyMpfe1mwKYr3xhUriBcXoM1kw==</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDHwyWdnnAsOePGxNOFkX1cJTAuZkiCsA0+8sooNYWbc</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQuo0eS5b8e+DofV8FmhQ8f5+a3+Ekd+oxpqkqpDJ7hyMpfe1mwKYr3xhUriBcXoM1kw==</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDk7V+WCQCbTf5mLypqZov8kVtY8II2YjBmvmOHrFcrj</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQuo0eS5b8e+DofV8FmhQ8f5+a3+Ekd+oxpqkqpDJ7hyMpfe1mwKYr3xhUriBcXoM1kw==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcI0P/H+AZcpPJ+89k+Mq/qf1yOewTR1n76l513CG+Wh7</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQuo0eS5b8e+DofV8FmhQ8f5+a3+Ekd+oxpqkqpDJ7hyMpfe1mwKYr3xhUriBcXoM1kw==</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3aN/7PxwrNmja2J0eINLzr7xPQD0e4W9lOfhvysXjoKo6hktVbHbuwo2uafM0mNvhrC9SXPOlcNa8s8uBFAtY7gfZ8IjH9AlUojJMNj6NTgAr0JA7dYZ1/o3h6OIv9FxK1t3Wr/btGxIMcceWwjzHZazOxB69dvHP30tQmt88+3HVgMJnjVeHGSCoC8/GOGV2qlg91hHSY4S0F8DDw0z9dZ4K6axyd9ADlbGiC706YW3Dp7fMi8PpY87mYI/VGpY8/C0udAG3OQxBbm5QjGnSD6417m2xcwTilHl4frfIxJ0A3ezT8dwOTQzeYi+kCNpK5e83m7wNmjcgt1YSRT6vSTcZVJ2Z6xUJqDwb36UH60FYnz5wdOGWjSYoBVOFbrU1OjOCr5782+EZCTqHmneJ+INIhV2ySwiAqYbPbrmC845OLOdBaCTatTiuizYVxD3tcDn+FH/S0HlMXVhac6yP+FnPhW6gG+uWI7+O+YXdBcVLue8OhXsnpyrDZ0sAH+zQAU6I/20Bl1i1VQJtSyAXd+1lSthsuXK0gF8V3VqUo1Skeu3B914/GAA5AQjHyNEoI</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5+QRWddH3AlR+z9nDTz+7CqQkA+CAc0ekwifZZLEvnfA==</Encrypted>]]>&k1;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLbDQuWp/INEfRg8i2ZohvuSOxi2k3Ehev738fS+rr9QWaelNKWSSfeO7/97hU3fKO7meSsidj8ymRTa+3h8LA1XS6H4O6+3FyI1xY+nCd5sTZajSm23WBBLrSDNbYNPwrn8lHr4c0bSPU57eH91Fk8O+F69XhBjvnvkC8H/lS1wnvgG+0Y0DsxZgDiw4DMV++M7LUK6zTwo4GNX2chRfm1M=</Encrypted>]]>&k3;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLT56P0Gndqm1eiOiFByj7/91ZLwNdb/W+fMyqlnwWu/d2Gcc//ZRy2ej0aMHBxM3mEP7IVbTBydrayB5fDkvqQ772cBUxd2q3aDU+g8iMcIgUZPxb8eTCKWULSQ9f9aB1XhM79qF2loDLnEJgsXaJjBBSn/HRChVGcwyiXvqX4BC</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp9ozwmNWaFXFGEKfmQZvzteUI1QmUgP10yHksf+Ca1iWw==</Encrypted>]]>&k2;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLbDQuWp/INEfRg8i2ZohvuSOxi2k3Ehev738fS+rr9QWw+aCN9ZChVqj6rMGPQLL26xRGTuTpDluNbhf1/K0D0Z3oXtjmKXSX2XF5ba9RFH4fZAf3f3X0ebnj5SdYsw2LdYzPaCwFla5FxJ2E4oTS7hRprHvKd/HatLoJCj9uX1sLnR8wx4OH3Qi66ntzfaKvQ==</Encrypted>]]>&k0;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLbWKoL5jETtroDAedIqUQR42mEpHAQGseHKQPt+hO6zMVZCLu0/56nviMMRE2b0t5VXIS9FErUnVAIrYHbfYuSE=</Encrypted>]]>&k2;<![CDATA[<Encrypted>&YARH0qdfPiWP620v9FAeSPICrzWaA8H4buAdoshnAjQ=</Encrypted>]]>&k1;<![CDATA[<Encrypted>&x2vMhmcVHH3IWkEVW8yP64FWcBQy+GNPmszxRdU0sWzpVzPfIXXZCeHLbbCTSsg82/8RjvjNbceT0uDfj+oUyd9Y8LtruuvldsJayDH/9BgYN6J+RcgEQrPSk7j3L/1s0FgB2lXMYkxRmXQtEvfYYzwAMq0+vGlAomSply7bE1bEscdocqx/KDSW1gWCp4M3ajj++Ajd+64kT+Qq/n9T5XM1XZOxNTYlu4Ri4gUD0mZ3kfqiaYFFvLS0HQykUjFs</Encrypted>]]>&k3;<![CDATA[<Encrypted>&O0YyoFEd0hYz2N2q7aidVIJZyGVrEhl0XipY/k8D9Tc=</Encrypted>]]>&k2;<![CDATA[<Encrypted>&x2vMhmcVHH3IWkEVW8yP65u1J8YrpvBRo1yWciTDq1l7iUlUt1H32dhTIdzILIipv9BwWaBVtBR1B6bjegkYmlmH2A0upvg1C/gMrUJHbl4AOhMYkBVVj/c1WQsejUMm</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XV+ON7PtGJwPs+Ue1dhk9iTEMusobpy/mpGNP17+b7z99</Encrypted>]]>&k1;
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22VJvj7NkwuBcVNTyepJpRGwmYmxjrA5StX1mF+GgawqdGFrsR38GTdmAZ+3DVQl7Pvfwm9AvzBjzlJcWnk1Xj4+WhmFis7EC8HDGSZoN5UrA8Ek3yDug174zhqmVjDpn1hs0dFn04JQ0C1kmGRzjWkmch/gYNq7mDI9DQv2YgfuQdT2k/T6cEXO97FiBmv/zOMEPtpptjwS3QT7R5q7Z7Tdu7hcXmDJguHGhP3t+COgL3xDD89WJuim3NAORgNHFKREydkIzLWgjuUQ0FhKLNLpSF2tn/OpdbNT8VbztwaO9IgRQKc2yu8f0RQgsVcvxdPo89GCCT5elc2gjBH/pu3TzgJ70Qi1q/Rdpy6Z31+8epv/ZO5G0TN2FwR492jwdkg==</Encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22bSuNVcsiFY2XvyWSbeqhk7mWWN9vGjAWR5YhmM7AjFn</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&XBj6YDSBZrE7ldnLBomYrSxwArwbRx6xJ64RqQuObwSBNQzkR44X4xOY04DsJQgAaehpAJ0Cfa4HPHw6AiV0fg==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&XBj6YDSBZrE7ldnLBomYraWk1puRRmoNTnTG2cUDrmMEU0PPFd763XKrCGWI/8E5OSUFcZr3gql8b1amK+j0aw==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&XBj6YDSBZrE7ldnLBomYrVdJ5hKhgjliXJ+tzHP3Kd5rYlwC+ep5z0DHiyprLdXswfTD71QHM3Nib2uFG8sdvA==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHUCothhCKotCSIkskECrMjjn0tnOOhLhxBfJBweSM2nRSS5Nk2NIU2/UgsWJVoDRZUF2z8R67+yu65v8bEuo74KM0JrDwWEbBG5MeIuro/cb</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&XBj6YDSBZrE7ldnLBomYrarUWHOMBIZklf9j5Tg5cru/TSHojbB6/dWlMCe/BT6Ljp+UIU4aJhpCCd+p/rer0A==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&XBj6YDSBZrE7ldnLBomYrWCb3wo6Lqgyn6g4MKqoL7EhBUUV5sV0ZoD7My32bMIUOpP4Z1LDWl945c7b9X7zCE2bgmteCPcQHh1zw92KBaI=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&XBj6YDSBZrE7ldnLBomYrQiKBZ/ItM5niFlX7/stf7dZYQXtrDLphXldwDT0dX9iW7QsqS20sbYluR456dUH1w8Pe2+istLjuWZ1+SiR/ao=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHemLmDblVZZyuvFaGPTzKq8K9wbgN5j3pldI02fUnyOHmiRb1r50HQeAiDMza1aBgZW9CeHhr+ITMovrI39Ablw=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHc7X/84zX1ElDBQ0Oio9BYhpU71ALmfk5ffMVXbbEaC95FDNPuPVyyo0paJ5AWSXOQ/onvbV5bNXYdtHuIDX7H8jFKJNFaPszc306jhi5p99HS1Qv0eP8NdyIUbO1I6wk6tWK3mr6J2tPu+MbRuxllMea1xM0N7pCn8ZQltUQUfji4+yYKYwk3fTqjgOFFqttYbL3eQKlk39QKXaphOQIZ0=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&XBj6YDSBZrE7ldnLBomYreNKsjgckYcHSS8UJEOGS1OAH/5rtOrKFaoBtCWZL/W06ImYoNQbZZJS33EDojg7kpJuExtWNg2KfviuPN7X0gh4vNMfRuCRNcUid4wpLqmtln1VhUaujTDUzbYbVghjhcAYOMBUHCVx95nd9Dn/+yd55oSC8c5iRYOdffZs7rnmpcP8iekJB+MZWQ82iHBz9mCOx3N2xdrxJWVGkNElePZFUOemZCKxV+LoyxwIoqPMbVvL2IueakFF2stgaNfkX2Lk2OId4fU7VtZGdLmlQqLNIlHTcnlCa76L19GzDPUdbt7JSv793mA/L5olfI59nLdsbUrDNCadwyS/wd/FQPB4FhFE6TrdchS+dDd2iyo6CmwrTIEmoc/nOurhsqRtIkT6X7E9z/IfizLM17vpq+nS/bb7+VxWuOF3hBuuejqAUTjM10GUvQhnO2bzR9TGSG9ef6953h7JbZKj9bw9B+nBl/djq9fAvIK+Yr0zVYT4Nz1EDdlqzQLO0DrSoNsDb4SaXy3P1HQX2IQWrQeAzTt2CrHf/O9Q79b60sP/oX6leyq/b/40UwPjBA8bJnLnxFiKInV7y64WoMlIVQ2rxi2CcgCYm5UsEozvvlD2mXKSqj1pchPhnZ9F8ffIVQdhHzUg+IwdcYzhCIrfgI4jZAEQah60wEzdaAxDr3CNOhiCFNVeFXmO7SnUlbzq5DaohL12I5pA4czkF6YVusTUsc/AamY7AGFhiR8Ump+fWNgLEwZ4gNzTCg/wIYYlrTuvBKx03ddwsQ73UK/VHVsFiovLLejXK4FmKZ74ZSd+lVAC</Encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>