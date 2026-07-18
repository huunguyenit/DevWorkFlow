<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "hrInsuranceInformationChangesInputImportForm">
  <!ENTITY UploadButtonCss SYSTEM "..\Include\XML\ImageUploadForm.txt">

  <!ENTITY UploadCreateTicket SYSTEM "..\Include\XML\UploadCreateTicket.txt">
  <!ENTITY UploadField SYSTEM "..\Include\XML\UploadField.txt">
  <!ENTITY UploadCommand SYSTEM "..\Include\Command\UploadCommand.txt">
  <!ENTITY UploadScript SYSTEM "..\Include\Javascript\UploadScript.txt">
]>

<dir table="hrbhdstg" code="nam, ky, dot, stt_rec, loai_thay_doi, ngay_thay_doi" order="nam, ky, dot, stt_rec, loai_thay_doi, ngay_thay_doi" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lấy dữ liệu từ tệp" e="Import Data From File"></title>

  <fields>
    &UploadField;
    <field name="type" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Kiểu sao chép" e="Type"></header>
      <footer v="1 - Chép đè, 0 - Không" e="1 - Overwrite, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="thang" type="Decimal" dataFormatString="#0" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="ticket" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 100, 30, 0, 0"/>
      <item value="110001011: [upload].Label, [upload], [upload].Description, [thang], [nam]"/>
      <item value="1110001: [type].Label, [type], [type].Description, [ticket]"/>
    </view>
  </views>

  <commands>
    &UploadCommand;

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OlhMzIHz1eI5IxL4pZUp0+Q+DFCAfaOCNukXyqVH7r2tUVkQ8y3uliMiKEQ6HucGu120j0ae/lpaSoz3kdG9lgkiJZC8GZlsdXnEoJhgE0JAqDiyCdPTRupZGp1I6w/SA==</encrypted>]]>&Identity;<![CDATA[<encrypted>%/vOP2em6Xhs7Z9GPyNAHjjBNhSB4n36RAHIrC3EsIUZOJpgG4hHoR/Q/8hBmCxWHSUmQylFesVOE3pC3Wxw6g6DMmVv1vBozKq0VnniMXHAQlO5NkMmzW4Blq17syK8lqKEVrosC7hOMH2nm8XIbGLDF0tPk94fmB0my8pW5Phdm7OgeBLKpCRVZNMEbvc2A0GnBa4TqTRcFhvL5+oacqMIa+VuBI+EHtVwf38yu5/ZGh6OxRMCZNBYirywQXFYPbnbPDGutXcEhqCPOhknF7jf28s76Y52dAeqRl/GFAnsQVS8FhzZpcFyzIzMe8K+UJbT/y6dZDTr7+i8gEZTSl/weX4RHRQcP+Pte0BCR/kd5b6frC5Q1STQGJogKoKbrB41LD3/qtHrtVzq+1iouug==</encrypted>]]>&Identity;<![CDATA[<encrypted>%tKdK3MWmxeikauzyRrII1khOmYPdDJR0UVGp36IftZ7FWkxO0uRbmEbTX6FBDUkS</encrypted>]]>&Identity;<![CDATA[<encrypted>%/AfHL6YdajQfFcOwzqzJsHpsIv+eYjv43aSeT6AHtMK5KqNOsXbLy07maA3woZ2khpNpcL+3pjRCBa18OnzstZpnydA13e3PF3E44PWS1zp2NWLRQCC7an0zD6t1c5fJZaJMu33wfzo9TL6EKg1x6XnoN9ewd1tkWLpRy64oklNCHhc9BJ310vPgwiRyMbX3nOoZGCKhT3yi7QuvKjL8P5kgAH81ICSeAcFYYRmVa1jYAIOTh2HU6AmMMUJuSzfusKESkGMOCFBMPQaoEabEs+1oHKTud6evIq+M6SSmLP3pJuaenZ0hOgMwN2D2MP3g7nxkf+QVpNKie1iXKq5IYYQcSuuqRYG/N2VewcrrG+q1xvvwW4y+92rYiK4/l8/i2Z2s7MpwATRmGMfxsPvzjJ3Od4U44nEohntoPc/iI2M2MZQtmek7s5CBqj6Wc4BhQJr7D2wfWBrItTPUIXAyOFiZqUJsVqQWqEUzDoabBv7V/oWvt1BEfNds5jTRuwi8xUwilyQch7Mzd6CzfQzxEmW7J8PBzQ/NahAyoURgyEi1FRrgtPRjErmztB+4hcwk</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &UploadScript;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70MgU3L9MV51GLhAC5KldzdIJNZ9RTQ5cy/QV/Zj/O55L</encrypted>]]>&Identity;<![CDATA[<encrypted>%rnZ922lNpfjaCeWsVZkA0WZiYw6XUQtQ2WPvtce3XMkAbvUh26+cM+Y6LHeeTBT66ltoDlSplfNkb+5A8FrLQlnK4FPFnqUpyAU4IeKFBysJuvmfDda46O8EczcRtmD0itwf8E9WbIHwLId2BMdi2Kma+eih+uabr+eiwrCYFxbWkMdoaxw/9UGUZWYMnrv67g0XChSDW0drPyOADn7HNsz90uxYY2H0JqSw1/OiBq2YPSnp4YrnOH7LA9Wsi1DjEkVU+vn2NQrlyfouCNNvR0zeylKVOhb6msc27YldLq8AW8F8scgVSYxML+sQB2rk</encrypted>]]>&Identity;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfMY+vxj5ddyyoutgGhLGg+wsbG4kDSfy9Br7CB81Z0C7Y8d+ocmYlcPxUdK5t6UahCErdMQpGylb9O/5okkAcaY9W5HHck54MnGXVjfbDE4ymhDUkl34azliBxi4OZbMgvLSdZ5wqBKouGmoCnhegmm2GWWTsOOWSJ3Tj9lduQjbaII2ftCq90T3jb2YF0Uazyxs2A0Q4JFMJfWe6LWDpd6r2KjoOWo51uoO1qkFe8PR</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetTicket">
      <text>
        &UploadCreateTicket;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfz6e414K5THbJPKTpTCXK/0Soy/gsPLzbDunHmOYjOYz5znFkiGNhRte4WM40R4ZHA==</encrypted>]]>
      </text>
    </action>
  </response>

  &UploadButtonCss;
</dir>