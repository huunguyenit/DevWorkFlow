<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  
  <!ENTITY CommandCheckLockedDate
"FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV++BKNt2rS+bUFeFIn4P/i5YD7LYF2VgQC28BogsGuXSTu5O4ge0ZCR2ixZtl6TCpGaRDduzCymhOjgpQVGhOGzwEbJtwacL9kpq9uGmKDpgQav9WNQppKdAbKTdQXNB9S4/6TLPl3iNs30nWopIf4NcO+HiquEvwWJPCo835Lv5wVRSZD2GXz+o3pvZaFHH7QO6H1j1npVwu81cC0L7nDktPmXxDF/otGy0tQeGvguCbfPPmeK3FZRLBBRMaZpXB1TN8wveejUp4fYkhtgs9tbRSxTzDLOO572MQC+rR5kijUWA2t75jgpHxsE9jh5fOAgZU+hHbpmyOSNGCDC8iLpv/FQ8Yf2Qa/G69bRl8iRtLFastBusiness.Encryption.End">
  
]>

<dir table="ctgs" code="nam, so_ctgs" order="ngay_ctgs, so_ctgs, tk" xmlns="urn:schemas-fast-com:data-dir">
  <title v="chứng từ ghi sổ" e="Journal Voucher"></title>
  <fields>
    <field name="nam" isPrimaryKey="true" type="Int16" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày từ" e="Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Ngày đến" e="Date to"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Ful8U/LuNJ3J75Z6Kq84nGlzJy9MDlqGwBOiYHRTjcxif0MSDYCK9ro21XLHb6yLA==</Encrypted>]]></clientScript>
    </field>
    <field name="td_yn" type="Boolean" defaultValue="true" clientDefault="Default">
      <header v="Đánh số tự động" e="Auto Numbering"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Ful8U/LuNJ3J75Z6Kq84nHJwFXkcnXkjAD/lC5oR1gi/pVMj8EEYFEouvF5f2JzGRcqoriohCx58zyZngROfdc=</Encrypted>]]></clientScript>
    </field>
    <field name="so_ctgs0" dataFormatString="@upperCaseFormat" align="right" filterSource="Optional">
      <header v="Tiếp đầu ngữ" e="Prefix"></header>
      <items style="Mask"></items>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Ful8U/LuNJ3J75Z6Kq84nGYL2sihZE8NMOf3ozPDjUedZuAw5D0wrErlacsRVL9jA==</Encrypted>]]></clientScript>
    </field>
    <field name="so_ctgs" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false" align="right">
      <header v="Số c.từ ghi sổ" e="Batch Number"></header>
      <items style="Mask"></items>
    </field>
    <field name="ngay_ctgs" type="DateTime" dataFormatString="@datetimeFormat" align="left" disabled="true">
      <header v="Ngày c.từ ghi sổ" e="Batch Date"></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="ds_ct">
      <header v="Danh sách chứng từ" e="Voucher List"></header>
      <items style="Lookup" controller="Voucher" key="wedition &lt;&gt; '9' and xgl = 1 and dbo.ff_ExactInlist(ma_ct, '') = 0 and status = '1'" check="wedition &lt;&gt; '9' and xgl = 1 and dbo.ff_ExactInlist(ma_ct, '') = 0"/>
    </field>
    <field name="tk">
      <header v="Tài khoản" e="Account"></header>
      <items style="Lookup" controller="Account" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="no_co" dataFormatString="0, 1, 2" clientDefault="1" align="right">
      <header v="Phát sinh" e="Arising"></header>
      <footer v="0 - Tất cả, 1 - Nợ, 2 - Có " e="0 - All, 1 - Debit, 2 - Credit"></footer>
      <items style="Mask"/>
    </field>
    <field name="tk_du">
      <header v="Tài khoản đối ứng" e="Reference Account"></header>
      <items style="Lookup" controller="Account" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ma_bp">
      <header v="Bộ phận" e="Department"></header>
      <items style="Lookup" controller="Department" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ma_vv">
      <header v="Vụ việc" e="Job"></header>
      <items style="Lookup" controller="Job" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="loc" dataFormatString="1, 2, 3" clientDefault="2" align="right">
      <header v="Lọc" e="Filter"></header>
      <footer v="1 - Tất cả chứng từ, 2 - Chứng từ chưa đánh số, 3 - Chứng từ đã đánh số " e="1 - All Trans., 2 - Trans. Having No Batch No., 3 - Trans. Having Batch No."></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="ma_dvcs in (select ma_dvcs from sysunitrights r where r.user_id = @@userID and r.r_access=1) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights r where r.user_id = @@userID and r.r_access=1)" information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="stt" type="Decimal" dataFormatString="#0">
      <header v="Stt ưu tiên" e="Priority"></header>
      <items style="Numeric"></items>
    </field>
    <field name="suffix" external="true" defaultValue="''" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 25, 5, 10, 60, 100, 100, 130, 0"/>
      <item value="110001--1: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2], [nam]"/>
      <item value="11: [td_yn].Label, [td_yn]"/>
      <item value="11000: [so_ctgs0].Label, [so_ctgs0]"/>
      <item value="11000: [so_ctgs].Label, [so_ctgs]"/>
      <item value="11000: [ngay_ctgs].Label, [ngay_ctgs]"/>
      <item value="11000000: [dien_giai].Label, [dien_giai]"/>
      <item value="1100000: [ds_ct].Label, [ds_ct]"/>
      <item value="1100000: [tk].Label, [tk]"/>
      <item value="110100: [no_co].Label, [no_co], [no_co].Description"/>
      <item value="1100000: [tk_du].Label, [tk_du]"/>
      <item value="1100000: [ma_bp].Label, [ma_bp]"/>
      <item value="1100000: [ma_vv].Label, [ma_vv]"/>
      <item value="11010000: [loc].Label, [loc], [loc].Description"/>
      <item value="11000100: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="11001: [stt].Label, [stt], [suffix]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcBuS9Ne9fT2FQVO1ZC1myt/dtfEDp+28q3SS9WSS4hHLUDY4qpqTdRhGMFAvgtg+v+n6X8xAjBS8UD5rtTyqUxU=</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcBuS9Ne9fT2FQVO1ZC1myt/dtfEDp+28q3SS9WSS4hHLUDY4qpqTdRhGMFAvgtg+v+n6X8xAjBS8UD5rtTyqUxU=</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3af99XLCv10PE39uENjugvgjGlsRTUGxoPhirmhCio5g+oL+NiiXRbfrT4zEroRgNIkHibOl3ERiVHBlw5eAxDeGSIxb/Evp66cqH7EKMY0N7F6sTKAeTOVLH/5CcbV9frADFO46YYJaXcgvXFMOk3EnAbfXbaJry+us25CHzs8dA1vXqT2+58UKJsSBrqDxFNaFjCFKP0AtuUseKbAFLi/QQrCGHnIa01XB/mmfgEGFWbMnT0cK4a6xQHTApuaMo0bNoABMziNZyYf5ZhOdH2ilEmwlbLrLp5lypQ9JrzYIRc0GkIw+zwdkTRN16jgxW/IfDQiwoLmr9Lak7pNr4b6naYDUCi8YXjeGi6crxV1zJ0En9xugeeKwSW3K8X8/rsXJAsHr4bOMmfNRUyIMN2Q73G1cS2cJtliLeQyUPJsx1+334Ci+rKCxeo/bp2a2PN</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcLlmcjMJWvUPCQhpkxadI1KDe/GxqSKgSBVUz6NoRYLDNhfA2kztK1YsYU6rYhLTTX1YmYzVZXZU8vSUjdqGT0DNoXGsGWHLNPdhT2ZSEuWA1dJ8qR7WwElwg1ht6j0TLtNn6kOJ2IP0lWXpbGGieyQ=</Encrypted>]]>&CommandCheckLockedDate;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN2JKxKAnBFch6SwKc9HgayuYbj8YcwZjqrfsqeBUDwUMWp5rAWQw6nkgcwco/gvW2VlKRvD6YOMPKfpBgDGMjot5vnVfmsOWorzeKLdFcZoFE353DHi1+ukpdN6QbphKU10eOCpZHS3AqNmQF+/f50=</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcLlmcjMJWvUPCQhpkxadI1KDe/GxqSKgSBVUz6NoRYLDNhfA2kztK1YsYU6rYhLTTX1YmYzVZXZU8vSUjdqGT0DNoXGsGWHLNPdhT2ZSEuWA1dJ8qR7WwElwg1ht6j0TLtNn6kOJ2IP0lWXpbGGieyQ=</Encrypted>]]>&CommandCheckLockedDate;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8Ubfvq2dXTvAvl4Z841iZLmAQB0EFHcPrMyAohnJs+pXuTOz8OdfeoocoqgV4atUJV/hDqfgfLH6ulHAM2YyDGkaRSycvXAMeMzrZfRrpUyqayzFy/zm+oo3Ir3ypAKys48A3S3GsymIfWItARWw9vMbdC23olb7mwaCxzgA8vdKysqy9/xTZzkqtIDrkpRfjn3w2OrWMlMyFllBPIaAgQaxonr9mw0FwR2pWLYUoctA==</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1Pp8owFthqpameVVabqifFDaGf00LiqSq4p9FDIjCYTDpahJ5NZmHYFY9aLCok3QsJ3UHYsCaBtfdyHXNfTLecx8cMNKsnu4okId0lAMsfQhXj74/7TVUZ0Ke3uBd8Ilg==</Encrypted>]]>&CommandCheckLockedDate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Y6zg+R5K/sNHor64hSPLCVeTRr87BNCnPI/8mT/a/Nypx1sM8/qcWGcJ74U9TLRV8hdQ4vHC/Ork4O2e6Fx46VcyMro0emUSrGFx+lMqYzt</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2EctdcZXE12zX5j9VbTVrAscsd131M5DC0krRD6o3iwVKQ2lq25qDTxmDUHyJnpBtmqsZsAtZLsoOVMiiVbj8EKQ5wltUbaHgaf9ACiXry+A/Gx/ZGc7/pA7H4KpUpH2qcfRa2x7xFnIS255FRRRxvuA=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtewSb24eDUKq/WopJgVtpHeQwUHrll9+7h37Ogq6IwQ96IfVpEf6gsOB+E34huNvDbAYB9u0PSS3lQoU/fLP9ID3af+Tlt9WJBr7ShZXxRflOqUT0tjptWrk7cBCCR+rZ868aVPRlnHtTwpTBLqk2a1sNcNBXUg8zFxbGbFkF7hAE9BZAHfQQ/s3F/7rR8JMAQetjFAADRgO0GstVmzWwa45kaZfxmYBqi3BgY8gBvIl/NB/hBAOZ7y8wRJ/q6yWQGcQSBiJF+CNkTe1WQOUpLd8OW3ToJCWnI0JsoT9vZvCD/sXOLjhykPhgY39ocKGGFVjG6jxjLQyE8uNojW3xzw1roAjbrIswHIuWt4b5KI8kTPD47K0ZqWlG4P4Bac9pJfXNJlB7xbZV4G+EXTA1zkbKrwj0Y9ERtpEBy1HSNlUWcYse4VIMz8Mx4BJrM4MlWpzHWWGwCpagmYdCLpOwqRujhTpMYcdfIezeM2Q4cXAuAHP6AQmrD5H26oziEk6iKAouUz/QDB70c/IpnvVQOf+2ecoA4dCPVf4HLKxfMN9iIcBiH2lMBl55bRZLb8MiZARLTCAhW3cgR+8Pcnm3iodl8Gg6YBSdOi8N0KeRiseZECfO0cQbGi6iZEadHhxptK3cAPh4J5FjEZlOUmvKaRXIYB1gfxAYtu3fD/rrdQQmDVx0Bdt6bmQXjnCAlBE9TvvYkR2/wS1xW2uQk5FBurWo8/zAS7DUnBpuBBU/tiCoo/NhYNZ60iV8vhGEYpGWQ==</Encrypted>]]>
    </text>
  </script>

</dir>